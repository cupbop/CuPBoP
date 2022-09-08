#include "performance.h"
#include "llvm/ADT/Statistic.h"
#include "llvm/ADT/StringRef.h"
#include "llvm/ADT/Triple.h"
#include "llvm/Analysis/LoopInfo.h"
#include "llvm/Analysis/LoopPass.h"
#include "llvm/Analysis/PostDominators.h"
#include "llvm/Analysis/TargetLibraryInfo.h"
#include "llvm/Analysis/TargetTransformInfo.h"
#include "llvm/CodeGen/MachineModuleInfo.h"
#include "llvm/IR/CFG.h"
#include "llvm/IR/DataLayout.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/GlobalValue.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/InlineAsm.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/ValueSymbolTable.h"
#include "llvm/InitializePasses.h"
#include "llvm/MC/TargetRegistry.h"
#include "llvm/PassInfo.h"
#include "llvm/PassRegistry.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/Support/Host.h"
#include "llvm/Target/TargetMachine.h"
#include "llvm/Target/TargetOptions.h"
#include "llvm/Transforms/IPO/PassManagerBuilder.h"
#include "llvm/Transforms/Utils/BasicBlockUtils.h"
#include "llvm/Transforms/Utils/Cloning.h"
#include "llvm/Transforms/Utils/ValueMapper.h"
#include <map>
#include <set>
#include <sstream>
#include <tuple>
#include <vector>

using namespace llvm;

void performance_optimization(llvm::Module *M) {
  for (auto F = M->begin(); F != M->end(); F++) {
    for (auto I = F->arg_begin(); I != F->arg_end(); ++I) {
      if (I->getType()->isPointerTy()) {
        I->addAttr(llvm::Attribute::NoAlias);
      }
    }
  }
  llvm::legacy::PassManager Passes;

  // add target machine info
  llvm::Triple triple("x86_64-unknown-linux-gnu");

  std::string Error;
  const Target *TheTarget = TargetRegistry::lookupTarget("", triple, Error);
  if (!TheTarget) {
    printf("Error: %s\n", Error.c_str());
    assert(0);
  }
  llvm::TargetOptions Options;
  Options.FloatABIType = FloatABI::Hard;

  TargetMachine *TM = TheTarget->createTargetMachine(
      triple.getTriple(), llvm::sys::getHostCPUName().str(), StringRef("+m,+f"),
      Options, Reloc::PIC_, CodeModel::Small, CodeGenOpt::Aggressive);
  assert(TM && "No Machine Information\n");

  Passes.add(createTargetTransformInfoWrapperPass(TM->getTargetIRAnalysis()));

  TargetLibraryInfoImpl TLII(triple);
  TLII.disableAllFunctions();
  Passes.add(new TargetLibraryInfoWrapperPass(TLII));

  // Add O3 optimization
  llvm::PassManagerBuilder Builder;
  Builder.OptLevel = 3;
  Builder.SizeLevel = 0;

  Builder.LoopVectorize = true;
  Builder.SLPVectorize = true;

  Builder.VerifyInput = true;
  Builder.VerifyOutput = true;

  Builder.populateModulePassManager(Passes);
  Passes.run(*M);
}
