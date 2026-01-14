//===-- ZEERegisterInfo.cpp - ZEE Register Information --*- C++ -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file contains the ZEE implementation of the TargetRegisterInfo class.
//
//===----------------------------------------------------------------------===//

#include "ZEERegisterInfo.h"
#include "ZEE.h"
#include "ZEESubtarget.h"
#include "llvm/CodeGen/MachineFrameInfo.h"
#include "llvm/CodeGen/MachineFunction.h"
#include "llvm/CodeGen/MachineInstrBuilder.h"
#include "llvm/CodeGen/RegisterScavenging.h"
#include "llvm/CodeGen/TargetFrameLowering.h"
#include "llvm/CodeGen/TargetInstrInfo.h"
#include "llvm/Support/ErrorHandling.h"

#define GET_REGINFO_ENUM
#define GET_REGINFO_TARGET_DESC
#include "ZEEGenRegisterInfo.inc"

using namespace llvm;

ZEERegisterInfo::ZEERegisterInfo(unsigned HwMode)
    : ZEEGenRegisterInfo(ZEE::GR0, /*DwarfFlavour*/0, /*EHFlavor*/0,
                           /*PC*/0, HwMode) {}

// ZEERegisterInfo::ZEERegisterInfo() : ZEEGenRegisterInfo(ZEE::RA) {}

const MCPhysReg *
ZEERegisterInfo::getCalleeSavedRegs(const MachineFunction *MF) const {
  return CSR_SaveList;
}

BitVector ZEERegisterInfo::getReservedRegs(const MachineFunction &MF) const {
  BitVector Reserved(getNumRegs());

  // Use markSuperRegs to ensure any register aliases are also reserved
  markSuperRegs(Reserved, ZEE::GR0); // ra
  markSuperRegs(Reserved, ZEE::SP); // sp
  markSuperRegs(Reserved, ZEE::RA); // ra
  markSuperRegs(Reserved, ZEE::FP); // sp
  assert(checkAllSuperRegsMarked(Reserved));
  return Reserved;
}

void ZEERegisterInfo::eliminateFrameIndex(MachineBasicBlock::iterator II,
                                            int SPAdj, unsigned FIOperandNum,
                                            RegScavenger *RS) const {
  assert(SPAdj == 0 && "Unexpected non-zero SPAdj value");

  MachineInstr &MI = *II;
  MachineFunction &MF = *MI.getParent()->getParent();
  MachineFrameInfo MFI = MF.getFrameInfo();
  MachineOperand &FIOp = MI.getOperand(FIOperandNum);
  unsigned FI = FIOp.getIndex();
  // ZEEFunctionInfo ZEEFI = MF.getInfo<ZEEFunctionInfo>();
  // DebugLoc DL = MI.getDebugLoc();

  int FrameIndex = MI.getOperand(FIOperandNum).getIndex();
  unsigned FrameReg;
  int Offset =
      getFrameLowering(MF)->getFrameIndexReference(MF, FrameIndex, FrameReg) +
      MI.getOperand(FIOperandNum + 1).getImm();

  // MachineOperand &ImmOp = MI.getOperand(FIOperandNum + 1);
  // Offset = MFI.getObjectOffset(FI) + MFI.getStackSize() + ImmOp.getImm();
  
  // if (!isInt<16>(Offset)) {
  //   report_fatal_error(
  //       "Frame offsets outside of the signed 16-bit range not supported");
  // }

  MI.getOperand(FIOperandNum)
      .ChangeToRegister(FrameReg, false);
  MI.getOperand(FIOperandNum + 1).ChangeToImmediate(Offset);
}

Register ZEERegisterInfo::getFrameRegister(const MachineFunction &MF) const {
  return ZEE::FP;
}

const uint32_t *
ZEERegisterInfo::getCallPreservedMask(const MachineFunction & MF,
                                        CallingConv::ID /*CC*/) const {
  return CSR_RegMask;
}
