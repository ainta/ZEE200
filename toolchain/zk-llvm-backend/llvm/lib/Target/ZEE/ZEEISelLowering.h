//===-- ZEEISelLowering.h - ZEE DAG Lowering Interface --*- C++ -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file defines the interfaces that ZEE uses to lower LLVM code into a
// selection DAG.
//
//===----------------------------------------------------------------------===//

#ifndef LLVM_LIB_TARGET_ZEE_ZEEISELLOWERING_H
#define LLVM_LIB_TARGET_ZEE_ZEEISELLOWERING_H

#include "ZEE.h"
#include "llvm/CodeGen/SelectionDAG.h"
#include "llvm/CodeGen/TargetLowering.h"

namespace llvm {
class ZEESubtarget;
namespace ZEEISD {
enum NodeType : unsigned {
  FIRST_NUMBER = ISD::BUILTIN_OP_END,
  Add,
  Sub,
  Call,
  Ret,
  CMP,
  
  LT,
  LTE,
  GT,
  GTE,
  EQ,
  NEQ,
  
  ULT,
  ULTE,
  UGT,
  UGTE,
  
  RET_FLAG,
  LOAD_SYM,
};
}

class ZEETargetLowering : public TargetLowering {
  const ZEESubtarget &Subtarget;

public:
  explicit ZEETargetLowering(const TargetMachine &TM,
                               const ZEESubtarget &STI);

  // Provide custom lowering hooks for some operations.
  SDValue LowerOperation(SDValue Op, SelectionDAG &DAG) const override;

  SDValue LowerBR_CC(SDValue Op, SelectionDAG &DAG) const;	
  SDValue LowerSETCC(SDValue Op, SelectionDAG &DAG) const;	
  SDValue LowerSELECT(SDValue Op, SelectionDAG &DAG) const;	
  SDValue LowerVASTART(SDValue Op, SelectionDAG &DAG) const;
  SDValue LowerSHL_PARTS(SDValue Op, SelectionDAG &DAG) const;
  SDValue LowerSRL_PARTS(SDValue Op, SelectionDAG &DAG) const;
	
  // This method returns the name of a target specific DAG node.
  const char *getTargetNodeName(unsigned Opcode) const override;
  MachineBasicBlock *
  EmitInstrWithCustomInserter(MachineInstr &MI,
                              MachineBasicBlock *BB) const override;

	// inline assembly

	Register getRegisterByName(const char *RegName, LLT VT,
							   const MachineFunction &MF) const override;
	std::pair<unsigned, const TargetRegisterClass *>
	getRegForInlineAsmConstraint(const TargetRegisterInfo *TRI,
								 StringRef Constraint, MVT VT) const override;
	ConstraintWeight
	getSingleConstraintMatchWeight(AsmOperandInfo &Info,
								   const char *Constraint) const override;
	void LowerAsmOperandForConstraint(SDValue Op, std::string &Constraint,
									  std::vector<SDValue> &Ops,
									  SelectionDAG &DAG) const override;

	/*
	bool isLegalAddressingMode(const DataLayout &DL, const AddrMode &AM,
                               Type *Ty, unsigned AS) const override;
	*/

    EVT getSetCCResultType(const DataLayout &DL, LLVMContext &Context,
                           EVT VT) const override;
	
private:
  // Lower incoming arguments, copy physregs into vregs
  SDValue LowerFormalArguments(SDValue Chain, CallingConv::ID CallConv,
                               bool IsVarArg,
                               const SmallVectorImpl<ISD::InputArg> &Ins,
                               const SDLoc &DL, SelectionDAG &DAG,
                               SmallVectorImpl<SDValue> &InVals) const override;
  SDValue LowerReturn(SDValue Chain, CallingConv::ID CallConv, bool IsVarArg,
                      const SmallVectorImpl<ISD::OutputArg> &Outs,
                      const SmallVectorImpl<SDValue> &OutVals, const SDLoc &DL,
                      SelectionDAG &DAG) const override;
  SDValue LowerCall(TargetLowering::CallLoweringInfo &CLI,
                    SmallVectorImpl<SDValue> &InVals) const override;
  SDValue LowerCallResult(SDValue Chain, SDValue InFlag,
                          CallingConv::ID CallConv, bool isVarArg,
                          const SmallVectorImpl<ISD::InputArg> &Ins,
                          const SDLoc &dl, SelectionDAG &DAG,
                          SmallVectorImpl<SDValue> &InVals) const;
  // LowerGlobalAddress - Emit a constant load to the global address.
  SDValue LowerGlobalAddress(SDValue Op, SelectionDAG &DAG) const;
};
}

#endif
