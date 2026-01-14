//===-- ZKMCAsmInfo.cpp - ZK asm properties -----------------------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//

#include "ZKMCAsmInfo.h"
#include "llvm/ADT/StringRef.h"
#include "llvm/ADT/Triple.h"
using namespace llvm;

void ZKMCAsmInfo::anchor() {}

ZKMCAsmInfo::ZKMCAsmInfo(const Triple &TT) {
	CommentString = "//";
	SupportsDebugInformation = true;
}
