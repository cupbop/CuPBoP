#include "handle_sync.h"
#include "debug.hpp"
#include "tool.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/GlobalValue.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/InlineAsm.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include <set>
#include <string>

using namespace llvm;

void split_block_by_sync(llvm::Function *F) {
  std::set<llvm::Instruction *> sync_inst;
  bool jump_first_sync = 1;
  for (Function::iterator b = F->begin(); b != F->end(); ++b) {
    BasicBlock *B = &(*b);
    for (BasicBlock::iterator i = B->begin(); i != B->end(); ++i) {
      Instruction *inst = &(*i);
      if (jump_first_sync) {
        jump_first_sync = 0;
        Instruction *next_inst = &(*std::next(i));
        sync_inst.insert(next_inst);
        continue;
      }
      llvm::CallInst *Call = llvm::dyn_cast<llvm::CallInst>(inst);
      if (Call) {
        if (Call->isInlineAsm())
          continue;
        auto func_name = Call->getCalledFunction()->getName().str();
        if (func_name == "llvm.nvvm.barrier0" ||
            func_name == "llvm.nvvm.bar.warp.sync" ||
            func_name == "llvm.nvvm.barrier.sync") {
          sync_inst.insert(Call);
          // we should also sync the next instruction
          // so that we can get a block with sync inst only
          Instruction *next_inst = &(*std::next(i));
          sync_inst.insert(next_inst);
        }
      }
    }
  }
  int _tmp = 0;
  for (auto inst : sync_inst) {
    inst->getParent()->splitBasicBlock(
        inst, inst->getParent()->getName().str() + "_after_block_sync_" +
                  std::to_string(_tmp++));
  }
}

void split_block_by_sync(llvm::Module *M) {
  DEBUG_INFO("split block by sync\n");
  for (Module::iterator i = M->begin(), e = M->end(); i != e; ++i) {
    Function *F = &(*i);
    if (isKernelFunction(M, F))
      split_block_by_sync(F);
  }
}
