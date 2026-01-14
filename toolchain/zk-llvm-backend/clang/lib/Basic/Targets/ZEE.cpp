//===--- ZEE.cpp - Implement ZEE target feature support ------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file implements ZEE TargetInfo objects.
//
//===----------------------------------------------------------------------===//

#include "ZEE.h"
#include "clang/Basic/MacroBuilder.h"

using namespace clang;
using namespace clang::targets;

ZEETargetInfo::ZEETargetInfo(const llvm::Triple &Triple,
                             const TargetOptions &)
    : TargetInfo(Triple) {
  // Match the backend data layout.
  resetDataLayout("e-m:e-p:32:32-i1:8:32-i8:8:32-i16:16:32-i64:32-n32-S32");

  BigEndian = false;
  PointerWidth = PointerAlign = 32;
  IntWidth = IntAlign = 32;
  LongWidth = LongAlign = 32;
  LongLongWidth = 64;
  LongLongAlign = 32;
  FloatWidth = FloatAlign = 32;
  DoubleWidth = 64;
  DoubleAlign = 32;
  LongDoubleWidth = 64;
  LongDoubleAlign = 32;
  SuitableAlign = 32;

  SizeType = UnsignedInt;
  IntMaxType = SignedLongLong;
  IntPtrType = SignedInt;
  PtrDiffType = SignedInt;
}

void ZEETargetInfo::getTargetDefines(const LangOptions &Opts,
                                     MacroBuilder &Builder) const {
  Builder.defineMacro("__ZEE__");
  Builder.defineMacro("__zee__");
}
