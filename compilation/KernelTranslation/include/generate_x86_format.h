#ifndef __NVVM2x86_GENERATE_X86_FORMAT__
#define __NVVM2x86_GENERATE_X86_FORMAT__

#include "llvm/IR/Module.h"

void generate_x86_format(llvm::Module *M);

void set_meta_data(llvm::Module *M);

#endif
