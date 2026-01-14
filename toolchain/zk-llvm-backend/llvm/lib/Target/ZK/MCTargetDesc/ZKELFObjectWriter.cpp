//===-- ZKELFObjectWriter.cpp - ZK ELF Writer ---------------------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//

#include "MCTargetDesc/ZKMCTargetDesc.h"

#include "llvm/BinaryFormat/ELF.h"
#include "llvm/MC/MCObjectWriter.h"

#include "llvm/MC/MCELFObjectWriter.h"
#include "llvm/MC/MCFixup.h"
#include "llvm/Support/ErrorHandling.h"

using namespace llvm;

namespace {
	class ZKELFObjectWriter : public MCELFObjectTargetWriter {
	public:
		ZKELFObjectWriter(uint8_t OSABI);

		virtual ~ZKELFObjectWriter();

		unsigned getRelocType(MCContext &Ctx, const MCValue &Target,
							  const MCFixup &Fixup, bool IsPCRel) const override;
    };
}

ZKELFObjectWriter::ZKELFObjectWriter(uint8_t OSABI)
    : MCELFObjectTargetWriter(/*Is64Bit*/ false, OSABI,
                              /*ELF::EM_ZK*/ ELF::EM_ZK,
                              /*HasRelocationAddend*/ false) {}

ZKELFObjectWriter::~ZKELFObjectWriter() {}

unsigned ZKELFObjectWriter::getRelocType(MCContext &Ctx,
										 const MCValue &Target,
										 const MCFixup &Fixup,
										 bool IsPCRel) const {
	llvm_unreachable("ZKELFObjectWriter: invalid fixup kind");
}

std::unique_ptr<MCObjectTargetWriter>
llvm::createZKELFObjectWriter(uint8_t OSABI) {
	return std::make_unique<ZKELFObjectWriter>(OSABI);
}
