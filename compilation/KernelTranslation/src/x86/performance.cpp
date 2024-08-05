#include "performance.h"
#include "debug.hpp"
#include "tool.h"
#include "llvm/ADT/Statistic.h"
#include "llvm/ADT/StringRef.h"
#include "llvm/ADT/Triple.h"
#include "llvm/Analysis/LoopInfo.h"
#include "llvm/Analysis/LoopPass.h"
#include "llvm/Analysis/TargetLibraryInfo.h"
#include "llvm/Analysis/TargetTransformInfo.h"
#include "llvm/CodeGen/MachineModuleInfo.h"
#include "llvm/IR/CFG.h"
#include "llvm/IR/DataLayout.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/GlobalValue.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/InlineAsm.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/ValueSymbolTable.h"
#include "llvm/InitializePasses.h"
#include "llvm/MC/TargetRegistry.h"
#include "llvm/PassInfo.h"
#include "llvm/PassRegistry.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/Host.h"
#include "llvm/Target/TargetMachine.h"
#include "llvm/Target/TargetOptions.h"
#include "llvm/Transforms/IPO/PassManagerBuilder.h"
#include "llvm/Transforms/Utils/BasicBlockUtils.h"
#include "llvm/Transforms/Utils/Cloning.h"
#include "llvm/Transforms/Utils/ValueMapper.h"
#include <map>
#include <set>
#include <sstream>
#include <tuple>
#include <vector>

using namespace llvm;

void eliminate_redudant_threadIdx_computation(llvm::Module *M) {
  for (Module::iterator f = M->begin(); f != M->end(); ++f) {
    Function *F = &(*f);
    if (!isKernelFunction(M, F))
      continue;
    // check whether we have inter_warp
    bool has_inter_warp = false;
    for (Function::iterator b = F->begin(); b != F->end(); ++b) {
      BasicBlock *B = &(*b);
      if (B->getName().startswith("inter_warp_cond")) {
        has_inter_warp = true;
        break;
      }
    }
    if (!has_inter_warp) {
      // since there is not inter_warp, the inter_warp_index is always 0,
      // threadIdx = 32*inter_warp_index+intra_warp_index --> threadIdx =
      // intra_warp_index
      for (Function::iterator b = F->begin(); b != F->end(); ++b) {
        BasicBlock *B = &(*b);
        LoadInst *load_intra_warp_index = NULL;
        // if there is store to local_intra_warp_idx, it is not safe to replace
        bool safe_to_replace = true;
        std::set<Instruction *> need_to_replace;
        for (BasicBlock::iterator i = B->begin(); i != B->end(); ++i) {
          Instruction *inst = &(*i);
          if (auto loadInst = dyn_cast<LoadInst>(inst)) {
            if (loadInst->getOperand(0)->getName().equals(
                    "local_intra_warp_idx") &&
                !load_intra_warp_index)
              load_intra_warp_index = loadInst;
          } else if (auto storeInst = dyn_cast<StoreInst>(inst)) {
            if (storeInst->getOperand(1)->getName().equals(
                    "local_intra_warp_idx")) {
              safe_to_replace = false;
              break;
            }
          } else if (auto binaryInst = dyn_cast<BinaryOperator>(inst)) {
            if (binaryInst->getName().startswith("thread_idx") &&
                binaryInst->getOpcode() == Instruction::Add) {
              need_to_replace.insert(binaryInst);
            }
          }
        }
        if (safe_to_replace) {
          for (auto inst : need_to_replace) {
            inst->replaceAllUsesWith(load_intra_warp_index);
            inst->eraseFromParent();
          }
        }
      }
    }
  }
}

void performance_optimization(llvm::Module *M) {
  DEBUG_INFO("performance optimization\n");
  // remove useless load
  eliminate_redudant_threadIdx_computation(M);
  // we assume no alias in arguments
  for (auto F = M->begin(); F != M->end(); F++) {
    for (auto I = F->arg_begin(); I != F->arg_end(); ++I) {
      if (I->getType()->isPointerTy()) {
        I->addAttr(llvm::Attribute::NoAlias);
      }
    }
  }
  llvm::legacy::PassManager Passes;

  // add target machine info
  llvm::Triple triple("x86_64-unknown-linux-gnu");

  std::string Error;
  const Target *TheTarget = TargetRegistry::lookupTarget("", triple, Error);
  assert(TheTarget && "No Target Information\n");
  llvm::TargetOptions Options;
  Options.FloatABIType = FloatABI::Hard;

  TargetMachine *TM = TheTarget->createTargetMachine(
      triple.getTriple(), llvm::sys::getHostCPUName().str(), StringRef(""),
      Options, Reloc::PIC_, CodeModel::Small, CodeGenOpt::Aggressive);
  assert(TM && "No Machine Information\n");

  Passes.add(createTargetTransformInfoWrapperPass(TM->getTargetIRAnalysis()));

  TargetLibraryInfoImpl TLII(triple);
  TLII.disableAllFunctions();
  Passes.add(new TargetLibraryInfoWrapperPass(TLII));

  // Add O3 optimization
  llvm::PassManagerBuilder Builder;
  Builder.OptLevel = 3;
  Builder.SizeLevel = 0;

  Builder.LoopVectorize = true;
  Builder.SLPVectorize = true;

  // Builder.VerifyInput = true;
  // Builder.VerifyOutput = true;

  Builder.populateModulePassManager(Passes);
  Passes.run(*M);
}

/*
 * Check whether the value of inst is linear with blockDim
 */
bool linear_with_blockDim(llvm::Instruction *inst,
                          std::set<llvm::Instruction *> visited) {

  bool result = false;
  if (llvm::CallBase *callInst = llvm::dyn_cast<llvm::CallBase>(inst)) {
    if (Function *calledFunction = callInst->getCalledFunction()) {
      if (calledFunction->getName().startswith(
              "llvm.nvvm.read.ptx.sreg.ntid")) {
        result = true;
      }
    } else {
      result = false;
    }
  } else if (auto binOp = llvm::dyn_cast<llvm::BinaryOperator>(inst)) {
    if (auto lhs = dyn_cast<llvm::Instruction>(binOp->getOperand(0)))
      if (visited.find(lhs) == visited.end()) {
        visited.insert(lhs);
        result |= linear_with_blockDim(lhs, visited);
      }

    if (auto rhs = dyn_cast<llvm::Instruction>(binOp->getOperand(1)))
      if (visited.find(rhs) == visited.end()) {
        visited.insert(rhs);
        result |= linear_with_blockDim(rhs, visited);
      }
  } else if (auto loadInst = llvm::dyn_cast<llvm::LoadInst>(inst)) {
    // find all store that related to this load
    auto address = loadInst->getOperand(0);
    bool all_linear_with_blockDim = true;
    for (auto U : address->users()) {
      if (auto store = dyn_cast<StoreInst>(U)) {
        all_linear_with_blockDim &= linear_with_blockDim(store, visited);
      } else if (!isa<AllocaInst>(U) && U != loadInst) {
        all_linear_with_blockDim = false;
      }
    }
    result = all_linear_with_blockDim;
  } else if (auto storeInst = llvm::dyn_cast<llvm::StoreInst>(inst)) {
    if (isa<llvm::Instruction>(storeInst->getOperand(0)))
      result = linear_with_blockDim(
          dyn_cast<llvm::Instruction>(storeInst->getOperand(0)), visited);
  }
  return result;
}
/*
 * check whether a variable des is linear related with variable src
 */
bool linear_related(llvm::Instruction *src, llvm::Instruction *des) {
  if (src == des)
    return true;
  if (auto cast = dyn_cast<CastInst>(des)) {
    if (auto cast_var = dyn_cast<llvm::Instruction>(cast->getOperand(0)))
      return linear_related(src, cast_var);
  } else if (auto load = dyn_cast<LoadInst>(des)) {
    if (auto load_var = dyn_cast<llvm::Instruction>(load->getOperand(0)))
      return linear_related(src, load_var);
  }
  return false;
}
/*
 * check whether the loop contains global memory coalescing optimizations
 * we identify the memory coalescing according to that:
 * 1) the loop iteration variable is linearly related with blockDim;
 * 2) there are memory access, where the index is: induction_variable +
 * threadIdx and the index is the -1 dimension;
 */
bool loop_contains_global_memory_coalescing(llvm::Loop *L) {
  printf("check loop with header: %s\n",
         L->getHeader()->getName().str().c_str());
  // find iteration variable
  auto loop_latch = L->getLoopLatch();
  auto F = loop_latch->getParent();
  if (!loop_latch) {
    return false;
  }
  llvm::Instruction *iteration_var = NULL;
  llvm::Instruction *inc_inst = NULL;
  for (BasicBlock::reverse_iterator i = loop_latch->rbegin(),
                                    e = loop_latch->rend();
       i != e; ++i) {
    if (auto Store = dyn_cast<llvm::StoreInst>(&*i)) {
      if (isa<llvm::Instruction>(Store->getOperand(1))) {
        iteration_var = dyn_cast<llvm::Instruction>(Store->getOperand(1));
        inc_inst = dyn_cast<llvm::Instruction>(Store->getOperand(0));

        break;
      }
    }
  }
  if (!iteration_var) {
    // cannot find iteration variable
    exit(1);
  }

  // check whether the stride is a linear function of blockDim
  std::set<llvm::Instruction *> visited;
  if (!linear_with_blockDim(inc_inst, visited)) {
    // the stride is not linear with blockDim
    printf("not linear with block\n");
    return false;
  }
  // check whether the loop contains GEP insturction, with iteration_var as the
  // last dimension
  for (Loop::block_iterator i = L->block_begin(), e = L->block_end(); i != e;
       ++i) {
    for (BasicBlock::iterator j = (*i)->begin(), e = (*i)->end(); j != e; ++j) {
      if (auto GEP = dyn_cast<GetElementPtrInst>(j)) {
        auto last_dim = GEP->getOperand(GEP->getNumIndices());
        if (auto last_dim_var = dyn_cast<llvm::Instruction>(last_dim)) {
          if (linear_related(iteration_var, last_dim_var)) {
            printf("Find global memory coalescing\n");
            return true;
          }
        }
      }
    }
  }
  return false;
}
