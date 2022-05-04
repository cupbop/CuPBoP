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
  // VerifyModule(program);
  handle_warp_shfl(program);
  // insert sync
  // VerifyModule(program);
  insert_sync(program);
  // split block by sync
  // VerifyModule(program);
  std::cout << "split\n" << std::flush;
  split_block_by_sync(program);
  // add loop for intra&intera thread

  // VerifyModule(program);
  std::cout << "insert\n" << std::flush;
  insert_warp_loop(program);

  // VerifyModule(program);

  // (TODO): replace this patch
  std::cout << "replace\n" << std::flush;
  replace_built_in_function(program);

  // VerifyModule(program);
  std::cout << "generate\n" << std::flush;
  generate_x86_format(program);

  // VerifyModule(program);

  // performance optimization
  performance_optimization(program);

  VerifyModule(program);

  DumpModule(program, argv[2]);

  fout.close();

  return 0;
}
