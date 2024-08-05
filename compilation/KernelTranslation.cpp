#include "generate_x86_format.h"
#include "global_mem_coalescing_optimization.h"
#include "handle_sync.h"
#include "init.h"
#include "insert_sync.h"
#include "insert_warp_loop.h"
#include "performance.h"
#include "tail_block_adaptive_sync_optimization.h"
#include "tool.h"
#include "warp_func.h"
#include "llvm/IR/Module.h"
#include <assert.h>
#include <fstream>
#include <iostream>
#include <llvm/Support/raw_ostream.h>
#include <map>
#include <set>
#include <stdlib.h>

using namespace llvm;

std::string PATH = "kernel_meta.log";

int main(int argc, char **argv) {
  assert(argc == 4 && "incorrect number of arguments\n");
  const char *input_kernel_module_path = argv[1];
  const char *input_host_module_path = argv[2];
  const char *output_path = argv[3];
  llvm::Module *kernel_module = LoadModuleFromFilr(input_kernel_module_path);
  llvm::Module *host_module = LoadModuleFromFilr(input_host_module_path);

  std::ofstream fout;
  fout.open(PATH);

  // inline, and create auxiliary global variables
  init_block(kernel_module, fout);

  // Apply tail block adaptive synchronization transformation
  tail_block_adaptive_sync_optimization(kernel_module, host_module);
  VerifyModule(kernel_module);
  // insert sync before each vote, and replace the
  // original vote function to warp vote
  handle_warp_vote(kernel_module);

  // replace warp shuffle
  handle_warp_shfl(kernel_module);

  // global memory access coalescing optimization
  global_mem_coalescing_optimization(kernel_module);
  VerifyModule(kernel_module);

  // insert sync
  insert_sync(kernel_module);

  // split block by sync
  split_block_by_sync(kernel_module);
  // add loop for intra&intera thread
  insert_warp_loop(kernel_module);

  replace_built_in_function(kernel_module);

  generate_x86_format(kernel_module, host_module);

  // performance optimization
  performance_optimization(kernel_module);

  VerifyModule(kernel_module);

  DumpModule(kernel_module, output_path);

  fout.close();
  return 0;
}
