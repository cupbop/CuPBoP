#include "debug.hpp"
#include "global_mem_coalescing_optimization.h"
#include "performance.h"
#include "tool.h"
#include "llvm/Analysis/LoopInfo.h"
#include "llvm/Analysis/LoopPass.h"
#include "llvm/Analysis/ScalarEvolution.h"
#include "llvm/Analysis/ScalarEvolutionExpressions.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/PassManager.h"
#include "llvm/InitializePasses.h"
#include "llvm/PassInfo.h"
#include "llvm/PassRegistry.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Transforms/Scalar/IndVarSimplify.h"
#include "llvm/Transforms/Utils/BasicBlockUtils.h"
#include "llvm/Transforms/Utils/Cloning.h"
using namespace llvm;

std::set<Dim3SizeConfig> possible_block_size_list;
std::set<Dim3SizeConfig> possible_grid_size_list;

int tail_block_threshold;

struct TailBlockSyncTransformation : public llvm::FunctionPass {

public:
  static char ID;

  TailBlockSyncTransformation() : FunctionPass(ID) {}

  void getAnalysisUsage(AnalysisUsage &AU) const {
    AU.addRequired<DominatorTreeWrapperPass>();
    AU.addRequired<LoopInfoWrapperPass>();
    AU.addRequired<ScalarEvolutionWrapperPass>();
  }

  void apply_tail_block_adaptive_sync(Function *F, DominatorTree *DT,
                                      LoopInfo *LI) {
    // Step 1: Split the header by the condition
    BasicBlock *header_block = &*F->begin();
    Instruction *thread_idx_x = find_thread_idx_x(header_block);
    Instruction *block_idx_x = find_block_idx_x(header_block);
    Instruction *block_dim_x = find_block_dim_x(header_block);
    Instruction *grid_dim_x = find_grid_dim_x(header_block);

    BasicBlock *body_block = &*std::next(F->begin());
    BasicBlock *ret_block = &*std::next(std::next(F->begin()));

    Instruction *splitPoint = header_block->getTerminator();
    BasicBlock *tail_block_start =
        SplitBlock(header_block, splitPoint, DT, LI, nullptr, "tail_block");
    CreateInterWarpBarrier(tail_block_start->getTerminator());
    // Step 2: Construct new blocks for non-tail GPU blocks
    ValueToValueMapTy VMap;
    BasicBlock *non_tail_block_start =
        CloneBasicBlock(body_block, VMap, "non_tail_block", F);

    for (Instruction &I : *non_tail_block_start) {
      RemapInstruction(&I, VMap,
                       RF_NoModuleLevelChanges | RF_IgnoreMissingLocals);
    }
    CreateInterWarpBarrier(non_tail_block_start->getTerminator());
    // Step 3: Build a new condition instruction at end of the header block
    IRBuilder<> Builder(header_block->getTerminator());

    // Check whether the block is the last block
    Value *is_tail_block = Builder.CreateCmp(
        CmpInst::ICMP_EQ, block_idx_x,
        Builder.CreateSub(block_dim_x,
                          ConstantInt::get(block_dim_x->getType(), 1)));
    Instruction *new_branch_for_header = Builder.CreateCondBr(
        is_tail_block, tail_block_start, non_tail_block_start);

    // Remove the original unconditional branch
    Instruction *unconditional_branch = header_block->getTerminator();
    unconditional_branch->eraseFromParent();
  }

  bool isSingleConditionFormat(Function *F) {
    // The idle format should be like:
    // void func() {
    //   int gid = blockIdx.x * blockDim.x + threadIdx.x;
    //   if (gid < N) {
    //     // kernel body
    //   }
    // }
    //}
    //
    // check the length of blocks
    if (F->size() != 3) {
      return false;
    }
    auto header_block = F->begin();
    auto ret_block = std::next(std::next(F->begin()));
    // Step1: Check the return block
    if (ret_block->size() != 1) {
      // The return block should only contains a single ret instruction
      return false;
    }
    // Step2: Check the header block
    auto branch_inst = dyn_cast<BranchInst>(header_block->getTerminator());
    if (!branch_inst || branch_inst->isUnconditional()) {
      return false;
    }
    auto cmp_inst = dyn_cast<CmpInst>(branch_inst->getCondition());
    if (!cmp_inst || cmp_inst->getPredicate() != CmpInst::ICMP_SLT) {
      return false;
    }
    // The left operand should be a variable
    auto lhr = dyn_cast<LoadInst>(cmp_inst->getOperand(0));
    // The right operand should be a constant
    auto rhr = dyn_cast<ConstantInt>(cmp_inst->getOperand(1));
    if (!lhr || !rhr) {
      return false;
    }
    tail_block_threshold = rhr->getSExtValue();
    // Check the left operand, it should be blockIdx.x * blockDim.x + tid.x
    for (auto inst : lhr->getPointerOperand()->users()) {
      if (auto store_inst = dyn_cast<StoreInst>(inst)) {
        auto add_inst = dyn_cast<BinaryOperator>(store_inst->getValueOperand());
        if (!add_inst || add_inst->getOpcode() != Instruction::Add) {
          return false;
        }
        // The second operand should be threadIdx.x
        auto tid_inst = dyn_cast<CallInst>(add_inst->getOperand(1));
        if (!tid_inst || tid_inst->getCalledFunction()->getName() !=
                             "llvm.nvvm.read.ptx.sreg.tid.x") {
          return false;
        }
        // The first operand should be blockIdx.x * blockDim.x
        if (auto mul_inst = dyn_cast<BinaryOperator>(add_inst->getOperand(0))) {
          if (mul_inst->getOpcode() == Instruction::Mul) {
            auto block_idx_inst = dyn_cast<CallInst>(mul_inst->getOperand(0));
            auto grid_size_inst = dyn_cast<CallInst>(mul_inst->getOperand(1));

            if (!block_idx_inst || !grid_size_inst) {
              return false;
            }
            if (block_idx_inst->getCalledFunction()->getName() ==
                    "llvm.nvvm.read.ptx.sreg.ctaid.x" &&
                grid_size_inst->getCalledFunction()->getName() ==
                    "llvm.nvvm.read.ptx.sreg.ntid.x") {
              return true;
            }
          }
        }
      }
    }
    return false;
  }
  bool runOnFunction(Function &F) {
    auto M = F.getParent();
    if (!isKernelFunction(M, &F))
      return 0;
    // Check whether the function body can be optimized.
    if (!isSingleConditionFormat(&F)) {
      printf("the function does not contain tail block\n");
      return 0;
    }
    auto &SE = getAnalysis<ScalarEvolutionWrapperPass>().getSE();
    // Check whether the condition is true for all but the last blocks.
    APInt condition_constant(32, tail_block_threshold);

    ConstantRange ThreadIdxRange = ConstantRange(
        APInt(32, 0), APInt(32, possible_block_size_list.begin()->_x + 1));
    ConstantRange BlockIdxRange = ConstantRange(
        APInt(32, 0), APInt(32, possible_grid_size_list.begin()->_x));

    ConstantRange MulRange = BlockIdxRange.multiply(ThreadIdxRange);

    MulRange.print(llvm::outs());
    llvm::outs() << "\n";
    if (!MulRange.icmp(CmpInst::ICMP_SLT, condition_constant)) {
      printf("Condition is not always true.\n");
      return 0;
    }
    printf("The function can be optimized by tail block adaptive sync\n");
    // Apply transformation
    DominatorTree *DT = &getAnalysis<DominatorTreeWrapperPass>().getDomTree();
    LoopInfo *LI = &getAnalysis<LoopInfoWrapperPass>().getLoopInfo();
    apply_tail_block_adaptive_sync(&F, DT, LI);
    return 1;
  }
};

char TailBlockSyncTransformation::ID = 0;

namespace {
static RegisterPass<TailBlockSyncTransformation> tail_block_adaptive_sync(
    "tail-block-adaptive-sync",
    "Apply tail block adaptive synchronization transformation");
} // namespace

void tail_block_adaptive_sync_optimization(llvm::Module *kernel_module,
                                           llvm::Module *host_module) {
  DEBUG_INFO("tail block adaptive synchronization optimization\n");

  // Try to analyze the host module to get the range of grid/block size

  possible_block_size_list =
      get_possible_grid_or_block_size(host_module, /*getBlockSize=*/true);
  possible_grid_size_list =
      get_possible_grid_or_block_size(host_module, /*getBlockSize=*/false);

  // We only optimize the cases when there is single grid/block configuration
  if (possible_block_size_list.size() != 1 ||
      possible_grid_size_list.size() != 1) {
    DEBUG_INFO("Not a single static grid/block configuration. Skip.\n");
    return;
  }

  // The block size and grid size should be 1 dimension
  if (possible_block_size_list.begin()->_y != 1 ||
      possible_block_size_list.begin()->_z != 1 ||
      possible_grid_size_list.begin()->_y != 1 ||
      possible_grid_size_list.begin()->_z != 1) {
    DEBUG_INFO("Not a single dimension grid/block configuration. Skip.\n");
    return;
  }
  auto Registry = PassRegistry::getPassRegistry();

  llvm::legacy::PassManager Passes;

  std::vector<std::string> passes;
  passes.push_back("tail-block-adaptive-sync");
  for (auto pass : passes) {
    const PassInfo *PIs = Registry->getPassInfo(StringRef(pass));
    if (PIs) {
      Pass *thispass = PIs->createPass();
      Passes.add(thispass);
    } else {
      assert(0 && "Pass not found\n");
    }
  }
  Passes.run(*kernel_module);
}
