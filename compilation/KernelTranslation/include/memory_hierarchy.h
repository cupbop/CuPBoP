#ifndef __NVVM2x86_MEMORY_HIERARCHY__
#define __NVVM2x86_MEMORY_HIERARCHY__
#include "llvm/IR/Module.h"

using namespace llvm;

void mem_share2global(llvm::Module *M);

#endif
