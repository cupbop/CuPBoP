#ifndef __NVVM2x86_TOOL__
#define __NVVM2x86_TOOL__

#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Module.h"

#include <sstream>

llvm::Module *LoadModuleFromFilr(const char *file_name);
void DumpModule(llvm::Module *M, const char *file_name);
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
llvm::LoadInst *createLoad(llvm::IRBuilder<> &B, llvm::Value *addr,
                           bool isVolatile = false);
llvm::Value *createInBoundsGEP(llvm::IRBuilder<> &B, llvm::Value *ptr,
                               llvm::ArrayRef<llvm::Value *> idxlist);
llvm::Value *createGEP(llvm::IRBuilder<> &B, llvm::Value *ptr,
                       llvm::ArrayRef<llvm::Value *> idxlist);

// Used to represent the CUDA grid/block size configuration
// This is an auxiliary structure to store the possible block sizes.
struct Dim3SizeConfig {
  int _x, _y, _z;
  Dim3SizeConfig(int x, int y, int z) : _x(x), _y(y), _z(z) {}
  // This function is used to convert the block size configuration to a
  // string.
  std::string toString() const {
    std::ostringstream oss;
    oss << _x << "_" << _y << "_" << _z;
    return oss.str();
  }
  bool operator==(const Dim3SizeConfig &other) const {
    return (_x == other._x && _y == other._y && _z == other._z);
  }
  bool operator<(const Dim3SizeConfig &other) const {
    if (_x != other._x)
      return _x < other._x;
    if (_y != other._y)
      return _y < other._y;
    return _z < other._z;
  }
};

std::set<Dim3SizeConfig>
get_possible_grid_or_block_size(llvm::Module *host_module, bool getBlockSize);

llvm::Instruction *find_thread_idx_x(llvm::BasicBlock *BB);
llvm::Instruction *find_block_idx_x(llvm::BasicBlock *BB);
llvm::Instruction *find_block_dim_x(llvm::BasicBlock *BB);
llvm::Instruction *find_grid_dim_x(llvm::BasicBlock *BB);

#endif
