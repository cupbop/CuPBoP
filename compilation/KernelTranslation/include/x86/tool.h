#ifndef __NVVM2x86_TOOL__
#define __NVVM2x86_TOOL__

#include "llvm/IR/Module.h"
llvm::Module *LoadModuleFromFilr(char *file_name);
void DumpModule(llvm::Module *M, char *file_name);
bool isKernelFunction(llvm::Module *M, llvm::Function *F);
void replace_block(llvm::Function *F, llvm::BasicBlock *before,
                   llvm::BasicBlock *after);
llvm::CallInst *CreateInterWarpBarrier(llvm::Instruction *InsertBefore);
llvm::CallInst *CreateIntraWarpBarrier(llvm::Instruction *InsertBefore);
void VerifyModule(llvm::Module *);
void phi2alloc(llvm::Module *M);
void remove_cuda_built_in(llvm::Module *M);
void replace_built_in_function(llvm::Module *M);
void replace_asm_call(llvm::Module *M);
bool find_block_barrier_in_region(llvm::BasicBlock *start,
                                  llvm::BasicBlock *end);
bool find_barrier_in_region(llvm::BasicBlock *start, llvm::BasicBlock *end);
bool has_warp_barrier(llvm::BasicBlock *B);
bool has_barrier(llvm::BasicBlock *B);
bool has_block_barrier(llvm::BasicBlock *B);
bool has_barrier(llvm::Function *F);
void replace_dynamic_shared_memory(llvm::Module *M);
#endif
