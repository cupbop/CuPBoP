#include "insert_sync.h"
#include "assert.h"
#include "handle_sync.h"
#include "tool.h"
#include "llvm/ADT/SmallVector.h"
#include "llvm/ADT/Statistic.h"
#include "llvm/Analysis/LoopInfo.h"
#include "llvm/Analysis/LoopPass.h"
#include "llvm/Analysis/PostDominators.h"
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
#include <iostream>
#include <queue>

using namespace llvm;

class InsertBuiltInBarrier : public llvm::FunctionPass {

public:
  static char ID;

  InsertBuiltInBarrier() : FunctionPass(ID) {}

  virtual bool runOnFunction(Function &F) {
    if (!isKernelFunction(F.getParent(), &F))
      return 0;
    std::vector<llvm::Instruction *> insert_intra_warp_sync_before;
    std::vector<llvm::Instruction *> insert_inter_warp_sync_before;

    // insert sync in the entry
    BasicBlock *entry = &(*F.begin());
    for (auto i = entry->begin(); i != entry->end(); i++) {
      if (!isa<AllocaInst>(i)) {
        insert_inter_warp_sync_before.push_back(&(*(i)));
        break;
      }
    }

    for (Function::iterator I = F.begin(); I != F.end(); ++I) {
      BasicBlock::iterator BI = I->begin();

      // insert barrier before return
      for (; BI != I->end(); BI++) {
        llvm::ReturnInst *Ret = llvm::dyn_cast<llvm::ReturnInst>(&(*BI));
        if (Ret) {
          insert_inter_warp_sync_before.push_back(&(*BI));
        }
      }
    }
    if (insert_intra_warp_sync_before.empty() &&
        insert_inter_warp_sync_before.empty())
      return 0;
    for (auto inst : insert_intra_warp_sync_before) {
      CreateIntraWarpBarrier(inst);
    }
    for (auto inst : insert_inter_warp_sync_before) {
      CreateInterWarpBarrier(inst);
    }
    return 1;
  }
};

class InsertConditionalBarrier : public llvm::FunctionPass {

public:
  static char ID;

  InsertConditionalBarrier() : FunctionPass(ID) {}

  virtual void getAnalysisUsage(llvm::AnalysisUsage &AU) const {
    AU.addRequired<PostDominatorTreeWrapperPass>();
    AU.addPreserved<PostDominatorTreeWrapperPass>();
    AU.addRequired<DominatorTreeWrapperPass>();
    AU.addPreserved<DominatorTreeWrapperPass>();
  }

  BasicBlock *firstNonBackedgePredecessor(llvm::BasicBlock *bb) {

    DominatorTree *DT = &getAnalysis<DominatorTreeWrapperPass>().getDomTree();

    pred_iterator I = pred_begin(bb), E = pred_end(bb);
    if (I == E)
      return NULL;
    while (DT->dominates(bb, *I) && I != E)
      ++I;
    if (I == E)
      return NULL;
    else
      return *I;
  }

  BasicBlock *firstNonBackedgeSuccessor(llvm::BasicBlock *bb) {
    DominatorTree *DT = &getAnalysis<DominatorTreeWrapperPass>().getDomTree();
    auto t = bb->getTerminator();
    assert(t->getNumSuccessors() <= 2);
    for (unsigned i = 0, e = t->getNumSuccessors(); i != e; ++i) {
      BasicBlock *successor = t->getSuccessor(i);
      bool isBackedge = DT->dominates(successor, bb);
      if (isBackedge)
        continue;
      return successor;
    }
  };

  virtual bool runOnFunction(Function &F) {
    if (!isKernelFunction(F.getParent(), &F))
      return 0;

    auto PDT = &getAnalysis<PostDominatorTreeWrapperPass>();

    // first find all conditional barriers
    std::vector<BasicBlock *> conditionalBarriers;
    for (Function::iterator i = F.begin(), e = F.end(); i != e; ++i) {
      BasicBlock *b = &*i;
      if (!has_barrier(b))
        continue;

      // Unconditional barrier postdominates the entry node.
      if (PDT->getPostDomTree().dominates(b, &F.getEntryBlock()))
        continue;
      conditionalBarriers.push_back(b);
    }

    if (conditionalBarriers.size() == 0)
      return 0;

    bool changed = false;

    while (!conditionalBarriers.empty()) {
      BasicBlock *b = conditionalBarriers.back();
      conditionalBarriers.pop_back();

      // insert barrier in the start of if-condition

      BasicBlock *pos = b;
      BasicBlock *pred = firstNonBackedgePredecessor(b);

      while (PDT->getPostDomTree().dominates(b, pred)) {
        pos = pred;
        // If our BB post dominates the given block, we know it is not the
        // branching block that makes the barrier conditional.
        pred = firstNonBackedgePredecessor(pred);

        if (pred == b)
          break; // Traced across a loop edge, skip this case.
      }
      // we should create warp/block barrier based on the conditional barrier
      if (has_warp_barrier(b)) {
        CreateIntraWarpBarrier(pred->getTerminator());
      } else {
        CreateInterWarpBarrier(pred->getTerminator());
      }
      changed = true;

      // insert barrier in the merge point for then-else branches
      // also insert barrier at the end of conditional branch
      DominatorTree *DT = &getAnalysis<DominatorTreeWrapperPass>().getDomTree();
      std::queue<llvm::BasicBlock *> successor_queue;
      for (int i = 0; i < pred->getTerminator()->getNumSuccessors(); i++) {
        auto ss = pred->getTerminator()->getSuccessor(i);
        if (!DT->dominates(ss, pred))
          successor_queue.push(ss);
      }
      std::set<llvm::BasicBlock *> visited;
      llvm::BasicBlock *merge_point = NULL;
      while (!successor_queue.empty()) {
        auto curr = successor_queue.front();
        successor_queue.pop();
        if (visited.find(curr) != visited.end())
          continue;

        visited.insert(curr);
        if (PDT->getPostDomTree().dominates(curr, pred)) {
          // find the truly merge point
          merge_point = curr;
          if (has_warp_barrier(b)) {
            CreateIntraWarpBarrier(&(*curr->begin()));
            for (BasicBlock *Pred : predecessors(curr)) {
              CreateIntraWarpBarrier(&(*Pred->getTerminator()));
            }
          } else {
            CreateInterWarpBarrier(&(*curr->begin()));
            for (BasicBlock *Pred : predecessors(curr)) {
              CreateInterWarpBarrier(&(*Pred->getTerminator()));
            }
          }
          break;
        }
        for (int i = 0; i < curr->getTerminator()->getNumSuccessors(); i++) {
          auto ss = curr->getTerminator()->getSuccessor(i);
          if (!DT->dominates(ss, curr))
            successor_queue.push(ss);
        }
      }
      assert(merge_point && "do not find merge point\n");
      changed = true;

      // we may create a new conditional barrier after insert
      if (!PDT->getPostDomTree().dominates(pred, &F.getEntryBlock())) {
        // if the block postdominates all its predecessor
        // then it is not a conditional barriers
        bool post_dominate_all = true;
        for (auto I = pred_begin(pred); I != pred_end(pred); I++) {
          if (!PDT->getPostDomTree().dominates(pred, *I)) {
            post_dominate_all = false;
            break;
          }
        }
        if (!post_dominate_all)
          conditionalBarriers.push_back(pred);
      }

      // find any block which are not dominated by header
      // but be postdominated by merge point
      std::queue<llvm::BasicBlock *> if_body;
      std::set<llvm::BasicBlock *> visited_block;
      for (int i = 0; i < pred->getTerminator()->getNumSuccessors(); i++) {
        if_body.push(pred->getTerminator()->getSuccessor(i));
      }
      while (!if_body.empty()) {
        auto curr = if_body.front();
        if_body.pop();
        if (visited_block.find(curr) != visited_block.end())
          continue;
        visited_block.insert(curr);
        if (!PDT->getPostDomTree().dominates(merge_point, curr))
          continue;
        if (!DT->dominates(pred, curr) &&
            PDT->getPostDomTree().dominates(merge_point, curr)) {
          // we should insert barrier at the beginning and
          // end of its predecessor
          if (has_warp_barrier(b)) {
            CreateIntraWarpBarrier(&(*curr->begin()));
            for (BasicBlock *Pred : predecessors(curr)) {
              CreateIntraWarpBarrier(&(*Pred->getTerminator()));
            }
          } else {
            CreateInterWarpBarrier(&(*curr->begin()));
            for (BasicBlock *Pred : predecessors(curr)) {
              CreateInterWarpBarrier(&(*Pred->getTerminator()));
            }
          }
        }
        for (int i = 0; i < curr->getTerminator()->getNumSuccessors(); i++) {
          // avoid backedge
          if (DT->dominates(curr->getTerminator()->getSuccessor(i), pred)) {
            continue;
          }
          if_body.push(curr->getTerminator()->getSuccessor(i));
        }
      }
    }
    return changed;
  }
};

class InsertBarrierForSpecialCase : public llvm::FunctionPass {
public:
  static char ID;

  InsertBarrierForSpecialCase() : FunctionPass(ID) {}

  virtual void getAnalysisUsage(llvm::AnalysisUsage &AU) const {
    AU.addRequired<PostDominatorTreeWrapperPass>();
    AU.addRequired<DominatorTreeWrapperPass>();
  }

  BasicBlock *find_merge_point(BasicBlock *start, PostDominatorTree &PDT) {
    assert(start->getTerminator()->getNumSuccessors() == 2);
    std::set<llvm::BasicBlock *> visit;
    std::queue<llvm::BasicBlock *> pending_blocks;
    for (int i = 0; i < start->getTerminator()->getNumSuccessors(); i++) {
      pending_blocks.push(start->getTerminator()->getSuccessor(i));
    }
    while (!pending_blocks.empty()) {
      BasicBlock *current = pending_blocks.front();
      pending_blocks.pop();

      if (visit.find(current) != visit.end())
        continue;

      visit.insert(current);
      if (PDT.dominates(current, start))
        return current;
      for (int i = 0; i < current->getTerminator()->getNumSuccessors(); i++) {
        auto succ = current->getTerminator()->getSuccessor(i);
        if (visit.find(succ) == visit.end())
          pending_blocks.push(succ);
      }
    }
    assert(0 && "Do not find merge point\n");
    return NULL;
  }
  virtual bool runOnFunction(Function &F) {
    if (!isKernelFunction(F.getParent(), &F))
      return 0;
    bool changed = false;
    std::set<BasicBlock *> if_head;
    // insert an extra block for the following case
    // 1) there is a merge point for an if-else branch,
    // but this merge point has other income edge

    auto PDT = &getAnalysis<PostDominatorTreeWrapperPass>();
    auto DT = &getAnalysis<DominatorTreeWrapperPass>().getDomTree();

    for (Function::iterator i = F.begin(), e = F.end(); i != e; ++i) {
      BasicBlock *b = &*i;
      if (b->getTerminator()->getNumSuccessors() == 2) {
        auto merge_point = find_merge_point(b, PDT->getPostDomTree());
        for (BasicBlock *Pred : predecessors(merge_point)) {
          if (!DT->dominates(b, Pred)) {
            // we need to insert an extra block to be the merge point
            // for the if-branch
            if_head.insert(b);
          }
        }
      }
    }

    auto M = F.getParent();
    for (auto head : if_head) {
      assert(head->getTerminator()->getNumSuccessors() == 2);
      BasicBlock *merge_point = find_merge_point(head, PDT->getPostDomTree());
      assert(PDT->getPostDomTree().dominates(merge_point, head));
      if (!find_barrier_in_region(head, merge_point)) {
        DEBUG_INFO("do not need to handle tri-income if: %s\n",
                   merge_point->getName().str().c_str());
        continue;
      }

      BasicBlock *Block = BasicBlock::Create(M->getContext(), "if_end", &F);
      llvm::IRBuilder<> Builder(M->getContext());
      Builder.SetInsertPoint(Block);
      auto br_inst = Builder.CreateBr(merge_point);
      assert(has_barrier(head) && "preheader does not have barrier\n");
      if (has_warp_barrier(head)) {
        CreateIntraWarpBarrier(br_inst);
      } else {
        CreateInterWarpBarrier(br_inst);
      }
      // replace usage in if-branch
      std::set<Instruction *> need_replace;
      for (BasicBlock *Pred : predecessors(merge_point)) {
        if (DT->dominates(head, Pred) && Pred != Block) {
          need_replace.insert(Pred->getTerminator());
        }
      }
      for (auto inst : need_replace) {
        inst->replaceUsesOfWith(merge_point, Block);
      }
      changed = 1;
    }
    return changed;
  }
};

class InsertConditionalForBarrier : public llvm::LoopPass {

public:
  static char ID;

  InsertConditionalForBarrier() : LoopPass(ID) {}

  void getAnalysisUsage(AnalysisUsage &AU) const {
    AU.addRequired<DominatorTreeWrapperPass>();
  }

  bool runOnLoop(Loop *L, LPPassManager &LPM) {
    if (!isKernelFunction(L->getHeader()->getParent()->getParent(),
                          L->getHeader()->getParent()))
      return 0;
    // check whether this loop has barrier
    bool is_conditional_loop = 0;
    bool is_warp = 0;
    for (Loop::block_iterator i = L->block_begin(), e = L->block_end(); i != e;
         ++i) {
      for (BasicBlock::iterator j = (*i)->begin(), e = (*i)->end(); j != e;
           ++j) {
        if (auto Call = dyn_cast<CallInst>(j)) {
          if (Call->isInlineAsm())
            continue;
          auto func_name = Call->getCalledFunction()->getName().str();
          if (func_name == "llvm.nvvm.barrier0" ||
              func_name == "llvm.nvvm.bar.warp.sync" ||
              func_name == "llvm.nvvm.barrier.sync") {
            is_conditional_loop = true;
            if (func_name == "llvm.nvvm.bar.warp.sync") {
              is_warp = 1;
            }
            break;
          }
        }
      }
    }
    if (!is_conditional_loop)
      return 0;
    // insert barrier at the beginning of header (for_cond)
    // and the end of pre header, so that we can get a
    // single block connected with latch
    if (!is_warp) {
      auto prehead_block = L->getLoopPreheader();
      CreateInterWarpBarrier(prehead_block->getTerminator());
      auto header_block = L->getHeader();
      CreateInterWarpBarrier(&(*header_block->begin()));
    } else {
      auto prehead_block = L->getLoopPreheader();
      CreateIntraWarpBarrier(prehead_block->getTerminator());
      auto header_block = L->getHeader();
      CreateIntraWarpBarrier(&(*header_block->begin()));
    }

    // as we assume all loops are rotated, we have to insert
    // barrier before the condition jump of the for_cond
    if (auto for_cond = L->getExitingBlock()) {
      assert(for_cond->getTerminator()->getNumSuccessors() == 2 &&
             "has more than 2 successors of the for-cond\n");
      auto conditional_br =
          dyn_cast<llvm::BranchInst>(for_cond->getTerminator());
      assert(conditional_br && conditional_br->isConditional());
      // insert barrier before the condition jump of the loop cond
      if (!is_warp)
        CreateInterWarpBarrier(conditional_br);
      else
        CreateIntraWarpBarrier(conditional_br);
      // insert barrier before the for_body
      auto for_body = for_cond->getTerminator()->getSuccessor(0);
      if (for_body == L->getExitBlock()) {
        for_body = for_cond->getTerminator()->getSuccessor(1);
      }
      // insert at the beginning of for_body
      if (!is_warp)
        CreateInterWarpBarrier(&(*for_body->begin()));
      else
        CreateIntraWarpBarrier(&(*for_body->begin()));
      // insert at the beginning and end in for_inc block
      if (auto for_inc = L->getLoopLatch()) {
        if (!is_warp) {
          CreateInterWarpBarrier(&(*for_inc->begin()));
          CreateInterWarpBarrier(for_inc->getTerminator());
        } else {
          CreateIntraWarpBarrier(&(*for_inc->begin()));
          CreateIntraWarpBarrier(for_inc->getTerminator());
        }
      } else {
        assert(0 && "has continue in a barrier loop\n");
      }
    } else {
      // handle break in for-loop
      DEBUG_INFO("loop has multiply exists\n");
      // this time, we have also insert sync before the for-body
      auto header_block = L->getHeader();
      assert(header_block->getTerminator()->getNumSuccessors() == 2 &&
             "has more than 2 successors of the for-head\n");
      BasicBlock *for_body = NULL;
      for (int i = 0; i < header_block->getTerminator()->getNumSuccessors();
           i++) {
        auto bb = header_block->getTerminator()->getSuccessor(i);
        if (L->contains(bb)) {
          if (is_warp) {
            CreateIntraWarpBarrier(&(*bb->begin()));
          } else {
            CreateInterWarpBarrier(&(*bb->begin()));
          }
        }
      }

      SmallVector<llvm::BasicBlock *, 8> ExitingBlocks;

      L->getExitingBlocks(ExitingBlocks);
      while (!ExitingBlocks.empty()) {
        auto exit_block = ExitingBlocks.back();
        ExitingBlocks.pop_back();
        auto conditional_br =
            dyn_cast<llvm::BranchInst>(exit_block->getTerminator());
        assert(conditional_br && conditional_br->isConditional());
        // insert barrier at the beginning of successor of exit
        if (!is_warp)
          CreateInterWarpBarrier(conditional_br);
        else
          CreateIntraWarpBarrier(conditional_br);
      }
    }

    return 1;
  }
};

char InsertBuiltInBarrier::ID = 0;
char InsertConditionalBarrier::ID = 0;
char InsertConditionalForBarrier::ID = 0;
char InsertBarrierForSpecialCase::ID = 0;

namespace {
static RegisterPass<InsertConditionalBarrier>
    insert_conditional_barrier("insert-conditional-if-barriers",
                               "Insert conditional barriers for if body");
static RegisterPass<InsertConditionalForBarrier>
    insert_conditional_for_barrier("insert-conditional-for-barriers",
                                   "Insert conditional barriers for for loop");
static RegisterPass<InsertBarrierForSpecialCase>
    insert_special_case("insert-special-case-barriers",
                        "Insert barriers for special cases");
static RegisterPass<InsertBuiltInBarrier>
    insert_built_in_barrier("insert-built-in-barriers",
                            "Insert built in barriers");
} // namespace

/*
This function inserts implicit synchronization for conditional statements,
please refer to https://dl.acm.org/doi/abs/10.1145/3554736 for detail
*/
void insert_sync(llvm::Module *M) {
  DEBUG_INFO("insert sync\n");
  auto Registry = PassRegistry::getPassRegistry();

  llvm::legacy::PassManager Passes;

  std::vector<std::string> passes;
  passes.push_back("insert-built-in-barriers");
  passes.push_back("insert-conditional-if-barriers");
  passes.push_back("insert-conditional-for-barriers");
  passes.push_back("insert-special-case-barriers");
  for (auto pass : passes) {
    const PassInfo *PIs = Registry->getPassInfo(StringRef(pass));
    if (PIs) {
      Pass *thispass = PIs->createPass();
      Passes.add(thispass);
    } else {
      assert(0 && "Pass not found\n");
    }
  }
  Passes.run(*M);
}
