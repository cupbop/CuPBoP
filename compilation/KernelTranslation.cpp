#include "generate_x86_format.h"
#include "handle_sync.h"
#include "init.h"
#include "insert_sync.h"
#include "insert_warp_loop.h"
#include "performance.h"
#include "tool.h"
#include "warp_func.h"
#include "llvm/IR/Module.h"
#include <assert.h>
#include <iostream>
#include <map>
#include <set>
#include <stdlib.h>

using namespace llvm;

int main(int argc, char **argv) {
  assert(argc == 9 && "incorrect number of arguments\n");
  llvm::Module *program = LoadModuleFromFilr(argv[1]);
  // get size of grid and dim from input arguments
  int *grid_dim = new int[3];
  int *block_dim = new int[3];
  grid_dim[0] = atoi(argv[3]);
  grid_dim[1] = atoi(argv[4]);
  grid_dim[2] = atoi(argv[5]);
  block_dim[0] = atoi(argv[6]);
  block_dim[1] = atoi(argv[7]);
  block_dim[2] = atoi(argv[8]);

  // inline, and create auxiliary global variables
  init_block(program);
  // insert sync before each vote, and replace the
  // original vote function to warp vote
  handle_warp_vote(program);
  // replace warp shuffle
  handle_warp_shfl(program);
  // insert sync
  insert_sync(program);
  // split block by sync
  split_block_by_sync(program);
  // add loop for intra&intera thread
  insert_warp_loop(program);
  // (TODO): replace this patch
  replace_built_in_function(program, grid_dim, block_dim);
  // VerifyModule(program);
  generate_x86_format(program);
  // performance optimization
  performance_optimization(program);

  DumpModule(program, argv[2]);
  return 0;
}
