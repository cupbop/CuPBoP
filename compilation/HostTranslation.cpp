#include "RemoveCudaBuiltin.h"
#include "ReplaceConstantMemory.h"
#include "ReplaceCudaBuiltin.h"
#include "ReplaceKernelArgs.h"
#include "tool.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Verifier.h"
#include <assert.h>
#include <fstream>
#include <iostream>
#include <stdlib.h>

using namespace llvm;

std::string PATH = "kernel_meta.log";

int main(int argc, char **argv) {
  assert(argc == 3 && "incorrect number of arguments\n");

  char *input_host_path = argv[1];
  char *output_host_path = argv[2];

  std::ifstream fin;
  fin.open(PATH);

  // load LLVM module(s)
  llvm::Module *hostModule = LoadModuleFromFilr(input_host_path);
  VerifyModule(hostModule);
  // replace const memory
  ReplaceConstantMemory(hostModule, fin);
  // process host module
  ReplaceCudaBuiltin(hostModule);
  // remove builtin unuse functions and variables
  RemoveCudaBuiltin(hostModule);
  // replace arguments in kernel_arg, from alloc to malloc
  ReplaceKernelArg(hostModule);

  VerifyModule(hostModule);
  DumpModule(hostModule, output_host_path);

  fin.close();
  return 0;
}
