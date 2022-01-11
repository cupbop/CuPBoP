#include "init.h"
#include "memory_hierarchy.h"
#include "tool.h"
#include <iostream>
#include <set>

#include "llvm/IR/Function.h"
#include "llvm/IR/GlobalValue.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/InlineAsm.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/IR/Module.h"
#include "llvm/InitializePasses.h"
#include "llvm/PassInfo.h"
#include "llvm/PassRegistry.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/TargetSelect.h"
#include "llvm/Transforms/IPO/PassManagerBuilder.h"
#include "llvm/Transforms/Utils/Cloning.h"
#include "llvm/Transforms/Utils/ValueMapper.h"

using namespace llvm;

void inline_func_vote(llvm::Module *M) {
  std::set<llvm::Function *> need_remove;

  for (Module::iterator i = M->begin(), e = M->end(); i != e; ++i) {
    Function *F = &(*i);
    auto func_name = F->getName().str();
    if (!isKernelFunction(M, F))
      continue;
    Function::iterator I = F->begin();
    for (Function::iterator E = F->end(); I != E; ++I) {
      for (BasicBlock::iterator BI = I->begin(), BE = I->end(); BI != BE;) {
        if (CallInst *c = dyn_cast<CallInst>(BI++)) {
          if (c->getCalledFunction()) {
            if (c->getCalledFunction()->getName().str() == "_Z10__any_syncji") {
              InlineFunctionInfo IFI;
              InlineFunction(c, IFI);
              need_remove.insert(c->getCalledFunction());
            }
          }
        }
      }
    }
  }
  for (auto f : need_remove) {
    f->dropAllReferences();
    f->eraseFromParent();
  }
}

void create_global_variable(llvm::Module *M) {
  llvm::Type *I32 = llvm::Type::getInt32Ty(M->getContext());
  llvm::Type *I8 = llvm::Type::getInt8Ty(M->getContext());

  auto zero = llvm::ConstantInt::get(I32, 0, true);

  // we need global variable used for warp shuffle
  llvm::Type *WarpArrayType = llvm::ArrayType::get(I32, 32);
  llvm::Type *VoteArrayType = llvm::ArrayType::get(I8, 32);

  new llvm::GlobalVariable(*M, I32, false, llvm::GlobalValue::ExternalLinkage,
                           zero, "intra_warp_index", NULL,
                           llvm::GlobalValue::GeneralDynamicTLSModel, 0, false);
  new llvm::GlobalVariable(*M, I32, false, llvm::GlobalValue::ExternalLinkage,
                           zero, "inter_warp_index", NULL,
                           llvm::GlobalValue::GeneralDynamicTLSModel, 0, false);
  new llvm::GlobalVariable(*M, I32, false, llvm::GlobalValue::ExternalLinkage,
                           NULL, "block_size", NULL,
                           llvm::GlobalValue::NotThreadLocal, 0, false);
  new llvm::GlobalVariable(*M, I32, false, llvm::GlobalValue::ExternalLinkage,
                           NULL, "block_size_x", NULL,
                           llvm::GlobalValue::NotThreadLocal, 0, false);
  new llvm::GlobalVariable(*M, I32, false, llvm::GlobalValue::ExternalLinkage,
                           NULL, "block_size_y", NULL,
                           llvm::GlobalValue::NotThreadLocal, 0, false);
  new llvm::GlobalVariable(*M, I32, false, llvm::GlobalValue::ExternalLinkage,
                           NULL, "block_size_z", NULL,
                           llvm::GlobalValue::NotThreadLocal, 0, false);
  new llvm::GlobalVariable(*M, I32, false, llvm::GlobalValue::ExternalLinkage,
                           NULL, "grid_size", NULL,
                           llvm::GlobalValue::NotThreadLocal, 0, false);
  new llvm::GlobalVariable(*M, I32, false, llvm::GlobalValue::ExternalLinkage,
                           NULL, "block_index", NULL,
                           llvm::GlobalValue::GeneralDynamicTLSModel, 0, false);
  // TLS variable used for warp-level collective operators
  new llvm::GlobalVariable(
      *M, WarpArrayType, false, llvm::GlobalValue::ExternalLinkage, NULL,
      "warp_shfl", NULL, llvm::GlobalValue::GeneralDynamicTLSModel, 0, false);
  auto warp_vote = new llvm::GlobalVariable(
      *M, VoteArrayType, false, llvm::GlobalValue::ExternalLinkage, NULL,
      "warp_vote", NULL, llvm::GlobalValue::GeneralDynamicTLSModel, 0, false);
  warp_vote->setAlignment(llvm::MaybeAlign(32));
}

void remove_metadata(llvm::Module *M) {
  SmallVector<std::pair<unsigned, MDNode *>, 4> MDs;
  for (Module::iterator i = M->begin(), e = M->end(); i != e; ++i) {
    Function *F = &(*i);
    F->getAllMetadata(MDs);
    for (auto &MD : MDs) {
      F->setMetadata(MD.first, NULL);
    }
    F->removeFnAttr("target-features");
    F->removeFnAttr("target-cpu");
  }
}

void init_llvm_pass() {

  InitializeAllTargets();
  InitializeAllTargetMCs();
  InitializeAllAsmPrinters();
  InitializeAllAsmParsers();

  PassRegistry &Registry = *PassRegistry::getPassRegistry();

  initializeCore(Registry);
  initializeScalarOpts(Registry);
  initializeVectorization(Registry);
  initializeIPO(Registry);
  initializeAnalysis(Registry);
  initializeTransformUtils(Registry);
  initializeInstCombine(Registry);
  initializeInstrumentation(Registry);
  initializeTarget(Registry);

  llvm::StringMap<llvm::cl::Option *> &opts = llvm::cl::getRegisteredOptions();

  llvm::cl::Option *O = nullptr;

  O = opts["scalarize-load-store"];
  assert(O && "could not find LLVM option 'scalarize-load-store'");
  O->addOccurrence(1, StringRef("scalarize-load-store"), StringRef("1"), false);

  // LLVM inner loop vectorizer does not check whether the loop inside
  // another loop, in which case even a small trip count loops might be
  // worthwhile to vectorize.
  O = opts["vectorizer-min-trip-count"];
  assert(O && "could not find LLVM option 'vectorizer-min-trip-count'");
  O->addOccurrence(1, StringRef("vectorizer-min-trip-count"), StringRef("2"),
                   false);

  // Disable jump threading optimization with following two options from
  // duplicating blocks. Using jump threading will mess up parallel region
  // construction especially when kernel contains barriers.
  // TODO: If enabled then parallel region construction code needs
  // improvements and make sure it doesn't disallow other optimizations like
  // vectorization.
  O = opts["jump-threading-threshold"];
  assert(O && "could not find LLVM option 'jump-threading-threshold'");
  O->addOccurrence(1, StringRef("jump-threading-threshold"), StringRef("0"),
                   false);
  O = opts["jump-threading-implication-search-threshold"];
  assert(O && "could not find LLVM option "
              "'jump-threading-implication-search-threshold'");
  O->addOccurrence(1, StringRef("jump-threading-implication-search-threshold"),
                   StringRef("0"), false);

  // Enable diagnostics from the loop vectorizer.
  O = opts["pass-remarks-missed"];
  assert(O && "could not find LLVM option 'pass-remarks-missed'");
  O->addOccurrence(1, StringRef("pass-remarks-missed"),
                   StringRef("loop-vectorize"), false);
  O->addOccurrence(1, StringRef("pass-remarks-missed"),
                   StringRef("slp-vectorize"), false);

  O = opts["pass-remarks-analysis"];
  assert(O && "could not find LLVM option 'pass-remarks-analysis'");
  O->addOccurrence(1, StringRef("pass-remarks-analysis"),
                   StringRef("loop-vectorize"), false);
  O->addOccurrence(1, StringRef("pass-remarks-analysis"),
                   StringRef("slp-vectorize"), false);

  O = opts["pass-remarks"];
  assert(O && "could not find LLVM option 'pass-remarks'");
  O->addOccurrence(1, StringRef("pass-remarks"), StringRef("loop-vectorize"),
                   false);
  O->addOccurrence(1, StringRef("pass-remarks"), StringRef("slp-vectorize"),
                   false);
}

void llvm_preprocess(llvm::Module *M) {
  init_llvm_pass();

  auto Registry = PassRegistry::getPassRegistry();

  llvm::legacy::PassManager Passes;

  std::vector<std::string> passes;
  passes.push_back("lowerswitch");
  passes.push_back("mem2reg");
  passes.push_back("simplifycfg");
  passes.push_back("loop-simplify");
  for (auto pass : passes) {
    const PassInfo *PIs = Registry->getPassInfo(StringRef(pass));
    if (PIs) {
      Pass *thispass = PIs->createPass();
      Passes.add(thispass);
    } else {
      printf("Pass: %s not found\n", pass.c_str());
    }
  }
  Passes.run(*M);
}

bool lower_constant_expr(llvm::Module *M) {
  bool modified = false;
  LLVMContext &context = M->getContext();
  auto I32 = llvm::Type::getInt32Ty(context);
  std::vector<CallInst *> need_remove;
  for (Module::iterator i = M->begin(), e = M->end(); i != e; ++i) {
    Function *F = &(*i);
    auto func_name = F->getName().str();
    if (!isKernelFunction(M, F))
      continue;

    for (auto BB = F->begin(); BB != F->end(); ++BB) {
      for (auto BI = BB->begin(); BI != BB->end(); BI++) {
        if (auto load_inst = dyn_cast<llvm::LoadInst>(BI)) {
          auto load_from = load_inst->getOperand(0);
          if (auto get_element_ptr = dyn_cast<llvm::ConstantExpr>(load_from)) {
            modified = true;
            auto ReplInst = get_element_ptr->getAsInstruction();
            ReplInst->insertBefore(load_inst);
            std::vector<Instruction *> Users;
            // Do not replace use during iteration of use. Do it in another loop
            for (auto U : get_element_ptr->users()) {
              if (auto InstUser = dyn_cast<Instruction>(U)) {
                Users.push_back(InstUser);
              }
            }
            for (auto &User : Users)
              User->replaceUsesOfWith(get_element_ptr, ReplInst);
          }
        } else if (auto store_inst = dyn_cast<llvm::StoreInst>(BI)) {
          auto store_to = store_inst->getOperand(1);
          if (auto addr_cast = dyn_cast<llvm::ConstantExpr>(store_to)) {
            modified = true;
            auto ReplInst = addr_cast->getAsInstruction();
            ReplInst->insertBefore(store_inst);
            std::vector<Instruction *> Users;
            // Do not replace use during iteration of use. Do it in another loop
            for (auto U : addr_cast->users()) {
              if (auto InstUser = dyn_cast<Instruction>(U)) {
                Users.push_back(InstUser);
              }
            }
            for (auto &User : Users)
              User->replaceUsesOfWith(addr_cast, ReplInst);
          }
        } else if (auto get_element_ptr =
                       dyn_cast<llvm::GetElementPtrInst>(BI)) {
          auto get_from = get_element_ptr->getOperand(0);
          if (auto addr_cast = dyn_cast<llvm::ConstantExpr>(get_from)) {
            modified = true;
            auto ReplInst = addr_cast->getAsInstruction();
            ReplInst->insertBefore(get_element_ptr);
            std::vector<Instruction *> Users;
            // Do not replace use during iteration of use. Do it in another loop
            for (auto U : addr_cast->users()) {
              if (auto InstUser = dyn_cast<Instruction>(U)) {
                Users.push_back(InstUser);
              }
            }
            for (auto &User : Users)
              User->replaceUsesOfWith(addr_cast, ReplInst);
          }
        }
      }
    }
  }
  return modified;
}

void init_block(llvm::Module *M) {
  // using official llvm preprocess
  llvm_preprocess(M);
  // remove useles Cuda function
  remove_cuda_built_in(M);

  // lower ConstantExpression
  bool modified;
  do {
    modified = lower_constant_expr(M);
  } while (modified);
  // remove useless metadata
  remove_metadata(M);
  // inline vote function
  inline_func_vote(M);
  // create global variable for warp and vote
  create_global_variable(M);
  // replace phi with data load
  phi2alloc(M);
  // replace share memory
  mem_share2global(M);
  // replace asm Inline
  replace_asm_call(M);
}
