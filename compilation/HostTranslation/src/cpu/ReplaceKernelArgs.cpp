#include "ReplaceKernelArgs.h"
#include "llvm/IR/IRBuilder.h"
#include <map>
#include <set>

using namespace llvm;

/*
 * before:
 * %m_cuda.addr = alloca float*, align 8
 * after:
 * %m_cuda.addr_tmp = call i8* @malloc(i64 8)
 * %m_cuda.addr = bitcast i8* %m_cuda.addr_tmp to float**
 */
// TODO: we use hard-code to implement this replacement,
// to use use-analysis to find the arguments in the future
void ReplaceKernelArg(llvm::Module *M) {
  LLVMContext &context = M->getContext();
  std::map<std::string, Function *> kernels;

  std::set<llvm::Function *> need_replace;

  for (Module::iterator i = M->begin(), e = M->end(); i != e; ++i) {
    Function *F = &(*i);
    for (Function::iterator b = F->begin(); b != F->end(); ++b) {
      BasicBlock *B = &(*b);
      for (BasicBlock::iterator i = B->begin(); i != B->end(); ++i) {
        Instruction *inst = &(*i);
        if (llvm::CallInst *callInst = llvm::dyn_cast<llvm::CallInst>(inst)) {
          if (Function *calledFunction = callInst->getCalledFunction()) {
            if (calledFunction->getName().startswith("cudaLaunchKernel")) {
              need_replace.insert(F);
            }
          }
        }
      }
    }
  }

  // find/create C's malloc function
  std::vector<llvm::Type *> args;
  args.push_back(llvm::Type::getInt8PtrTy(context));
  llvm::FunctionType *mallocFuncType =
      FunctionType::get(llvm::Type::getInt8PtrTy(context),
                        {llvm::Type::getInt64Ty(context)}, false);

  llvm::FunctionCallee _f = M->getOrInsertFunction("malloc", mallocFuncType);
  llvm::Function *func_malloc = llvm::cast<llvm::Function>(_f.getCallee());

  for (auto F : need_replace) {
    std::set<const llvm::Value *> args_set;
    int arg_cnt = 0;
    for (Function::const_arg_iterator ii = F->arg_begin(), ee = F->arg_end();
         ii != ee; ++ii) {
      args_set.insert(&(*ii));
      arg_cnt++;
    }
    std::vector<llvm::Instruction *> need_remove;
    for (Function::iterator b = F->begin(); b != F->end(); ++b) {
      BasicBlock *B = &(*b);
      for (BasicBlock::iterator i = B->begin(); i != B->end(); ++i) {
        Instruction *inst = &(*i);
        if (llvm::AllocaInst *alloc = llvm::dyn_cast<llvm::AllocaInst>(inst)) {
          // just replace all alloc in that function
          auto c_malloc_inst = llvm::CallInst::Create(
              func_malloc,
              ConstantInt::get(llvm::Type::getInt64Ty(context), 256), "",
              alloc);
          auto bit_cast = new BitCastInst(c_malloc_inst, alloc->getType(),
                                          alloc->getName().str(), alloc);
          alloc->replaceAllUsesWith(bit_cast);
          need_remove.push_back(alloc);
        }
      }
    }
    for (auto inst : need_remove) {
      inst->eraseFromParent();
    }
  }
}
