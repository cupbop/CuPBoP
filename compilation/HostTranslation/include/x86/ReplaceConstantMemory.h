#ifndef __NVVM2x86_REPLACE_CONSTANT_MEMORY__
#define __NVVM2x86_REPLACE_CONSTANT_MEMORY__

#include "llvm/IR/Module.h"
#include <fstream>
/*
 * From: @ff_variable = internal global [5 x float] undef, align 16
 * To: @wrapper_global_ff_variable = common global [5 x float] zeroinitializer
 */
void ReplaceConstantMemory(llvm::Module *M, std::ifstream &fin);

#endif
