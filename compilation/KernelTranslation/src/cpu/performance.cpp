#include "performance.h"
#include "debug.hpp"
#include "tool.h"
#include "llvm/Analysis/TargetLibraryInfo.h"
#include "llvm/Analysis/TargetTransformInfo.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/MC/TargetRegistry.h"
#include "llvm/Support/Host.h"
#include "llvm/Target/TargetMachine.h"
#include "llvm/Transforms/IPO/PassManagerBuilder.h"

using namespace llvm;

void performance_optimization(llvm::Module *M) {
  DEBUG_INFO("performance optimization\n");
  for (auto F = M->begin(); F != M->end(); F++) {
    for (auto I = F->arg_begin(); I != F->arg_end(); ++I) {
      if (I->getType()->isPointerTy()) {
        I->addAttr(llvm::Attribute::NoAlias);
      }
    }
  }
  llvm::legacy::PassManager Passes;

  // add target machine info
  llvm::Triple triple(llvm::sys::getProcessTriple());

  std::string Error;
  const Target *TheTarget = TargetRegistry::lookupTarget("", triple, Error);
  assert(TheTarget && "No Target Information\n");
  llvm::TargetOptions Options;
  Options.FloatABIType = FloatABI::Hard;

  TargetMachine *TM = TheTarget->createTargetMachine(
      triple.getTriple(), llvm::sys::getHostCPUName().str(), StringRef(""),
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

  Builder.populateModulePassManager(Passes);
  Passes.run(*M);
}
