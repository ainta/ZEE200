//===-- ZEEFixupKinds.h - ZEE Specific Fixup Entries ----*- C++ -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#ifndef LLVM_LIB_TARGET_ZEE_MCTARGETDESC_ZEEFIXUPKINDS_H
#define LLVM_LIB_TARGET_ZEE_MCTARGETDESC_ZEEFIXUPKINDS_H

#include "llvm/MC/MCFixup.h"

#undef ZEE

namespace llvm {
namespace ZEE {
enum Fixups {
  fixup_zee_24 = FirstTargetFixupKind,  // TODO: confirm this definition.
  // fixup_zee_invalid - used as a sentinel and a marker, must be last fixup
  fixup_zee_invalid,
  NumTargetFixupKinds = fixup_zee_invalid - FirstTargetFixupKind
};
} // end namespace ZEE
} // end namespace llvm

#endif
