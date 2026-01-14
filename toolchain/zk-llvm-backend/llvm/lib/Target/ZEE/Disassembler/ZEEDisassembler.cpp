//===-- ZEEDisassembler.cpp - Disassembler for ZEE ------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file implements the ZEEDisassembler class.
//
//===----------------------------------------------------------------------===//

#include "MCTargetDesc/ZEEMCTargetDesc.h"
#include "TargetInfo/ZEETargetInfo.h"
#include "llvm/CodeGen/Register.h"
#include "llvm/MC/MCContext.h"
#include "llvm/MC/MCDisassembler/MCDisassembler.h"
#include "llvm/MC/MCFixedLenDisassembler.h"
#include "llvm/MC/MCInst.h"
#include "llvm/MC/MCRegisterInfo.h"
#include "llvm/MC/MCSubtargetInfo.h"
#include "llvm/Support/Endian.h"
#include "llvm/Support/TargetRegistry.h"

using namespace llvm;

#define DEBUG_TYPE "zee-disassembler"

typedef MCDisassembler::DecodeStatus DecodeStatus;

namespace {
// NOTE llvm/include/llvm/MC/MCDisassembler/MCDisassembler.h
// NOTE llvm/lib/MC/MCDisassembler/MCDisassembler.cpp
class ZEEDisassembler : public MCDisassembler {

public:
  ZEEDisassembler(const MCSubtargetInfo &STI, MCContext &Ctx)
      : MCDisassembler(STI, Ctx) {}

  DecodeStatus getInstruction(MCInst &Instr, uint64_t &Size,
                              ArrayRef<uint8_t> Bytes, uint64_t Address,
                              raw_ostream &CStream) const override;
};
} // end anonymous namespace

static MCDisassembler *createZEEDisassembler(const Target &T,
                                                const MCSubtargetInfo &STI,
                                                MCContext &Ctx) {
  return new ZEEDisassembler(STI, Ctx);
}

extern "C" void LLVMInitializeZEEDisassembler() {
  // Register the disassembler for each target.
  TargetRegistry::RegisterMCDisassembler(getTheZEETarget(),
                                         createZEEDisassembler);
}

static const Register IntRegsDecoderTable[] = {
  ZEE::GR0,  ZEE::GR1,  ZEE::GR2,  ZEE::GR3,
  ZEE::GR4,  ZEE::GR5,  ZEE::GR6,  ZEE::SP
};

static DecodeStatus DecodeIntRegsRegisterClass(MCInst &Inst, uint64_t RegNo,
                                               uint64_t Address,
                                               const void *Decoder) {
  if (RegNo > array_lengthof(IntRegsDecoderTable))
    return MCDisassembler::Fail;

  // We must define our own mapping from RegNo to register identifier.
  // Accessing index RegNo in the register class will work in the case that
  // registers were added in ascending order, but not in general.
  Register Reg = IntRegsDecoderTable[RegNo];
  Inst.addOperand(MCOperand::createReg(Reg));
  return MCDisassembler::Success;
}

// Forward declarations for decode helpers referenced by the generated tables.
static DecodeStatus DecodeMem(MCInst &Inst, uint64_t RegNo, uint64_t Address,
                              const void *Decoder);
static DecodeStatus DecodeCallTarget(MCInst &Inst, uint64_t RegNo,
                                     uint64_t Address, const void *Decoder);

#include "ZEEGenDisassemblerTables.inc"

static DecodeStatus DecodeMem(MCInst &Inst, uint64_t RegNo,
                              uint64_t Address,
                              const void *Decoder) {
    // TODO: decode operands for load/store instructions.
    return MCDisassembler::Success;
}

static DecodeStatus DecodeCallTarget(MCInst &Inst, uint64_t RegNo,
                                     uint64_t Address,
                                     const void *Decoder) {
    // TODO: decode operands for call instructions.
    return MCDisassembler::Success;
}

DecodeStatus ZEEDisassembler::getInstruction(MCInst &MI, uint64_t &Size,
                                                ArrayRef<uint8_t> Bytes,
                                                uint64_t Address,
                                                raw_ostream &OS) const {
  uint32_t Insn;
  DecodeStatus Result;

  Insn = support::endian::read32le(Bytes.data());
  Result = decodeInstruction(DecoderTableZEE32, MI, Insn, Address, this, STI);
  Size = 4;

  return Result;
}
