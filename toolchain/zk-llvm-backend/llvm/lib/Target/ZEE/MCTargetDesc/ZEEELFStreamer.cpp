//===-- ZEEELFStreamer.cpp - ZEE ELF Target Streamer Methods ------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file provides ZEE specific target streamer methods.
//
//===----------------------------------------------------------------------===//

#include "ZEEELFStreamer.h"
#include "MCTargetDesc/ZEEAsmBackend.h"
#include "ZEEMCTargetDesc.h"
#include "llvm/BinaryFormat/ELF.h"
#include "llvm/MC/MCSubtargetInfo.h"

using namespace llvm;

// This part is for ELF object output.
ZEETargetELFStreamer::ZEETargetELFStreamer(MCStreamer &S,
                                                 const MCSubtargetInfo &STI)
    : ZEETargetStreamer(S) {
  MCAssembler &MCA = getStreamer().getAssembler();

  unsigned EFlags = MCA.getELFHeaderEFlags();

  MCA.setELFHeaderEFlags(EFlags);
}

MCELFStreamer &ZEETargetELFStreamer::getStreamer() {
  return static_cast<MCELFStreamer &>(Streamer);
}
