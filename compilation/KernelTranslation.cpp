#include "generate_cpu_format.h"
#include "handle_sync.h"
#include "init.h"
#include "insert_sync.h"
#include "insert_warp_loop.h"
#include "performance.h"
#include "tool.h"
#include "warp_func.h"
#include <assert.h>

using namespace llvm;

// to support constant memory variables, we need to convert information
// from kernelTranslator to HostTranslator, since HostTranslator knows nothing
// about the kernel functions, we need to write the information to a file
// by KernelTranslator and read it in HostTranslator
std::string PATH = "kernel_meta.log";

int main(int argc, char **argv) {
  assert(argc == 3 && "incorrect number of arguments\n");
  llvm::Module *program = LoadModuleFromFilr(argv[1]);

  std::ofstream fout;
  fout.open(PATH);

  // inline __device__ functions, and create auxiliary global variables
  init_block(program, fout);

  // insert sync before each vote, and replace the
  // original vote function to warp vote
  handle_warp_vote(program);

  // replace warp shuffle
  handle_warp_shfl(program);

  // insert sync
  insert_sync(program);

  // split block by sync
  split_block_by_sync(program);

  // add loop for intra&intera thread, it refers 'hierarchical collapsing' in
  // COX paper.
  insert_warp_loop(program);

  replace_built_in_function(program);

  // the input kernel programs have NVIDIA metadata, they need to be replaced to
  // CPU metadata
  generate_cpu_format(program);

  // execute O3 pipeline on the transformed program
  performance_optimization(program);

  VerifyModule(program);

  DumpModule(program, argv[2]);

  fout.close();
  return 0;
}
