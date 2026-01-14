//===-- ZEETargetStreamer.h - ZEE Target Streamer ------*- C++ -*--===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#ifndef LLVM_LIB_TARGET_ZEE_ZEETARGETSTREAMER_H
#define LLVM_LIB_TARGET_ZEE_ZEETARGETSTREAMER_H

#include "llvm/MC/MCStreamer.h"

namespace llvm {

class ZEETargetStreamer : public MCTargetStreamer {
public:
  ZEETargetStreamer(MCStreamer &S);
};

// This part is for ascii assembly output
class ZEETargetAsmStreamer : public ZEETargetStreamer {
  formatted_raw_ostream &OS;

public:
  ZEETargetAsmStreamer(MCStreamer &S, formatted_raw_ostream &OS);
};

}
#endif
