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
            llvm::GlobalVariable *global_memory = new llvm::GlobalVariable(
                *M, array_type, false, llvm::GlobalValue::ExternalLinkage, NULL,
                new_name, NULL, llvm::GlobalValue::GeneralDynamicTLSModel, 1);
            ConstantAggregateZero *const_array =
                ConstantAggregateZero::get(array_type);
            global_memory->setInitializer(const_array);
            corresponding_global_memory.insert(
                std::pair<GlobalVariable *, GlobalVariable *>(share_memory,
                                                              global_memory));
          } else if (auto int_type = dyn_cast<IntegerType>(element_type)) {
            auto zero = llvm::ConstantInt::get(int_type, 0, true);
            llvm::GlobalVariable *global_memory = new llvm::GlobalVariable(
                *M, int_type, false, llvm::GlobalValue::ExternalLinkage, zero,
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

  for (Module::iterator i = M->begin(), e = M->end(); i != e; ++i) {
    Function *F = &(*i);
    for (Function::iterator i = F->begin(), e = F->end(); i != e; ++i) {
      BasicBlock *b = &*i;
      for (BasicBlock::iterator i = b->begin(), e = b->end(); i != e; ++i) {
        if (auto get_element_ptr = dyn_cast<llvm::GetElementPtrInst>(i)) {
          auto read_array = get_element_ptr->getPointerOperand();
          if (GlobalVariable *read_share_memory =
                  dyn_cast<llvm::GlobalVariable>(read_array)) {
            // find a GetElementPtr which read share memory
            if (corresponding_global_memory.find(read_share_memory) !=
                corresponding_global_memory.end()) {
              std::vector<Value *> Indices;
              for (int i = 0; i < get_element_ptr->getNumIndices(); i++)
                Indices.push_back(get_element_ptr->getOperand(i + 1));

              auto new_GEP = GetElementPtrInst::Create(
                  NULL, // Pointee type
                  corresponding_global_memory.find(read_share_memory)
                      ->second, // Alloca
                  Indices,      // Indices
                  "", get_element_ptr);
              // replace all get_element_ptr with new_GEP:
              // we can not directly use:
              // get_element_ptr->replaceAllUsesWith(new_GEP);
              // as get_element_ptr and new_GEP have different return type
              llvm::Type *original_type = get_element_ptr->getType();
              auto FormatASC = CastInst::CreatePointerBitCastOrAddrSpaceCast(
                  new_GEP, original_type, "", get_element_ptr);
              get_element_ptr->replaceAllUsesWith(FormatASC);
              need_remove.insert(get_element_ptr);
            }
          }
        } else if (auto addr_cast = dyn_cast<llvm::CastInst>(i)) {
          auto read_array = addr_cast->getOperand(0);
          if (GlobalVariable *read_share_memory =
                  dyn_cast<llvm::GlobalVariable>(read_array)) {
            // find a GetElementPtr which read share memory
            if (corresponding_global_memory.find(read_share_memory) !=
                corresponding_global_memory.end()) {
              llvm::Type *original_type = addr_cast->getType();
              auto FormatASC = CastInst::CreatePointerBitCastOrAddrSpaceCast(
                  corresponding_global_memory.find(read_share_memory)->second,
                  original_type, "", addr_cast);
              addr_cast->replaceAllUsesWith(FormatASC);
              need_remove.insert(addr_cast);
            }
          }
        }
      }
    }
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
