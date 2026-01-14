//===-- ZKMCTargetDesc.h - ZK Target Descriptions -------------*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file provides ZK specific target descriptions.
//
//===----------------------------------------------------------------------===//

#ifndef ZKMCTARGETDESC_H
#define ZKMCTARGETDESC_H

#include "llvm/MC/MCInstrInfo.h"
#include "llvm/MC/MCTargetOptions.h"
#include "llvm/Support/DataTypes.h"

namespace llvm {
	class Target;

	class MCAsmBackend;
	class MCCodeEmitter;
	class MCContext;
	class MCInstrInfo;
	class MCObjectTargetWriter;
	class MCRegisterInfo;
	class MCSubtargetInfo;

	class StringRef;
	class raw_ostream;
	class raw_pwrite_stream;
	class Triple;

	Target &getTheZKTarget();

	MCCodeEmitter *createZKMCCodeEmitter(const MCInstrInfo &MCII,
										  const MCRegisterInfo &MRI,
										  MCContext &Ctx);

	MCAsmBackend *createZKAsmBackend(const Target &T, const MCSubtargetInfo &STI,
									 const MCRegisterInfo &MRI,
									 const MCTargetOptions &Options);


	std::unique_ptr<MCObjectTargetWriter> createZKELFObjectWriter(uint8_t OSABI);

} // End llvm namespace

// Defines symbolic names for ZK registers.
#define GET_REGINFO_ENUM
#include "ZKGenRegisterInfo.inc"

// Defines symbolic names for ZK instructions.
#define GET_INSTRINFO_ENUM
#include "ZKGenInstrInfo.inc"

#endif
