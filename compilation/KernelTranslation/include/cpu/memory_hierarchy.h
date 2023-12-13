#ifndef __NVVM2x86_MEMORY_HIERARCHY__
#define __NVVM2x86_MEMORY_HIERARCHY__
#include "llvm/IR/Module.h"
#include <fstream>
using namespace llvm;

void mem_share2global(llvm::Module *M);
void mem_constant2global(llvm::Module *M, std::ofstream &fout);

#endif
