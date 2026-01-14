//===-- ZEEInstrInfo.td - Target Description for ZEE -*- tablegen -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file describes the ZEE instructions in TableGen format.
//
//===----------------------------------------------------------------------===//

include "ZEEInstrFormats.td"

// Immediate operand (16-bit).
// Bits 16-0: signed 16-bit integer.
// EncoderMethod: extract a signed 16-bit integer from the bitfield.
def imm32 : Operand<i32> {
  let EncoderMethod = "get32bitOpValue";
}

def calltarget  : Operand<iPTR> {
  let EncoderMethod = "getCallTargetOpValue";
}

// Signed 16-bit integer.
// Matches ISD::Constant values representable in 16 bits.
def immSExt32 : PatLeaf<(imm), [{ return isInt<32>(N->getSExtValue()); }]>;

// NOTE: AVR ADD may be a useful reference.
// Add instructions
class ZEEInstReg<bits<8> op, string asmstr, SDNode OpNode, RegisterClass RC>
    : ZEEInstFormReg<op, (outs RC:$dst), (ins RC:$src1, RC:$src2),
                        !strconcat(asmstr, "\t$dst, $src1, $src2"),
                        [(set i32:$dst, (OpNode i32:$src1, i32:$src2))]> {
  //let Constraints = "$src = $r1";
  bits<4> dst;
  bits<4> src1;
  bits<4> src2;
  let Inst{23-20} = dst;
  let Inst{19-16} = src1;
  let Inst{15-12} = src2;  
}

def ADDAREG : ZEEInstReg<0x20, "ADD", add, IntRegs>;
def SUBAREG : ZEEInstReg<0x21, "SUB", sub, IntRegs>;
def MULAREG : ZEEInstReg<0x22, "MUL", mul, IntRegs>;
def XORAREG : ZEEInstReg<0x23, "XOR", xor, IntRegs>;
def ANDAREG : ZEEInstReg<0x24, "AND", and, IntRegs>;
def ORAREG : ZEEInstReg<0x25, "OR", or, IntRegs>;
def SHLAREG : ZEEInstReg<0x26, "SHL", shl, IntRegs>;
def SRLAREG : ZEEInstReg<0x27, "SRL", srl, IntRegs>;
def SRAAREG : ZEEInstReg<0x28, "SRA", sra, IntRegs>;

def SDIVAREG : ZEEInstReg<0x29, "SDIV", sdiv, IntRegs>;
def UDIVAREG : ZEEInstReg<0x2a, "UDIV", udiv, IntRegs>;
def SREMAREG : ZEEInstReg<0x2b, "SREM", srem, IntRegs>;
def UREMAREG : ZEEInstReg<0x2c, "UREM", urem, IntRegs>;

class ZEEALUInstRI<bits<8> op, string asmstr, SDNode OpNode, RegisterClass RC>
    : ZEEInstFormAdr<op, (outs RC:$dst), (ins RC:$src1, imm32:$const),
                        !strconcat(asmstr, "\t$dst, $src1, $const"),
                        [(set i32:$dst, (OpNode i32:$src1, immSExt32:$const))]> {
}

def ADDri : ZEEALUInstRI<0x30, "ADDI", add, IntRegs>;
def SUBri : ZEEALUInstRI<0x31, "SUBI", sub, IntRegs>;
def MULri : ZEEALUInstRI<0x32, "MULI", mul, IntRegs>;
def XORri : ZEEALUInstRI<0x33, "XORI", xor, IntRegs>;
def ANDri : ZEEALUInstRI<0x34, "ANDI", and, IntRegs>;
def ORri : ZEEALUInstRI<0x35, "ORI", or, IntRegs>;
def SHLri : ZEEALUInstRI<0x36, "SHLI", shl, IntRegs>;
def SRLri : ZEEALUInstRI<0x37, "SRLI", srl, IntRegs>;
def SRAri : ZEEALUInstRI<0x38, "SRAI", sra, IntRegs>;

def SDIVri : ZEEALUInstRI<0x39, "SDIVI", sdiv, IntRegs>;
def UDIVri : ZEEALUInstRI<0x3a, "UDIVI", udiv, IntRegs>;
def SREMri : ZEEALUInstRI<0x3b, "SREMI", srem, IntRegs>;
def UREMri : ZEEALUInstRI<0x3c, "UREMI", urem, IntRegs>;

def ZEELT : SDNode<"ZEEISD::LT", SDTIntBinOp, [SDNPInGlue]>;
def ZEELTE : SDNode<"ZEEISD::LTE", SDTIntBinOp, [SDNPInGlue]>;
def ZEEGT : SDNode<"ZEEISD::GT", SDTIntBinOp, [SDNPInGlue]>;
def ZEEGTE : SDNode<"ZEEISD::GTE", SDTIntBinOp, [SDNPInGlue]>;
def ZEEULT : SDNode<"ZEEISD::ULT", SDTIntBinOp, [SDNPInGlue]>;
def ZEEULTE : SDNode<"ZEEISD::ULTE", SDTIntBinOp, [SDNPInGlue]>;
def ZEEUGT : SDNode<"ZEEISD::UGT", SDTIntBinOp, [SDNPInGlue]>;
def ZEEUGTE : SDNode<"ZEEISD::UGTE", SDTIntBinOp, [SDNPInGlue]>;
def ZEEEQ : SDNode<"ZEEISD::EQ", SDTIntBinOp, [SDNPInGlue]>;
def ZEENEQ : SDNode<"ZEEISD::NEQ", SDTIntBinOp, [SDNPInGlue]>;

def LTAREG : ZEEInstReg<0x40, "LT", ZEELT, IntRegs>;
def LTEAREG : ZEEInstReg<0x41, "LTE", ZEELTE, IntRegs>;
def GTAREG : ZEEInstReg<0x42, "GT", ZEEGT, IntRegs>;
def GTEAREG : ZEEInstReg<0x43, "GTE", ZEEGTE, IntRegs>;
def EQAREG : ZEEInstReg<0x44, "EQ", ZEEEQ, IntRegs>;
def NEQAREG : ZEEInstReg<0x45, "NEQ", ZEENEQ, IntRegs>;
def ULTAREG : ZEEInstReg<0x46, "ULT", ZEEULT, IntRegs>;
def ULTEAREG : ZEEInstReg<0x47, "ULTE", ZEEULTE, IntRegs>;
def UGTAREG : ZEEInstReg<0x48, "UGT", ZEEUGT, IntRegs>;
def UGTEAREG : ZEEInstReg<0x49, "UGTE", ZEEUGTE, IntRegs>;

class ZEESelect<bits<8> op, string asmstr, SDNode OpNode, RegisterClass RC>
    : ZEEInstFormReg<op, (outs RC:$dst), (ins RC:$cond, RC:$src1, RC:$src2),
                        !strconcat(asmstr, "\t$dst, $cond, $src1"),
                        [(set i32:$dst, (OpNode i32:$cond, i32:$src1, i32:$src2))]> {
  let Constraints = "$dst = $src2";
}

def SELECT : ZEESelect<0x50, "CMOV", select, IntRegs>;

// Load immediate
class LoadI<bits<8> op, string asmstr>
    : ZEEInstFormAdr<op, (outs IntRegs:$r), (ins imm32:$addr),
                        !strconcat(asmstr, "\t$r, $addr"),
                        [(set IntRegs:$r, immSExt32:$addr)]> {
}

def COPYI : LoadI<0x12, "COPYI">;

def COPYG : LoadI<0x12, "COPYG">;

def load_sym : SDNode<"ZEEISD::LOAD_SYM", SDTIntUnaryOp>;

def : Pattern<(i32 (load_sym tglobaladdr:$addr)),  [(COPYG $addr)]>;

// Register-to-register move
class LoadR<bits<8> op, string asmstr>
    : ZEEInstFormReg<op, (outs IntRegs:$r1), (ins IntRegs:$r2),
                        !strconcat(asmstr, "\t$r1, $r2"),
                        [(set IntRegs:$r1, IntRegs:$r2)]> {
}

def COPYR : LoadR<0x14, "COPYR">;


// Call instruction
def SDT_ZEECall : SDTypeProfile<0, 1, [SDTCisVT<0, iPTR>]>;
def ZEECall : SDNode<"ZEEISD::Call", SDT_ZEECall,
                        [SDNPHasChain, SDNPOutGlue, SDNPOptInGlue,
                         SDNPVariadic]>;

class Call<bits<8> op, string asmstr>
    : ZEEInstFormAdr<op, (outs), (ins calltarget:$adr, variable_ops),
                        !strconcat(asmstr, "\t$adr"), [(ZEECall imm:$adr)]> {
    let isCall = 1;
    let Defs = [RA, FP];
    let Uses = [SP];
    let DecoderMethod = "DecodeCallTarget";
    let r = 0;
    let x = 0;
}

def CALL : Call<0x80, "CALL">;

def CallR: ZEEInst2words<(outs), (ins IntRegs:$dst),
                         "CALLR\t$dst", [(ZEECall IntRegs:$dst)], InstFormatAdr> {
    let Opcode = 0x8e;
    bits<32> dst;
    let Defs = [RA, FP];
    let Uses = [SP];
    let isCall = 1;
}

class CallR<bits<8> op, string asmstr>
    : ZEEInstFormAdr<op, (outs), (ins IntRegs:$adr, variable_ops),
                        !strconcat(asmstr, "\t$adr"), [(ZEECall IntRegs:$adr)]> {
    let isCall = 1;
    let Defs = [RA, FP];
    let Uses = [SP];
    let DecoderMethod = "DecodeCallTarget";
    let r = 0;
    let x = 0;
}

// def CALLR : CallR<0x80, "CALL">;


// Pattern: rewrite the first operand's match into the second operand.
def : Pat<(ZEECall (i32 tglobaladdr:$dst)),
          (CALL tglobaladdr:$dst)>;
def : Pat<(ZEECall (i32 texternalsym:$dst)),
          (CALL texternalsym:$dst)>;


// Return instruction
def ZEERet : SDNode<"ZEEISD::Ret", SDTNone,
                       [SDNPHasChain, SDNPOptInGlue, SDNPVariadic]>;

class RetInst<bits<8> op, string asmstr>
    : ZEEInstFormAdr<op, (outs), (ins), asmstr,
                        [(ZEERet)]> {
    let isBranch = 1;
    let isTerminator = 1;
    let isBarrier = 1;
    let isReturn = 1;
    let Uses = [RA, FP];
    let x = 0;
    let adr = 0;
    let r = 0;
}

def RET : RetInst<0x81, "RET">;

def mem : Operand<i32> {
    let PrintMethod = "printMemOperand";
    let MIOperandInfo = (ops IntRegs, i32imm);
    let EncoderMethod = "getMemEncoding";
}

// NOTE llvm/include/llvm/CodeGen/SDNodeProperties.td
def addr : ComplexPattern<iPTR, 2, "SelectAddr", [], [SDNPWantRoot]>;

// Shared load/store format
class FMem<bits<8> op, dag outs, dag ins, string asmstr, list<dag> pattern>
    : ZEEInstFormAdr<op, outs, ins, asmstr, pattern> {
    bits<32> addr;
    // let Inst{15-0} = addr;
    let DecoderMethod = "DecodeMem";
}

// Load instruction
class LoadM<bits<8> op, string asmstr, RegisterClass RC, PatFrag OpNode>
    : FMem<op, (outs RC:$r), (ins mem:$addr),
           !strconcat(asmstr, "\t$r, $addr"),
           [(set (i32 RC:$r), (OpNode addr:$addr))]>;

// Store instruction
class StoreM<bits<8> op, string asmstr, RegisterClass RC, PatFrag OpNode>
    : FMem<op, (outs), (ins RC:$r, mem:$addr),
           !strconcat(asmstr, "\t$r, $addr"),
           [(OpNode RC:$r, addr:$addr)]>;

def LOAD : LoadM<0x10, "LOAD", IntRegs, load>;
def STORE : StoreM<0x11, "STORE", IntRegs, store>;

def STOREH : StoreM<0x01, "STOREH", IntRegs, truncstorei16>;
def STOREB : StoreM<0x02, "STOREB", IntRegs, truncstorei8>;

def ULOADH : LoadM<0x03, "ULOADH", IntRegs, zextloadi16>;
def ULOADB : LoadM<0x04, "ULOADB", IntRegs, zextloadi8>;

def LOADH : LoadM<0x05, "LOADH", IntRegs, sextloadi16>;
def LOADB : LoadM<0x06, "LOADB", IntRegs, sextloadi8>;

def ANYLOADH : LoadM<0x07, "ULOADH", IntRegs, extloadi16>;
def ANYLOADB : LoadM<0x08, "ULOADB", IntRegs, extloadi8>;

// TODO: implement brcond/br

def b_target : Operand<OtherVT>;

def B : ZEEInst2words<(outs), (ins b_target:$dst),
                         "JUMP\t$dst", [(br bb:$dst)], InstFormatAdr> {
    let Opcode = 0x82;
    bits<32> dst;
    let isTerminator = 1;
    let isBranch = 1;
    let isBarrier = 1;
}

def Bind : ZEEInst2words<(outs), (ins IntRegs:$dst),
                         "JUMP\t$dst", [(brind IntRegs:$dst)], InstFormatAdr> {
    let Opcode = 0x84;
    bits<32> dst;
    let isTerminator = 1;
    let isBranch = 1;
    let isBarrier = 1;
    let isIndirectBranch = 1;
}

def Bcc : ZEEInst2words<(outs), (ins IntRegs:$cond, b_target:$dst),
                         "BNEQZ\t$cond, $dst", [(brcond IntRegs:$cond, bb:$dst)], InstFormatAdr> {
    let Opcode = 0x83;
    bits<32> dst;
    let isTerminator = 1;
    let isBranch = 1;
    let isBarrier = 1;
}

// Pseudo instructions

// Target-independent type requirements, but with target-specific formats.
def SDT_CallSeqStart : SDCallSeqStart<[SDTCisVT<0, i32>,
                                       SDTCisVT<1, i32>]>;
def SDT_CallSeqEnd   : SDCallSeqEnd<[SDTCisVT<0, i32>,
                                     SDTCisVT<1, i32>]>;

// Target-independent nodes, but with target-specific formats.
def callseq_start : SDNode<"ISD::CALLSEQ_START", SDT_CallSeqStart,
                           [SDNPHasChain, SDNPOutGlue]>;
def callseq_end   : SDNode<"ISD::CALLSEQ_END", SDT_CallSeqEnd,
                           [SDNPHasChain, SDNPOptInGlue, SDNPOutGlue]>;

let Defs = [SP], Uses = [SP] in {
def ADJCALLSTACKDOWN : ZEEPseudo<(outs), (ins i32imm:$amt1, i32imm:$amt2),
                                  "!ADJCALLSTACKDOWN $amt1",
                                  [(callseq_start timm:$amt1, timm:$amt2)]>;
def ADJCALLSTACKUP   : ZEEPseudo<(outs), (ins i32imm:$amt1, i32imm:$amt2),
                                  "!ADJCALLSTACKUP $amt1",
                                  [(callseq_end timm:$amt1, timm:$amt2)]>;
}






/*
def SDT_ZEECmp          : SDTypeProfile<0, 2, [SDTCisSameAs<0, 1>]>;
def ZEEcmp     : SDNode<"ZEEISD::CMP", SDT_ZEECmp, [SDNPOutGlue]>;

class CMP_Inst<bits<8> op, string opstr>
    : ZEEInstFormReg<op, (outs),
                        (ins IntRegs:$r1, IntRegs:$r2),
                        !strconcat(opstr, "\t$r1, $r2"),
                        [(ZEEcmp IntRegs:$r1, IntRegs:$r2)]> {
}

def CMP  : CMP_Inst<0b01010000, "cmp">;

class CMP_Inst_RI<bits<8> op, string opstr>
    : ZEEInstFormReg<op, (outs),
                        (ins IntRegs:$r1, i32imm:$const),
                        !strconcat(opstr, "\t$r1, $const"),
                        [(ZEEcmp IntRegs:$r1, immSExt32:$r2)]> {
}

def CMPri  : CMP_Inst<0b01010001, "cmpri">;
*/
