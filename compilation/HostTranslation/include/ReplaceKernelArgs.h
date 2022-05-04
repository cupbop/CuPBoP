#ifndef __NVVM2x86_REPLACE_KERNEL_ARGS__
#define __NVVM2x86_REPLACE_KERNEL_ARGS__

#include "llvm/IR/Module.h"
/*
 * before:
 * %m_cuda.addr = alloca float*, align 8
 * after:
 * %m_cuda.addr_tmp = call i8* @malloc(i64 8)
 * %m_cuda.addr = bitcast i8* %m_cuda.addr_tmp to float**
 */
void ReplaceKernelArg(llvm::Module *M);

#endif
