#ifndef __NVVM2x86_GLOBAL_MEM_COALESCING_OPTIMIZATION__
#define __NVVM2x86_GLOBAL_MEM_COALESCING_OPTIMIZATION__

#include "llvm/IR/Function.h"

void global_mem_coalescing_optimization(llvm::Module *M);

#endif