
#include "insert_warp_loop.h"
#include "handle_sync.h"
#include "tool.h"
#include <assert.h>
#include <iostream>
#include <set>

#include "llvm/ADT/Statistic.h"
#include "llvm/Analysis/LoopInfo.h"
#include "llvm/Analysis/LoopPass.h"
#include "llvm/Analysis/PostDominators.h"
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
#include "llvm/PassInfo.h"
#include "llvm/PassRegistry.h"
#include "llvm/Support/CommandLine.h"
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

struct ParallelRegion {
  std::set<llvm::BasicBlock *> wrapped_block;
  llvm::BasicBlock *successor_block;
  llvm::BasicBlock *start_block;
  llvm::BasicBlock *end_block;
  bool inst_in_region(llvm::Instruction *inst) {
    for (auto bb : wrapped_block) {
      if (inst->getParent()->getName().str() == bb->getName().str())
        return true;
    }
    return false;
  }
  bool inst_used_in_region(llvm::Instruction *inst) {
    for (auto ui = inst->use_begin(); ui != inst->use_end(); ++ui) {
      auto *user = dyn_cast<Instruction>(ui->getUser());
      if (user == NULL)
        continue;
      if (inst_in_region(user)) {
        return 1;
      }
    }
    return 0;
  }
};

std::map<llvm::Instruction *, unsigned> tempInstructionIds;
std::map<std::string, llvm::Instruction *> contextArrays;
int tempInstructionIndex = 0;
int need_nested_loop;

bool ShouldNotBeContextSaved(llvm::Instruction *instr) {
  if (isa<BranchInst>(instr))
    return true;

  llvm::Module *M = instr->getParent()->getParent()->getParent();
  llvm::LoadInst *load = dyn_cast<llvm::LoadInst>(instr);
  if (load != NULL) {
    auto load_addr = load->getPointerOperand();
    if (load_addr == M->getGlobalVariable("intra_warp_index"))
      return true;
    if (load_addr == M->getGlobalVariable("inter_warp_index"))
      return true;
    if (load_addr == M->getGlobalVariable("warp_vote"))
      return true;
  }

  // TODO: we should further analyze whether the local variable
  // is same among all threads within a wrap
  return false;
}

// generate countpart alloc in the beginning of the Function
llvm::Instruction *GetContextArray(llvm::Instruction *instruction,
                                   bool intra_warp_loop) {
  std::ostringstream var;

  if (std::string(instruction->getName().str()) != "") {
    var << instruction->getName().str();
  } else if (tempInstructionIds.find(instruction) != tempInstructionIds.end()) {
    var << tempInstructionIds[instruction];
  } else {
    tempInstructionIds[instruction] = tempInstructionIndex++;
    var << tempInstructionIds[instruction];
  }
  if (intra_warp_loop)
    var << "_intra_warp_";
  else
    var << "_inter_warp_";
  std::string varName = var.str();

  if (contextArrays.find(varName) != contextArrays.end())
    return contextArrays[varName];

  BasicBlock &bb = instruction->getParent()->getParent()->getEntryBlock();
  IRBuilder<> builder(&*(bb.getFirstInsertionPt()));
  Function *FF = instruction->getParent()->getParent();
  Module *M = instruction->getParent()->getParent()->getParent();
  LLVMContext &C = M->getContext();
  const llvm::DataLayout &Layout = M->getDataLayout();

  llvm::Type *elementType;
  if (isa<AllocaInst>(instruction)) {
    elementType =
        dyn_cast<AllocaInst>(instruction)->getType()->getElementType();
  } else {
    elementType = instruction->getType();
  }

  Type *AllocType = elementType;
  AllocaInst *InstCast = dyn_cast<AllocaInst>(instruction);
  if (InstCast) {
    unsigned Alignment = InstCast->getAlignment();

    uint64_t StoreSize = Layout.getTypeStoreSize(InstCast->getAllocatedType());

    if ((Alignment > 1) && (StoreSize & (Alignment - 1))) {
      uint64_t AlignedSize = (StoreSize & (~(Alignment - 1))) + Alignment;
      assert(AlignedSize > StoreSize);
      uint64_t RequiredExtraBytes = AlignedSize - StoreSize;

      if (isa<ArrayType>(elementType)) {

        ArrayType *StructPadding = ArrayType::get(
            Type::getInt8Ty(M->getContext()), RequiredExtraBytes);

        std::vector<Type *> PaddedStructElements;
        PaddedStructElements.push_back(elementType);
        PaddedStructElements.push_back(StructPadding);
        const ArrayRef<Type *> NewStructElements(PaddedStructElements);
        AllocType = StructType::get(M->getContext(), NewStructElements, true);
        uint64_t NewStoreSize = Layout.getTypeStoreSize(AllocType);
        assert(NewStoreSize == AlignedSize);
      } else if (isa<StructType>(elementType)) {
        StructType *OldStruct = dyn_cast<StructType>(elementType);

        ArrayType *StructPadding = ArrayType::get(
            Type::getInt8Ty(M->getContext()), RequiredExtraBytes);
        std::vector<Type *> PaddedStructElements;
        for (unsigned j = 0; j < OldStruct->getNumElements(); j++)
          PaddedStructElements.push_back(OldStruct->getElementType(j));
        PaddedStructElements.push_back(StructPadding);
        const ArrayRef<Type *> NewStructElements(PaddedStructElements);
        AllocType = StructType::get(OldStruct->getContext(), NewStructElements,
                                    OldStruct->isPacked());
        uint64_t NewStoreSize = Layout.getTypeStoreSize(AllocType);
        assert(NewStoreSize == AlignedSize);
      }
    }
  }

  llvm::Value *ItemSize = nullptr;
  llvm::AllocaInst *Alloca = nullptr;

  auto block_size_addr = M->getGlobalVariable("block_size");
  auto block_size = builder.CreateLoad(block_size_addr);
  Alloca = builder.CreateAlloca(AllocType, block_size, varName);

  contextArrays[varName] = Alloca;
  return Alloca;
}

// save the local variable into replicated array
llvm::Instruction *AddContextSave(llvm::Instruction *instruction,
                                  llvm::Instruction *alloca,
                                  bool intra_warp_loop) {

  if (isa<AllocaInst>(instruction)) {
    return NULL;
  }

  llvm::Module *M = instruction->getParent()->getParent()->getParent();
  LLVMContext &context = M->getContext();
  auto I32 = llvm::Type::getInt32Ty(context);

  /* Save the produced variable to the array. */
  BasicBlock::iterator definition =
      (dyn_cast<Instruction>(instruction))->getIterator();
  ++definition;

  IRBuilder<> builder(&*definition);
  std::vector<llvm::Value *> gepArgs;

  auto inter_warp_index =
      builder.CreateLoad(M->getGlobalVariable("inter_warp_index"));
  auto intra_warp_index =
      builder.CreateLoad(M->getGlobalVariable("intra_warp_index"));
  auto thread_idx = builder.CreateBinOp(
      Instruction::Add, intra_warp_index,
      builder.CreateBinOp(Instruction::Mul, inter_warp_index,
                          ConstantInt::get(I32, 32)),
      "thread_idx");
  gepArgs.push_back(thread_idx);

  return builder.CreateStore(instruction, builder.CreateGEP(alloca, gepArgs));
}

llvm::Instruction *AddContextRestore(llvm::Value *val,
                                     llvm::Instruction *alloca,
                                     llvm::Instruction *before, bool isAlloca,
                                     bool intra_warp_loop) {
  assert(val != NULL);
  assert(alloca != NULL);
  IRBuilder<> builder(alloca);
  if (before != NULL) {
    builder.SetInsertPoint(before);
  } else if (isa<Instruction>(val)) {
    builder.SetInsertPoint(dyn_cast<Instruction>(val));
    before = dyn_cast<Instruction>(val);
  } else {
    assert(false && "Unknown context restore location!");
  }

  std::vector<llvm::Value *> gepArgs;

  auto M = before->getParent()->getParent()->getParent();
  auto I32 = llvm::Type::getInt32Ty(M->getContext());
  auto inter_warp_index =
      builder.CreateLoad(M->getGlobalVariable("inter_warp_index"));
  auto intra_warp_index =
      builder.CreateLoad(M->getGlobalVariable("intra_warp_index"));
  auto thread_idx = builder.CreateBinOp(
      Instruction::Add, intra_warp_index,
      builder.CreateBinOp(Instruction::Mul, inter_warp_index,
                          ConstantInt::get(I32, 32)),
      "thread_idx");
  gepArgs.push_back(thread_idx);

  llvm::Instruction *gep =
      dyn_cast<Instruction>(builder.CreateGEP(alloca, gepArgs));
  if (isAlloca) {
    return gep;
  }
  return builder.CreateLoad(gep);
}

void AddContextSaveRestore(llvm::Instruction *instruction,
                           bool intra_warp_loop) {

  /* Allocate the context data array for the variable. */
  llvm::Instruction *alloca = GetContextArray(instruction, intra_warp_loop);

  llvm::Instruction *theStore =
      AddContextSave(instruction, alloca, intra_warp_loop);

  std::vector<Instruction *> uses;

  for (Instruction::use_iterator ui = instruction->use_begin(),
                                 ue = instruction->use_end();
       ui != ue; ++ui) {
    llvm::Instruction *user = cast<Instruction>(ui->getUser());
    if (user == NULL)
      continue;
    if (user == theStore)
      continue;
    uses.push_back(user);
  }

  for (auto user : uses) {
    Instruction *contextRestoreLocation = user;
    llvm::Value *loadedValue =
        AddContextRestore(user, alloca, contextRestoreLocation,
                          isa<AllocaInst>(instruction), intra_warp_loop);
    user->replaceUsesOfWith(instruction, loadedValue);
  }
}

void handle_alloc(llvm::Function *F) {
  auto M = F->getParent();
  LLVMContext &C = M->getContext();
  auto I32 = llvm::Type::getInt32Ty(C);

  std::vector<llvm::Instruction *> instruction_to_fix;
  for (auto bb = F->begin(); bb != F->end(); bb++) {
    for (auto ii = bb->begin(); ii != bb->end(); ii++) {
      if (llvm::AllocaInst *i = dyn_cast<AllocaInst>(ii)) {
        instruction_to_fix.push_back(i);
      }
    }
  }

  std::vector<llvm::Instruction *> need_remove;

  for (auto inst : instruction_to_fix) {
    // generate a new alloc
    auto block_size_addr = M->getGlobalVariable("block_size");
    IRBuilder<> builder(inst);
    auto block_size = builder.CreateLoad(block_size_addr);

    llvm::Type *elementType = NULL;
    if (dyn_cast<AllocaInst>(inst)->getType()->getElementType()) {
      elementType = dyn_cast<AllocaInst>(inst)->getType()->getElementType();
    }
    assert(elementType != NULL);

    auto Alloca = builder.CreateAlloca(elementType, block_size,
                                       inst->getName().str() + "inter_warp");

    // replace all usage
    std::set<Instruction *> replace_user;
    for (Instruction::use_iterator ui = inst->use_begin(), ue = inst->use_end();
         ui != ue; ++ui) {
      replace_user.insert(dyn_cast<Instruction>(ui->getUser()));
    }
    for (auto user : replace_user) {

      IRBuilder<> builder(user);
      // std::vector<llvm::Value *> gepArgs;
      auto inter_warp_index =
          builder.CreateLoad(M->getGlobalVariable("inter_warp_index"));
      auto intra_warp_index =
          builder.CreateLoad(M->getGlobalVariable("intra_warp_index"));
      auto thread_idx = builder.CreateBinOp(
          Instruction::Add, intra_warp_index,
          builder.CreateBinOp(Instruction::Mul, inter_warp_index,
                              ConstantInt::get(I32, 32)),
          "thread_idx");

      auto gep = builder.CreateGEP(Alloca, thread_idx);

      user->replaceUsesOfWith(inst, gep);
    }
    need_remove.push_back(inst);
  }
  for (auto inst : need_remove) {
    inst->dropAllReferences();
    inst->eraseFromParent();
  }
}

void handle_local_variable_intra_warp(std::vector<ParallelRegion> PRs) {
  bool intra_warp_loop = 1;
  // we should handle allocation generated by PHI
  {
    std::vector<llvm::Instruction *> instruction_to_fix;
    auto F = PRs[0].start_block->getParent();
    for (auto bb = F->begin(); bb != F->end(); bb++) {
      for (auto ii = bb->begin(); ii != bb->end(); ii++) {
        if (isa<AllocaInst>(&(*ii)))
          instruction_to_fix.push_back(&(*ii));
      }
      for (auto inst : instruction_to_fix) {
        AddContextSaveRestore(inst, intra_warp_loop);
      }
    }
  }

  for (auto parallel_regions : PRs) {
    std::set<llvm::Instruction *> instruction_in_region;
    std::vector<llvm::Instruction *> instruction_to_fix;

    for (auto bb : parallel_regions.wrapped_block) {
      for (llvm::BasicBlock::iterator instr = bb->begin(); instr != bb->end();
           ++instr) {
        llvm::Instruction *instruction = &*instr;
        instruction_in_region.insert(instruction);
      }
    }
    /* Find all the instructions that define new values and
       check if they need to be context saved. */
    for (auto bb : parallel_regions.wrapped_block) {
      for (llvm::BasicBlock::iterator instr = bb->begin(); instr != bb->end();
           ++instr) {
        llvm::Instruction *instruction = &*instr;

        if (ShouldNotBeContextSaved(instruction))
          continue;

        for (Instruction::use_iterator ui = instruction->use_begin(),
                                       ue = instruction->use_end();
             ui != ue; ++ui) {
          llvm::Instruction *user = dyn_cast<Instruction>(ui->getUser());

          if (user == NULL)
            continue;
          if (isa<AllocaInst>(instruction) ||
              (instruction_in_region.find(user) ==
               instruction_in_region.end())) {
            instruction_to_fix.push_back(instruction);
            break;
          }
        }
      }
    }
    for (auto inst : instruction_to_fix) {
      AddContextSaveRestore(inst, intra_warp_loop);
    }
  }
}

BasicBlock *insert_loop_init(llvm::BasicBlock *InsertInitBefore,
                             bool intra_warp_loop) {
  llvm::Module *M = InsertInitBefore->getParent()->getParent();
  LLVMContext &context = M->getContext();
  auto I32 = llvm::Type::getInt32Ty(context);
  std::string block_name =
      (intra_warp_loop) ? "intra_warp_init" : "inter_warp_init";
  BasicBlock *loop_init = BasicBlock::Create(
      context, block_name, InsertInitBefore->getParent(), InsertInitBefore);
  IRBuilder<> builder(context);
  builder.SetInsertPoint(loop_init);
  if (intra_warp_loop) { // intra warp
    auto intra_warp_index = M->getGlobalVariable("intra_warp_index");
    builder.CreateStore(ConstantInt::get(I32, 0), intra_warp_index);
  } else { // inter warp
    auto inter_warp_index = M->getGlobalVariable("inter_warp_index");
    builder.CreateStore(ConstantInt::get(I32, 0), inter_warp_index);
  }
  builder.CreateBr(InsertInitBefore);
  return loop_init;
}

BasicBlock *insert_loop_cond(llvm::BasicBlock *InsertCondBefore,
                             llvm::BasicBlock *LoopEnd, bool intra_warp_loop) {
  llvm::Module *M = InsertCondBefore->getParent()->getParent();
  LLVMContext &context = M->getContext();
  auto I32 = llvm::Type::getInt32Ty(context);
  std::string block_name =
      (intra_warp_loop) ? "intra_warp_cond" : "inter_warp_cond";
  BasicBlock *loop_cond = BasicBlock::Create(
      context, block_name, InsertCondBefore->getParent(), InsertCondBefore);
  IRBuilder<> builder(context);
  builder.SetInsertPoint(loop_cond);

  llvm::Value *cmpResult = NULL;
  if (!intra_warp_loop) {
    auto inter_warp_index = M->getGlobalVariable("inter_warp_index");
    auto block_size = M->getGlobalVariable("block_size");
    auto warp_cnt =
        builder.CreateBinOp(Instruction::SDiv, builder.CreateLoad(block_size),
                            ConstantInt::get(I32, 32), "warp_number");

    cmpResult =
        builder.CreateICmpULT(builder.CreateLoad(inter_warp_index), warp_cnt);
  } else {
    auto intra_warp_index = M->getGlobalVariable("intra_warp_index");
    auto block_size = M->getGlobalVariable("block_size");
    if (!need_nested_loop) {
      cmpResult = builder.CreateICmpULT(builder.CreateLoad(intra_warp_index),
                                        builder.CreateLoad(block_size));
    } else {
      cmpResult = builder.CreateICmpULT(builder.CreateLoad(intra_warp_index),
                                        ConstantInt::get(I32, 32));
    }
  }
  builder.CreateCondBr(cmpResult, InsertCondBefore, LoopEnd);
  return loop_cond;
}

BasicBlock *insert_loop_inc(llvm::BasicBlock *InsertIncBefore,
                            bool intra_warp_loop) {
  llvm::Module *M = InsertIncBefore->getParent()->getParent();
  LLVMContext &context = M->getContext();
  auto I32 = llvm::Type::getInt32Ty(context);
  std::string block_name =
      (intra_warp_loop) ? "intra_warp_inc" : "inter_warp_inc";
  BasicBlock *loop_inc = BasicBlock::Create(
      context, block_name, InsertIncBefore->getParent(), InsertIncBefore);
  IRBuilder<> builder(context);
  builder.SetInsertPoint(loop_inc);
  if (intra_warp_loop) { // intra warp
    auto intra_warp_index = M->getGlobalVariable("intra_warp_index");
    auto new_index = builder.CreateBinOp(
        Instruction::Add, builder.CreateLoad(intra_warp_index),
        ConstantInt::get(I32, 1), "intra_warp_index_increment");
    builder.CreateStore(new_index, intra_warp_index);
  } else { // inter warp
    auto inter_warp_index = M->getGlobalVariable("inter_warp_index");
    auto new_index = builder.CreateBinOp(
        Instruction::Add, builder.CreateLoad(inter_warp_index),
        ConstantInt::get(I32, 1), "inter_warp_index_increment");
    builder.CreateStore(new_index, inter_warp_index);
  }
  builder.CreateBr(InsertIncBefore);
  return loop_inc;
}

void add_warp_loop(std::vector<ParallelRegion> parallel_regions,
                   bool intra_warp_loop) {
  for (auto region : parallel_regions) {
    auto start_block = region.start_block;
    auto tail_block = region.end_block;
    auto next_block = region.successor_block;

    auto loop_cond = insert_loop_cond(start_block, next_block, intra_warp_loop);
    auto loop_init = insert_loop_init(loop_cond, intra_warp_loop);

    auto F = start_block->getParent();
    for (Function::iterator i = F->begin(); i != F->end(); ++i) {
      llvm::BasicBlock *bb = &(*i);
      if (bb == loop_cond)
        continue;
      bb->getTerminator()->replaceUsesOfWith(start_block, loop_init);
    }
    auto loop_inc = insert_loop_inc(loop_cond, intra_warp_loop);
    tail_block->getTerminator()->replaceUsesOfWith(next_block, loop_inc);
    // we have to reset inter/intra warp index to 0, as these maybe used
    // outside PR when there are conditional loop/branch
    llvm::Module *M = start_block->getParent()->getParent();
    LLVMContext &context = M->getContext();
    auto I32 = llvm::Type::getInt32Ty(context);
    BasicBlock *reset_index = BasicBlock::Create(start_block->getContext(),
                                                 "reset_block", F, next_block);
    IRBuilder<> builder(start_block->getContext());
    builder.SetInsertPoint(reset_index);
    if (intra_warp_loop) { // intra warp
      auto intra_warp_index = M->getGlobalVariable("intra_warp_index");
      builder.CreateStore(ConstantInt::get(I32, 0), intra_warp_index);
    } else { // inter warp
      auto inter_warp_index = M->getGlobalVariable("inter_warp_index");
      builder.CreateStore(ConstantInt::get(I32, 0), inter_warp_index);
    }
    builder.CreateBr(next_block);
    loop_cond->getTerminator()->replaceUsesOfWith(next_block, reset_index);
    // add metadata
    MDNode *Dummy =
        MDNode::getTemporary(context, ArrayRef<Metadata *>()).release();
    MDNode *AccessGroupMD = MDNode::getDistinct(context, {});
    MDNode *ParallelAccessMD = MDNode::get(
        context,
        {MDString::get(context, "llvm.loop.parallel_accesses"), AccessGroupMD});
    MDNode *Root = MDNode::get(context, {Dummy, ParallelAccessMD});

    Root->replaceOperandWith(0, Root);
    MDNode::deleteTemporary(Dummy);
    // We now have
    //   !1 = metadata !{metadata !1} <- self-referential root
    loop_cond->getTerminator()->setMetadata("llvm.loop", Root);

    for (auto bb : region.wrapped_block) {
      for (BasicBlock::iterator ii = bb->begin(), ee = bb->end(); ii != ee;
           ii++) {
        if (!ii->mayReadOrWriteMemory()) {
          continue;
        }
        MDNode *NewMD = MDNode::get(bb->getContext(), AccessGroupMD);
        MDNode *OldMD = ii->getMetadata("llvm.mem.parallel_loop_access");
        if (OldMD != nullptr) {
          NewMD = llvm::MDNode::concatenate(OldMD, NewMD);
        }
        ii->setMetadata("llvm.mem.parallel_loop_access", NewMD);
      }
    }
  }
}

void print_parallel_region(std::vector<ParallelRegion> parallel_regions) {
  printf("get PR:\n");
  for (auto region : parallel_regions) {
    auto start = region.start_block;
    auto end = region.end_block;
    auto next = region.successor_block;
    printf("parallel region: %s->%s next: %s\n", start->getName().str().c_str(),
           end->getName().str().c_str(), next->getName().str().c_str());
    printf("have: \n");
    for (auto b : region.wrapped_block) {
      printf("%s\n", b->getName().str().c_str());
    }
  }
}

void remove_barrier(llvm::Function *F, bool intra_warp_loop) {
  std::vector<Instruction *> need_remove;
  for (auto BB = F->begin(); BB != F->end(); ++BB) {
    for (auto BI = BB->begin(); BI != BB->end(); BI++) {
      if (auto Call = dyn_cast<CallInst>(BI)) {
        auto func_name = Call->getCalledFunction()->getName().str();
        if (func_name == "llvm.nvvm.bar.warp.sync") {
          need_remove.push_back(Call);
        }
        if (!intra_warp_loop && (func_name == "llvm.nvvm.barrier0" ||
                                 func_name == "llvm.nvvm.barrier.sync")) {
          need_remove.push_back(Call);
        }
      }
    }
  }
  for (auto inst : need_remove) {
    inst->eraseFromParent();
  }
}

class InsertWarpLoopPass : public llvm::FunctionPass {

public:
  static char ID;
  bool intra_warp_loop;
  DominatorTree *DT;
  PostDominatorTree *PDT;

  InsertWarpLoopPass(bool intra_warp = 0)
      : FunctionPass(ID), intra_warp_loop(intra_warp) {}

  virtual void getAnalysisUsage(llvm::AnalysisUsage &AU) const {
    AU.addRequired<DominatorTreeWrapperPass>();
    AU.addRequired<PostDominatorTreeWrapperPass>();
  }

  void getParallelRegionBefore(llvm::BasicBlock *B, bool intra_warp_loop,
                               std::vector<ParallelRegion> &parallel_regions) {
    ParallelRegion current_region;

    SmallVector<BasicBlock *, 4> pending_blocks;
    BasicBlock *region_entry_barrier = NULL;
    BasicBlock *entry = NULL;
    BasicBlock *exit = B->getSinglePredecessor();
    for (BasicBlock *Pred : predecessors(B)) {
      pending_blocks.push_back(Pred);
    }
    if (pending_blocks.size() > 1) {
      // becuase we have insert the sync and split by them,
      // so if B has several income edges, it must be a merge point
      // for a conditional if. We can safely ignore it
      // TODO: we have to further check whether this conditional if
      // is for inter warp or intra warp
      return;
    }

    while (!pending_blocks.empty()) {
      BasicBlock *current = pending_blocks.back();
      pending_blocks.pop_back();

      // avoid infinite recursion of loops
      if (current_region.wrapped_block.count(current) != 0) {
        continue;
      }

      // If we reach another barrier this must be the
      // parallel region entry.
      bool has_barrier = 0;
      for (auto i = current->begin(), e = current->end(); i != e; ++i) {
        if (llvm::CallInst *call_inst = llvm::dyn_cast<llvm::CallInst>(&(*i))) {
          auto func_name = call_inst->getCalledFunction()->getName().str();
          if (func_name == "llvm.nvvm.barrier0" ||
              func_name == "llvm.nvvm.barrier.sync")
            has_barrier = 1;
          if (func_name == "llvm.nvvm.bar.warp.sync" && intra_warp_loop)
            has_barrier = 1;
        }
      }

      // if we reach a block which only has a single condtional branch,
      // it is the start point of a B-condition, we have to stop here
      bool is_single_conditional_branch_block = 0;
      if (auto br = dyn_cast<llvm::BranchInst>(current->getTerminator())) {
        if (br->isConditional()) {
          if (current->size() == 1) {
            is_single_conditional_branch_block = 1;
          } else {
            // generate by replicate local variable
            printf(
                "[WARNING] match single conditional branch with HARD CODE\n");
            bool branch_to_intra_init = false;
            for (unsigned suc = 0; suc < br->getNumSuccessors(); ++suc) {
              llvm::BasicBlock *entryCandidate = br->getSuccessor(suc);
              auto block_name = entryCandidate->getName().str();
              if (find_block_barrier_in_region(current, B)) {
                if (block_name.find("warp_init") != block_name.npos) {
                  is_single_conditional_branch_block = 1;
                  break;
                }
              }
            }
          }
        }
      }

      if (has_barrier || is_single_conditional_branch_block) {
        if (region_entry_barrier == NULL)
          region_entry_barrier = current;
        else if (region_entry_barrier != current) {
          // this means there is not PR before B, just return
          return;
        }
        continue;
      }

      // Non-barrier block, this must be on the region.
      current_region.wrapped_block.insert(current);

      // Add predecessors to pending queue.
      for (BasicBlock *Pred : predecessors(current)) {
        pending_blocks.push_back(Pred);
      }
    }

    if (current_region.wrapped_block.empty()) {
      return;
    }

    // if do not find entry node, this means all predecessor
    // blocks do not need to execute multiply times
    if (region_entry_barrier == NULL) {
      return;
    }
    // Find the entry node.
    assert(region_entry_barrier != NULL);
    for (unsigned
             suc = 0,
             num = region_entry_barrier->getTerminator()->getNumSuccessors();
         suc < num; ++suc) {
      llvm::BasicBlock *entryCandidate =
          region_entry_barrier->getTerminator()->getSuccessor(suc);
      if (current_region.wrapped_block.count(entryCandidate) == 0)
        continue;
      entry = entryCandidate;
      break;
    }
    // delete useless PR, those PRs only have branch
    if (entry == exit) {
      if (entry->size() == 1 && isa<llvm::BranchInst>(entry->begin())) {
        return;
      }
    }
    bool is_useless = true;
    auto iter = entry;
    do {
      if (iter->size() != 1 || !isa<llvm::BranchInst>(entry->begin())) {
        is_useless = false;
        break;
      }
      if (iter->getTerminator()->getNumSuccessors() > 1) {
        is_useless = false;
        break;
      }
      iter = iter->getTerminator()->getSuccessor(0);
    } while (iter != exit);
    if (is_useless) {
      return;
    }
    assert(current_region.wrapped_block.count(entry) != 0);
    current_region.start_block = entry;
    current_region.end_block = exit;
    current_region.successor_block = B;
    parallel_regions.push_back(current_region);
  }

  std::vector<ParallelRegion> getParallelRegions(llvm::Function *F,
                                                 bool intra_warp_loop) {
    std::vector<ParallelRegion> parallel_regions;

    SmallVector<BasicBlock *, 4> exit_blocks;
    for (Function::iterator s = F->begin(); s != F->end(); s++) {
      if (llvm::CallInst *call_inst =
              llvm::dyn_cast<llvm::CallInst>(s->begin())) {
        auto func_name = call_inst->getCalledFunction()->getName().str();
        if (func_name == "llvm.nvvm.barrier0" ||
            func_name == "llvm.nvvm.barrier.sync") {
          exit_blocks.push_back(&(*s));
        }
        // when handling intra warp loop, we need also split the blocks
        // between warp barrier
        if (intra_warp_loop && func_name == "llvm.nvvm.bar.warp.sync") {
          exit_blocks.push_back(&(*s));
        }
      }
    }

    // First find all the ParallelRegions in the Function.
    while (!exit_blocks.empty()) {
      BasicBlock *exit = exit_blocks.back();
      exit_blocks.pop_back();
      getParallelRegionBefore(exit, intra_warp_loop, parallel_regions);
    }
    return parallel_regions;
  }

  virtual bool runOnFunction(Function &F) {
    if (!isKernelFunction(F.getParent(), &F))
      return 0;

    DT = &getAnalysis<DominatorTreeWrapperPass>().getDomTree();
    PDT = &getAnalysis<PostDominatorTreeWrapperPass>().getPostDomTree();

    // find parallel region we need to wrap
    auto parallel_regions = getParallelRegions(&F, intra_warp_loop);
    assert(!parallel_regions.empty() && "can not find any parallel regions\n");
    // print_parallel_region(parallel_regions);
    add_warp_loop(parallel_regions, intra_warp_loop);

    if (intra_warp_loop) {
      handle_local_variable_intra_warp(parallel_regions);
    }
    remove_barrier(&F, intra_warp_loop);
    return 1;
  }
};

char InsertWarpLoopPass::ID = 0;

namespace {
static RegisterPass<InsertWarpLoopPass> X("insert-warp-loop",
                                          "Insert inter/intra warp loop");
} // namespace

bool has_warp_barrier(llvm::Module *M) {
  for (auto F = M->begin(); F != M->end(); ++F)
    for (auto BB = F->begin(); BB != F->end(); ++BB) {
      for (auto BI = BB->begin(); BI != BB->end(); BI++) {
        if (auto Call = dyn_cast<CallInst>(BI)) {
          auto func_name = Call->getCalledFunction()->getName().str();
          if (func_name == "llvm.nvvm.bar.warp.sync") {
            return true;
          }
        }
      }
    }
  return false;
}

void insert_warp_loop(llvm::Module *M) {
  llvm::legacy::PassManager Passes;
  need_nested_loop = has_warp_barrier(M);
  // use nested loop only when there are warp-level barrier
  if (need_nested_loop) {
    bool intra_warp = true;
    Passes.add(new InsertWarpLoopPass(intra_warp));
    // insert inter warp loop
    Passes.add(new InsertWarpLoopPass(!intra_warp));
    Passes.run(*M);
  } else {
    bool intra_warp = true;
    // only need a single loop, with size=block_size
    Passes.add(new InsertWarpLoopPass(intra_warp));
    Passes.run(*M);
    // remove all barriers
    for (auto F = M->begin(); F != M->end(); ++F)
      remove_barrier(dyn_cast<llvm::Function>(F), false);
  }
}
