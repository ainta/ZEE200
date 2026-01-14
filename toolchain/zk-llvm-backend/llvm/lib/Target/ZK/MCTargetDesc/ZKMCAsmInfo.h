//===-- ZKMCAsmInfo.h - ZK asm properties --------------------*- C++ -*--===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file contains the declaration of the ZKMCAsmInfo class.
//
//===----------------------------------------------------------------------===//

#ifndef ZKTARGETASMINFO_H
#define ZKTARGETASMINFO_H

#include "llvm/MC/MCAsmInfoELF.h"

namespace llvm {
	class Triple;

	class ZKMCAsmInfo : public MCAsmInfoELF {
		virtual void anchor();

	public:
		explicit ZKMCAsmInfo(const Triple &TT);
	};

} // namespace llvm

#endif
