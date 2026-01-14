//===-- ZEETargetInfo.cpp - ZEE Target Implementation -------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#include "TargetInfo/ZEETargetInfo.h"
#include "llvm/Support/TargetRegistry.h"
using namespace llvm;

Target &llvm::getTheZEETarget() {
  static Target TheZEETarget;
  return TheZEETarget;
}

extern "C" void LLVMInitializeZEETargetInfo() {
  RegisterTarget<Triple::zee> X(getTheZEETarget(), "zee",
                                    "ZEE", "ZEE");
}
