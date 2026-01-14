//===-- ZEESubtarget.cpp - ZEE Subtarget Information --------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file implements the ZEE specific subclass of TargetSubtargetInfo.
//
//===----------------------------------------------------------------------===//

#include "ZEESubtarget.h"
#include "ZEE.h"
#include "llvm/Support/TargetRegistry.h"
#include <string>

using namespace llvm;

#define DEBUG_TYPE "zee-subtarget"

#define GET_SUBTARGETINFO_TARGET_DESC
#define GET_SUBTARGETINFO_CTOR
#include "ZEEGenSubtargetInfo.inc"

void ZEESubtarget::anchor() {}

ZEESubtarget::ZEESubtarget(const Triple &TT, StringRef CPU, StringRef FS,
                               StringRef ABIName, const TargetMachine &TM)
    : ZEEGenSubtargetInfo(TT, CPU, FS),
      FrameLowering(*this),
      InstrInfo(), RegInfo(getHwMode()), TLInfo(TM, *this) {
  std::string CPUName = "generic";

  ParseSubtargetFeatures(CPUName, FS);
}

