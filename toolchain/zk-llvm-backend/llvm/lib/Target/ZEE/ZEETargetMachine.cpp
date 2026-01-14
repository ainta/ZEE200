//===-- ZEETargetMachine.cpp - Define TargetMachine for ZEE -------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// Implements the info about ZEE target spec.
//
//===----------------------------------------------------------------------===//

#include "ZEE.h"
#include "ZEETargetMachine.h"
#include "ZEETargetObjectFile.h"
#include "TargetInfo/ZEETargetInfo.h"
#include "llvm/ADT/STLExtras.h"
#include "llvm/Analysis/TargetTransformInfo.h"
#include "llvm/CodeGen/GlobalISel/IRTranslator.h"
#include "llvm/CodeGen/GlobalISel/InstructionSelect.h"
#include "llvm/CodeGen/GlobalISel/Legalizer.h"
#include "llvm/CodeGen/GlobalISel/RegBankSelect.h"
#include "llvm/CodeGen/Passes.h"
#include "llvm/CodeGen/TargetLoweringObjectFileImpl.h"
#include "llvm/CodeGen/TargetPassConfig.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/Support/FormattedStream.h"
#include "llvm/Support/TargetRegistry.h"
#include "llvm/Target/TargetOptions.h"
using namespace llvm;

extern "C" void LLVMInitializeZEETarget() {
  RegisterTargetMachine<ZEETargetMachine> X(getTheZEETarget());
}

static StringRef computeDataLayout(const Triple &TT) {
  assert(TT.isArch32Bit() && "ZEE 32bit only");

  // e little-endian
  // m:e ELF mangling
  // p:16:16 16bit address space, 16-bit aligned
  // i16:16 i16 is 16-bit aligned
  // n16 native integer widths is 16-bit
  return "e-m:e-p:32:32-i1:8:32-i8:8:32-i16:16:32-i64:32-n32-S32";
  // return "E"        // Big endian
  //        "-m:e"     // ELF name manging
  //        "-p:32:32" // 32-bit pointers, 32 bit aligned
  //        "-i64:64"  // 64 bit integers, 64 bit aligned
  //        "-a:0:32"  // 32 bit alignment of objects of aggregate type
  //        "-n32"     // 32 bit native integer width
  //        "-S64";    // 64 bit natural stack alignment
}

static Reloc::Model getEffectiveRelocModel(const Triple &TT,
                                           Optional<Reloc::Model> RM) {
  if (!RM.hasValue())
    return Reloc::Static;
  return *RM;
}

ZEETargetMachine::ZEETargetMachine(const Target &T, const Triple &TT,
                                         StringRef CPU, StringRef FS,
                                         const TargetOptions &Options,
                                         Optional<Reloc::Model> RM,
                                         Optional<CodeModel::Model> CM,
                                         CodeGenOpt::Level OL, bool JIT)
    : LLVMTargetMachine(T, computeDataLayout(TT), TT, CPU, FS, Options,
                        getEffectiveRelocModel(TT, RM),
                        getEffectiveCodeModel(CM, CodeModel::Small), OL),
      TLOF(std::make_unique<ZEEELFTargetObjectFile>()),
      Subtarget(TT, CPU, FS, Options.MCOptions.getABIName(), *this) {
  initAsmInfo();
}

namespace {
class ZEEPassConfig : public TargetPassConfig {
public:
  ZEEPassConfig(ZEETargetMachine &TM, PassManagerBase &PM)
      : TargetPassConfig(TM, PM) {}

  ZEETargetMachine &getZEETargetMachine() const {
    return getTM<ZEETargetMachine>();
  }

  bool addInstSelector() override;
};
}

TargetPassConfig *ZEETargetMachine::createPassConfig(PassManagerBase &PM) {
  return new ZEEPassConfig(*this, PM);
}

bool ZEEPassConfig::addInstSelector() {
  addPass(createZEEISelDag(getZEETargetMachine()));

  return false;
}
