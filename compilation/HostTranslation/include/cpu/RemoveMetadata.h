#ifndef __NVVM2x86_REMOVE_METADATA__
#define __NVVM2x86_REMOVE_METADATA__

#include "llvm/IR/Module.h"

// remove metadata, e.g., optnone
void RemoveMetadata(llvm::Module *M);

#endif
