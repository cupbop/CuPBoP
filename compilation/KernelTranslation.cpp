#include "generate_x86_format.h"
#include "global_mem_coalescing_optimization.h"
#include "handle_sync.h"
#include "init.h"
#include "insert_sync.h"
#include "insert_warp_loop.h"
#include "performance.h"
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
  assert(argc == 3 && "incorrect number of arguments\n");
  llvm::Module *program = LoadModuleFromFilr(argv[1]);

  std::ofstream fout;
  fout.open(PATH);

  // inline, and create auxiliary global variables
  init_block(program, fout);
  // insert sync before each vote, and replace the
  // original vote function to warp vote
  handle_warp_vote(program);

  // replace warp shuffle
  handle_warp_shfl(program);

  // global memory access coalescing optimization
  global_mem_coalescing_optimization(program);
  VerifyModule(program);

  // insert sync
  insert_sync(program);

  // split block by sync
  split_block_by_sync(program);
  // add loop for intra&intera thread
  insert_warp_loop(program);

  // (TODO): replace this patch
  replace_built_in_function(program);

  // TODO: replace with a more general function
  // Not only for x86 backend
  generate_x86_format(program);

  // performance optimization
  performance_optimization(program);

  VerifyModule(program);

  DumpModule(program, argv[2]);

  fout.close();
  return 0;
}
