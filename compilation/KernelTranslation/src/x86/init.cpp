#include "init.h"
#include "debug.hpp"
#include "memory_hierarchy.h"
#include "tool.h"
#include <fstream>
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

bool inline_warp_level_func(llvm::Module *M) {
  bool changed = false;
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
            auto func_name = c->getCalledFunction()->getName().str();
            if (func_name == "_Z10__any_syncji" ||
                func_name.find("shfl_down_sync") != std::string::npos) {
              InlineFunctionInfo IFI;
              InlineFunction(*c, IFI);
              need_remove.insert(c->getCalledFunction());
              changed = true;
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
  return changed;
}

bool find_sreg_inst(llvm::Function *F) {
  Function::iterator I = F->begin();
  for (Function::iterator E = F->end(); I != E; ++I) {
    for (BasicBlock::iterator BI = I->begin(), BE = I->end(); BI != BE;) {
      if (CallInst *c = dyn_cast<CallInst>(BI++)) {
        if (c->getCalledFunction()) {
          auto func_name = c->getCalledFunction()->getName().str();
          if (func_name.find("llvm.nvvm.read.ptx.sreg.") != std::string::npos) {
            return true;
          }
        }
      }
    }
  }
  return false;
}

bool inline_func_with_tid(llvm::Module *M) {
  bool changed = false;
  std::set<llvm::Function *> need_remove;
  std::set<CallInst *> need_inline;
  for (Module::iterator i = M->begin(), e = M->end(); i != e; ++i) {
    Function *F = &(*i);
    auto func_name = F->getName().str();
    Function::iterator I = F->begin();
    for (Function::iterator E = F->end(); I != E; ++I) {
      for (BasicBlock::iterator BI = I->begin(), BE = I->end(); BI != BE;) {
        if (CallInst *c = dyn_cast<CallInst>(BI++)) {
          if (c->getCalledFunction()) {
            if (find_sreg_inst(c->getCalledFunction())) {
              DEBUG_INFO("inline: %s\n",
                         c->getCalledFunction()->getName().str().c_str());
              need_inline.insert(c);
              need_remove.insert(c->getCalledFunction());
            }
          }
        }
      }
    }
  }
  if (!need_inline.empty()) {
    changed = true;
  }
  for (auto c : need_inline) {
    InlineFunctionInfo IFI;
    InlineFunction(*c, IFI);
  }
  for (auto f : need_remove) {
    f->dropAllReferences();
    f->eraseFromParent();
  }
  return changed;
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
                           llvm::GlobalValue::GeneralDynamicTLSModel, 0, false);
  new llvm::GlobalVariable(*M, I32, false, llvm::GlobalValue::ExternalLinkage,
                           NULL, "block_size_x", NULL,
                           llvm::GlobalValue::GeneralDynamicTLSModel, 0, false);
  new llvm::GlobalVariable(*M, I32, false, llvm::GlobalValue::ExternalLinkage,
                           NULL, "block_size_y", NULL,
                           llvm::GlobalValue::GeneralDynamicTLSModel, 0, false);
  new llvm::GlobalVariable(*M, I32, false, llvm::GlobalValue::ExternalLinkage,
                           NULL, "block_size_z", NULL,
                           llvm::GlobalValue::GeneralDynamicTLSModel, 0, false);
  new llvm::GlobalVariable(*M, I32, false, llvm::GlobalValue::ExternalLinkage,
                           NULL, "grid_size_x", NULL,
                           llvm::GlobalValue::GeneralDynamicTLSModel, 0, false);
  new llvm::GlobalVariable(*M, I32, false, llvm::GlobalValue::ExternalLinkage,
                           NULL, "grid_size_y", NULL,
                           llvm::GlobalValue::GeneralDynamicTLSModel, 0, false);
  new llvm::GlobalVariable(*M, I32, false, llvm::GlobalValue::ExternalLinkage,
                           NULL, "grid_size_z", NULL,
                           llvm::GlobalValue::GeneralDynamicTLSModel, 0, false);
  new llvm::GlobalVariable(*M, I32, false, llvm::GlobalValue::ExternalLinkage,
                           NULL, "block_index_x", NULL,
                           llvm::GlobalValue::GeneralDynamicTLSModel, 0, false);
  new llvm::GlobalVariable(*M, I32, false, llvm::GlobalValue::ExternalLinkage,
                           NULL, "block_index_y", NULL,
                           llvm::GlobalValue::GeneralDynamicTLSModel, 0, false);
  new llvm::GlobalVariable(*M, I32, false, llvm::GlobalValue::ExternalLinkage,
                           NULL, "block_index_z", NULL,
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
    F->removeFnAttr(llvm::Attribute::NoInline);
    F->removeFnAttr("min-legal-vector-width");
    F->removeFnAttr("no-trapping-math");
    F->removeFnAttr(llvm::Attribute::OptimizeNone);
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
      DEBUG_INFO("Pass: %s not found\n", pass.c_str());
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
            std::vector<Instruction *> Users;
            for (auto U : get_element_ptr->users()) {
              if (auto InstUser = dyn_cast<Instruction>(U)) {
                Users.push_back(InstUser);
              }
            }
            for (auto &User : Users) {
              auto ReplInst = get_element_ptr->getAsInstruction();
              ReplInst->insertBefore(User);
              User->replaceUsesOfWith(get_element_ptr, ReplInst);
            }
          }
        } else if (auto store_inst = dyn_cast<llvm::StoreInst>(BI)) {
          auto store_to = store_inst->getOperand(1);
          if (auto addr_cast = dyn_cast<llvm::ConstantExpr>(store_to)) {
            modified = true;

            std::vector<Instruction *> Users;
            // Do not replace use during iteration of use. Do it in another loop
            for (auto U : addr_cast->users()) {
              if (auto InstUser = dyn_cast<Instruction>(U)) {
                Users.push_back(InstUser);
              }
            }
            for (auto &User : Users) {
              auto ReplInst = addr_cast->getAsInstruction();
              ReplInst->insertBefore(User);
              User->replaceUsesOfWith(addr_cast, ReplInst);
            }
          }
        } else if (auto get_element_ptr =
                       dyn_cast<llvm::GetElementPtrInst>(BI)) {
          auto get_from = get_element_ptr->getOperand(0);
          if (auto addr_cast = dyn_cast<llvm::ConstantExpr>(get_from)) {
            modified = true;
            std::vector<Instruction *> Users;
            // Do not replace use during iteration of use. Do it in another loop
            for (auto U : addr_cast->users()) {
              if (auto InstUser = dyn_cast<Instruction>(U)) {
                Users.push_back(InstUser);
              }
            }
            for (auto &User : Users) {
              auto ReplInst = addr_cast->getAsInstruction();
              ReplInst->insertBefore(User);
              User->replaceUsesOfWith(addr_cast, ReplInst);
            }
          }
        }
      }
    }
  }
  return modified;
}

void replace_cuda_math_built_in(llvm::Module *M) {
  // replace _ZL3expd, just delete its body
  for (Module::iterator i = M->begin(), e = M->end(); i != e; ++i) {
    Function *F = &(*i);
    auto func_name = F->getName().str();
    if (func_name.find("_ZL3expd") != std::string::npos) {
      F->deleteBody();
    }
    if (func_name.find("_ZL8copysigndd") != std::string::npos) {
      F->deleteBody();
    }
    if (func_name.find("_ZL8copysigndd.8") != std::string::npos) {
      F->deleteBody();
    }
  }
}

void init_block(llvm::Module *M, std::ofstream &fout) {
  DEBUG_INFO("init block\n");
  // using official llvm preprocess
  llvm_preprocess(M);
  // remove useles Cuda function
  remove_cuda_built_in(M);
  // replace CUDA math function, like expf
  replace_cuda_math_built_in(M);
  // replace CUDA math function, like expf
  replace_cuda_math_built_in(M);

  // lower ConstantExpression
  bool modified;
  do {
    modified = lower_constant_expr(M);
  } while (modified);
  // remove useless metadata
  remove_metadata(M);
  // inline warp-level function
  while (1) {
    if (!inline_warp_level_func(M))
      break;
  }
  // TODO: remove the hardcode
  while (1) {
    if (!inline_func_with_tid(M))
      break;
  }
  // create global variable for warp and vote
  create_global_variable(M);
  // replace phi with data load
  phi2alloc(M);
  // replace share memory
  mem_share2global(M);
  // replace share memory
  mem_constant2global(M, fout);
  // replace asm Inline
  replace_asm_call(M);
  // replace dynamic shared memory
  auto dynamic_shared_memory_addr =
      M->getGlobalVariable("dynamic_shared_memory");
  if (dynamic_shared_memory_addr) {
    replace_dynamic_shared_memory(M);
  }
}
