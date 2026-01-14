//===-- ZEEMCTargetDesc.cpp - ZEE Target Descriptions -------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
///
/// This file provides ZEE-specific target descriptions.
///
//===----------------------------------------------------------------------===//

#include "ZEEMCTargetDesc.h"
#include "ZEEELFStreamer.h"
#include "ZEEInstPrinter.h"
#include "ZEEMCAsmInfo.h"
#include "ZEETargetStreamer.h"
#include "TargetInfo/ZEETargetInfo.h"
#include "llvm/ADT/STLExtras.h"
#include "llvm/CodeGen/Register.h"
#include "llvm/MC/MCAsmInfo.h"
#include "llvm/MC/MCInstrInfo.h"
#include "llvm/MC/MCRegisterInfo.h"
#include "llvm/MC/MCStreamer.h"
#include "llvm/MC/MCSubtargetInfo.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/TargetRegistry.h"

#define GET_INSTRINFO_MC_DESC
#include "ZEEGenInstrInfo.inc"

#define GET_REGINFO_MC_DESC
#include "ZEEGenRegisterInfo.inc"

#define GET_SUBTARGETINFO_MC_DESC
#include "ZEEGenSubtargetInfo.inc"

using namespace llvm;

static MCInstrInfo *createZEEMCInstrInfo() {
  MCInstrInfo *X = new MCInstrInfo();
  InitZEEMCInstrInfo(X);
  return X;
}

static MCRegisterInfo *createZEEMCRegisterInfo(const Triple &TT) {
  MCRegisterInfo *X = new MCRegisterInfo();
  InitZEEMCRegisterInfo(X, ZEE::GR6);
  return X;
}

// static MCAsmInfo *createZEEMCAsmInfo(const MCRegisterInfo &MRI,
//                                         const Triple &TT) {
//   MCAsmInfo *MAI = new ZEEMCAsmInfo(TT);

//   Register SP = MRI.getDwarfRegNum(ZEE::SP, true);
//   MCCFIInstruction Inst = MCCFIInstruction::createDefCfa(nullptr, SP, 0);
//   MAI->addInitialFrameState(Inst);

//   return MAI;
// }

static MCSubtargetInfo *createZEEMCSubtargetInfo(const Triple &TT,
                                                    StringRef CPU, StringRef FS) {
  // TODO: handle the case where no subtarget is specified.
  std::string CPUName = CPU;
  return createZEEMCSubtargetInfoImpl(TT, CPUName, FS);
}

static MCInstPrinter *createZEEMCInstPrinter(const Triple &T,
                                                unsigned SyntaxVariant,
                                                const MCAsmInfo &MAI,
                                                const MCInstrInfo &MII,
                                                const MCRegisterInfo &MRI) {
  return new ZEEInstPrinter(MAI, MII, MRI);
}

static MCTargetStreamer *
createZEEObjectTargetStreamer(MCStreamer &S, const MCSubtargetInfo &STI) {
  // TODO: still following the RISCV implementation.
  const Triple &TT = STI.getTargetTriple();
  if (TT.isOSBinFormatELF())
    return new ZEETargetELFStreamer(S, STI);
  return nullptr;
}

static MCTargetStreamer *createZEEAsmTargetStreamer(MCStreamer &S,
                                                       formatted_raw_ostream &OS,
                                                       MCInstPrinter *InstPrint,
                                                       bool isVerboseAsm) {
  return new ZEETargetAsmStreamer(S, OS);
}

extern "C" void LLVMInitializeZEETargetMC() {
  // NOTE llvm/include/llvm/Support/TargetRegistry.h getTheFooTarget
  Target &T = getTheZEETarget();  // TODO: confirm the type is correct.
  RegisterMCAsmInfo<ZEEMCAsmInfo> X(getTheZEETarget());
  // TargetRegistry::RegisterMCAsmInfo(T, createZEEMCAsmInfo);
  TargetRegistry::RegisterMCInstrInfo(T, createZEEMCInstrInfo);
  TargetRegistry::RegisterMCRegInfo(T, createZEEMCRegisterInfo);
  TargetRegistry::RegisterMCAsmBackend(T, createZEEAsmBackend);
  TargetRegistry::RegisterMCCodeEmitter(T, createZEEMCCodeEmitter);
  TargetRegistry::RegisterMCInstPrinter(T, createZEEMCInstPrinter);
  TargetRegistry::RegisterMCSubtargetInfo(T, createZEEMCSubtargetInfo);
  TargetRegistry::RegisterObjectTargetStreamer(
      T, createZEEObjectTargetStreamer);

  // Register the asm target streamer.
  TargetRegistry::RegisterAsmTargetStreamer(T, createZEEAsmTargetStreamer);
}
