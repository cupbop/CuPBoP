#include "generate_cpu_format.h"
#include "debug.hpp"
#include "tool.h"
#include "llvm/Support/Host.h"

using namespace llvm;

// set TargetTriple and DataLayout same as the host CPU
void set_meta_data(llvm::Module *M) {
  M->setTargetTriple(llvm::sys::getProcessTriple());
  // use the default DataLayout
  M->setDataLayout("");
}

// as pthread only accept a single void* for input
// we have to decode this input inside the kernel
void decode_input(llvm::Module *M) {

  std::set<llvm::Function *> need_remove;

  llvm::Type *Int32T = Type::getInt32Ty(M->getContext());
  llvm::Type *Int8T = Type::getInt8Ty(M->getContext());

  llvm::FunctionType *LauncherFuncT = FunctionType::get(
      Type::getVoidTy(M->getContext()), {PointerType::get(Int8T, 0)}, false);

  // generate Wrapper Function type
  // now we only support a single int32*
  for (Module::iterator i = M->begin(), e = M->end(); i != e; ++i) {
    Function *F = &(*i);
    if (!isKernelFunction(M, F))
      continue;
    auto func_name = F->getName().str();
    // filter out _Z24 and other mangled prefix
    for (int pos = 2; pos < func_name.length(); pos++) {
      if (func_name[pos] >= '0' && func_name[pos] <= '9')
        continue;
      func_name = func_name.substr(pos);
      break;
    }
    llvm::IRBuilder<> Builder(M->getContext());

    FunctionCallee fc =
        M->getOrInsertFunction(func_name + "_wrapper", LauncherFuncT);
    Function *WorkGroup = dyn_cast<Function>(fc.getCallee());

    BasicBlock *Block = BasicBlock::Create(M->getContext(), "", WorkGroup);
    Builder.SetInsertPoint(Block);

    // WorkGroup has only a single input
    Function::arg_iterator ai = WorkGroup->arg_begin();

    SmallVector<Value *, 8> Arguments;
    Value *input_arg = &*ai;
    // convert to int**
    input_arg = Builder.CreateBitOrPointerCast(
        input_arg, PointerType::get(PointerType::get(Int32T, 0), 0));

    size_t idx = 0;
    // replace original arguments with the unpacked values
    // for example, for a function f(int* a, char* b),
    // we will generate a function f_wrapper(int** input)
    // and replace the original arguments with the unpacked values
    // e.g., a = (int*)input[0], b = (char*)input[1]
    for (Function::const_arg_iterator ii = F->arg_begin(), ee = F->arg_end();
         ii != ee; ++ii) {
      Type *ArgType = ii->getType();
      // calculate addr
      Value *GEP = createGEP(Builder, input_arg, ConstantInt::get(Int32T, idx));
      // load corresponding int*
      GEP = createLoad(Builder, GEP);
      // bitcast
      GEP = Builder.CreateBitOrPointerCast(GEP, PointerType::get(ArgType, 0));
      Value *Arg = createLoad(Builder, GEP);
      Arguments.push_back(Arg);
      ++idx;
    }
    Builder.CreateCall(F, ArrayRef<llvm::Value *>(Arguments));
    Builder.CreateRetVoid();
  }
  for (auto f : need_remove) {
    f->dropAllReferences();
    f->eraseFromParent();
  }
}

// after flat/hierarchical collapsing, the barrier instructions are useless
void remove_barrier(llvm::Module *M) {
  std::vector<Instruction *> need_remove;
  for (auto F = M->begin(); F != M->end(); ++F)
    for (auto BB = F->begin(); BB != F->end(); ++BB) {
      for (auto Inst = BB->begin(); Inst != BB->end(); Inst++) {
        if (auto Call = dyn_cast<CallInst>(Inst)) {
          if (Call->isInlineAsm())
            continue;
          auto func_name = Call->getCalledFunction()->getName().str();
          if (func_name == "llvm.nvvm.bar.warp.sync" ||
              func_name == "llvm.nvvm.barrier0" ||
              func_name == "llvm.nvvm.barrier.sync") {
            need_remove.push_back(Call);
          }
        }
      }
    }
  for (auto inst : need_remove) {
    inst->eraseFromParent();
  }
}

void remove_useless_var(llvm::Module *M) {
  M->getGlobalVariable("intra_warp_index")->eraseFromParent();
  M->getGlobalVariable("inter_warp_index")->eraseFromParent();
}

void generate_cpu_format(llvm::Module *M) {
  DEBUG_INFO("generate cpu format\n");
  // change metadata
  set_meta_data(M);
  // decode argument
  decode_input(M);
  // remove barrier
  remove_barrier(M);
  // remove useless func/variable
  remove_useless_var(M);
}
