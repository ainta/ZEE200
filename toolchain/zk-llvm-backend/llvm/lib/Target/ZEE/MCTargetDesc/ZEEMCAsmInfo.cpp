//===-- ZEEMCAsmInfo.cpp - ZEE Asm properties ---------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file contains the declarations of the ZEEMCAsmInfo properties.
//
//===----------------------------------------------------------------------===//

#include "ZEEMCAsmInfo.h"
#include "MCTargetDesc/ZEEMCExpr.h"
#include "llvm/ADT/Triple.h"
#include "llvm/BinaryFormat/Dwarf.h"
#include "llvm/MC/MCStreamer.h"
using namespace llvm;

void ZEEMCAsmInfo::anchor() {}

// NOTE: see llvm/include/llvm/MC/MCAsmInfo.h
ZEEMCAsmInfo::ZEEMCAsmInfo(const Triple &TT,
								 const MCTargetOptions &Options) {
  CodePointerSize = CalleeSaveStackSlotSize = 2;
  CommentString = ";";
  LabelSuffix = " NOP "; // Standalone labels are not allowed.
}

bool
ZEEMCAsmInfo::shouldOmitSectionDirective(StringRef SectionName) const {
    return true;
}
