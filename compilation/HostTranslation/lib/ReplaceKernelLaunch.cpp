#include "ReplaceKernelLaunch.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/GlobalValue.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include <iostream>
#include <map>
#include <set>

using namespace llvm;

// Change to i8* bitcast (i8* (i8*)* @_Z9vecPKiS0_Pii_wrapper to i8*)
// Original: i8* bitcast (void (i32*, i32*, i32*, i32)* @_Z9vecPKiS0_Pii to i8*)
void ReplaceKernelLaunch(llvm::Module *M) {
  LLVMContext &context = M->getContext();
  auto VoidTy = llvm::Type::getVoidTy(context);
  auto I8 = llvm::Type::getInt8PtrTy(context);
  std::map<std::string, BitCastInst *> kernels;

  LLVMContext *C = &M->getContext();

  llvm::Type *Int32T = Type::getInt32Ty(*C);
  llvm::Type *Int8T = Type::getInt8Ty(*C);

  llvm::FunctionType *LauncherFuncT =
      FunctionType::get(Type::getVoidTy(*C), NULL);

  llvm::FunctionType *LaunchFun2 =
      FunctionType::get(PointerType::get(PointerType::get(Int32T, 0), 0), NULL);

  bool done = false;

  for (Module::iterator i = M->begin(), e = M->end(); i != e; ++i) {
    Function *F = &(*i);
    auto func_name = F->getName().str();

    for (Function::iterator b = F->begin(); b != F->end(); ++b) {
      BasicBlock *B = &(*b);

      for (BasicBlock::iterator i = B->begin(); i != B->end(); ++i) {
        Instruction *inst = &(*i);

        if (llvm::CallInst *callInst = llvm::dyn_cast<llvm::CallInst>(inst)) {
          if (Function *calledFunction = callInst->getCalledFunction()) {

            if (calledFunction->getName().startswith("cudaLaunchKernel")) {

              Value *callOperand = callInst->getArgOperand(0);

              Function *functionOperand =
                  dyn_cast<Function>(callInst->getArgOperand(0));

              // call function is wrapped in a bitcast
              if (functionOperand == NULL) {

                std::vector<size_t> arg_sizes;
                functionOperand =
                    dyn_cast<Function>(callOperand->stripPointerCasts());

                FunctionType *ft = calledFunction->getFunctionType();
                std::cout << " Parent (Caller) Function Name: " << func_name
                          << ", cudaLaunchKernel Function: "
                          << functionOperand->getName().str() << ", args "
                          << functionOperand->arg_size() << std::endl;
                auto rep = kernels.find(functionOperand->getName().str());
                if (rep != kernels.end()) {

                  callInst->setArgOperand(0, rep->second);
                  continue;
                }

                std::vector<Type *> Params;
                Params.push_back(I8);
                FunctionType *FT = FunctionType::get(VoidTy, Params, false);
                std::string newName =
                    functionOperand->getName().str() + "_wrapper";

                Function *F =
                    Function::Create(FT, Function::ExternalLinkage, newName, M);
                F->setDSOLocal(true);

                BitCastInst *BC = new BitCastInst(F, I8, "", callInst);
                callInst->setArgOperand(0, BC);
                kernels.insert({functionOperand->getName().str(), BC});
              }
            }
          }
        }
      }
    }
  }
}
