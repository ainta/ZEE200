//===-- ZEETargetObjectFile.h - ZEE Object Info -*- C++ ---------*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#ifndef LLVM_LIB_TARGET_ZEE_ZEETARGETOBJECTFILE_H
#define LLVM_LIB_TARGET_ZEE_ZEETARGETOBJECTFILE_H

#include "llvm/CodeGen/TargetLoweringObjectFileImpl.h"

namespace llvm {
class ZEETargetMachine;

/// This implementation is used for ZEE ELF targets.
class ZEEELFTargetObjectFile : public TargetLoweringObjectFileELF {

public:
  void Initialize(MCContext &Ctx, const TargetMachine &TM) override;
};

} // end namespace llvm

#endif
