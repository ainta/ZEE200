//===-- ZKAsmBackend.cpp - ZK Assembler Backend -------------------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//

#include "MCTargetDesc/ZKMCTargetDesc.h"
#include "llvm/MC/MCAsmBackend.h"
#include "llvm/MC/MCAssembler.h"
#include "llvm/MC/MCDirectives.h"
#include "llvm/MC/MCELFObjectWriter.h"
#include "llvm/MC/MCFixupKindInfo.h"
#include "llvm/MC/MCObjectWriter.h"
#include "llvm/MC/MCSubtargetInfo.h"
#include "llvm/MC/MCExpr.h"
#include "llvm/MC/MCSymbol.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/raw_ostream.h"

using namespace llvm;

namespace {
	class ZKAsmBackend : public MCAsmBackend {
		uint8_t OSABI;
		Triple::OSType OSType;

		public:
		ZKAsmBackend(const Target &T, Triple::OSType OST)
			: MCAsmBackend(support::big), OSType(OST) {}

		~ZKAsmBackend() {}

		std::unique_ptr<MCObjectTargetWriter>
		createObjectTargetWriter() const override;

		unsigned getNumFixupKinds() const override {
			return 1;
		}

		void applyFixup(const MCAssembler &Asm, const MCFixup &Fixup,
						const MCValue &Target, MutableArrayRef<char> Data,
						uint64_t Value, bool IsResolved,
						const MCSubtargetInfo *STI) const override;

		bool mayNeedRelaxation(const MCInst & /*Inst*/,
							   const MCSubtargetInfo &STI) const override {
			return false;
		}

		bool fixupNeedsRelaxation(const MCFixup &Fixup, uint64_t Value,
								  const MCRelaxableFragment *DF,
								  const MCAsmLayout &Layout) const override {
			return false;
		}

		void relaxInstruction(const MCInst &Inst, const MCSubtargetInfo &STI,
							  MCInst &Res) const override {
			llvm_unreachable("ZKAsmBackend::relaxInstruction() unimplemented");
		}
	
		bool writeNopData(raw_ostream &OS, uint64_t Count) const override;
	};

	bool ZKAsmBackend::writeNopData(raw_ostream &OS, uint64_t Count) const {
		if (Count == 0) return true;
		else return false;
	}


	void ZKAsmBackend::applyFixup(const MCAssembler &Asm, const MCFixup &Fixup,
									 const MCValue &Target,
									 MutableArrayRef<char> Data, uint64_t Value,
									 bool /*IsResolved*/,
									 const MCSubtargetInfo * /*STI*/) const {
		llvm_unreachable("ZKAsmBackend::applyFixup() unimplemented");
		return;
	}

	std::unique_ptr<MCObjectTargetWriter>
	ZKAsmBackend::createObjectTargetWriter() const {
		return createZKELFObjectWriter(MCELFObjectTargetWriter::getOSABI(OSType));
	}

} // end anonymous namespace

MCAsmBackend *llvm::createZKAsmBackend(const Target &T,
									   const MCSubtargetInfo &STI,
									   const MCRegisterInfo & /*MRI*/,
									   const MCTargetOptions & /*Options*/) {
  const Triple &TT = STI.getTargetTriple();
  if (!TT.isOSBinFormatELF())
    llvm_unreachable("OS not supported");

  return new ZKAsmBackend(T, TT.getOS());
}
