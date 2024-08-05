#include "global_mem_coalescing_optimization.h"
#include "debug.hpp"
#include "performance.h"
#include "tool.h"
#include "llvm/Analysis/LoopInfo.h"
#include "llvm/Analysis/LoopPass.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/InitializePasses.h"
#include "llvm/PassInfo.h"
#include "llvm/PassRegistry.h"
#include "llvm/Transforms/Utils/BasicBlockUtils.h"
using namespace llvm;

// insert a barrier before the for-loop which contains global memory coalescing
struct MemCoalescingTransformation : public llvm::FunctionPass {

public:
  static char ID;

  MemCoalescingTransformation() : FunctionPass(ID) {}

  void getAnalysisUsage(AnalysisUsage &AU) const {
    AU.addRequiredTransitive<LoopInfoWrapperPass>();
  }

  bool runOnFunction(Function &F) {
    auto M = F.getParent();
    if (!isKernelFunction(M, &F))
      return 0;
    // check whether this loop has barrier
    // if the loop contains barrier, we do not need to implement optimizations
    // for memory coalescing
    std::set<Loop *> mem_coalescing_loop;
    LoopInfo &LI = getAnalysis<LoopInfoWrapperPass>().getLoopInfo();
    SmallVector<Loop *, 8> LoopStack(LI.begin(), LI.end());
    for (auto L : LoopStack) {
      bool contains_barrier = 0;
      for (Loop::block_iterator i = L->block_begin(), e = L->block_end();
           i != e; ++i) {
        for (BasicBlock::iterator j = (*i)->begin(), e = (*i)->end(); j != e;
             ++j) {
          if (auto Call = dyn_cast<CallInst>(j)) {
            if (Call->isInlineAsm())
              continue;
            auto func_name = Call->getCalledFunction()->getName().str();
            if (func_name == "llvm.nvvm.barrier0" ||
                func_name == "llvm.nvvm.bar.warp.sync" ||
                func_name == "llvm.nvvm.barrier.sync") {
              contains_barrier = true;
              break;
            }
          }
        }
      }
      if (contains_barrier)
        continue;

      // check whether this loop contains global memory coalescing
      if (!loop_contains_global_memory_coalescing(L))
        continue;
      if (!L->getExitBlock())
        continue;
      mem_coalescing_loop.insert(L);
    }
    // implement transformation
    for (auto L : mem_coalescing_loop) {
      LLVMContext &context = M->getContext();
      auto I8Ptr = llvm::Type::getInt8PtrTy(context);
      auto I8 = llvm::Type::getInt8Ty(context);
      IRBuilder<> builder(context);
      // create basic blocks
      BasicBlock *do_while_latch = BasicBlock::Create(
          context, "do_while_latch", L->getHeader()->getParent());
      BasicBlock *do_while_preheader = BasicBlock::Create(
          context, "do_while_preheader", L->getHeader()->getParent());
      BasicBlock *do_while_header = BasicBlock::Create(
          context, "do_while_header", L->getHeader()->getParent());
      // create do while latch
      builder.SetInsertPoint(do_while_latch);
      llvm::Instruction *has_activated_thread = createLoad(
          builder, M->getGlobalVariable("has_activated_thread_addr"));
      auto branch_var = builder.CreateICmpNE(has_activated_thread,
                                             ConstantInt::get(I8, 0, true));
      builder.CreateCondBr(branch_var, do_while_header, L->getExitBlock());
      // Part0: change the loop preheader, to jump to do while preheader
      auto preheader_br =
          dyn_cast<BranchInst>(L->getLoopPreheader()->getTerminator());
      assert(preheader_br->isUnconditional());
      preheader_br->setSuccessor(0, do_while_preheader);
      // Part1: do while preheader
      // create a variable thread_activated, to record whether a thread is
      // activated or not
      builder.SetInsertPoint(do_while_preheader);
      llvm::Instruction *thread_activated_addr =
          builder.CreateAlloca(I8, 0, "thread_activated_addr");
      builder.CreateStore(ConstantInt::get(I8, 1, true), thread_activated_addr);
      builder.CreateBr(do_while_header);
      // Part2: do while header
      // set has_activated_thread to false
      builder.SetInsertPoint(do_while_header);
      Instruction *last_inst = builder.CreateStore(
          ConstantInt::get(I8, 0),
          M->getGlobalVariable("has_activated_thread_addr"));
      // get condition ins the origial loop
      // (TODO): currently, we assume the loop header contains/calculates the
      // loop condition, and the cond is the instruction before condition
      llvm::BasicBlock *loop_body;
      llvm::BasicBlock *loop_cond = L->getHeader();
      for (auto b_iter = loop_cond->begin(); b_iter != loop_cond->end();
           ++b_iter) {
        Instruction *org_inst = dyn_cast<Instruction>(&*b_iter);
        if (isa<llvm::BranchInst>(org_inst)) {
          auto br = dyn_cast<llvm::BranchInst>(org_inst);
          loop_body = br->getSuccessor(0);
          break;
        }
        auto new_inst = org_inst->clone();
        new_inst->insertAfter(last_inst);
        org_inst->replaceAllUsesWith(new_inst);
        last_inst = new_inst;
      }
      if (!isa<llvm::CmpInst>(last_inst))
        return 0;
      CreateInterWarpBarrier(last_inst);
      // set thread_activated = thread_activated & (cond)
      auto thread_activated = new LoadInst(I8, thread_activated_addr,
                                           "thread_activated", do_while_header);
      last_inst = llvm::CastInst::CreateIntegerCast(last_inst, I8, false, "",
                                                    do_while_header);
      auto and_result = BinaryOperator::Create(
          Instruction::And, last_inst, thread_activated, "", do_while_header);
      new StoreInst(and_result, thread_activated_addr, do_while_header);
      // has_activated_thread |= and_result
      has_activated_thread =
          new LoadInst(I8, M->getGlobalVariable("has_activated_thread_addr"),
                       "has_activated_thread", do_while_header);
      auto or_result =
          BinaryOperator::Create(Instruction::Or, has_activated_thread,
                                 and_result, "", do_while_header);
      new StoreInst(or_result,
                    M->getGlobalVariable("has_activated_thread_addr"),
                    do_while_header);
      // create branch
      auto branch_res =
          new ICmpInst(*do_while_header, llvm::CmpInst::Predicate::ICMP_NE,
                       and_result, ConstantInt::get(I8, 0));
      llvm::BranchInst::Create(loop_body, do_while_latch, branch_res,
                               do_while_header);
      // Part3: replace original loop's latches target
      if (auto latch = L->getLoopLatch()) {
        auto t = dyn_cast<BranchInst>(latch->getTerminator());
        assert(t->isUnconditional());
        t->setSuccessor(0, do_while_latch);
      }
      // Part4: remove useless block: loop header, as it has been copied to
      // do_while_header
      DeleteDeadBlocks(loop_cond);
    }
    return 1;
  }
};

char MemCoalescingTransformation::ID = 0;

namespace {
static RegisterPass<MemCoalescingTransformation> insert_mem_coalescing_barrier(
    "mem-coalescing-opt",
    "Apply transformation on CUDA memory coalescing pattern");
} // namespace

/*
 *The CUDA global memory coalescing optimization will result to low cache hit
 *rate on CPU. Thus, we need to implement transformation.
 * For example:
 * Input CUDA:
 *   uint32_t index = tid;
 *   while (index < num_pixels) {
 *      uint32_t color = pixels[index];
 *      priv_hist[color]++;
 *      index += gsize;
 * }
 * Output CUDA:
 *   uint32_t index = tid;
 *   __shared__ bool has_activated_thread;
 *   bool thread_activated = true;
 *   do {
 *      has_activated_thread = false;
 *      __syncthreads();
 *      thread_activated = thread_activated & (index < num_pixels);
 *      has_activated_thread |= thread_activated;
 *      if (thread_activated) {
 *        uint32_t color = pixels[index];
 *        priv_hist[color]++;
 *        index += gsize;
 *      }
 *   } while (has_activated_thread);
 *   __syncthreads();
 */
void global_mem_coalescing_optimization(llvm::Module *M) {
  DEBUG_INFO("global memory coalescing optimization\n");
  auto Registry = PassRegistry::getPassRegistry();

  llvm::legacy::PassManager Passes;

  std::vector<std::string> passes;
  passes.push_back("mem-coalescing-opt");
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
