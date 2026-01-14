//===-- ZEEInstrInfo.cpp - ZEE Instruction Information --*- C++ -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file contains the ZEE implementation of the TargetInstrInfo class.
//
//===----------------------------------------------------------------------===//

#include "ZEEInstrInfo.h"
#include "ZEE.h"
#include "ZEESubtarget.h"
#include "ZEETargetMachine.h"
#include "MCTargetDesc/ZEEMCTargetDesc.h"
#include "llvm/ADT/STLExtras.h"
#include "llvm/ADT/SmallVector.h"
#include "llvm/CodeGen/MachineFunctionPass.h"
#include "llvm/CodeGen/MachineInstrBuilder.h"
#include "llvm/CodeGen/MachineRegisterInfo.h"
#include "llvm/CodeGen/RegisterScavenging.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/TargetRegistry.h"

#include <iostream>

#define GET_INSTRINFO_CTOR_DTOR
#include "ZEEGenInstrInfo.inc"

using namespace llvm;

/// Adjust SP by Amount bytes.
void ZEEInstrInfo::adjustStackPtr(unsigned SP, int64_t Amount,
                                     MachineBasicBlock &MBB,
                                     MachineBasicBlock::iterator I) const {
  DebugLoc DL = I != MBB.end() ? I->getDebugLoc() : DebugLoc();
  unsigned ADDiu = ZEE::ADDri;

  // addiu sp, sp, amount
  BuildMI(MBB, I, DL, get(ADDiu), SP).addReg(SP).addImm(Amount);
}

ZEEInstrInfo::ZEEInstrInfo()
    : ZEEGenInstrInfo(ZEE::ADJCALLSTACKDOWN, ZEE::ADJCALLSTACKUP) {}

unsigned ZEEInstrInfo::isLoadFromStackSlot(const MachineInstr &MI,
                                              int &FrameIndex) const {
  switch (MI.getOpcode()) {
  default:
    return 0;
  case ZEE::LOAD:
    break;
  }

  if (MI.getOperand(1).isFI() && MI.getOperand(2).isImm() &&
      MI.getOperand(2).getImm() == 0) {
    FrameIndex = MI.getOperand(1).getIndex();
    return MI.getOperand(0).getReg();
  }

  return 0;
}

unsigned ZEEInstrInfo::isStoreToStackSlot(const MachineInstr &MI,
                                             int &FrameIndex) const {
  switch (MI.getOpcode()) {
  default:
    return 0;
  case ZEE::STORE:
    break;
  }

  if (MI.getOperand(0).isFI() && MI.getOperand(1).isImm() &&
      MI.getOperand(1).getImm() == 0) {
    FrameIndex = MI.getOperand(0).getIndex();
    return MI.getOperand(2).getReg();
  }

  return 0;
}

void ZEEInstrInfo::copyPhysReg(MachineBasicBlock &MBB,
                                  MachineBasicBlock::iterator MBBI,
                                  const DebugLoc &DL,
								  MCRegister DstReg,
                                  MCRegister SrcReg, bool KillSrc) const {
  BuildMI(MBB, MBBI, DL, get(ZEE::COPYR))
      .addReg(DstReg, RegState::Define)
      .addReg(SrcReg, getKillRegState(KillSrc));
}

void ZEEInstrInfo::storeRegToStackSlot(MachineBasicBlock &MBB,
                                          MachineBasicBlock::iterator I,
                                          unsigned SrcReg, bool IsKill, int FI,
                                          const TargetRegisterClass *RC,
                                          const TargetRegisterInfo *TRI) const {
  DebugLoc DL;
  if (I != MBB.end())
    DL = I->getDebugLoc();

  BuildMI(MBB, I, DL, get(ZEE::STORE))
      .addReg(SrcReg, getKillRegState(IsKill))
      .addFrameIndex(FI)
      .addImm(0);  // TODO: confirm frame index usage is correct.
}

void ZEEInstrInfo::loadRegFromStackSlot(MachineBasicBlock &MBB,
                                           MachineBasicBlock::iterator I,
                                           unsigned DstReg, int FI,
                                           const TargetRegisterClass *RC,
                                           const TargetRegisterInfo *TRI) const {
  DebugLoc DL;
  if (I != MBB.end())
    DL = I->getDebugLoc();

  BuildMI(MBB, I, DL, get(ZEE::LOAD), DstReg)
      .addFrameIndex(FI)
      .addImm(0);  // TODO: confirm frame index usage is correct.
}

static unsigned getOppositeBranchOpcode(int Opc) {
  // TODO: branch opcodes not wired yet.
  llvm_unreachable("Unrecognized conditional branch");
}

bool ZEEInstrInfo::analyzeBranch(MachineBasicBlock &MBB,
                                    MachineBasicBlock *&TBB,
                                    MachineBasicBlock *&FBB,
                                    SmallVectorImpl<MachineOperand> &Cond,
                                    bool AllowModify) const {
  // TODO: branch analysis not implemented; return true while stubbed.
  return true;
}

unsigned ZEEInstrInfo::removeBranch(MachineBasicBlock &MBB,
                                      int *BytesRemoved) const {
  // TODO branch etc
  llvm_unreachable("Target doesn't implement ZEEInstrInfo::removeBranch");
}

unsigned ZEEInstrInfo::insertBranch(
    MachineBasicBlock &MBB, MachineBasicBlock *TBB, MachineBasicBlock *FBB,
    ArrayRef<MachineOperand> Cond, const DebugLoc &DL, int *BytesAdded) const {
  // TODO: branch insertion not implemented.

	std::cout << "DEBUG in ZEEInstrInfo::insertBranch" << std::endl;
	
  llvm_unreachable("Target doesn't implement ZEEInstrInfo::insertBranch!");
}

unsigned ZEEInstrInfo::insertIndirectBranch(MachineBasicBlock &MBB,
                                               MachineBasicBlock &DestBB,
                                               const DebugLoc &DL,
                                               int64_t BrOffset,
                                               RegScavenger *RS) const {
  // TODO: indirect branch insertion not implemented.
  llvm_unreachable("Target doesn't implement ZEEInstrInfo::insertIndirectBranch!");
}

bool ZEEInstrInfo::reverseBranchCondition(
    SmallVectorImpl<MachineOperand> &Cond) const {
  // TODO: still matching the RISCV version.
  assert((Cond.size() == 3) && "Invalid branch condition!");
  Cond[0].setImm(getOppositeBranchOpcode(Cond[0].getImm()));
  return false;
}

MachineBasicBlock *
ZEEInstrInfo::getBranchDestBlock(const MachineInstr &MI) const {
  assert(MI.getDesc().isBranch() && "Unexpected opcode!");
  // TODO: still matching the RISCV version.
  // The branch target is always the last operand.
  int NumOp = MI.getNumExplicitOperands();
  return MI.getOperand(NumOp - 1).getMBB();
}

bool ZEEInstrInfo::isBranchOffsetInRange(unsigned BranchOp,
                                           int64_t BrOffset) const {
  // Return true if the branch offset fits the encodable range.
  return isIntN(32, BrOffset);  // True when BrOffset fits a signed 32-bit value.
}

unsigned ZEEInstrInfo::getInstSizeInBytes(const MachineInstr &MI) const {
  unsigned Opcode = MI.getOpcode();

  switch (Opcode) {
  case ZEE::ADDAREG:
  case ZEE::SUBAREG:
  case ZEE::MULAREG:
  case ZEE::XORAREG:
  case ZEE::COPYR:
    return 1;
  default:
    return 2;
  }
}
