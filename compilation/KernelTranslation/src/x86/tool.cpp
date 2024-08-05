#include "tool.h"
#include "debug.hpp"
#include "llvm/Bitcode/BitcodeWriter.h"
#include "llvm/Config/llvm-config.h"
#include "llvm/IR/Constants.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/GlobalValue.h"
#include "llvm/IR/GlobalVariable.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/InlineAsm.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Verifier.h"
#include "llvm/IRReader/IRReader.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/ErrorOr.h"
#include "llvm/Support/FileSystem.h"
#include "llvm/Support/ManagedStatic.h"
#include "llvm/Support/MemoryBuffer.h"
#include "llvm/Support/ToolOutputFile.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Transforms/Utils/Cloning.h"
#include "llvm/Transforms/Utils/ValueMapper.h"

#include <iostream>
#include <set>

using namespace llvm;

llvm::Module *LoadModuleFromFilr(const char *file_name) {
  llvm::SMDiagnostic Err;
  llvm::LLVMContext *globalContext = new llvm::LLVMContext;
  auto program = parseIRFile(file_name, Err, *globalContext).release();
  if (!program) {
    printf("error when opening the bitcode\n");
    exit(1);
  }
  return program;
}

void VerifyModule(llvm::Module *program) {
  std::string msg;
  llvm::raw_string_ostream os(msg);
  if (llvm::verifyModule(*program, &(llvm::errs())))
    llvm::report_fatal_error(os.str().c_str());
}

void DumpModule(llvm::Module *M, const char *file_name) {
  std::string msg;
  llvm::raw_string_ostream os(msg);
  std::error_code EC;
  ToolOutputFile Out(file_name, EC, sys::fs::OF_None);
  if (EC) {
    errs() << "Fails to open output file: " << EC.message();
    return;
  }
  WriteBitcodeToFile(*M, Out.os());
  Out.keep();
}

bool isKernelFunction(llvm::Module *M, llvm::Function *F) {
  NamedMDNode *NamedMD = M->getNamedMetadata("nvvm.annotations");
  if (!NamedMD) {
    printf("there must be nvvm.annotations!\n");
    exit(1);
  }
  for (unsigned I = 0, E = NamedMD->getNumOperands(); I != E; ++I) {
    MDNode *MD = NamedMD->getOperand(I);
    if (!MD || MD->getNumOperands() == 0)
      continue;
    if (MD->getNumOperands() != 3)
      continue;
    Metadata *Op = MD->getOperand(1);
    if (auto Str = llvm::cast<MDString>(Op)) {
      if (Str->getString().str() != "kernel")
        continue;
      llvm::Value *meta =
          dyn_cast<llvm::ValueAsMetadata>(MD->getOperand(0))->getValue();
      Function *FF = llvm::cast<Function>(meta);
      if (FF->getName().str() == F->getName().str())
        return true;
    }
  }
  return false;
}

void replace_block(llvm::Function *F, llvm::BasicBlock *before,
                   llvm::BasicBlock *after) {
  for (Function::iterator i = F->begin(); i != F->end(); ++i) {
    llvm::BasicBlock *bb = &(*i);
    if (bb == after)
      continue;
    bb->getTerminator()->replaceUsesOfWith(before, after);
  }
}

llvm::CallInst *CreateInterWarpBarrier(llvm::Instruction *InsertBefore) {
  llvm::Module *M = InsertBefore->getParent()->getParent()->getParent();

  llvm::FunctionType *LauncherFuncT =
      FunctionType::get(llvm::Type::getVoidTy(M->getContext()), {}, false);

  llvm::FunctionCallee f =
      M->getOrInsertFunction("llvm.nvvm.barrier0", LauncherFuncT);
  llvm::Function *F = llvm::cast<llvm::Function>(f.getCallee());
  return llvm::CallInst::Create(F, "", InsertBefore);
}

llvm::CallInst *CreateIntraWarpBarrier(llvm::Instruction *InsertBefore) {
  llvm::Module *M = InsertBefore->getParent()->getParent()->getParent();
  llvm::FunctionType *LauncherFuncT =
      FunctionType::get(llvm::Type::getVoidTy(M->getContext()), {}, false);
  llvm::FunctionCallee f =
      M->getOrInsertFunction("llvm.nvvm.bar.warp.sync", LauncherFuncT);
  llvm::Function *F = llvm::cast<llvm::Function>(f.getCallee());
  return llvm::CallInst::Create(F, "", InsertBefore);
}

llvm::Instruction *BreakPHIToAllocas(PHINode *phi) {

  std::string allocaName = std::string(phi->getName().str()) + ".ex_phi";

  llvm::Function *function = phi->getParent()->getParent();

  IRBuilder<> builder(&*(function->getEntryBlock().getFirstInsertionPt()));

  llvm::Instruction *alloca =
      builder.CreateAlloca(phi->getType(), 0, allocaName);

  for (unsigned incoming = 0; incoming < phi->getNumIncomingValues();
       ++incoming) {
    Value *val = phi->getIncomingValue(incoming);
    BasicBlock *incomingBB = phi->getIncomingBlock(incoming);
    builder.SetInsertPoint(incomingBB->getTerminator());
    llvm::Instruction *store = builder.CreateStore(val, alloca);
  }
  builder.SetInsertPoint(phi);

  llvm::Instruction *loadedValue = createLoad(builder, alloca);
  phi->replaceAllUsesWith(loadedValue);
  phi->eraseFromParent();

  return loadedValue;
}

void phi2alloc(llvm::Module *M) {
  for (Module::iterator i = M->begin(), e = M->end(); i != e; ++i) {
    Function *F = &(*i);
    auto func_name = F->getName().str();
    if (!isKernelFunction(M, F))
      continue;

    typedef std::vector<llvm::Instruction *> InstructionVec;

    InstructionVec PHIs;

    for (Function::iterator bb = F->begin(); bb != F->end(); ++bb) {
      for (BasicBlock::iterator p = bb->begin(); p != bb->end(); ++p) {
        Instruction *instr = &*p;
        if (isa<PHINode>(instr)) {
          PHIs.push_back(instr);
        }
      }
    }

    bool changed = false;
    for (InstructionVec::iterator i = PHIs.begin(); i != PHIs.end(); ++i) {
      Instruction *instr = *i;
      BreakPHIToAllocas(dyn_cast<PHINode>(instr));
    }
  }
}

void remove_cuda_built_in(llvm::Module *M) {
  // initialize function name
  std::set<std::string> useless_func_name;
  useless_func_name.insert("cudaMalloc");
  useless_func_name.insert("cudaFuncGetAttributes");
  useless_func_name.insert("cudaGetDevice");
  useless_func_name.insert("cudaDeviceGetAttribute");
  useless_func_name.insert("cudaOccupancyMaxActiveBlocksPerMultiprocessor");
  useless_func_name.insert(
      "cudaOccupancyMaxActiveBlocksPerMultiprocessorWithFlags");

  std::set<llvm::Function *> need_remove;
  for (Module::iterator i = M->begin(), e = M->end(); i != e; ++i) {
    Function *F = &(*i);
    auto func_name = F->getName().str();
    if (useless_func_name.find(func_name) != useless_func_name.end()) {
      need_remove.insert(F);
    }
  }
  for (auto F : need_remove) {
    F->dropAllReferences();
    F->eraseFromParent();
  }
}

// copied from POCL
static void breakConstantExpressions(llvm::Value *Val, llvm::Function *Func) {
  std::vector<llvm::Value *> Users(Val->user_begin(), Val->user_end());
  for (auto *U : Users) {
    if (auto *CE = llvm::dyn_cast<llvm::ConstantExpr>(U)) {
      // First, make sure no users of this constant expression are themselves
      // constant expressions.
      breakConstantExpressions(U, Func);
      // Convert this constant expression to an instruction.
      llvm::Instruction *I = CE->getAsInstruction();
      I->insertBefore(&*Func->begin()->begin());
      CE->replaceAllUsesWith(I);
      CE->destroyConstant();
    }
  }
}

void replace_dynamic_shared_memory(llvm::Module *M) {
  for (Module::iterator i = M->begin(), e = M->end(); i != e; ++i) {
    Function *F = &(*i);
    if (!isKernelFunction(M, F))
      continue;
    for (Module::global_iterator i = M->global_begin(), e = M->global_end();
         i != e; ++i) {
      breakConstantExpressions(&*i, F);
    }
    auto dynamic_shared_memory_addr =
        M->getGlobalVariable("dynamic_shared_memory");
    if (!dynamic_shared_memory_addr) {
      return;
    }
    auto load_shared_memory = new LoadInst(
        dynamic_shared_memory_addr->getType()->getPointerElementType(),
        dynamic_shared_memory_addr, "new_load", &*F->begin()->begin());
    auto new_bit_cast =
        new BitCastInst(load_shared_memory,
                        dynamic_shared_memory_addr->getType(), "new_bit_cast");
    new_bit_cast->insertAfter(load_shared_memory);
    dynamic_shared_memory_addr->replaceUsesWithIf(new_bit_cast, [&](Use &U) {
      auto *Instr = dyn_cast<Instruction>(U.getUser());
      return Instr != new_bit_cast && Instr != load_shared_memory;
    });
  }
}

void replace_built_in_function(llvm::Module *M) {
  LLVMContext &context = M->getContext();
  auto I32 = llvm::Type::getInt32Ty(context);
  std::vector<llvm::Instruction *> need_remove;
  for (Module::iterator i = M->begin(), e = M->end(); i != e; ++i) {
    Function *F = &(*i);
    auto func_name = F->getName().str();
    if (!isKernelFunction(M, F))
      continue;

    IRBuilder<> builder(&*(F->getEntryBlock().getFirstInsertionPt()));
    auto global_intra_warp_idx =
        F->getParent()->getGlobalVariable("intra_warp_index");
    auto local_intra_warp_idx =
        builder.CreateAlloca(global_intra_warp_idx->getType()->getElementType(),
                             0, "local_intra_warp_idx");
    global_intra_warp_idx->replaceUsesWithIf(local_intra_warp_idx, [&](Use &U) {
      auto *Instr = dyn_cast<Instruction>(U.getUser());
      return Instr->getParent()->getParent()->getName().str() == func_name;
    });

    auto global_inter_warp_idx =
        F->getParent()->getGlobalVariable("inter_warp_index");

    auto local_inter_warp_idx =
        builder.CreateAlloca(global_inter_warp_idx->getType()->getElementType(),
                             0, "local_inter_warp_idx");

    builder.CreateStore(ConstantInt::get(I32, 0), local_inter_warp_idx);

    global_inter_warp_idx->replaceUsesWithIf(local_inter_warp_idx, [&](Use &U) {
      auto *Instr = dyn_cast<Instruction>(U.getUser());
      return Instr->getParent()->getParent()->getName().str() == func_name;
    });

    for (auto BB = F->begin(); BB != F->end(); ++BB) {
      for (auto BI = BB->begin(); BI != BB->end(); BI++) {
        if (auto Load = dyn_cast<LoadInst>(BI)) {
          auto load_from = Load->getOperand(0);
        } else if (auto Call = dyn_cast<CallInst>(BI)) {
          if (Call->getCalledFunction()) {
            auto func_name = Call->getCalledFunction()->getName().str();
            if (func_name == "llvm.nvvm.read.ptx.sreg.ntid.x" ||
                func_name ==
                    "_ZN25__cuda_builtin_blockDim_t17__fetch_builtin_xEv") {
              auto block_size_addr = M->getGlobalVariable("block_size_x");
              IRBuilder<> builder(context);
              builder.SetInsertPoint(Call);
              auto val = createLoad(builder, block_size_addr);
              Call->replaceAllUsesWith(val);
              need_remove.push_back(Call);
            } else if (func_name == "llvm.nvvm.read.ptx.sreg.ntid.y") {
              auto block_size_addr = M->getGlobalVariable("block_size_y");
              IRBuilder<> builder(context);
              builder.SetInsertPoint(Call);
              auto val = createLoad(builder, block_size_addr);
              Call->replaceAllUsesWith(val);
              need_remove.push_back(Call);
            } else if (func_name == "llvm.nvvm.read.ptx.sreg.ntid.z") {
              auto block_size_addr = M->getGlobalVariable("block_size_z");
              IRBuilder<> builder(context);
              builder.SetInsertPoint(Call);
              auto val = createLoad(builder, block_size_addr);
              Call->replaceAllUsesWith(val);
              need_remove.push_back(Call);
            } else if (func_name == "llvm.nvvm.read.ptx.sreg.tid.x" ||
                       func_name == "_ZN26__cuda_builtin_threadIdx_t17__fetch_"
                                    "builtin_xEv") {
              // replace it by warp_id

              IRBuilder<> builder(context);
              builder.SetInsertPoint(Call);

              auto thread_idx = builder.CreateBinOp(
                  Instruction::Mul, createLoad(builder, local_inter_warp_idx),
                  ConstantInt::get(I32, 32), "");
              thread_idx = builder.CreateBinOp(
                  Instruction::Add, createLoad(builder, local_intra_warp_idx),
                  thread_idx, "thread_idx");

              thread_idx = builder.CreateBinOp(
                  Instruction::SRem, thread_idx,
                  createLoad(builder, M->getGlobalVariable("block_size_x")),
                  "thread_id_x");

              Call->replaceAllUsesWith(thread_idx);
              need_remove.push_back(Call);
            } else if (func_name == "llvm.nvvm.read.ptx.sreg.tid.y") {
              // replace it by warp_id
              IRBuilder<> builder(context);
              builder.SetInsertPoint(Call);

              auto thread_idx = builder.CreateBinOp(
                  Instruction::Mul, createLoad(builder, local_inter_warp_idx),
                  ConstantInt::get(I32, 32), "");
              thread_idx = builder.CreateBinOp(
                  Instruction::Add, createLoad(builder, local_intra_warp_idx),
                  thread_idx, "thread_idx");
              // tidy = tid / block_dim.x
              thread_idx = builder.CreateBinOp(
                  Instruction::SDiv, thread_idx,
                  createLoad(builder, M->getGlobalVariable("block_size_x")),
                  "thread_id_y");
              Call->replaceAllUsesWith(thread_idx);
              need_remove.push_back(Call);
            } else if (func_name == "llvm.nvvm.read.ptx.sreg.tid.z") {
              printf("[WARNING] We DO NOT support triple-dim block\n");
              exit(1);
              auto zero = ConstantInt::get(I32, 0);
              Call->replaceAllUsesWith(zero);
              need_remove.push_back(Call);
            } else if (func_name == "llvm.nvvm.read.ptx.sreg.ctaid.x" ||
                       func_name == "_ZN25__cuda_builtin_blockIdx_t17__fetch_"
                                    "builtin_xEv") {
              auto block_index_addr = M->getGlobalVariable("block_index_x");
              IRBuilder<> builder(context);
              builder.SetInsertPoint(Call);
              auto block_idx = createLoad(builder, block_index_addr);
              Call->replaceAllUsesWith(block_idx);
              need_remove.push_back(Call);
            } else if (func_name == "llvm.nvvm.read.ptx.sreg.ctaid.y") {
              auto block_index_addr = M->getGlobalVariable("block_index_y");
              IRBuilder<> builder(context);
              builder.SetInsertPoint(Call);
              auto block_idx = createLoad(builder, block_index_addr);
              Call->replaceAllUsesWith(block_idx);
              need_remove.push_back(Call);
            } else if (func_name == "llvm.nvvm.read.ptx.sreg.ctaid.z") {
              auto block_index_addr = M->getGlobalVariable("block_index_z");
              IRBuilder<> builder(context);
              builder.SetInsertPoint(Call);
              auto block_idx = createLoad(builder, block_index_addr);
              Call->replaceAllUsesWith(block_idx);
              need_remove.push_back(Call);
            } else if (func_name == "llvm.nvvm.read.ptx.sreg.nctaid.x" ||
                       func_name == "_ZN24__cuda_builtin_gridDim_t17__fetch_"
                                    "builtin_xEv") {
              auto grid_size_addr = M->getGlobalVariable("grid_size_x");
              IRBuilder<> builder(context);
              builder.SetInsertPoint(Call);
              auto grid_size = createLoad(builder, grid_size_addr);
              Call->replaceAllUsesWith(grid_size);
              need_remove.push_back(Call);
            } else if (func_name == "llvm.nvvm.read.ptx.sreg.nctaid.y") {
              auto grid_size_addr = M->getGlobalVariable("grid_size_y");
              IRBuilder<> builder(context);
              builder.SetInsertPoint(Call);
              auto grid_size = createLoad(builder, grid_size_addr);
              Call->replaceAllUsesWith(grid_size);
              need_remove.push_back(Call);
            } else if (func_name == "llvm.nvvm.read.ptx.sreg.nctaid.z") {
              auto grid_size_addr = M->getGlobalVariable("grid_size_z");
              IRBuilder<> builder(context);
              builder.SetInsertPoint(Call);
              auto grid_size = createLoad(builder, grid_size_addr);
              Call->replaceAllUsesWith(grid_size);
              need_remove.push_back(Call);
            }
          }
          if (Call->isInlineAsm()) {
            auto asm_inst = dyn_cast<InlineAsm>(Call->getCalledOperand());
            if (asm_inst->getAsmString() != "mov.u32 $0, %laneid;") {
              printf("unknown InlineAsm\n");
              exit(1);
            }
            // return the rank within the warp
            IRBuilder<> builder(context);
            builder.SetInsertPoint(Call);
            auto intra_warp_index = createLoad(builder, local_intra_warp_idx);
            Call->replaceAllUsesWith(intra_warp_index);
            need_remove.push_back(Call);
          }
        }
      }
    }
  }
  for (Module::iterator i = M->begin(), e = M->end(); i != e; ++i) {
    Function *F = &(*i);
    for (auto BB = F->begin(); BB != F->end(); ++BB) {
      for (auto BI = BB->begin(); BI != BB->end(); BI++) {
        if (auto Call = dyn_cast<CallInst>(BI)) {
          if (Call->getCalledFunction()) {
            auto func_name = Call->getCalledFunction()->getName().str();
            auto callFn = Call->getCalledFunction();
            if (func_name == "vprintf") {
              /*
               * replace CUDA's printf to C's printf
               * CUDA:
               * %0 = tail call i32 @vprintf(i8* getelementptr inbounds ([19 x
               * i8], [19 x i8]* @.str, i64 0, i64 0), i8* null)
               * C: %call1 = call i32 (i8*, ...) @printf(i8* getelementptr
               * inbounds ([45 x i8], [45 x i8]* @.str.1, i64 0, i64 0))
               */
              // find/create C's printf function
              std::vector<llvm::Type *> args;
              args.push_back(llvm::Type::getInt8PtrTy(context));
              llvm::FunctionType *printfType =
                  FunctionType::get(I32, args, true);

              llvm::FunctionCallee _f =
                  M->getOrInsertFunction("printf", printfType);
              llvm::Function *func_printf =
                  llvm::cast<llvm::Function>(_f.getCallee());
              // construct argument(s)
              std::vector<Value *> printf_args;
              // first argument is same between CUDA and C
              auto placeholder = Call->getArgOperand(0);
              printf_args.push_back(placeholder);
              // insert arguments
              auto compressed_args = Call->getArgOperand(1);
              if (auto BC = dyn_cast<BitCastInst>(compressed_args)) {
                auto src_alloc = BC->getOperand(0);
                auto SrcPointTy =
                    dyn_cast<PointerType>(BC->getOperand(0)->getType());
                auto SrcTy = SrcPointTy->getElementType();
                // reverse the bitcast
                auto reverse_BC = new BitCastInst(BC, SrcPointTy, "", Call);
                assert(SrcTy->isStructTy() == 1);
                auto StructTy = dyn_cast<StructType>(SrcTy);
                for (int i = 0; i < StructTy->getNumElements(); i++) {
                  std::vector<Value *> Indices;
                  Indices.push_back(ConstantInt::get(I32, 0));
                  Indices.push_back(ConstantInt::get(I32, i));
                  auto new_GEP = GetElementPtrInst::Create(
                      cast<PointerType>(src_alloc->getType()->getScalarType())
                          ->getElementType(),
                      src_alloc, // Alloca
                      Indices,   // Indices
                      "", Call);
                  auto new_load =
                      new LoadInst(new_GEP->getType()->getPointerElementType(),
                                   new_GEP, "", Call);
                  printf_args.push_back(new_load);
                }
              }
              auto c_printf_inst =
                  llvm::CallInst::Create(func_printf, printf_args, "", Call);
              // insert
              Call->replaceAllUsesWith(c_printf_inst);
              need_remove.push_back(Call);
            } else if (func_name == "__nv_fast_log2f" ||
                       func_name == "__nv_log2f" ||
                       func_name == "__nv_fast_powf" ||
                       func_name == "__nv_powf" || func_name == "__nv_logf" ||
                       func_name == "__nv_expf" || func_name == "__nv_fabsf" ||
                       func_name == "__nv_log10f" || func_name == "__nv_log" ||
                       func_name == "__nv_fmodf" || func_name == "__nv_sqrt" ||
                       func_name == "__nv_sqrtf" || func_name == "__nv_exp" ||
                       func_name == "__nv_floorf" || func_name == "__nv_cosf" ||
                       func_name == "__nv_isnanf" || func_name == "__nv_sinf" ||
                       func_name == "__nv_isinff" || func_name == "__nv_powi" ||
                       func_name == "__nvvm_fabs_f" ||
                       func_name == "__nv_powif") {
              Call->getCalledFunction()->deleteBody();
            } else if (func_name == "llvm.nvvm.fma.rn.d") {
              Call->getCalledFunction()->setName("__nvvm_fma_rn_d");
            } else if (func_name == "llvm.nvvm.d2i.lo") {
              Call->getCalledFunction()->setName("__nvvm_d2i_lo");
            } else if (func_name == "llvm.nvvm.d2i.hi") {
              Call->getCalledFunction()->setName("__nvvm_d2i_hi");
            } else if (func_name == "llvm.nvvm.add.rn.d") {
              Call->getCalledFunction()->setName("__nvvm_add_rn_d");
            } else if (func_name == "llvm.nvvm.lohi.i2d") {
              Call->getCalledFunction()->setName("__nvvm_lohi_i2d");
            } else if (func_name == "llvm.nvvm.fabs.f") {
              Call->getCalledFunction()->setName("__nvvm_fabs_f");
            } else if (func_name == "llvm.nvvm.fabs.d") {
              Call->getCalledFunction()->setName("__nv_fabsd");
            } else if (func_name == "llvm.nvvm.mul24.i") {
              Call->getCalledFunction()->setName("__nvvm_mul24_i");
            } else if (func_name == "llvm.nvvm.fmin.d") {
              Call->getCalledFunction()->setName("__nv_fmind");
            } else if (func_name == "llvm.nvvm.fmax.d") {
              Call->getCalledFunction()->setName("__nv_fmaxd");
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

void replace_asm_call(llvm::Module *M) {
  LLVMContext &context = M->getContext();
  auto I32 = llvm::Type::getInt32Ty(context);
  std::vector<CallInst *> need_remove;
  for (Module::iterator i = M->begin(), e = M->end(); i != e; ++i) {
    Function *F = &(*i);
    auto func_name = F->getName().str();
    if (!isKernelFunction(M, F))
      continue;

    for (auto BB = F->begin(); BB != F->end(); ++BB) {
      for (auto BI = BB->begin(); BI != BB->end(); BI++) {
        if (auto Call = dyn_cast<CallInst>(BI)) {
          if (Call->isInlineAsm()) {
            auto asm_inst = dyn_cast<InlineAsm>(Call->getCalledOperand());
            if (asm_inst->getAsmString() != "mov.u32 $0, %laneid;") {
              assert(0 && "unknown InlineAsm\n");
            }
            // return the rank within the warp
            IRBuilder<> builder(context);
            builder.SetInsertPoint(Call);
            auto intra_warp_index_addr =
                M->getGlobalVariable("intra_warp_index");
            auto intra_warp_index = createLoad(builder, intra_warp_index_addr);
            Call->replaceAllUsesWith(intra_warp_index);
            need_remove.push_back(Call);
          }
        }
      }
    }
  }
  for (auto inst : need_remove) {
    inst->eraseFromParent();
  }
}

bool has_warp_barrier(llvm::BasicBlock *B) {
  for (BasicBlock::iterator i = B->begin(); i != B->end(); ++i) {
    Instruction *inst = &(*i);
    llvm::CallInst *Call = llvm::dyn_cast<llvm::CallInst>(inst);
    if (Call) {
      if (Call->isInlineAsm())
        continue;
      auto func_name = Call->getCalledFunction()->getName().str();
      if (func_name == "llvm.nvvm.bar.warp.sync") {
        return true;
      }
    }
  }
  return false;
}

bool has_barrier(llvm::BasicBlock *B) {
  for (BasicBlock::iterator i = B->begin(); i != B->end(); ++i) {
    Instruction *inst = &(*i);
    llvm::CallInst *Call = llvm::dyn_cast<llvm::CallInst>(inst);
    if (Call) {
      if (Call->isInlineAsm())
        continue;
      auto func_name = Call->getCalledFunction()->getName().str();
      if (func_name == "llvm.nvvm.barrier0" ||
          func_name == "llvm.nvvm.bar.warp.sync" ||
          func_name == "llvm.nvvm.barrier.sync") {
        return true;
      }
    }
  }
  return false;
}

bool has_block_barrier(llvm::BasicBlock *B) {
  for (BasicBlock::iterator i = B->begin(); i != B->end(); ++i) {
    Instruction *inst = &(*i);
    llvm::CallInst *Call = llvm::dyn_cast<llvm::CallInst>(inst);
    if (Call) {
      if (Call->isInlineAsm())
        continue;
      auto func_name = Call->getCalledFunction()->getName().str();
      if (func_name == "llvm.nvvm.barrier0" ||
          func_name == "llvm.nvvm.barrier.sync") {
        return true;
      }
    }
  }
  return false;
}

bool has_barrier(llvm::Function *F) {
  for (auto B = F->begin(); B != F->end(); B++) {
    if (has_barrier(&(*B)))
      return true;
  }
  return false;
}

bool find_block_barrier_in_region(llvm::BasicBlock *start,
                                  llvm::BasicBlock *end) {
  std::set<llvm::BasicBlock *> visit;
  std::vector<llvm::BasicBlock *> pending_blocks;
  for (int i = 0; i < start->getTerminator()->getNumSuccessors(); i++) {
    pending_blocks.push_back(start->getTerminator()->getSuccessor(i));
  }
  while (!pending_blocks.empty()) {
    BasicBlock *current = pending_blocks.back();
    pending_blocks.pop_back();
    if (visit.find(current) != visit.end())
      continue;
    visit.insert(current);
    if (current == end)
      continue;
    if (has_block_barrier(current)) {
      return 1;
    }
    for (int i = 0; i < current->getTerminator()->getNumSuccessors(); i++) {
      pending_blocks.push_back(current->getTerminator()->getSuccessor(i));
    }
  }
  return 0;
}

bool find_barrier_in_region(llvm::BasicBlock *start, llvm::BasicBlock *end) {
  std::set<llvm::BasicBlock *> visit;
  std::vector<llvm::BasicBlock *> pending_blocks;
  for (int i = 0; i < start->getTerminator()->getNumSuccessors(); i++) {
    pending_blocks.push_back(start->getTerminator()->getSuccessor(i));
  }
  while (!pending_blocks.empty()) {
    BasicBlock *current = pending_blocks.back();
    pending_blocks.pop_back();
    if (visit.find(current) != visit.end())
      continue;
    visit.insert(current);
    if (current == end)
      continue;
    if (has_barrier(current)) {
      return 1;
    }
    for (int i = 0; i < current->getTerminator()->getNumSuccessors(); i++) {
      pending_blocks.push_back(current->getTerminator()->getSuccessor(i));
    }
  }
  return 0;
}

LoadInst *createLoad(IRBuilder<> &B, Value *addr, bool isVolatile) {
  return B.CreateLoad(addr->getType()->getPointerElementType(), addr,
                      isVolatile);
}

Value *createInBoundsGEP(IRBuilder<> &B, Value *ptr,
                         ArrayRef<Value *> idxlist) {
  return B.CreateInBoundsGEP(
      ptr->getType()->getScalarType()->getPointerElementType(), ptr, idxlist);
}

Value *createGEP(IRBuilder<> &B, Value *ptr, ArrayRef<Value *> idxlist) {
  return B.CreateGEP(ptr->getType()->getScalarType()->getPointerElementType(),
                     ptr, idxlist);
}

// The following functions are used to analyze the host module and extract the
// grid/block size information.
// This function checkes the depdency between two values recursively.
// Although there is off-the-shelf def-use analysis, it cannot handle bitcast
// and memcpy.
bool isDependentRecursively(llvm::Value *V1, llvm::Value *V2,
                            std::set<llvm::Value *> &visited) {
  // We also need to handle the bit cast
  if (llvm::BitCastInst *BitCastInst = llvm::dyn_cast<llvm::BitCastInst>(V1)) {
    if (isDependentRecursively(BitCastInst->getOperand(0), V2, visited)) {
      return true;
    }
  }
  if (llvm::CallInst *CallInst = llvm::dyn_cast<llvm::CallInst>(V1)) {
    if (CallInst->getCalledFunction() &&
        CallInst->getCalledFunction()->getName() ==
            "llvm.memcpy.p0i8.p0i8.i64") {
      if (isDependentRecursively(CallInst->getArgOperand(0), V2, visited)) {
        return true;
      }
    }
    return false;
  }

  if (visited.count(V1)) {
    return false;
  }
  visited.insert(V1);
  for (auto *User : V1->users()) {
    if (User == V2) {
      return true;
    }
    if (llvm::Instruction *Inst = llvm::dyn_cast<llvm::Instruction>(User)) {
      if (isDependentRecursively(Inst, V2, visited)) {
        return true;
      }
    }
  }
  return false;
}

// This function is used to find the block size configuration for the
// __cudaPushCallConfiguration instruction. Specifically, this function
// accepts a grid configuration and a block configuration, and they have the
// same data type: struct dim3. Thus, we need to write a function to find the
// corresponding block configuration for a given kernel launch. This function
// is an auxiliary function for the block size invariant analysis.
llvm::CallInst *
findDim3SizeForKernelLaunch(llvm::CallInst *cudaPushCallConfiguration,
                            bool getBlockSize) {
  // The 3rd and 4th arguments are related with block size
  llvm::Value *block_arg = cudaPushCallConfiguration->getArgOperand(3);
  llvm::Value *grid_arg = cudaPushCallConfiguration->getArgOperand(1);

  llvm::Value *required_arg = getBlockSize ? block_arg : grid_arg;

  for (auto &F : *cudaPushCallConfiguration->getFunction()->getParent()) {
    for (auto &BB : F) {
      for (auto &I : BB) {
        if (auto *callInst = llvm::dyn_cast<llvm::CallInst>(&I)) {
          llvm::Function *calledFunc = callInst->getCalledFunction();
          if (calledFunc && calledFunc->getName() == "_ZN4dim3C2Ejjj") {
            std::set<llvm::Value *> visited;
            // In CUDA host module, all grid/block configurations are
            // generated by _ZN4dim3C2Ejjj. For example: call void
            // @_ZN4dim3C2Ejjj(%struct.dim3* %15, i32 42, i32 1, i32 1) will
            // generate a grid/block configuration with size: 42 * 1 * 1.
            if (isDependentRecursively(callInst->getArgOperand(0), required_arg,
                                       visited)) {
              return callInst;
            }
          }
        }
      }
    }
  }
  return nullptr;
}

// This function analyzes the kernel launch instructions in the host module,
// and get all possible block sizes.
std::set<Dim3SizeConfig>
get_possible_grid_or_block_size(llvm::Module *host_module, bool getBlockSize) {
  std::set<Dim3SizeConfig> possible_size_set;
  for (auto &F : *host_module) {
    for (auto &BB : F) {
      for (auto &I : BB) {
        if (auto *CI = dyn_cast<CallInst>(&I)) {
          if (CI->getCalledFunction()->getName().str() ==
              "__cudaPushCallConfiguration") {
            auto dim3_size_initialization =
                findDim3SizeForKernelLaunch(CI, getBlockSize);

            if (dim3_size_initialization) {
              auto dim3_size_x = dyn_cast<ConstantInt>(
                  dim3_size_initialization->getArgOperand(1));
              auto dim3_size_y = dyn_cast<ConstantInt>(
                  dim3_size_initialization->getArgOperand(2));
              auto dim3_size_z = dyn_cast<ConstantInt>(
                  dim3_size_initialization->getArgOperand(3));
              if (dim3_size_x && dim3_size_y && dim3_size_z) {
                Dim3SizeConfig dim3_size(dim3_size_x->getSExtValue(),
                                         dim3_size_y->getSExtValue(),
                                         dim3_size_z->getSExtValue());
                possible_size_set.insert(dim3_size);
              }
            }
          }
        }
      }
    }
  }
  return possible_size_set;
}

Instruction *find_thread_idx_x(BasicBlock *BB) {
  for (auto &I : *BB) {
    if (auto *CI = dyn_cast<CallInst>(&I)) {
      if (CI->getCalledFunction()->getName() ==
          "llvm.nvvm.read.ptx.sreg.tid.x") {
        return CI;
      }
    }
  }
  return nullptr;
}
Instruction *find_block_idx_x(BasicBlock *BB) {
  for (auto &I : *BB) {
    if (auto *CI = dyn_cast<CallInst>(&I)) {
      if (CI->getCalledFunction()->getName() ==
          "llvm.nvvm.read.ptx.sreg.ctaid.x") {
        return CI;
      }
    }
  }
  return nullptr;
}

Instruction *find_block_dim_x(BasicBlock *BB) {
  for (auto &I : *BB) {
    if (auto *CI = dyn_cast<CallInst>(&I)) {
      if (CI->getCalledFunction()->getName() ==
          "llvm.nvvm.read.ptx.sreg.ntid.x") {
        return CI;
      }
    }
  }

  return nullptr;
}

Instruction *find_grid_dim_x(BasicBlock *BB) {
  for (auto &I : *BB) {
    if (auto *CI = dyn_cast<CallInst>(&I)) {
      if (CI->getCalledFunction()->getName() ==
          "llvm.nvvm.read.ptx.sreg.nctaid.x") {
        return CI;
      }
    }
  }
  return nullptr;
}
