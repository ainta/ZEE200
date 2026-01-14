//===-- ZEEELFStreamer.h - ZEE ELF Target Streamer -----*- C++ -*--===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#ifndef LLVM_LIB_TARGET_ZEE_ZEEELFSTREAMER_H
#define LLVM_LIB_TARGET_ZEE_ZEEELFSTREAMER_H

#include "ZEETargetStreamer.h"
#include "llvm/MC/MCELFStreamer.h"

// TODO: consider using MCNullStreamer instead of ELF.
// TODO #include "llvm/MC/MCStreamer.h"

namespace llvm {

class ZEETargetELFStreamer : public ZEETargetStreamer {
public:
  MCELFStreamer &getStreamer();
  ZEETargetELFStreamer(MCStreamer &S, const MCSubtargetInfo &STI);
};
}
#endif
