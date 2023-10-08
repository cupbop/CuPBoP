#ifndef __NVVM2x86_PERFORMANCE__
#define __NVVM2x86_PERFORMANCE__

#include "llvm/Analysis/LoopInfo.h"
#include "llvm/Analysis/PostDominators.h"
#include "llvm/IR/Module.h"

void performance_optimization(llvm::Module *M);

bool loop_contains_global_memory_coalescing(llvm::Loop *L);
#endif