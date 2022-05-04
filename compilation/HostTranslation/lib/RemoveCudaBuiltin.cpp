/**
 * Remove Clang cuda builtin functions and variables
 */
#include "RemoveCudaBuiltin.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/GlobalValue.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/Support/ToolOutputFile.h"
#include <iostream>
#include <map>
#include <set>

using namespace llvm;

void RemoveCudaBuiltin(llvm::Module *M) {

  std::set<llvm::Function *> need_remove;

  if (GlobalVariable *gv = M->getGlobalVariable("llvm.global_ctors")) {
    gv->dropAllReferences();
    gv->eraseFromParent();
  }
  Function *c_tor = NULL;
  if (c_tor = M->getFunction("__cuda_module_ctor")) {
    c_tor->dropAllReferences();
    c_tor->eraseFromParent();
  }
  if (c_tor = M->getFunction("__cuda_module_dtor")) {
    c_tor->dropAllReferences();
    c_tor->eraseFromParent();
  }
  if (c_tor = M->getFunction("__cuda_register_globals")) {

    c_tor->dropAllReferences();
    c_tor->eraseFromParent();
  }
  for (Module::iterator i = M->begin(), e = M->end(); i != e; ++i) {
    Function *F = &(*i);
    auto func_name = F->getName().str();

    if (func_name == "__cuda_module_dtor" ||
        func_name == "__cuda_register_globals" ||
        func_name == "__cudaRegisterFunction" ||
        func_name == "__cudaRegisterVar" ||
        func_name == "__cudaRegisterFatBinary" ||
        func_name == "__cuda_module_ctor" ||
        func_name == "__cudaRegisterFatBinaryEnd" ||
        func_name == "__cudaUnregisterFatBinary") {
      need_remove.insert(F);
    }
  }
  for (auto f : need_remove) {
    f->dropAllReferences();
    f->eraseFromParent();
  }
}
