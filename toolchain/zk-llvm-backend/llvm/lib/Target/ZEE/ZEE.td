//===-- ZEE.td - Describe the ZEE Target Machine ---*- tablegen -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

include "llvm/Target/Target.td"

//===----------------------------------------------------------------------===//
// ZEE subtarget features and instruction predicates.
//===----------------------------------------------------------------------===//

// nothing

//===----------------------------------------------------------------------===//
// Named operands for CSR instructions.
//===----------------------------------------------------------------------===//

// NOTE CSR (Control/Status Register)

// TODO: decide if these are needed.
//include "ZEESystemOperands.td"

//===----------------------------------------------------------------------===//
// Registers, calling conventions, instruction descriptions.
//===----------------------------------------------------------------------===//

include "ZEERegisterInfo.td"
include "ZEECallingConv.td"
include "ZEEInstrInfo.td"

//===----------------------------------------------------------------------===//
// ZEE processors supported.
//===----------------------------------------------------------------------===//

def : ProcessorModel<"ZEE", NoSchedModel, []>;

//===----------------------------------------------------------------------===//
// Define the ZEE target.
//===----------------------------------------------------------------------===//

def ZEEInstrInfo : InstrInfo {
  // NOTE: whether TableGen should infer unspecified properties (deprecated).
  let guessInstructionProperties = 0;
}

// TODO: could the DefaultAsmWriter from Target.td suffice?
def ZEEAsmWriter : AsmWriter;

def ZEE : Target {
  let InstructionSet = ZEEInstrInfo;
  let AssemblyWriters = [ZEEAsmWriter];
  // NOTE: whether to allow renaming registers after allocation.
  let AllowRegisterRenaming = 1;
}
