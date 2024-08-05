#include "generate_x86_format.h"
#include "debug.hpp"
#include "tool.h"
#include "llvm/Analysis/TargetLibraryInfo.h"
#include "llvm/Analysis/TargetTransformInfo.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/GlobalValue.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Verifier.h"
#include "llvm/IRReader/IRReader.h"
#include "llvm/MC/TargetRegistry.h"
#include "llvm/Support/TargetSelect.h"
#include "llvm/Support/ToolOutputFile.h"
#include "llvm/Target/TargetMachine.h"
#include "llvm/Target/TargetOptions.h"
#include "llvm/Transforms/Utils/Cloning.h"
#include "llvm/Transforms/Utils/ValueMapper.h"
#include <iostream>
#include <map>

using namespace llvm;

void set_meta_data(llvm::Module *M) {
  M->setTargetTriple("x86_64-unknown-linux-gnu");
  M->setDataLayout(
      "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128");
}

// As pthread only accept a single void* for input
// we have to decode this input inside the kernel
void generate_wrapper_func(llvm::Module *M, llvm::Module *host_module) {

  std::set<Dim3SizeConfig> possible_block_size_list =
      get_possible_grid_or_block_size(host_module, /*getBlockSize=*/true);
  if (possible_block_size_list.size() != 0) {
    printf("possible block sizes: \n");
    for (auto block_size : possible_block_size_list) {
      printf("x: %d y: %d z: %d\n", block_size._x, block_size._y,
             block_size._z);
    }
    printf("\n");
  }

  std::set<llvm::Function *> need_remove;

  LLVMContext *C = &M->getContext();
  llvm::Type *Int32T = Type::getInt32Ty(*C);
  llvm::Type *Int8T = Type::getInt8Ty(*C);

  llvm::FunctionType *LauncherFuncT = FunctionType::get(
      Type::getVoidTy(*C), {PointerType::get(Int8T, 0)}, false);

  std::set<GlobalVariable *> dynmaic_memory;

  std::map<GlobalVariable *, Value *> corres_dynamic_memory_load_address;

  // generate Wrapper Function type
  // now we only support a single int32*
  for (Module::iterator i = M->begin(), e = M->end(); i != e; ++i) {
    Function *F = &(*i);
    if (!isKernelFunction(M, F))
      continue;
    auto func_name = F->getName().str();
    // remove mangle prefix: _Z24
    for (int pos = 2; pos < func_name.length(); pos++) {
      if (func_name[pos] >= '0' && func_name[pos] <= '9')
        continue;
      func_name = func_name.substr(pos);
      break;
    }
    llvm::IRBuilder<> Builder(M->getContext());

    FunctionCallee fc =
        M->getOrInsertFunction(func_name + "_wrapper", LauncherFuncT);
    Function *WorkGroup = dyn_cast<Function>(fc.getCallee());

    // create the entry block
    BasicBlock *Block = BasicBlock::Create(M->getContext(), "", WorkGroup);
    Builder.SetInsertPoint(Block);

    // WorkGroup has only a single input
    Function::arg_iterator ai = WorkGroup->arg_begin();

    SmallVector<Value *, 8> Arguments;
    Value *input_arg = &*ai;
    // convert to int**
    input_arg = Builder.CreateBitOrPointerCast(
        input_arg, PointerType::get(PointerType::get(Int32T, 0), 0));

    // dynamic memory load in the wrapper function
    GlobalVariable *share_memory = M->getGlobalVariable("wrapper_global_data");
    if (share_memory != NULL) {
      dynmaic_memory.insert(share_memory);
      llvm::GlobalVariable *global_mem = new llvm::GlobalVariable(
          *M, Int32T, false, llvm::GlobalValue::ExternalLinkage, NULL,
          "thread_memory_size", NULL, llvm::GlobalValue::GeneralDynamicTLSModel,
          0, false);
      Value *loadedValue = createLoad(Builder, global_mem);

      llvm::FunctionType *LaunchFun2 = FunctionType::get(
          PointerType::get(PointerType::get(Int32T, 0), 0), NULL);

      FunctionCallee fc2 =
          M->getOrInsertFunction("_wrapper_global_data", LaunchFun2);

      Function *WorkGroup2 = dyn_cast<Function>(fc2.getCallee());

      WorkGroup2->setLinkage(GlobalValue::WeakODRLinkage);
      WorkGroup2->setVisibility(GlobalValue::HiddenVisibility);
      Comdat *co = M->getOrInsertComdat("_wrapper_global_data");
      co->setSelectionKind(Comdat::SelectionKind::Any);
      WorkGroup2->setComdat(co);

      BasicBlock *Block2 = BasicBlock::Create(M->getContext(), "", WorkGroup2);

      llvm::IRBuilder<> Builder2(M->getContext());
      Builder2.SetInsertPoint(Block2);
      Builder2.CreateRet(share_memory);

      auto PT = dyn_cast<PointerType>(share_memory->getType());
      auto element_type = PT->getElementType();

      AllocaInst *new_arr = Builder.CreateAlloca(Int8T, loadedValue, "new_arr");
      Value *new_ar = new_arr;
      Value *gptr = Builder.CreateBitOrPointerCast(
          share_memory, PointerType::get(PointerType::get(Int8T, 0), 0));

      Builder.CreateStore(new_ar, gptr);
    }

    size_t idx = 0;
    for (Function::const_arg_iterator ii = F->arg_begin(), ee = F->arg_end();
         ii != ee; ++ii) {
      Type *ArgType = ii->getType();

      // calculate addr
      Value *GEP = createGEP(Builder, input_arg, ConstantInt::get(Int32T, idx));
      // load corresponding int*
      GEP = createLoad(Builder, GEP);
      // bitcast
      GEP = Builder.CreateBitOrPointerCast(GEP, PointerType::get(ArgType, 0));
      Value *Arg = createLoad(Builder, GEP);
      Arguments.push_back(Arg);
      ++idx;
    }

    // replace the block_size to constant in the kernel functions,
    // and use switch to choose to call which function

    BasicBlock *Exit_Block = BasicBlock::Create(M->getContext(), "", WorkGroup);
    {
      llvm::IRBuilder<> Builder3(M->getContext());
      Builder3.SetInsertPoint(Exit_Block);
      Builder3.CreateRetVoid();
    }

    auto block_size_global = M->getGlobalVariable("block_size");
    auto loaded_block_size = Builder.CreateLoad(
        block_size_global->getType()->getElementType(), block_size_global);
    BasicBlock *default_call_block =
        BasicBlock::Create(*C, "default_block_size", WorkGroup);
    auto default_call_inst = llvm::CallInst::Create(
        F, ArrayRef<llvm::Value *>(Arguments), "", default_call_block);
    llvm::BranchInst::Create(Exit_Block, default_call_block);
    auto switchInst =
        Builder.CreateSwitch(loaded_block_size, default_call_block);

    for (auto block_size_config : possible_block_size_list) {
      // Clone a new function
      ValueToValueMapTy EmptyMap;
      Function *Clone = CloneFunction(F, EmptyMap);
      Clone->setName(F->getName() + "_block_size_" +
                     block_size_config.toString());
      // replace all reference to block_size to constants
      auto replace_global_variable_with_constant =
          [&](llvm::GlobalVariable *global_variable, int constant) {
            ConstantInt *constant_int =
                dyn_cast<ConstantInt>(ConstantInt::get(Int32T, constant, true));
            std::vector<llvm::Value *> Users(global_variable->user_begin(),
                                             global_variable->user_end());
            for (auto *U : Users) {
              if (auto *loadInst = llvm::dyn_cast<llvm::LoadInst>(U))
                if (loadInst->getParent()->getParent() == Clone) {
                  loadInst->replaceAllUsesWith(constant_int);
                }
            }
          };

      int total_block_size =
          block_size_config._x * block_size_config._y * block_size_config._z;
      replace_global_variable_with_constant(M->getGlobalVariable("block_size"),
                                            total_block_size);
      replace_global_variable_with_constant(
          M->getGlobalVariable("block_size_x"), block_size_config._x);
      replace_global_variable_with_constant(
          M->getGlobalVariable("block_size_y"), block_size_config._y);
      replace_global_variable_with_constant(
          M->getGlobalVariable("block_size_z"), block_size_config._z);
      BasicBlock *possible_call_block = BasicBlock::Create(
          *C, "block_size_" + block_size_config.toString(), WorkGroup);
      auto call_inst = llvm::CallInst::Create(
          Clone, ArrayRef<llvm::Value *>(Arguments), "", possible_call_block);
      auto branch_inst =
          llvm::BranchInst::Create(Exit_Block, possible_call_block);
      switchInst->addCase(dyn_cast<ConstantInt>(
                              ConstantInt::get(Int32T, total_block_size, true)),
                          possible_call_block);
    }
  }
  for (auto f : need_remove) {
    f->dropAllReferences();
    f->eraseFromParent();
  }
}

void remove_barrier(llvm::Module *M) {
  std::vector<Instruction *> need_remove;
  for (auto F = M->begin(); F != M->end(); ++F)
    for (auto BB = F->begin(); BB != F->end(); ++BB) {
      for (auto BI = BB->begin(); BI != BB->end(); BI++) {
        if (auto Call = dyn_cast<CallInst>(BI)) {
          if (Call->isInlineAsm())
            continue;
          auto func_name = Call->getCalledFunction()->getName().str();
          if (func_name == "llvm.nvvm.bar.warp.sync" ||
              func_name == "llvm.nvvm.barrier0" ||
              func_name == "llvm.nvvm.barrier.sync") {
            need_remove.push_back(Call);
          }
        }
      }
    }
  for (auto inst : need_remove) {
    inst->eraseFromParent();
  }
}

void remove_useless_var(llvm::Module *M) {
  M->getGlobalVariable("intra_warp_index")->eraseFromParent();
  M->getGlobalVariable("inter_warp_index")->eraseFromParent();
}

void generate_x86_format(llvm::Module *M, llvm::Module *host_module) {
  DEBUG_INFO("generate x86 format\n");
  // change metadata
  set_meta_data(M);
  // generate wrapper func for the kernel functions
  generate_wrapper_func(M, host_module);
  // remove barrier
  remove_barrier(M);
  // remove useless func/variable
  remove_useless_var(M);
}
