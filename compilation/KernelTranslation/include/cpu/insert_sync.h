#ifndef __NVVM2x86_INSERT_SYNC__
#define __NVVM2x86_INSERT_SYNC__

#include "llvm/IR/Function.h"

// insert extra barrier
void insert_sync(llvm::Module *M);

#endif
