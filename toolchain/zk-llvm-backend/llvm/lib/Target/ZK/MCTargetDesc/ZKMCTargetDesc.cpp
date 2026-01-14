//===-- ZKMCTargetDesc.cpp - ZK Target Descriptions ---------------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file provides ZK specific target descriptions.
//
//===----------------------------------------------------------------------===//

#include "ZKMCTargetDesc.h"
// #include "InstPrinter/LEGInstPrinter.h"
#include "ZKMCAsmInfo.h"
#include "llvm/MC/MCInstrInfo.h"
#include "llvm/MC/MCRegisterInfo.h"
#include "llvm/MC/MCSubtargetInfo.h"
#include "llvm/MC/MCStreamer.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/FormattedStream.h"
#include "llvm/Support/TargetRegistry.h"

#include <cstdio>

#define GET_INSTRINFO_MC_DESC
#include "ZKGenInstrInfo.inc"

#define GET_REGINFO_MC_DESC
#include "ZKGenRegisterInfo.inc"

using namespace llvm;

static MCInstrInfo *createZKMCInstrInfo() {
  MCInstrInfo *X = new MCInstrInfo();
  InitZKMCInstrInfo(X);
  return X;
}

static MCRegisterInfo *createZKMCRegisterInfo(const Triple &TT) {
  MCRegisterInfo *X = new MCRegisterInfo();
  InitZKMCRegisterInfo(X, ZK::R0);
  return X;
}

static MCAsmInfo *createZKMCAsmInfo(const MCRegisterInfo &MRI,
                                       const Triple &TT) { 
  return new ZKMCAsmInfo(TT);
}

extern "C" LLVM_EXTERNAL_VISIBILITY void LLVMInitializeZKTargetMC() {
  RegisterMCAsmInfo<ZKMCAsmInfo> X(getTheZKTarget());
  TargetRegistry::RegisterMCInstrInfo(getTheZKTarget(), createZKMCInstrInfo);
  TargetRegistry::RegisterMCRegInfo(getTheZKTarget(), createZKMCRegisterInfo);
  TargetRegistry::RegisterMCAsmBackend(getTheZKTarget(), createZKAsmBackend);
  TargetRegistry::RegisterMCCodeEmitter(getTheZKTarget(), createZKMCCodeEmitter);
}
