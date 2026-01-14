//===-- ZEEInstrFormats.td - ZEE Instruction Formats -*- tablegen -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

// Generic ZK Format
// Superclass
class ZKInst<dag outs, dag ins, string asmstr, list<dag> pattern>
    : Instruction
{
    field bits<128> Inst;

    let Namespace = "ZEE";
    let Size = 16;
  
    bits<5> Opcode = 0;
    let Inst{127-123} = Opcode;

    let OutOperandList = outs;
    let InOperandList = ins;
    let AsmString = asmstr;
    let Pattern = pattern;

    let DecoderNamespace = "ZEE";
    field bits<128> SoftFail = 0;
}

class ZKPseudoInst<dag outs, dag ins, string asmstr, list<dag> pattern>
    : ZKInst<outs, ins,asmstr, pattern>
{
    let isPseudo = 1;
    let isCodeGenOnly = 1;
}

//----------------------------------------------------------------------------
// ALU Instructions
// ADD, SUB, MUL, DIV(?), AND, XOR, OR(?)
// ??? EQL, GT, LT, LTE
//----------------------------------------------------------------------------

// ALU r = r + r
class ALU_Inst_RR<bits<5> opcode, dag outs, dag ins, string asmstr, list<dag> pattern>
    : ZKInst<outs, ins, asmstr, pattern>
{
    bits<5> ri; // dst
    bits<5> rj; // src 1
    bits<5> rk; // src 2

    let Opcode = opcode;
    let Inst{95-91} = ri;
    let Inst{63-59} = rj;
    let Inst{31-27} = rk;

    // TODO: initialize other bits to zero?

    let Inst{96} = 0b0; // not immediate mode
}

// ALU r = r + i
class ALU_Inst_RI<bits<5> opcode, dag outs, dag ins, string asmstr, list<dag> pattern>
    : ZKInst<outs, ins, asmstr, pattern>
{
    bits<5> ri; // dst
    bits<5> rj; // src
    bits<32> const; // imm

    let Opcode = opcode;
    let Inst{95-91} = ri;
    let Inst{63-59} = rj;
    let Inst{31-0} = const;

    let Inst{96} = 0b1; // immediate mode
}

class Format<bits<2> val> {
  bits<2> Value = val;
}

def InstFormatPseudo : Format<0>;
def InstFormatAdr    : Format<1>;
def InstFormatReg    : Format<2>;

class ZEEInst2words<dag outs, dag ins, string asmstr,
    list<dag> pattern, Format f>
    : Instruction {
    field bits<32> Inst;
    Format Form = f;

    bits<8> Opcode = 0;

    let Namespace = "ZEE";
    let Size = 4;  // NOTE: byte size?
    let Inst{31-24} = Opcode;
    let OutOperandList = outs;
    let InOperandList = ins;
    let AsmString = asmstr;
    let Pattern = pattern;

    bits<2> FormBits = Form.Value;

    let DecoderNamespace = "ZEE";

    field bits<32> SoftFail = 0;
}

class ZEEInstFormAdr<bits<8> op, dag outs, dag ins, string asmstr,
    list<dag> pattern>
    : ZEEInst2words<outs, ins, asmstr, pattern, InstFormatAdr> {
    bits<4> r;
    bits<4> x;
    bits<16> adr;

    let Opcode = op;

    let Inst{23-20} = r;
    let Inst{19-16} = x;
    let Inst{15-0} = adr;
}

class ZEEInstFormReg<bits<8> op, dag outs, dag ins, string asmstr,
    list<dag> pattern>
    : Instruction {
    field bits<32> Inst;

    bits<8> Opcode = op;
    bits<4> r1;
    bits<4> r2;
    bits<4> r3;
    let Inst{31-24} = Opcode;
    let Inst{23-20} = r1;
    let Inst{19-16} = r2;
    let Inst{15-12} = r3;

    let Namespace = "ZEE";
    let Size = 4;  // NOTE: byte size
    let OutOperandList = outs;
    let InOperandList = ins;
    let AsmString = asmstr;
    let Pattern = pattern;

    Format Form = InstFormatReg;
    bits<2> FormBits = Form.Value;

    let DecoderNamespace = "ZEE";

    field bits<32> SoftFail = 0;
}

class ZEEPseudo<dag outs, dag ins, string asmstr, list<dag> pattern>
    : ZEEInst2words<outs, ins, asmstr, pattern, InstFormatPseudo> {
    let isCodeGenOnly = 1;
    let isPseudo = 1;
}
