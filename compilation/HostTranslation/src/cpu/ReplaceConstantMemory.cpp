#include "ReplaceConstantMemory.h"
#include "llvm/IR/Instructions.h"
#include <assert.h>
#include <fstream>
#include <map>
#include <set>

using namespace llvm;

void ReplaceConstantMemory(llvm::Module *M, std::ifstream &fin) {
  std::string s;
  bool find_constant_memory = false;
  while (getline(fin, s)) {
    if (s.find("ConstMemory2GlobalMemory") != std::string::npos) {
      find_constant_memory = true;
      break;
    }
  }
  if (!find_constant_memory) {
    assert(0 && "Do not find constant to global mapping\n");
  }

  std::map<std::string, std::string> corresponding_global_memory;
  while (getline(fin, s)) {
    if (s.find("END") != std::string::npos) {
      break;
    }
    // get constant name
    size_t pos = 0;
    pos = s.find(' ');
    std::string constant_name = s.substr(0, pos);
    s.erase(0, pos + 1);
    // get mapped global name
    std::string global_name = s.substr(3, s.length() - 1);
    corresponding_global_memory.insert(
        std::pair<std::string, std::string>(constant_name, global_name));
  }

  std::set<llvm::GlobalVariable *> need_remove_constant_memory;
  // find all constant memory and generate corresponding global memory
  for (auto I = M->global_begin(), E = M->global_end(); I != E; ++I) {
    if (auto constant_memory = dyn_cast<llvm::GlobalVariable>(I)) {
      if (corresponding_global_memory.find(constant_memory->getName().str()) !=
          corresponding_global_memory.end()) {
        auto global_name =
            corresponding_global_memory.find(constant_memory->getName().str())
                ->second;
        // create a new global variable
        if (auto PT = dyn_cast<llvm::PointerType>(I->getType())) {
          need_remove_constant_memory.insert(constant_memory);
          // generate the corresponding global memory variable
          auto element_type = PT->getElementType();
          if (auto array_type = dyn_cast<llvm::ArrayType>(element_type)) {
            llvm::GlobalVariable *global_memory = new llvm::GlobalVariable(
                *M, array_type, false, llvm::GlobalValue::CommonLinkage, NULL,
                global_name, NULL, llvm::GlobalValue::NotThreadLocal, 0);

            llvm::ConstantAggregateZero *const_array =
                llvm::ConstantAggregateZero::get(array_type);
            global_memory->setInitializer(const_array);
            constant_memory->replaceAllUsesWith(
                llvm::ConstantExpr::getPointerCast(
                    global_memory,
                    cast<PointerType>(constant_memory->getType())));
          } else if (element_type->isStructTy()) {
            llvm::GlobalVariable *global_memory = new llvm::GlobalVariable(
                *M, element_type, false, llvm::GlobalValue::CommonLinkage, NULL,
                global_name, NULL, llvm::GlobalValue::NotThreadLocal, 0);
            llvm::ConstantAggregateZero *const_array =
                llvm::ConstantAggregateZero::get(element_type);
            global_memory->setInitializer(const_array);
            constant_memory->replaceAllUsesWith(
                llvm::ConstantExpr::getPointerCast(
                    global_memory,
                    cast<PointerType>(constant_memory->getType())));
          } else {
            assert(0 && "The required Constant Memory Type is not supported\n");
          }
        }
      }
    }
  }
  for (auto i : need_remove_constant_memory) {
    i->dropAllReferences();
    i->eraseFromParent();
  }
  return;
}
