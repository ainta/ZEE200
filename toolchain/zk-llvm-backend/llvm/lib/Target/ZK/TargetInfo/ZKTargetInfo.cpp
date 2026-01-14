//===-- ZKTargetInfo.cpp - ZK Target Implementation ---------------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//

#include "MCTargetDesc/ZKMCTargetDesc.h"
#include "llvm/IR/Module.h"
#include "llvm/Support/TargetRegistry.h"
using namespace llvm;

Target &llvm::getTheZKTarget() {
  static Target TheZKTarget;
  return TheZKTarget;
}

extern "C" LLVM_EXTERNAL_VISIBILITY void LLVMInitializeZKTargetInfo() {
	RegisterTarget<Triple::zk, /*HasJIT=*/false> X(getTheZKTarget(), "zk", "ZK", "ZK");
}
