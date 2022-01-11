#include "tool.h"
#include "llvm/Bitcode/BitcodeWriter.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/GlobalValue.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/InlineAsm.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Verifier.h"
#include "llvm/IRReader/IRReader.h"
#include "llvm/Support/ToolOutputFile.h"
#include "llvm/Transforms/Utils/Cloning.h"
#include "llvm/Transforms/Utils/ValueMapper.h"
#include <iostream>
#include <set>

using namespace llvm;

llvm::Module *LoadModuleFromFilr(char *file_name) {
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

void DumpModule(llvm::Module *M, char *file_name) {
  // modify the program, add a wrapper
  std::string msg;
  llvm::raw_string_ostream os(msg);
  std::error_code EC;
  ToolOutputFile Out(file_name, EC, sys::fs::F_None);
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

  llvm::Instruction *loadedValue = builder.CreateLoad(alloca);
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

void replace_built_in_function(llvm::Module *M, int *grid_dim, int *block_dim) {
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
    global_intra_warp_idx->replaceAllUsesWith(local_intra_warp_idx);
    auto global_inter_warp_idx =
        F->getParent()->getGlobalVariable("inter_warp_index");
    auto local_inter_warp_idx =
        builder.CreateAlloca(global_inter_warp_idx->getType()->getElementType(),
                             0, "local_inter_warp_idx");
    global_inter_warp_idx->replaceAllUsesWith(local_inter_warp_idx);

    for (auto BB = F->begin(); BB != F->end(); ++BB) {
      for (auto BI = BB->begin(); BI != BB->end(); BI++) {
        if (auto Load = dyn_cast<LoadInst>(BI)) {
          auto load_from = Load->getOperand(0);
          if (load_from == F->getParent()->getGlobalVariable("block_size")) {
            Load->replaceAllUsesWith(ConstantInt::get(
                I32, block_dim[0] * block_dim[1] * block_dim[2]));
            need_remove.push_back(Load);
          }
        } else if (auto Call = dyn_cast<CallInst>(BI)) {
          if (Call->getCalledFunction()) {
            auto func_name = Call->getCalledFunction()->getName().str();
            if (func_name == "llvm.nvvm.read.ptx.sreg.tid.x") {
              // replace it by warp_id
              IRBuilder<> builder(context);
              builder.SetInsertPoint(Call);

              auto thread_idx = builder.CreateBinOp(
                  Instruction::Mul, builder.CreateLoad(local_inter_warp_idx),
                  ConstantInt::get(I32, 32), "");
              thread_idx = builder.CreateBinOp(
                  Instruction::Add, builder.CreateLoad(local_intra_warp_idx),
                  thread_idx, "thread_idx");
              if (block_dim[1] != 1 || block_dim[2] != 1) {
                printf("block y: %d block z: %d\n", block_dim[1], block_dim[2]);
                thread_idx = builder.CreateBinOp(
                    Instruction::SRem, thread_idx,
                    ConstantInt::get(I32, block_dim[0]), "thread_id_x");
              }

              Call->replaceAllUsesWith(thread_idx);
              need_remove.push_back(Call);
            } else if (func_name == "llvm.nvvm.read.ptx.sreg.tid.y") {
              // replace it by warp_id
              IRBuilder<> builder(context);
              builder.SetInsertPoint(Call);

              auto thread_idx = builder.CreateBinOp(
                  Instruction::Mul, builder.CreateLoad(local_inter_warp_idx),
                  ConstantInt::get(I32, 32), "");
              thread_idx = builder.CreateBinOp(
                  Instruction::Add, builder.CreateLoad(local_intra_warp_idx),
                  thread_idx, "thread_idx");
              // tidy = tid / block_dim.x
              thread_idx = builder.CreateBinOp(
                  Instruction::SDiv, thread_idx,
                  ConstantInt::get(I32, block_dim[0]),
                  // builder.CreateLoad(M->getGlobalVariable("block_size_x")),
                  "thread_id_y");

              Call->replaceAllUsesWith(thread_idx);
              need_remove.push_back(Call);
            } else if (func_name == "llvm.nvvm.read.ptx.sreg.tid.z") {
              printf("[WARNING] We DO NOT support multi-dim block\n");
              auto zero = ConstantInt::get(I32, 0);
              Call->replaceAllUsesWith(zero);
              need_remove.push_back(Call);
            } else if (func_name == "llvm.nvvm.read.ptx.sreg.ctaid.x") {
              auto block_index_addr = M->getGlobalVariable("block_index");
              IRBuilder<> builder(context);
              builder.SetInsertPoint(Call);
              auto block_idx = builder.CreateLoad(block_index_addr);
              Call->replaceAllUsesWith(block_idx);
              need_remove.push_back(Call);
            } else if (func_name == "llvm.nvvm.read.ptx.sreg.ctaid.y" ||
                       func_name == "llvm.nvvm.read.ptx.sreg.ctaid.z") {
              printf("[WARNING We DO NOT support multi-dim grid\n");
              auto zero = ConstantInt::get(I32, 0);
              Call->replaceAllUsesWith(zero);
              need_remove.push_back(Call);
            } else if (func_name == "llvm.nvvm.read.ptx.sreg.ntid.x") {
              auto block_size_addr = M->getGlobalVariable("block_size_x");
              IRBuilder<> builder(context);
              builder.SetInsertPoint(Call);
              auto block_size = ConstantInt::get(I32, block_dim[0]);
              Call->replaceAllUsesWith(block_size);
              need_remove.push_back(Call);
            } else if (func_name == "llvm.nvvm.read.ptx.sreg.ntid.y") {
              auto block_size_addr = M->getGlobalVariable("block_size_y");
              IRBuilder<> builder(context);
              builder.SetInsertPoint(Call);
              auto block_size = ConstantInt::get(I32, block_dim[1]);
              Call->replaceAllUsesWith(block_size);
              need_remove.push_back(Call);
            } else if (func_name == "llvm.nvvm.read.ptx.sreg.ntid.z") {
              auto block_size_addr = M->getGlobalVariable("block_size_z");
              IRBuilder<> builder(context);
              builder.SetInsertPoint(Call);
              auto block_size = ConstantInt::get(I32, block_dim[2]);
              Call->replaceAllUsesWith(block_size);
              need_remove.push_back(Call);
            } else if (func_name == "llvm.nvvm.read.ptx.sreg.nctaid.x") {
              auto grid_size_addr = M->getGlobalVariable("grid_size");
              IRBuilder<> builder(context);
              builder.SetInsertPoint(Call);
              auto grid_size = ConstantInt::get(I32, grid_dim[0]);
              Call->replaceAllUsesWith(grid_size);
              need_remove.push_back(Call);
            } else if (func_name == "llvm.nvvm.read.ptx.sreg.nctaid.y" ||
                       func_name == "llvm.nvvm.read.ptx.sreg.nctaid.z") {
              printf("[WARNING We DO NOT support multi-dim grid\n");
              auto one = ConstantInt::get(I32, 1);
              Call->replaceAllUsesWith(one);
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
            auto intra_warp_index = builder.CreateLoad(local_intra_warp_idx);
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
              printf("unknown InlineAsm\n");
              exit(1);
            }
            // return the rank within the warp
            IRBuilder<> builder(context);
            builder.SetInsertPoint(Call);
            auto intra_warp_index_addr =
                M->getGlobalVariable("intra_warp_index");
            auto intra_warp_index = builder.CreateLoad(intra_warp_index_addr);
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
