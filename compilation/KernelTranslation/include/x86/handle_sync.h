#ifndef __NVVM2x86_HANDLE_SYNC__
#define __NVVM2x86_HANDLE_SYNC__

#include "llvm/IR/Module.h"

using namespace llvm;

void split_block_by_sync(llvm::Module *M);

#endif
