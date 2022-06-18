
#include "warp_func.h"
#include "tool.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/GlobalValue.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/Transforms/Utils/Cloning.h"
#include "llvm/Transforms/Utils/ValueMapper.h"
#include <iostream>
#include <set>

using namespace llvm;

/*
 * Insert sync before each vote, and replace the
 * original vote function to warp vote version
 */
void handle_warp_vote(llvm::Module *M) {
  std::set<llvm::CallInst *> need_replace;
  llvm::Type *Int1T = Type::getInt1Ty(M->getContext());
  llvm::Type *I32 = llvm::Type::getInt32Ty(M->getContext());
  llvm::Type *I8 = llvm::Type::getInt8Ty(M->getContext());
  auto zero = llvm::ConstantInt::get(I32, 0, true);
  auto one = llvm::ConstantInt::get(I32, 1, true);
  llvm::Type *VoteArrayType = llvm::ArrayType::get(I8, 32)->getPointerTo();

  llvm::FunctionType *LauncherFuncT =
      FunctionType::get(Int1T, {VoteArrayType}, false);
  llvm::FunctionCallee _f = M->getOrInsertFunction("warp_any", LauncherFuncT);
  llvm::Function *func_warp_any = llvm::cast<llvm::Function>(_f.getCallee());
  _f = M->getOrInsertFunction("warp_all", LauncherFuncT);
  llvm::Function *func_warp_all = llvm::cast<llvm::Function>(_f.getCallee());

  // replace llvm.nvvm.vote.any.sync to warp vote function
  for (Module::iterator i = M->begin(), e = M->end(); i != e; ++i) {
    Function *F = &(*i);
    auto func_name = F->getName().str();
    if (!isKernelFunction(M, F))
      continue;
    Function::iterator I = F->begin();
    for (Function::iterator E = F->end(); I != E; ++I) {
      for (BasicBlock::iterator BI = I->begin(); BI != I->end(); BI++) {
        if (CallInst *vote_any_sync = dyn_cast<CallInst>(BI)) {
          if (vote_any_sync->isInlineAsm())
            continue;
          auto func_name = vote_any_sync->getCalledFunction()->getName();
          if (func_name == "llvm.nvvm.vote.any.sync" ||
              func_name == "llvm.nvvm.vote.all.sync") {
            // insert sync before call
            need_replace.insert(vote_any_sync);
          }
        }
      }
    }
  }

  GlobalVariable *warp_vote_ptr = M->getNamedGlobal("warp_vote");
  for (auto sync_inst : need_replace) {
    // create barrier
    CreateIntraWarpBarrier(sync_inst);
    /*
     * store into warp_vote[tid]
     */
    assert(warp_vote_ptr != NULL);
    auto intra_warp_index_addr = M->getGlobalVariable("intra_warp_index");
    auto intra_warp_index =
        new LoadInst(intra_warp_index_addr->getType()->getPointerElementType(),
                     intra_warp_index_addr, "intra_warp_index", sync_inst);

    auto GEP = GetElementPtrInst::Create(NULL,          // Pointee type
                                         warp_vote_ptr, // Alloca
                                         {zero, intra_warp_index}, // Indices
                                         "", sync_inst);

    // as AVX only support 8bit for each thread
    // so we have to cast the predict into int8
    auto predict = llvm::CastInst::CreateIntegerCast(
        sync_inst->getArgOperand(1), I8, false, "", sync_inst);
    // we need to concern mask
    auto mask = llvm::CastInst::CreateIntegerCast(sync_inst->getArgOperand(0),
                                                  I32, false, "", sync_inst);
    auto bit_flag = BinaryOperator::Create(Instruction::LShr, mask,
                                           intra_warp_index, "", sync_inst);
    auto valid =
        BinaryOperator::Create(Instruction::And, one, bit_flag, "", sync_inst);
    auto valid_8bit =
        llvm::CastInst::CreateIntegerCast(valid, I8, false, "", sync_inst);

    llvm::Instruction *res;
    if (sync_inst->getCalledFunction()->getName() ==
        "llvm.nvvm.vote.any.sync") {
      res = BinaryOperator::Create(Instruction::Mul, valid_8bit, predict, "",
                                   sync_inst);
    } else if (sync_inst->getCalledFunction()->getName() ==
               "llvm.nvvm.vote.all.sync") {
      auto reverse_valid = BinaryOperator::CreateNot(valid_8bit, "", sync_inst);
      res = BinaryOperator::Create(Instruction::Or, reverse_valid, predict, "",
                                   sync_inst);
      // as AVX do not have all, we have to
      // reverse the result and call AVX-any instead
      res = BinaryOperator::CreateNot(res, "", sync_inst);
    }

    auto sotre_mask = new llvm::StoreInst(res, GEP, "", sync_inst);
    // create barrier
    CreateIntraWarpBarrier(sync_inst);
    /*
     * replace llvm.nvvm.vote.any.sync(i32 mask, i1 predict)
     * to warp_any(i32 mask, i8* predict)
     */
    std::vector<Value *> args;
    // args.push_back(mask);
    args.push_back(warp_vote_ptr);
    llvm::Instruction *warp_inst;
    if (sync_inst->getCalledFunction()->getName() ==
        "llvm.nvvm.vote.any.sync") {
      warp_inst = llvm::CallInst::Create(func_warp_any, args, "", sync_inst);
    } else if (sync_inst->getCalledFunction()->getName() ==
               "llvm.nvvm.vote.all.sync") {
      warp_inst = llvm::CallInst::Create(func_warp_all, args, "", sync_inst);
    }
    sync_inst->replaceAllUsesWith(warp_inst);
    sync_inst->eraseFromParent();
  }
}

void handle_warp_shfl(llvm::Module *M) {
  std::set<llvm::CallInst *> need_replace;

  llvm::Type *I32 = llvm::Type::getInt32Ty(M->getContext());
  auto ZERO = llvm::ConstantInt::get(I32, 0, true);
  // replace llvm.nvvm.vote.any.sync to warp vote function
  for (Module::iterator i = M->begin(), e = M->end(); i != e; ++i) {
    Function *F = &(*i);
    if (!isKernelFunction(M, F))
      continue;
    Function::iterator I = F->begin();
    for (Function::iterator E = F->end(); I != E; ++I) {
      for (BasicBlock::iterator BI = I->begin(); BI != I->end(); BI++) {
        if (CallInst *warp_shfl = dyn_cast<CallInst>(BI)) {
          auto func_name = warp_shfl->getCalledFunction()->getName();
          if (func_name == "llvm.nvvm.shfl.sync.down.i32" ||
              func_name == "llvm.nvvm.shfl.sync.up.i32" ||
              func_name == "llvm.nvvm.shfl.sync.bfly.i32") {
            // insert sync before call
            need_replace.insert(warp_shfl);
          }
        }
      }
    }
  }

  GlobalVariable *warp_shfl_ptr = M->getNamedGlobal("warp_shfl");
  for (auto shfl_inst : need_replace) {
    /*
     * %10 = tail call i32 @llvm.nvvm.shfl.sync.down.i32(i32 -1, i32 %add32, i32
     * 16, i32 31)
     * ->
     * warp_shfl[warp_id] = add32
     * warp.barrier()
     * %10 = warp_shfl[warp_id + offset]
     */
    IRBuilder<> builder(shfl_inst);

    auto shfl_variable = shfl_inst->getArgOperand(1);
    auto shfl_offset = shfl_inst->getArgOperand(2);

    auto intra_warp_index =
        createLoad(builder, M->getGlobalVariable("intra_warp_index"));
    builder.CreateStore(shfl_variable, createGEP(builder, warp_shfl_ptr,
                                                 {ZERO, intra_warp_index}));
    // we should create barrier before store
    CreateIntraWarpBarrier(intra_warp_index);
    // load shuffled data
    auto new_intra_warp_index =
        createLoad(builder, M->getGlobalVariable("intra_warp_index"));
    auto shfl_name = shfl_inst->getCalledFunction()->getName().str();
    if (shfl_name.find("down") != shfl_name.npos) {
      auto calculate_offset = builder.CreateBinOp(
          Instruction::Add, new_intra_warp_index, shfl_offset);
      auto new_index = builder.CreateBinOp(Instruction::SRem, calculate_offset,
                                           ConstantInt::get(I32, 32));
      auto gep = createGEP(builder, warp_shfl_ptr, {ZERO, new_index});
      auto load_inst = createLoad(builder, gep);

      // create barrier
      CreateIntraWarpBarrier(new_intra_warp_index);
      shfl_inst->replaceAllUsesWith(load_inst);
      shfl_inst->eraseFromParent();
    } else if (shfl_name.find("up") != shfl_name.npos) {
      auto calculate_offset = builder.CreateBinOp(
          Instruction::Sub, new_intra_warp_index, shfl_offset);
      auto new_index = builder.CreateBinOp(Instruction::SRem, calculate_offset,
                                           ConstantInt::get(I32, 32));
      auto gep = createGEP(builder, warp_shfl_ptr, {ZERO, new_index});
      auto load_inst = createLoad(builder, gep);

      // create barrier
      CreateIntraWarpBarrier(new_intra_warp_index);
      shfl_inst->replaceAllUsesWith(load_inst);
      shfl_inst->eraseFromParent();
    } else if (shfl_name.find("bfly") != shfl_name.npos) {
      auto calculate_offset = builder.CreateBinOp(
          Instruction::Xor, new_intra_warp_index, shfl_offset);
      auto new_index = builder.CreateBinOp(Instruction::SRem, calculate_offset,
                                           ConstantInt::get(I32, 32));
      auto gep = createGEP(builder, warp_shfl_ptr, {ZERO, new_index});
      auto load_inst = createLoad(builder, gep);

      // create barrier
      CreateIntraWarpBarrier(new_intra_warp_index);
      shfl_inst->replaceAllUsesWith(load_inst);
      shfl_inst->eraseFromParent();
    }
  }
}
