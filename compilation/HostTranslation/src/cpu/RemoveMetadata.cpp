#include "RemoveMetadata.h"
#include "llvm/Support/Host.h"

using namespace llvm;

void RemoveMetadata(llvm::Module *M) {
  // change the target triple to the host triple
  M->setTargetTriple(llvm::sys::getProcessTriple());
  // use the default DataLayout
  M->setDataLayout("");

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
    F->removeFnAttr("target-cpu");
    F->removeFnAttr("target-features");
  }
}
