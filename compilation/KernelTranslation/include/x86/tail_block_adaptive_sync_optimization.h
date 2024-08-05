#ifndef __NVVM2x86_TAIL_BLOCK_ADAPTIVE_SYNC_OPTIMIZATION__
#define __NVVM2x86_TAIL_BLOCK_ADAPTIVE_SYNC_OPTIMIZATION__

#include "llvm/IR/Function.h"

/*
Before transformation:
__global__ void k1(...) {
  int gid = bid * bdim + tid;
  // only the last block can be false
  if (gid < N)
    out[gid] = in[gid];
}
After transformation:
__global__ void k1(...) {
  int gid = bid * bdim + tid;
  if (blockIdx.x == blockDim.x - 1) {
    if (gid < N) {
      out[gid] = in[gid];
       __syncthreads();
    }
  else {
    out[gid] = in[gid];
    __syncthreads();
  }
}
*/

void tail_block_adaptive_sync_optimization(llvm::Module *kernel_module,
                                           llvm::Module *host_module);

#endif
