//===-- ZEEMCAsmInfo.h - ZEE Asm Info ------------------*- C++ -*--===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file contains the declaration of the ZEEMCAsmInfo class.
//
//===----------------------------------------------------------------------===//

#ifndef LLVM_LIB_TARGET_ZEE_MCTARGETDESC_ZEEMCASMINFO_H
#define LLVM_LIB_TARGET_ZEE_MCTARGETDESC_ZEEMCASMINFO_H

#include "llvm/MC/MCAsmInfoELF.h"

namespace llvm {
class Triple;

// NOTE llvm/include/llvm/MC/MCAsmInfo.h
// NOTE llvm/lib/MC/MCAsmInfo.cpp
class ZEEMCAsmInfo : public MCAsmInfoELF {
  void anchor() override;

public:
  explicit ZEEMCAsmInfo(const Triple &TargetTriple,
						   const MCTargetOptions &Options);
  bool shouldOmitSectionDirective(StringRef SectionName) const override;
};

} // namespace llvm

#endif
