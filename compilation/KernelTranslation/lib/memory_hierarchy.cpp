#include "memory_hierarchy.h"
#include "llvm/IR/CFG.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/GlobalValue.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/Transforms/Utils/Cloning.h"
#include "llvm/Transforms/Utils/ValueMapper.h"
#include <assert.h>
#include <fstream>
#include <iostream>
#include <map>
#include <set>
#include <sstream>
#include <tuple>
#include <vector>

void mem_share2global(llvm::Module *M) {
  LLVMContext *C = &M->getContext();
  llvm::Type *Int32T = Type::getInt32Ty(*C);
  llvm::Type *Int64T = Type::getInt64Ty(*C);
  llvm::Type *Int8T = Type::getInt8Ty(*C);

  std::map<GlobalVariable *, GlobalVariable *> corresponding_global_memory;
  std::set<llvm::Instruction *> need_remove;
  std::set<GlobalVariable *> need_remove_share_memory;

  // find all share memory and generate corresponding global memory
  for (auto I = M->global_begin(), E = M->global_end(); I != E; ++I) {
    if (GlobalVariable *share_memory = dyn_cast<GlobalVariable>(I)) {
      if (auto PT = dyn_cast<PointerType>(I->getType())) {
        unsigned AS = PT->getAddressSpace();
        if (AS == 3) { // find a share memory
          need_remove_share_memory.insert(share_memory);
          // generate the corresponding global memory variable
          auto new_name = "wrapper_global_" + share_memory->getName().str();
          auto element_type = PT->getElementType();
          if (auto array_type = dyn_cast<ArrayType>(element_type)) {
            if (share_memory->hasExternalLinkage() &&
                array_type->getArrayNumElements() == 0) {
              // external shared memory of []
              // generate global type pointer
              PointerType *PointerTy =
                  PointerType::get(array_type->getElementType(), 0);
              llvm::Constant *x1 = ConstantPointerNull::get(PointerTy);
              llvm::GlobalVariable *global_ptr = new llvm::GlobalVariable(
                  *M, PointerTy, false, llvm::GlobalValue::CommonLinkage, x1,
                  "wrapper_global_data", NULL,
                  llvm::GlobalValue::GeneralDynamicTLSModel, 0, false);

              global_ptr->setDSOLocal(true);

              corresponding_global_memory.insert(
                  std::pair<GlobalVariable *, GlobalVariable *>(share_memory,
                                                                global_ptr));
            } else {
              llvm::GlobalVariable *global_memory = new llvm::GlobalVariable(
                  *M, array_type, false, llvm::GlobalValue::ExternalLinkage,
                  NULL, new_name, NULL,
                  llvm::GlobalValue::GeneralDynamicTLSModel, 1);
              ConstantAggregateZero *const_array =
                  ConstantAggregateZero::get(array_type);
              global_memory->setInitializer(const_array);
              corresponding_global_memory.insert(
                  std::pair<GlobalVariable *, GlobalVariable *>(share_memory,
                                                                global_memory));
            }
          } else if (auto int_type = dyn_cast<IntegerType>(element_type)) {
            auto zero = llvm::ConstantInt::get(int_type, 0, true);
            llvm::GlobalVariable *global_memory = new llvm::GlobalVariable(
                *M, int_type, false, llvm::GlobalValue::ExternalLinkage, zero,
                new_name, NULL, llvm::GlobalValue::GeneralDynamicTLSModel, 0,
                false);
            corresponding_global_memory.insert(
                std::pair<GlobalVariable *, GlobalVariable *>(share_memory,
                                                              global_memory));
          } else if (element_type->isFloatTy()) {
            auto FP_type = llvm::Type::getFloatTy(*C);
            auto zero = llvm::ConstantFP::get(FP_type, 0);
            llvm::GlobalVariable *global_memory = new llvm::GlobalVariable(
                *M, FP_type, false, llvm::GlobalValue::ExternalLinkage, zero,
                new_name, NULL, llvm::GlobalValue::GeneralDynamicTLSModel, 0,
                false);
            corresponding_global_memory.insert(
                std::pair<GlobalVariable *, GlobalVariable *>(share_memory,
                                                              global_memory));
          } else {
            assert(0 && "The required Share Memory Type is not supported\n");
          }
        }
      }
    }
  }

  for (auto k : corresponding_global_memory) {
    auto share_addr = k.first;
    auto global_addr = k.second;
    share_addr->replaceAllUsesWith(ConstantExpr::getPointerCast(
        global_addr, cast<PointerType>(share_addr->getType())));
  }

  for (auto i : need_remove) {
    i->dropAllReferences();
    i->eraseFromParent();
  }
  for (auto i : need_remove_share_memory) {
    i->dropAllReferences();
    i->eraseFromParent();
  }
}

void mem_constant2global(llvm::Module *M, std::ofstream &fout) {
  LLVMContext *C = &M->getContext();
  llvm::Type *Int32T = Type::getInt32Ty(*C);
  llvm::Type *Int64T = Type::getInt64Ty(*C);
  llvm::Type *Int8T = Type::getInt8Ty(*C);

  std::map<GlobalVariable *, GlobalVariable *> corresponding_global_memory;
  std::set<llvm::Instruction *> need_remove;
  std::set<GlobalVariable *> need_remove_constant_memory;

  // find all constant memory and generate corresponding global memory
  for (auto I = M->global_begin(), E = M->global_end(); I != E; ++I) {
    if (GlobalVariable *constant_memory = dyn_cast<GlobalVariable>(I)) {
      if (auto PT = dyn_cast<PointerType>(I->getType())) {
        unsigned AS = PT->getAddressSpace();
        if (AS == 4) { // find a share memory
          need_remove_constant_memory.insert(constant_memory);
          // generate the corresponding global memory variable
          auto new_name = "wrapper_global_" + constant_memory->getName().str();
          auto element_type = PT->getElementType();
          if (auto array_type = dyn_cast<ArrayType>(element_type)) {
            if (constant_memory->hasExternalLinkage() &&
                array_type->getArrayNumElements() == 0) {
              // external shared memory of []
              // generate global type pointer
              PointerType *PointerTy =
                  PointerType::get(array_type->getElementType(), 0);
              llvm::Constant *x1 = ConstantPointerNull::get(PointerTy);
              llvm::GlobalVariable *global_ptr = new llvm::GlobalVariable(
                  *M, PointerTy, false, llvm::GlobalValue::ExternalLinkage, x1,
                  "wrapper_global_data", NULL,
                  llvm::GlobalValue::NotThreadLocal, 0, true);

              corresponding_global_memory.insert(
                  std::pair<GlobalVariable *, GlobalVariable *>(constant_memory,
                                                                global_ptr));
            } else {
              llvm::GlobalVariable *global_memory = new llvm::GlobalVariable(
                  *M, array_type, false, llvm::GlobalValue::ExternalLinkage,
                  NULL, new_name, NULL, llvm::GlobalValue::NotThreadLocal, 0);
              corresponding_global_memory.insert(
                  std::pair<GlobalVariable *, GlobalVariable *>(constant_memory,
                                                                global_memory));
            }
          } else if (element_type->isStructTy()) {
            llvm::GlobalVariable *global_memory = new llvm::GlobalVariable(
                *M, element_type, false, llvm::GlobalValue::ExternalLinkage,
                NULL, new_name, NULL, llvm::GlobalValue::NotThreadLocal, 0);
            corresponding_global_memory.insert(
                std::pair<GlobalVariable *, GlobalVariable *>(constant_memory,
                                                              global_memory));
          } else {
            assert(0 && "The required Constant Memory Type is not supported\n");
          }
        }
      }
    }
  }
  fout << "ConstMemory2GlobalMemory\n";
  for (auto k : corresponding_global_memory) {
    auto const_addr = k.first;
    auto global_addr = k.second;
    const_addr->replaceAllUsesWith(ConstantExpr::getPointerCast(
        global_addr, cast<PointerType>(const_addr->getType())));
    // this file will be used by host translator
    fout << const_addr->getName().str().c_str() << " to "
         << global_addr->getName().str().c_str() << std::endl;
  }
  fout << "END\n";

  for (auto i : need_remove) {
    i->dropAllReferences();
    i->eraseFromParent();
  }
  for (auto i : need_remove_constant_memory) {
    i->dropAllReferences();
    i->eraseFromParent();
  }
}
