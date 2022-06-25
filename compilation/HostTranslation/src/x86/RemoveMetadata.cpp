#include "RemoveMetadata.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/GlobalValue.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/Support/ToolOutputFile.h"
#include <iostream>

using namespace llvm;

void RemoveMetadata(llvm::Module *M) {
  SmallVector<std::pair<unsigned, MDNode *>, 4> MDs;
  for (Module::iterator i = M->begin(), e = M->end(); i != e; ++i) {
    Function *F = &(*i);
    F->getAllMetadata(MDs);
    for (auto &MD : MDs) {
      F->setMetadata(MD.first, NULL);
    }
    F->removeFnAttr(llvm::Attribute::NoInline);
    F->removeFnAttr("min-legal-vector-width");
    F->removeFnAttr("no-trapping-math");
    F->removeFnAttr(llvm::Attribute::OptimizeNone);
  }
}