//===-- ZEERegisterInfo.td - ZEE Register defs ----*- tablegen -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

//===----------------------------------------------------------------------===//
//  Declarations that describe the ZEE register files
//===----------------------------------------------------------------------===//

class ZEEReg<bits<4> Enc, string n> : Register<n> {
  let HWEncoding{3-0} = Enc;
  let Namespace = "ZEE";
}

def GR0 : ZEEReg<0, "GR0">, DwarfRegNum<[0]>;
def GR1 : ZEEReg<1, "GR1">, DwarfRegNum<[1]>;
def GR2 : ZEEReg<2, "GR2">, DwarfRegNum<[2]>;
def GR3 : ZEEReg<3, "GR3">, DwarfRegNum<[3]>;
def GR4 : ZEEReg<4, "GR4">, DwarfRegNum<[4]>;
def GR5 : ZEEReg<5, "GR5">, DwarfRegNum<[5]>;
def GR6 : ZEEReg<6, "GR6">, DwarfRegNum<[6]>;
def SP : ZEEReg<7, "SP">, DwarfRegNum<[7]>;

// return registers
def RT0 : ZEEReg<8, "RT0">, DwarfRegNum<[8]>;
def RT1 : ZEEReg<9, "RT1">, DwarfRegNum<[9]>;

// heap register
def HP : ZEEReg<10, "HP">, DwarfRegNum<[10]>;

// return address
def RA : ZEEReg<11, "RA">, DwarfRegNum<[11]>;

// frame pointer
def FP : ZEEReg<12, "FP">, DwarfRegNum<[12]>;

def IntRegsAll : RegisterClass<"ZEE", [i32], 32,
    (add GR0, GR1, GR2, GR3, GR4, GR5, GR6, SP, RT0, RT1, HP, RA, FP)>;

def IntRegs : RegisterClass<"ZEE", [i32], 32,
    (add GR1, GR2, GR3, GR4, GR5, GR6, SP)>;
