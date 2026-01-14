//===-- ZEEMCTargetDesc.h - ZEE Target Descriptions -----*- C++ -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file provides ZEE specific target descriptions.
//
//===----------------------------------------------------------------------===//

#ifndef LLVM_LIB_TARGET_ZEE_MCTARGETDESC_ZEEMCTARGETDESC_H
#define LLVM_LIB_TARGET_ZEE_MCTARGETDESC_ZEEMCTARGETDESC_H

#include "llvm/Config/config.h"
#include "llvm/MC/MCTargetOptions.h"
#include "llvm/Support/DataTypes.h"
#include <memory>

namespace llvm {
class MCAsmBackend;
class MCCodeEmitter;
class MCContext;
class MCInstrInfo;
class MCObjectTargetWriter;
class MCRegisterInfo;
class MCSubtargetInfo;
class StringRef;
class Target;
class Triple;
class raw_ostream;
class raw_pwrite_stream;

MCCodeEmitter *createZEEMCCodeEmitter(const MCInstrInfo &MCII,
                                         const MCRegisterInfo &MRI,
                                         MCContext &Ctx);

MCAsmBackend *createZEEAsmBackend(const Target &T, const MCSubtargetInfo &STI,
                                     const MCRegisterInfo &MRI,
                                     const MCTargetOptions &Options);

std::unique_ptr<MCObjectTargetWriter> createZEEELFObjectWriter(uint8_t OSABI,
                                                                  bool Is64Bit);
}

// Defines symbolic names for ZEE registers.
#define GET_REGINFO_ENUM
#include "ZEEGenRegisterInfo.inc"

// Defines symbolic names for ZEE instructions.
#define GET_INSTRINFO_ENUM
#include "ZEEGenInstrInfo.inc"

#define GET_SUBTARGETINFO_ENUM
#include "ZEEGenSubtargetInfo.inc"

#endif
