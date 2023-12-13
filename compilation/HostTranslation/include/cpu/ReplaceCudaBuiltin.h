#ifndef __NVVM2x86_REPLACE_CUDA_BUILTIN__
#define __NVVM2x86_REPLACE_CUDA_BUILTIN__

#include "llvm/IR/Module.h"
/*
 * Change to i8* bitcast (i8* (i8*)* @_Z9vecPKiS0_Pii_wrapper to i8*)
 * Original: i8* bitcast (void (i32*, i32*, i32*, i32)* @_Z9vecPKiS0_Pii to i8*)
 */
void ReplaceCudaBuiltin(llvm::Module *M);

#endif
