//===-- ZEEAsmPrinter.cpp - ZEE LLVM assembly writer --------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file contains a printer that converts from our internal representation
// of machine-dependent LLVM code to the ZEE assembly language.
//
//===----------------------------------------------------------------------===//

#include "ZEE.h"
#include "MCTargetDesc/ZEEInstPrinter.h"
#include "MCTargetDesc/ZEEMCExpr.h"
#include "ZEETargetMachine.h"
#include "TargetInfo/ZEETargetInfo.h"
#include "llvm/CodeGen/AsmPrinter.h"
#include "llvm/CodeGen/MachineConstantPool.h"
#include "llvm/CodeGen/MachineFunctionPass.h"
#include "llvm/CodeGen/MachineInstr.h"
#include "llvm/CodeGen/MachineModuleInfo.h"
#include "llvm/MC/MCAsmInfo.h"
#include "llvm/MC/MCInst.h"
#include "llvm/MC/MCStreamer.h"
#include "llvm/MC/MCSymbol.h"
#include "llvm/Support/TargetRegistry.h"
#include "llvm/Support/raw_ostream.h"

#include <iostream>

using namespace llvm;

#define DEBUG_TYPE "asm-printer"

namespace {
class ZEEAsmPrinter : public AsmPrinter {
public:
  explicit ZEEAsmPrinter(TargetMachine &TM,
                            std::unique_ptr<MCStreamer> Streamer)
      : AsmPrinter(TM, std::move(Streamer)) {}

  StringRef getPassName() const override { return "ZEE Assembly Printer"; }

  void EmitInstruction(const MachineInstr *MI) override;

  void printOperand(const MachineInstr *MI, int OpNum, raw_ostream &O);	

  bool PrintAsmOperand(const MachineInstr *MI, unsigned OpNo,
                       const char *ExtraCode, raw_ostream &O) override;

#if 0
  bool PrintAsmMemoryOperand(const MachineInstr *MI, unsigned OpNo,
                             const char *ExtraCode, raw_ostream &OS) override;

  void EmitToStreamer(MCStreamer &S, const MCInst &Inst);
#endif
};
}

void ZEEAsmPrinter::printOperand(const MachineInstr *MI, int OpNum,
                                   raw_ostream &O) {
  const MachineOperand &MO = MI->getOperand(OpNum);

  switch (MO.getType()) {
  case MachineOperand::MO_Register:
	  O << "%" << ZEEInstPrinter::getRegisterName(MO.getReg());
    break;

  case MachineOperand::MO_Immediate:
    O << MO.getImm();
    break;

  case MachineOperand::MO_MachineBasicBlock:
    O << *MO.getMBB()->getSymbol();
    break;

  case MachineOperand::MO_GlobalAddress:
    O << *getSymbol(MO.getGlobal());
    break;

  case MachineOperand::MO_BlockAddress: {
    MCSymbol *BA = GetBlockAddressSymbol(MO.getBlockAddress());
    O << BA->getName();
    break;
  }

  case MachineOperand::MO_ExternalSymbol:
    O << *GetExternalSymbolSymbol(MO.getSymbolName());
    break;

  case MachineOperand::MO_JumpTableIndex:
    O << MAI->getPrivateGlobalPrefix() << "JTI" << getFunctionNumber() << '_'
      << MO.getIndex();
    break;

  case MachineOperand::MO_ConstantPoolIndex:
    O << MAI->getPrivateGlobalPrefix() << "CPI" << getFunctionNumber() << '_'
      << MO.getIndex();
    return;

  default:
    llvm_unreachable("<unknown operand type>");
  }
}

// NOTE: defined in lib/CodeGen/AsmPrinter/AsmPrinter.cpp
#if 0
void ZEEAsmPrinter::EmitToStreamer(MCStreamer &S, const MCInst &Inst) {
}
#endif

void ZEEAsmPrinter::EmitInstruction(const MachineInstr *MI) {
  // TODO: confirm this implementation is sufficient.
  MCInst TmpInst;
  LowerZEEMachineInstrToMCInst(MI, TmpInst, *this);
  EmitToStreamer(*OutStreamer, TmpInst);
}

// NOTE: defined in llvm/lib/CodeGen/AsmPrinter/AsmPrinterInlineAsm.cpp
// For inline assembly support.
bool ZEEAsmPrinter::PrintAsmOperand(const MachineInstr *MI, unsigned OpNo,
									   const char *ExtraCode, raw_ostream &OS) {


	std::cout << "DEBUG in PrintAsmOperand" << std::endl;
	
	// Does this asm operand have a single letter operand modifier?
	if (ExtraCode && ExtraCode[0]) {
		if (ExtraCode[1])
			return true; // Unknown modifier.

		switch (ExtraCode[0]) {
			// The highest-numbered register of a pair.
		case 'H': {
			if (OpNo == 0)
				return true;
			const MachineOperand &FlagsOP = MI->getOperand(OpNo - 1);
			if (!FlagsOP.isImm())
				return true;
			unsigned Flags = FlagsOP.getImm();
			unsigned NumVals = InlineAsm::getNumOperandRegisters(Flags);
			if (NumVals != 2)
				return true;
			unsigned RegOp = OpNo + 1;
			if (RegOp >= MI->getNumOperands())
				return true;
			const MachineOperand &MO = MI->getOperand(RegOp);
			if (!MO.isReg())
				return true;
			Register Reg = MO.getReg();
			OS << "%" << ZEEInstPrinter::getRegisterName(Reg);
			return false;
		}
		default:
			return AsmPrinter::PrintAsmOperand(MI, OpNo, ExtraCode, OS);
		}
	}
	printOperand(MI, OpNo, OS);
	return false;
}

// NOTE: defined in llvm/lib/CodeGen/AsmPrinter/AsmPrinterInlineAsm.cpp
#if 0
// For inline assembly support.
bool ZEEAsmPrinter::PrintAsmMemoryOperand(const MachineInstr *MI,
                                            unsigned OpNo,
                                            const char *ExtraCode,
                                            raw_ostream &OS) {
}
#endif

// Force static initialization.
extern "C" void LLVMInitializeZEEAsmPrinter() {
  RegisterAsmPrinter<ZEEAsmPrinter> X(getTheZEETarget());
}
