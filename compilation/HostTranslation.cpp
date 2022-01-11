#include "ReplaceKernelLaunch.h"
#include "tool.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Verifier.h"
#include <assert.h>
#include <iostream>
#include <stdlib.h>

using namespace llvm;

int main(int argc, char **argv) {
  assert(argc == 3 && "incorrect number of arguments\n");

  char *input_host_path = argv[1];
  char *output_host_path = argv[2];

  // load LLVM module(s)
  llvm::Module *hostModule = LoadModuleFromFilr(input_host_path);
  VerifyModule(hostModule);
  // process host module
  ReplaceKernelLaunch(hostModule);
  VerifyModule(hostModule);
  DumpModule(hostModule, output_host_path);
  return 0;
}
