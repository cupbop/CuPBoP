#ifndef __NVVM2x86_WARP_FUNC__
#define __NVVM2x86_WARP_FUNC__

#include "llvm/IR/Function.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Module.h"

void handle_warp_vote(llvm::Module *M);
void handle_warp_shfl(llvm::Module *M);
#endif
