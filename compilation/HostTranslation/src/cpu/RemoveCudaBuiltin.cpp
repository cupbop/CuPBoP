/**
 * Remove Clang cuda builtin functions and variables
 */
#include "RemoveCudaBuiltin.h"
#include "debug.hpp"
#include "llvm/IR/Instructions.h"
#include "llvm/Support/ToolOutputFile.h"
#include <set>

using namespace llvm;

/// Given a llvm.global_ctors list that we can understand,
/// return a list of the functions and null terminator as a vector.
static std::vector<Function *> parseGlobalCtors(GlobalVariable *GV) {
  if (GV->getInitializer()->isNullValue())
    return std::vector<Function *>();
  ConstantArray *CA = cast<ConstantArray>(GV->getInitializer());
  std::vector<Function *> Result;
  Result.reserve(CA->getNumOperands());
  for (auto &V : CA->operands()) {
    ConstantStruct *CS = cast<ConstantStruct>(V);
    Result.push_back(dyn_cast<Function>(CS->getOperand(1)));
  }
  return Result;
}

void RemoveCudaBuiltin(llvm::Module *M) {

  std::set<llvm::Function *> need_remove;

  // remove cuda built-in from Ctors
  if (GlobalVariable *GV = M->getGlobalVariable("llvm.global_ctors")) {
    std::vector<Function *> Ctors = parseGlobalCtors(GV);
    if (!Ctors.empty()) {
      ConstantArray *OldCA = cast<ConstantArray>(GV->getInitializer());
      SmallVector<Constant *, 10> CAList;
      for (int i = 0; i < OldCA->getNumOperands(); i++) {
        if (!Ctors[i])
          continue;
        if (Ctors[i]->hasName() &&
            Ctors[i]->getName().str().find("__cuda") == std::string::npos) {
          DEBUG_INFO("keep: %s\n", Ctors[i]->getName().str().c_str());
          CAList.push_back(OldCA->getOperand(i));
        }
      }

      // Create the new array initializer.
      ArrayType *ATy =
          ArrayType::get(OldCA->getType()->getElementType(), CAList.size());
      Constant *CA = ConstantArray::get(ATy, CAList);

      // If we didn't change the number of elements, don't create a new GV.
      if (CA->getType() == OldCA->getType()) {
        GV->setInitializer(CA);
      } else {
        // Create the new global and insert it next to the existing list.
        GlobalVariable *NGV = new GlobalVariable(
            CA->getType(), GV->isConstant(), GV->getLinkage(), CA, "",
            GV->getThreadLocalMode());
        GV->getParent()->getGlobalList().insert(GV->getIterator(), NGV);
        NGV->takeName(GV);

        // Nuke the old list, replacing any uses with the new one.
        if (!GV->use_empty()) {
          Constant *V = NGV;
          if (V->getType() != GV->getType())
            V = ConstantExpr::getBitCast(V, GV->getType());
          GV->replaceAllUsesWith(V);
        }
        GV->eraseFromParent();
      }
    }
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
