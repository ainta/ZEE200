//=- ZEEVMachineFunctionInfo.h - ZEE machine function info -*- C++ -*-=//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file declares ZEE-specific per-machine-function information.
//
//===----------------------------------------------------------------------===//

#ifndef LLVM_LIB_TARGET_ZEE_ZEEMACHINEFUNCTIONINFO_H
#define LLVM_LIB_TARGET_ZEE_ZEEMACHINEFUNCTIONINFO_H

#include "llvm/CodeGen/MachineFrameInfo.h"
#include "llvm/CodeGen/MachineFunction.h"

namespace llvm {

	class ZEEMachineFunctionInfo : public MachineFunctionInfo {
		
		// VarArgsFrameIndex - FrameIndex for start of varargs area.
		int VarArgsFrameIndex;

	public:
		ZEEMachineFunctionInfo(MachineFunction &MF) {}

		int getVarArgsFrameIndex() const { return VarArgsFrameIndex; }
		void setVarArgsFrameIndex(int Index) { VarArgsFrameIndex = Index; }
		
	};

} // end namespace llvm

#endif // LLVM_LIB_TARGET_ZEE_ZEEMACHINEFUNCTIONINFO_H
