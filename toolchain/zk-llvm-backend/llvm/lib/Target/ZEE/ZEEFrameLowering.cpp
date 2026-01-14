//===-- ZEEFrameLowering.cpp - ZEE Frame Information ------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file contains the ZEE implementation of TargetFrameLowering class.
//
//===----------------------------------------------------------------------===//

#include "ZEEFrameLowering.h"
#include "ZEEMachineFunctionInfo.h"
#include "ZEESubtarget.h"
#include "MCTargetDesc/ZEEMCTargetDesc.h"
#include "llvm/CodeGen/MachineFrameInfo.h"
#include "llvm/CodeGen/MachineFunction.h"
#include "llvm/CodeGen/MachineInstrBuilder.h"
#include "llvm/CodeGen/MachineRegisterInfo.h"
#include "llvm/CodeGen/RegisterScavenging.h"
#include "llvm/MC/MCDwarf.h"

using namespace llvm;

bool ZEEFrameLowering::hasFP(const MachineFunction &MF) const {
  return false;
}

void ZEEFrameLowering::emitPrologue(MachineFunction &MF,
                                       MachineBasicBlock &MBB) const {
  assert(&MF.front() == &MBB && "Shrink-wrapping not yet supported");

  MachineFrameInfo &MFI = MF.getFrameInfo();
  const ZEEInstrInfo *TII = STI.getInstrInfo();
  const ZEERegisterInfo *CRI = STI.getRegisterInfo();
  MachineBasicBlock::iterator MBBI = MBB.begin();
  DebugLoc DL = MBBI->getDebugLoc();

  uint64_t StackSize = MFI.getStackSize();

  unsigned StackAlign = CRI->needsStackRealignment(MF) ? MFI.getMaxAlignment()
                                                       : getStackAlignment();

  // StackSize = alignTo(StackSize, StackAlign);  
 
  // Early exit if there is no need to allocate on the stack
  if (StackSize == 0 && !MFI.adjustsStack())
    return;

   // Update stack size
  MFI.setStackSize(StackSize);

  // Grow the stack by one frame.
  // Register tmp = ZEE::GR6;
  // BuildMI(MBB, MBBI, DL, TII->get(ZEE::COPYI), tmp)
  //     .addImm(StackSize);
  BuildMI(MBB, MBBI, DL, TII->get(ZEE::STORE), ZEE::FP)
      .addReg(ZEE::SP).addImm(-4);
  BuildMI(MBB, MBBI, DL, TII->get(ZEE::SUBri), ZEE::SP)
      .addReg(ZEE::SP).addImm(StackSize);
  BuildMI(MBB, MBBI, DL, TII->get(ZEE::COPYR), ZEE::FP)
  	  .addReg(ZEE::SP);
}

void ZEEFrameLowering::emitEpilogue(MachineFunction &MF,
                                       MachineBasicBlock &MBB) const {
  MachineBasicBlock::iterator MBBI = MBB.getLastNonDebugInstr();
  MachineFrameInfo &MFI = MF.getFrameInfo();
  DebugLoc DL = MBBI->getDebugLoc();
  const ZEEInstrInfo *TII = STI.getInstrInfo();

  // Get the number of bytes from FrameInfo
  uint64_t StackSize = MFI.getStackSize();

  if (StackSize == 0 && !MFI.adjustsStack())
    return;  

  // Shrink the stack by one frame.
  // Register tmp = ZEE::GR6;
  // BuildMI(MBB, MBBI, DL, TII->get(ZEE::COPYI), tmp)
  //     .addImm(StackSize);
  BuildMI(MBB, MBBI, DL, TII->get(ZEE::COPYR), ZEE::SP)
  	  .addReg(ZEE::FP);
  BuildMI(MBB, MBBI, DL, TII->get(ZEE::ADDri), ZEE::SP)
      .addReg(ZEE::SP).addImm(StackSize);
  BuildMI(MBB, MBBI, DL, TII->get(ZEE::LOAD), ZEE::FP)
      .addReg(ZEE::SP).addImm(-4);
}

// Eliminate ADJCALLSTACKDOWN, ADJCALLSTACKUP pseudo instructions.
MachineBasicBlock::iterator ZEEFrameLowering::eliminateCallFramePseudoInstr(
    MachineFunction &MF, MachineBasicBlock &MBB,
    MachineBasicBlock::iterator MI) const {

	// return MBB.erase(MI);
	
	// unsigned SP = ZEE::SP;

	// if (!hasReservedCallFrame(MF)) {
	// 	int64_t Amount = MI->getOperand(0).getImm();
	// 	if (MI->getOpcode() == ZEE::ADJCALLSTACKDOWN)
	// 		Amount = -Amount;

	// 	STI.getInstrInfo()->adjustStackPtr(SP, Amount, MBB, MI);
	// }
	
  if (!hasReservedCallFrame(MF)) {
    // If space has not been reserved for a call frame, ADJCALLSTACKDOWN and
    // ADJCALLSTACKUP must be converted to instructions manipulating the stack
    // pointer. This is necessary when there is a variable length stack
    // allocation (e.g. alloca), which means it's not possible to allocate
    // space for outgoing arguments from within the function prologue.
    int64_t Amount = MI->getOperand(0).getImm();

    if (Amount != 0) {
      // Ensure the stack remains aligned after adjustment.
      // TODO: not implemented.
    }
  }

  return MBB.erase(MI);
}


void ZEEFrameLowering::determineCalleeSaves(MachineFunction &MF,
											   BitVector &SavedRegs,
											   RegScavenger *RS) const {
  TargetFrameLowering::determineCalleeSaves(MF, SavedRegs, RS);

  MachineFrameInfo &MFI = MF.getFrameInfo();
  const ZEERegisterInfo *CRI =
      static_cast<const ZEERegisterInfo *>(STI.getRegisterInfo());
  int Offset = -4;

  // // Reserve 4 bytes for the saved RCA
  // MFI.CreateFixedObject(4, Offset, true);
  // Offset -= 4;

  // Reserve 4 bytes for the saved FP
  MFI.CreateFixedObject(4, Offset, true);
  Offset -= 4;

  // if (CRI->hasBasePointer(MF)) {
  //   MFI.CreateFixedObject(4, Offset, true);
  //   SavedRegs.reset(CRI->getBaseRegister());
  // }
}
