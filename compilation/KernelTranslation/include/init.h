#ifndef __NVVM2x86_INIT__
#define __NVVM2x86_INIT__

#include "llvm/IR/Module.h"
#include <fstream>
void init_block(llvm::Module *M, std::ofstream &fout);
#endif
