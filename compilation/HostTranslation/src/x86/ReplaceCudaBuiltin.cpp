#include "ReplaceCudaBuiltin.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/GlobalValue.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/Support/ToolOutputFile.h"
#include <iostream>
#include <map>
#include <regex>
#include <set>

using namespace llvm;

/*
insert sync after cudaKernel launch
  call void @_Z13staticReversePii(i32* %55, i32 64)
  %57 = call i32 @cudaDeviceSynchronize()
*/
void InsertSyncAfterKernelLaunch(llvm::Module *M) {
  LLVMContext *C = &M->getContext();

  llvm::Type *Int32T = Type::getInt32Ty(*C);
  llvm::FunctionType *LauncherFuncT = FunctionType::get(Int32T, NULL);
  llvm::FunctionCallee _f =
      M->getOrInsertFunction("cudaDeviceSynchronize", LauncherFuncT);
  llvm::Function *func_launch = llvm::cast<llvm::Function>(_f.getCallee());
  std::set<llvm::Instruction *> kernel_launch_instruction;
  for (Module::iterator i = M->begin(), e = M->end(); i != e; ++i) {
    Function *F = &(*i);
    auto func_name = F->getName().str();

    for (Function::iterator b = F->begin(); b != F->end(); ++b) {
      BasicBlock *B = &(*b);

      for (BasicBlock::iterator i = B->begin(); i != B->end(); ++i) {
        Instruction *inst = &(*i);
        if (llvm::CallBase *callInst = llvm::dyn_cast<llvm::CallBase>(inst)) {
          if (Function *calledFunction = callInst->getCalledFunction()) {
            if (calledFunction->getName().startswith("cudaLaunchKernel")) {
              // F is a kernel launch function
              kernel_launch_instruction.insert(callInst);
            }
          }
        }
      }
    }
  }
  for (auto call : kernel_launch_instruction) {
    auto sync_call = llvm::CallInst::Create(func_launch, "inserted_sync");
    sync_call->insertAfter(call);
  }
}

// Change to i8* bitcast (i8* (i8*)* @_Z9vecPKiS0_Pii_wrapper to i8*)
// Original: i8* bitcast (void (i32*, i32*, i32*, i32)* @_Z9vecPKiS0_Pii to i8*)
void ReplaceKernelLaunch(llvm::Module *M) {
  LLVMContext &context = M->getContext();
  auto VoidTy = llvm::Type::getVoidTy(context);
  auto I8 = llvm::Type::getInt8PtrTy(context);
  std::map<std::string, Function *> kernels;

  std::set<llvm::Function *> need_remove;
  LLVMContext *C = &M->getContext();

  llvm::Type *Int32T = Type::getInt32Ty(*C);
  llvm::Type *Int8T = Type::getInt8Ty(*C);

  llvm::FunctionType *LauncherFuncT =
      FunctionType::get(Type::getVoidTy(*C), NULL);

  llvm::FunctionType *LaunchFun2 =
      FunctionType::get(PointerType::get(PointerType::get(Int32T, 0), 0), NULL);

  bool done = false;

  std::set<std::string> cuda_register_kernel_names;

  std::string str;
  llvm::raw_string_ostream ss(str);

  /*

  When using << >>, clang generates cudaPushCallConfiguration with the same
  function definition as the kernel definition in the kernel bitcode

    define internal void @__cuda_register_globals(i8** %0) {
    entry:
      %1 = call i32 @__cudaRegisterFunction(i8** %0, i8* bitcast (void (float*,
  float*, i32, i32)* @_Z4Fan1PfS_ii to i8*), i8* getelementptr inbounds ([14 x
  i8], [14 x i8]* @0, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14
  x i8]* @0, i64 0, i64 0), i32 -1, i8* null, i8* null, i8* null, i8* null, i32*
  null) %2 = call i32 @__cudaRegisterFunction(i8** %0, i8* bitcast (void
  (float*, float*, float*, i32, i32, i32)* @_Z4Fan2PfS_S_iii to i8*), i8*
  getelementptr inbounds ([17 x i8], [17 x i8]* @1, i64 0, i64 0), i8*
  getelementptr inbounds ([17 x i8], [17 x i8]* @1, i64 0, i64 0), i32 -1, i8*
  null, i8* null, i8* null, i8* null, i32* null) ret void
    }

  */
  Function *f_register_global = M->getFunction("__cuda_register_globals");
  if (f_register_global) {
    for (Function::iterator b = f_register_global->begin();
         b != f_register_global->end(); ++b) {
      BasicBlock *B = &(*b);
      for (BasicBlock::iterator i = B->begin(); i != B->end(); ++i) {
        Instruction *inst = &(*i);
        if (llvm::CallInst *callInst = llvm::dyn_cast<llvm::CallInst>(inst)) {
          if (Function *calledFunction = callInst->getCalledFunction()) {
            if (calledFunction->getName().str() == "__cudaRegisterFunction") {
              Value *callOperand = callInst->getArgOperand(1);

              Function *functionOperand =
                  dyn_cast<Function>(callInst->getArgOperand(1));

              // call function is wrapped in a bitcast
              if (functionOperand == NULL) {

                std::vector<size_t> arg_sizes;
                functionOperand =
                    dyn_cast<Function>(callOperand->stripPointerCasts());

                cuda_register_kernel_names.insert(
                    functionOperand->getName().str());
                std::cout << "Cuda Register Global Kernel: "
                          << functionOperand->getName().str() << std::endl;
              }
            }
          }
        }
      }
    }
  }
  bool host_changed = false;
  for (Module::iterator i = M->begin(), e = M->end(); i != e; ++i) {
    Function *F = &(*i);
    auto func_name = F->getName().str();

    for (Function::iterator b = F->begin(); b != F->end(); ++b) {
      BasicBlock *B = &(*b);

      for (BasicBlock::iterator i = B->begin(); i != B->end(); ++i) {
        Instruction *inst = &(*i);

        if (llvm::CallBase *callInst = llvm::dyn_cast<llvm::CallBase>(inst)) {
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
                  Function *FC = rep->second;
                  BitCastInst *B = new BitCastInst(FC, I8, "", callInst);
                  callInst->setArgOperand(0, B);
                  continue;
                }

                std::vector<Type *> Params;
                Params.push_back(I8);
                FunctionType *FT = FunctionType::get(VoidTy, Params, false);

                /*
                  Because of the TODO in the 2nd if statement, need to get the
                  prior name before _host is add
                */
                std::string oldName = functionOperand->getName().str();

                // if parent function is __host and same as the
                // cudaKernelLaunch
                std::string newName = oldName + "_wrapper";
                if (func_name == oldName && host_changed &&
                    oldName.find("_host") != std::string::npos) {
                  newName =
                      oldName.substr(0, oldName.length() - 5) + "_wrapper";
                }
                // For LLVM>=14, it will add _device_stub prefix for the kernel
                // name, thus, we need to remove the prefix
                // example:
                // from: _Z24__device_stub__HistogramPjS_jj
                // to: HistogramPjS_jj
                newName = std::regex_replace(newName,
                                             std::regex("__device_stub__"), "");
                // remove _Z24
                for (int i = 2; i < newName.length(); i++) {
                  if (newName[i] >= '0' && newName[i] <= '9')
                    continue;
                  newName = newName.substr(i);
                  break;
                }

                std::cout << "Change Kernel Name to: " << newName << std::endl;

                Function *F =
                    Function::Create(FT, Function::ExternalLinkage, newName, M);
                F->setDSOLocal(true);
                F->setUnnamedAddr(llvm::GlobalValue::UnnamedAddr::Global);

                BitCastInst *BC = new BitCastInst(F, I8, "", callInst);
                callInst->setArgOperand(0, BC);
                kernels.insert({functionOperand->getName().str(), F});
              }
            } else if (cuda_register_kernel_names.find(
                           calledFunction->getName().str()) !=
                       cuda_register_kernel_names.end()) {
              // if the called function collides with kernel definiton
              // TODO: some reason changes all occurences of the function name
              // for both cudaKernelLaunch calls and regular function call
              host_changed = true;
              calledFunction->setName(calledFunction->getName() + "_host");
              std::cout << std::endl;
              std::cout << "Change Host Function Name To: "
                        << calledFunction->getName().str() << std::endl;
            }
          }
        }
      }
    }
  }
}

void ReplaceMemcpyToSymbol(llvm::Module *M) {
  LLVMContext &context = M->getContext();
  auto I32 = llvm::Type::getInt32Ty(context);
  std::vector<llvm::Instruction *> need_remove;
  for (Module::iterator F = M->begin(); F != M->end(); ++F) {
    for (auto BB = F->begin(); BB != F->end(); ++BB) {
      for (auto BI = BB->begin(); BI != BB->end(); BI++) {
        if (auto Call = dyn_cast<CallInst>(BI)) {
          if (Call->getCalledFunction()) {
            auto func_name = Call->getCalledFunction()->getName().str();
            if (func_name == "cudaMemcpyToSymbol") {
              std::vector<llvm::Type *> args;
              // i32 @cudaMemcpyToSymbol(i8* %1, i8* %2, i64 %3, i64 %4, i32 %5)
              args.push_back(llvm::Type::getInt8PtrTy(context));
              args.push_back(llvm::Type::getInt8PtrTy(context));
              args.push_back(llvm::Type::getInt64Ty(context));
              args.push_back(llvm::Type::getInt64Ty(context));
              args.push_back(llvm::Type::getInt32Ty(context));
              llvm::FunctionType *func_Type =
                  FunctionType::get(I32, args, false);

              llvm::FunctionCallee _f =
                  M->getOrInsertFunction("cudaMemcpyToSymbol_host", func_Type);
              llvm::Function *func = llvm::cast<llvm::Function>(_f.getCallee());
              // construct argument(s)
              std::vector<Value *> func_args;
              func_args.push_back(Call->getArgOperand(0));
              func_args.push_back(Call->getArgOperand(1));
              func_args.push_back(Call->getArgOperand(2));
              func_args.push_back(Call->getArgOperand(3));
              func_args.push_back(Call->getArgOperand(4));

              auto c_inst = llvm::CallInst::Create(func, func_args, "", Call);
              // insert
              Call->replaceAllUsesWith(c_inst);
              need_remove.push_back(Call);
            }
          }
        }
      }
    }
  }
  for (auto inst : need_remove) {
    inst->eraseFromParent();
  }
}
void ReplaceCudaBuiltin(llvm::Module *M) {
  InsertSyncAfterKernelLaunch(M);
  ReplaceKernelLaunch(M);
  ReplaceMemcpyToSymbol(M);
}
