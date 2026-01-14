//===-- ZEECallingConv.td - Calling Conventions ZEE -*- tablegen -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//


// TODO: confirm whether a custom calling convention is needed.

// Register roles
// GR0     return value
// GR1-GR5 argument registers
// GR6     scratch for frame setup/teardown
// SP      stack pointer

// Arguments
def CC_ZEE : CallingConv<[
    // Call by Value
    //CCIfByVal<CCPassByVal<4, 4>>,
    
    // Promote i8 arguments to i16.
    CCIfType<[i8, i16], CCPromoteToType<i32>>,
    
    // Put argument in registers if marked 'inreg' and not a vararg call.
    //CCIfNotVarArg<CCIfInReg<CCIfType<[i32],
    //                                 CCAssignToReg<[GR1, GR2, GR3, GR4, GR5]>>>>,

    // Otherwise they are assigned to the stack in 4-byte aligned units.
    //CCAssignToStack<4, 4>


    // Pass i32 values in GR1-GR5 when possible.
    CCIfNotVarArg<CCIfType<[i32], CCAssignToReg<[GR1, GR2, GR3, GR4, GR5]>>>,

    CCIfType<[i32], CCAssignToStack<4, 4>>
]>;

// Return values
def RetCC_ZEE : CallingConv<[
    // Promote i8 returns to i16.
    CCIfType<[i8, i16], CCPromoteToType<i32>>,

    // Return i32 via GR0/RT0 (and RT1 for the second word).
    CCIfType<[i32], CCAssignToReg<[RT0, RT1]>>,

    CCIfType<[i32], CCAssignToStack<4, 4>>
]>;

// Callee-saved registers.
// GR0 stores the return value, GR6 is scratch, SP is the frame pointer/stack pointer.
def CSR : CalleeSavedRegs<(add RA, (sequence "GR%u", 1, 5))>;
