//===-- ZEE.h - Top-level interface for ZEE -------------*- C++ -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file contains the entry points for global functions defined in the LLVM
// ZEE back-end.
//
//===----------------------------------------------------------------------===//

#ifndef LLVM_LIB_TARGET_ZEE_ZEE_H
#define LLVM_LIB_TARGET_ZEE_ZEE_H

#include "llvm/Target/TargetMachine.h"

namespace llvm {
class ZEESubtarget;
class ZEETargetMachine;
class AsmPrinter;
class FunctionPass;
class InstructionSelector;
class MCInst;
class MCOperand;
class MachineInstr;
class MachineOperand;
class PassRegistry;

void LowerZEEMachineInstrToMCInst(const MachineInstr *MI, MCInst &OutMI,
                                     const AsmPrinter &AP);
bool LowerZEEMachineOperandToMCOperand(const MachineOperand &MO,
                                          MCOperand &MCOp, const AsmPrinter &AP);

FunctionPass *createZEEISelDag(ZEETargetMachine &TM);
}

#endif
