#ifndef ZKTARGETMACHINE_H
#define ZKTARGETMACHINE_H

#include "MCTargetDesc/ZKMCTargetDesc.h"
#include "llvm/IR/DataLayout.h"
#include "llvm/Target/TargetMachine.h"

namespace llvm {

class ZKTargetMachine : public LLVMTargetMachine {
  // LEGSubtarget Subtarget;
  std::unique_ptr<TargetLoweringObjectFile> TLOF;

public:
  ZKTargetMachine(const Target &T, const Triple &TT, StringRef CPU,
                  StringRef FS, const TargetOptions &Options,
                  Optional<Reloc::Model> RM, Optional<CodeModel::Model> CM,
                  CodeGenOpt::Level OL, bool JIT);

  // const LEGSubtarget * getSubtargetImpl() const {
  //   return &Subtarget;
  // }

  // virtual const TargetSubtargetInfo *
  // getSubtargetImpl(const Function &) const override {
  //   return &Subtarget;
  // }

  // Pass Pipeline Configuration
  TargetPassConfig *createPassConfig(PassManagerBase &PM) override;

  TargetLoweringObjectFile *getObjFileLowering() const override {
    return TLOF.get();
  }
};

} // end namespace llvm

#endif
