//===-- ZEEELFObjectWriter.cpp - ZEE ELF Writer -------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#include "MCTargetDesc/ZEEFixupKinds.h"
#include "MCTargetDesc/ZEEMCExpr.h"
#include "MCTargetDesc/ZEEMCTargetDesc.h"
#include "llvm/MC/MCELFObjectWriter.h"
#include "llvm/MC/MCFixup.h"
#include "llvm/MC/MCObjectWriter.h"
#include "llvm/Support/ErrorHandling.h"

using namespace llvm;

// NOTE llvm/include/llvm/BinaryFormat/ELF.h
// NOTE llvm/include/llvm/BinaryFormat/ELFRelocs/*.def
// NOTE llvm/lib/MC/MCELFObjectTargetWriter.cpp

namespace {
class ZEEELFObjectWriter : public MCELFObjectTargetWriter {
public:
  ZEEELFObjectWriter(uint8_t OSABI, bool Is64Bit);

  ~ZEEELFObjectWriter() override;

protected:
  unsigned getRelocType(MCContext &Ctx, const MCValue &Target,
                        const MCFixup &Fixup, bool IsPCRel) const override;
};
}

ZEEELFObjectWriter::ZEEELFObjectWriter(uint8_t OSABI, bool Is64Bit)
    : MCELFObjectTargetWriter(Is64Bit, OSABI, ELF::EM_NONE,
                              /*HasRelocationAddend*/ true) {}

ZEEELFObjectWriter::~ZEEELFObjectWriter() {}

unsigned ZEEELFObjectWriter::getRelocType(MCContext &Ctx,
                                            const MCValue &Target,
                                            const MCFixup &Fixup,
                                            bool IsPCRel) const {
  // Determine the type of the relocation
  unsigned Kind = Fixup.getKind();

  switch (Kind) {
  default:
    llvm_unreachable("invalid fixup kind!");
  case ZEE::fixup_zee_24:
    return ELF::R_MIPS_26;
  }
}

std::unique_ptr<MCObjectTargetWriter>
llvm::createZEEELFObjectWriter(uint8_t OSABI, bool Is64Bit) {
  return std::make_unique<ZEEELFObjectWriter>(OSABI, Is64Bit);
}
