//===-- ZEEISelLowering.cpp - ZEE DAG Lowering Implementation  ----===//
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

#include "ZEEISelLowering.h"
#include "ZEE.h"
#include "ZEEMachineFunctionInfo.h"
#include "ZEERegisterInfo.h"
#include "ZEESubtarget.h"
#include "ZEETargetMachine.h"
#include "MCTargetDesc/ZEEMCTargetDesc.h"
#include "llvm/ADT/SmallSet.h"
#include "llvm/ADT/Statistic.h"
#include "llvm/CodeGen/CallingConvLower.h"
#include "llvm/CodeGen/MachineFrameInfo.h"
#include "llvm/CodeGen/MachineFunction.h"
#include "llvm/CodeGen/MachineInstrBuilder.h"
#include "llvm/CodeGen/MachineRegisterInfo.h"
#include "llvm/CodeGen/SelectionDAGISel.h"
#include "llvm/CodeGen/TargetLoweringObjectFileImpl.h"
#include "llvm/CodeGen/ValueTypes.h"
#include "llvm/IR/DiagnosticInfo.h"
#include "llvm/IR/DiagnosticPrinter.h"
#include "llvm/Support/Debug.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/raw_ostream.h"

#include <iostream>

using namespace llvm;

#define DEBUG_TYPE "zee-lower"

//===----------------------------------------------------------------------===//
//             Formal Arguments Calling Convention Implementation
//===----------------------------------------------------------------------===//

#include "ZEEGenCallingConv.inc"

ZEETargetLowering::ZEETargetLowering(const TargetMachine &TM,
                                           const ZEESubtarget &STI)
    : TargetLowering(TM), Subtarget(STI) {

	// Set up the register classes.
	addRegisterClass(MVT::i32, &ZEE::IntRegsRegClass);

	// Compute derived properties from the register classes.
	computeRegisterProperties(STI.getRegisterInfo());

	setStackPointerRegisterToSaveRestore(ZEE::SP);

	// setLoadExtAction(ISD::SEXTLOAD, MVT::i32, MVT::i8, Promote);

	/*

	  setOperationAction(ISD::EXTLOAD,  MVT::i1,  Promote);
	  setOperationAction(ISD::EXTLOAD,  MVT::i8,  Promote);
	  setOperationAction(ISD::EXTLOAD,  MVT::i16,  Promote);
	  setOperationAction(ISD::ZEXTLOAD, MVT::i1,  Promote);
	  setOperationAction(ISD::ZEXTLOAD, MVT::i8,  Promote);
	  setOperationAction(ISD::ZEXTLOAD, MVT::i16,  Promote);
	  setOperationAction(ISD::SEXTLOAD, MVT::i1,  Promote);
	  setOperationAction(ISD::SEXTLOAD, MVT::i8,  Promote);
	  setOperationAction(ISD::SEXTLOAD, MVT::i16,  Promote);

	*/

	// setTruncStoreAction(MVT::i32, MVT::i16, Expand);

	// setLoadExtAction(ISD::EXTLOAD,  MVT::i32, MVT::i16,  Promote);
	// setLoadExtAction(ISD::ZEXTLOAD, MVT::i32, MVT::i16,  Promote);
	// setLoadExtAction(ISD::SEXTLOAD, MVT::i32, MVT::i16,  Promote);

	// Load extented operations for i1 types must be promoted
	for (MVT VT : MVT::integer_valuetypes()) {
		setLoadExtAction(ISD::EXTLOAD,  VT, MVT::i1,  Promote);
		setLoadExtAction(ISD::ZEXTLOAD, VT, MVT::i1,  Promote);
		setLoadExtAction(ISD::SEXTLOAD, VT, MVT::i1,  Promote);
		// setLoadExtAction(ISD::EXTLOAD,  VT, MVT::i8,  Promote);
		// setLoadExtAction(ISD::ZEXTLOAD, VT, MVT::i8,  Promote);
		// setLoadExtAction(ISD::SEXTLOAD, VT, MVT::i8,  Promote);
		// setLoadExtAction(ISD::EXTLOAD,  VT, MVT::i16,  Promote);
		// setLoadExtAction(ISD::ZEXTLOAD, VT, MVT::i16,  Promote);
		// setLoadExtAction(ISD::SEXTLOAD, VT, MVT::i16,  Promote);
	}

	// setTruncStoreAction(MVT::i32, MVT::i1, Expand);
	// setTruncStoreAction(MVT::i32, MVT::i8, Expand);
	// setTruncStoreAction(MVT::i32, MVT::i16,  Expand);


	setOperationAction(ISD::BR_CC, MVT::i32, Expand);
	setOperationAction(ISD::BR_JT, MVT::Other, Expand);
	setOperationAction(ISD::BRIND, MVT::Other, Expand);
	// setOperationAction(ISD::SELECT, MVT::i32, Custom);
	setOperationAction(ISD::SELECT_CC, MVT::i32, Expand);
	setOperationAction(ISD::SETCC, MVT::i32, Custom);


	setOperationAction(ISD::VASTART, MVT::Other, Custom);
	setOperationAction(ISD::VAARG, MVT::Other, Expand);
	setOperationAction(ISD::VACOPY, MVT::Other, Expand);
	setOperationAction(ISD::VAEND, MVT::Other, Expand);
	

	setOperationAction(ISD::MULHU, MVT::i32, Expand);
	setOperationAction(ISD::MULHS, MVT::i32, Expand);
	setOperationAction(ISD::UMUL_LOHI, MVT::i32, Expand);
	setOperationAction(ISD::SMUL_LOHI, MVT::i32, Expand);

	setOperationAction(ISD::ROTR, MVT::i32, Expand);
	setOperationAction(ISD::ROTL, MVT::i32, Expand);

	setOperationAction(ISD::SHL_PARTS, MVT::i32, Custom);
	setOperationAction(ISD::SRL_PARTS, MVT::i32, Custom);
	setOperationAction(ISD::SRA_PARTS, MVT::i32, Expand);
	
	// setOperationAction(ISD::UDIV, MVT::i32, Expand);
	// setOperationAction(ISD::SDIV, MVT::i32, Expand);
	// setOperationAction(ISD::UREM, MVT::i32, Expand);
	// setOperationAction(ISD::SREM, MVT::i32, Expand);
	/*
	  setOperationAction(ISD::SHL_PARTS, MVT::i32, Expand);
	  setOperationAction(ISD::SRA_PARTS, MVT::i32, Expand);
	  setOperationAction(ISD::SRL_PARTS, MVT::i32, Expand);
	*/

	
	setOperationAction(ISD::DYNAMIC_STACKALLOC, MVT::i32, Expand);

	
	// whether to add shl or not???
	// setOperationAction(ISD::SHL, MVT::i32, Expand);
	
	// TODO: decide whether to support gcc __atomic_* intrinsics.
	setMaxAtomicSizeInBitsSupported(0);

	// Boolean representation type.
	setBooleanContents(ZeroOrOneBooleanContent);

	setOperationAction(ISD::GlobalAddress, MVT::i32, Custom);
}

SDValue ZEETargetLowering::LowerOperation(SDValue Op,
                                             SelectionDAG &DAG) const {

	std::cout << "DEBUG in ISelL::LO" << std::endl;

	switch (Op.getOpcode()) {
	case ISD::SETCC:
		std::cout << "SET_CC" << std::endl;
		return LowerSETCC(Op, DAG);
	case ISD::BR_CC:
		std::cout << "BR_CC" << std::endl;
		return LowerBR_CC(Op, DAG);
    case ISD::SELECT:
		std::cout << "SELECT" << std::endl;
		return LowerSELECT(Op, DAG);
	case ISD::GlobalAddress:
		std::cout << "GBA" << std::endl;
		return LowerGlobalAddress(Op, DAG);
	case ISD::VASTART:
		return LowerVASTART(Op, DAG);
	case ISD::SHL_PARTS:
		return LowerSHL_PARTS(Op, DAG);
	case ISD::SRL_PARTS:
		return LowerSRL_PARTS(Op, DAG);
	default:
		llvm_unreachable("unimplemented operand");
	}

	// Handling for nodes marked as Custom.
	report_fatal_error("unimplemented operand");
	return SDValue();
}

SDValue ZEETargetLowering::LowerSRL_PARTS(SDValue Op,
                                            SelectionDAG &DAG) const {
	MVT VT = Op.getSimpleValueType();
	unsigned VTBits = VT.getSizeInBits();
	SDLoc dl(Op);
	SDValue ShOpLo = Op.getOperand(0);
	SDValue ShOpHi = Op.getOperand(1);
	SDValue ShAmt = Op.getOperand(2);

	// Performs the following for a >> b:
	//   unsigned r_high = a_high >> b;
	//   r_high = (32 - b <= 0) ? 0 : r_high;
	//
	//   unsigned r_low = a_low >> b;
	//   r_low = (32 - b <= 0) ? r_high : r_low;
	//   r_low = (b == 0) ? r_low : r_low | (a_high << (32 - b));
	//   return (unsigned long long)r_high << 32 | r_low;
	// Note: This takes advantage of Lanai's shift behavior to avoid needing to
	// mask the shift amount.

	SDValue Zero = DAG.getConstant(0, dl, MVT::i32);
	SDValue NegatedPlus32 = DAG.getNode(
		ISD::SUB, dl, MVT::i32, DAG.getConstant(VTBits, dl, MVT::i32), ShAmt);
	SDValue SetCC = DAG.getSetCC(dl, MVT::i32, NegatedPlus32, Zero, ISD::SETLE);

	SDValue Hi = DAG.getNode(ISD::SRL, dl, MVT::i32, ShOpHi, ShAmt);
	Hi = DAG.getSelect(dl, MVT::i32, SetCC, Zero, Hi);

	SDValue Lo = DAG.getNode(ISD::SRL, dl, MVT::i32, ShOpLo, ShAmt);
	Lo = DAG.getSelect(dl, MVT::i32, SetCC, Hi, Lo);
	SDValue CarryBits =
		DAG.getNode(ISD::SHL, dl, MVT::i32, ShOpHi, NegatedPlus32);
	SDValue ShiftIsZero = DAG.getSetCC(dl, MVT::i32, ShAmt, Zero, ISD::SETEQ);
	Lo = DAG.getSelect(dl, MVT::i32, ShiftIsZero, Lo,
					   DAG.getNode(ISD::OR, dl, MVT::i32, Lo, CarryBits));

	SDValue Ops[2] = {Lo, Hi};
	return DAG.getMergeValues(Ops, dl);
}


SDValue ZEETargetLowering::LowerSHL_PARTS(SDValue Op,
											 SelectionDAG &DAG) const {
	EVT VT = Op.getValueType();
	unsigned VTBits = VT.getSizeInBits();
	SDLoc dl(Op);
	assert(Op.getNumOperands() == 3 && "Unexpected SHL!");
	SDValue ShOpLo = Op.getOperand(0);
	SDValue ShOpHi = Op.getOperand(1);
	SDValue ShAmt = Op.getOperand(2);

	// Performs the following for (ShOpLo + (ShOpHi << 32)) << ShAmt:
	//   LoBitsForHi = (ShAmt == 0) ? 0 : (ShOpLo >> (32-ShAmt))
	//   HiBitsForHi = ShOpHi << ShAmt
	//   Hi = (ShAmt >= 32) ? (ShOpLo << (ShAmt-32)) : (LoBitsForHi | HiBitsForHi)
	//   Lo = (ShAmt >= 32) ? 0 : (ShOpLo << ShAmt)
	//   return (Hi << 32) | Lo;

	SDValue RevShAmt = DAG.getNode(ISD::SUB, dl, MVT::i32,
								   DAG.getConstant(VTBits, dl, MVT::i32), ShAmt);
	SDValue LoBitsForHi = DAG.getNode(ISD::SRL, dl, VT, ShOpLo, RevShAmt);

	// If ShAmt == 0, we just calculated "(SRL ShOpLo, 32)" which is "undef". We
	// wanted 0, so CSEL it directly.
	SDValue Zero = DAG.getConstant(0, dl, MVT::i32);
	SDValue SetCC = DAG.getSetCC(dl, MVT::i32, ShAmt, Zero, ISD::SETEQ);
	LoBitsForHi = DAG.getSelect(dl, MVT::i32, SetCC, Zero, LoBitsForHi);

	SDValue ExtraShAmt = DAG.getNode(ISD::SUB, dl, MVT::i32, ShAmt,
									 DAG.getConstant(VTBits, dl, MVT::i32));
	SDValue HiBitsForHi = DAG.getNode(ISD::SHL, dl, VT, ShOpHi, ShAmt);
	SDValue HiForNormalShift =
		DAG.getNode(ISD::OR, dl, VT, LoBitsForHi, HiBitsForHi);

	SDValue HiForBigShift = DAG.getNode(ISD::SHL, dl, VT, ShOpLo, ExtraShAmt);

	SetCC = DAG.getSetCC(dl, MVT::i32, ExtraShAmt, Zero, ISD::SETGE);
	SDValue Hi =
		DAG.getSelect(dl, MVT::i32, SetCC, HiForBigShift, HiForNormalShift);

	// Lanai shifts of larger than register sizes are wrapped rather than
	// clamped, so we can't just emit "lo << b" if b is too big.
	SDValue LoForNormalShift = DAG.getNode(ISD::SHL, dl, VT, ShOpLo, ShAmt);
	SDValue Lo = DAG.getSelect(
		dl, MVT::i32, SetCC, DAG.getConstant(0, dl, MVT::i32), LoForNormalShift);

	SDValue Ops[2] = {Lo, Hi};
	return DAG.getMergeValues(Ops, dl);
}


SDValue ZEETargetLowering::LowerVASTART(SDValue Op, SelectionDAG &DAG) const
{
	MachineFunction &MF = DAG.getMachineFunction();
	ZEEMachineFunctionInfo *FuncInfo = MF.getInfo<ZEEMachineFunctionInfo>();

	SDLoc DL(Op);
	SDValue FI = DAG.getFrameIndex(FuncInfo->getVarArgsFrameIndex(),
								   getPointerTy(DAG.getDataLayout()));

	// vastart just stores the address of the VarArgsFrameIndex slot into the
	// memory location argument.
	const Value *SV = cast<SrcValueSDNode>(Op.getOperand(2))->getValue();
	return DAG.getStore(Op.getOperand(0), DL, FI, Op.getOperand(1),
						MachinePointerInfo(SV));
}


SDValue ZEETargetLowering::LowerGlobalAddress(SDValue Op, SelectionDAG& DAG) const
{
	EVT VT = Op.getValueType();
	GlobalAddressSDNode *GlobalAddr = cast<GlobalAddressSDNode>(Op.getNode());

	int64_t Offset = cast<GlobalAddressSDNode>(Op)->getOffset();
	std::cout << "Offset " << Offset << std::endl;
	
	SDValue TargetAddr =
		DAG.getTargetGlobalAddress(GlobalAddr->getGlobal(), Op, MVT::i32, Offset);
	return DAG.getNode(ZEEISD::LOAD_SYM, Op, VT, TargetAddr);
}

SDValue ZEETargetLowering::LowerSELECT(SDValue Op, SelectionDAG &DAG) const {
	SDValue cond = Op.getOperand(0);
	SDValue LHS = Op.getOperand(1);
	SDValue RHS = Op.getOperand(2);
	SDLoc DL(Op);

	return DAG.getNode(ISD::ADD, DL, MVT::i32,
					   cond, cond);
}

SDValue ZEETargetLowering::LowerSETCC(SDValue Op, SelectionDAG &DAG) const {
	SDValue LHS = Op.getOperand(0);
	SDValue RHS = Op.getOperand(1);
	ISD::CondCode CC = cast<CondCodeSDNode>(Op.getOperand(2))->get();
	SDLoc DL(Op);

	// SDValue TargetCC;
	// SDValue Flag = EmitCMP(LHS, RHS, TargetCC, CC, dl, DAG);

	switch (CC) {
	default: llvm_unreachable("Invalid integer condition!");
	case ISD::SETLT:
		return DAG.getNode(ZEEISD::LT, DL, MVT::i32,
						   LHS, RHS);
	case ISD::SETLE:
		return DAG.getNode(ZEEISD::LTE, DL, MVT::i32,
						   LHS, RHS);
	case ISD::SETGT:
		return DAG.getNode(ZEEISD::LT, DL, MVT::i32,
						   RHS, LHS);
	case ISD::SETGE:
		return DAG.getNode(ZEEISD::LTE, DL, MVT::i32,
						   RHS, LHS);
	case ISD::SETULT:
		return DAG.getNode(ZEEISD::ULT, DL, MVT::i32,
						   LHS, RHS);
	case ISD::SETULE:
		return DAG.getNode(ZEEISD::ULTE, DL, MVT::i32,
						   LHS, RHS);
	case ISD::SETUGT:
		return DAG.getNode(ZEEISD::ULT, DL, MVT::i32,
						   RHS, LHS);
	case ISD::SETUGE:
		return DAG.getNode(ZEEISD::ULTE, DL, MVT::i32,
						   RHS, LHS);
	case ISD::SETEQ:
		return DAG.getNode(ZEEISD::EQ, DL, MVT::i32,
						   LHS, RHS);
	case ISD::SETNE:
		return DAG.getNode(ZEEISD::NEQ, DL, MVT::i32,
						   LHS, RHS);
		// TODO: Unsigned CMP?
	}
}

SDValue ZEETargetLowering::LowerBR_CC(SDValue Op, SelectionDAG &DAG) const {
	SDValue Chain = Op.getOperand(0);
	ISD::CondCode CC = cast<CondCodeSDNode>(Op.getOperand(1))->get();
	SDValue LHS   = Op.getOperand(2);
	SDValue RHS   = Op.getOperand(3);
	SDValue Dest  = Op.getOperand(4);
	SDLoc dl  (Op);

	// SDValue TargetCC;
	// SDValue Flag = EmitCMP(LHS, RHS, TargetCC, CC, dl, DAG);

	return DAG.getNode(ZEEISD::CMP, dl, Op.getValueType(),
					   LHS, RHS);
}


// NOTE: declaration in llvm/include/llvm/CodeGen/TargetLowering.h
MachineBasicBlock *
ZEETargetLowering::EmitInstrWithCustomInserter(MachineInstr &MI,
                                                  MachineBasicBlock *BB) const {
	// TODO: confirm if this override is needed.
	std::cout << "DEBUG in ISelL::EIWCI" << std::endl;
	llvm_unreachable("Unexpected instr type to insert");
	return BB;
}

// NOTE: defined in llvm/include/llvm/CodeGen/TargetLowering.h
// Transform physical registers into virtual registers.
SDValue ZEETargetLowering::LowerFormalArguments(
    SDValue Chain, CallingConv::ID CallConv, bool IsVarArg,
    const SmallVectorImpl<ISD::InputArg> &Ins, const SDLoc &DL,
    SelectionDAG &DAG, SmallVectorImpl<SDValue> &InVals) const {
	LLVM_DEBUG(dbgs() << "### LowerFormalArguments\n");

	switch (CallConv) {
	default:
		report_fatal_error("Unsupported calling convention");
	case CallingConv::C:
	case CallingConv::Fast:
		break;
	}

	MachineFunction &MF = DAG.getMachineFunction();
	MachineFrameInfo &MFI = MF.getFrameInfo();
	MachineRegisterInfo &RegInfo = MF.getRegInfo();
	ZEEMachineFunctionInfo *ZEEMFI = MF.getInfo<ZEEMachineFunctionInfo>();

	const Function &Func = MF.getFunction();
	if (Func.hasFnAttribute("interrupt")) {
		if (!Func.arg_empty())
			report_fatal_error(
				"Functions with the interrupt attribute cannot have arguments!");

		StringRef Kind =
			MF.getFunction().getFnAttribute("interrupt").getValueAsString();

		if (!(Kind == "user" || Kind == "supervisor" || Kind == "machine"))
			report_fatal_error(
				"Function interrupt attribute argument not supported!");
	}

	// Assign locations to all of the incoming arguments.
	SmallVector<CCValAssign, 16> ArgLocs;
	CCState CCInfo(CallConv, IsVarArg, MF, ArgLocs, *DAG.getContext());
	CCInfo.AnalyzeFormalArguments(Ins, CC_ZEE);

	for (unsigned i = 0, e = ArgLocs.size(); i != e; ++i) {
		CCValAssign &VA = ArgLocs[i];
		if (VA.isRegLoc()) {
			LLVM_DEBUG(dbgs() << "### LowerFormalArguments Reg\n");
			// Argument passed in a register.
			EVT RegVT = VA.getLocVT();
			// Specify the register class to use.
			const TargetRegisterClass *RC = &ZEE::IntRegsRegClass;
			if (VA.getLocInfo() != CCValAssign::Full) {
				llvm_unreachable("not supported yet");
			}

			// Create a virtual register.
			Register VReg = RegInfo.createVirtualRegister(RC);
			RegInfo.addLiveIn(VA.getLocReg(), VReg);
			SDValue ArgValue = DAG.getCopyFromReg(Chain, DL, VReg, RegVT);
			InVals.push_back(ArgValue);
		} else {
			LLVM_DEBUG(dbgs() << "### LowerFormalArguments Mem\n");
			// Argument passed on the stack.
			assert(VA.isMemLoc());

			unsigned ObjSize = VA.getLocVT().getSizeInBits() / 8;
			int FI = MFI.CreateFixedObject(ObjSize, VA.getLocMemOffset(), true);

			// Create a load to pull the argument from the stack.
			SDValue FIN = DAG.getFrameIndex(FI, MVT::i32);
			InVals.push_back(DAG.getLoad(VA.getLocVT(), DL, Chain, FIN,
										 MachinePointerInfo::getFixedStack(MF, FI)));
		}
	}

	if (IsVarArg) {
		int FI = MFI.CreateFixedObject(4, CCInfo.getNextStackOffset(), true);
		ZEEMFI->setVarArgsFrameIndex(FI);
		// report_fatal_error(
		// 	"VarArg not supported!");
	}

	return Chain;
}

// NOTE: defined in llvm/include/llvm/CodeGen/TargetLowering.h
// Lower a call to a callseq_start + CALL + callseq_end chain, and add input
// and output parameter nodes.
SDValue ZEETargetLowering::LowerCall(CallLoweringInfo &CLI,
										SmallVectorImpl<SDValue> &InVals) const {
	LLVM_DEBUG(dbgs() << "### LowerCall\n");

	// NOTE: derived from AVR lowering.
	SelectionDAG &DAG = CLI.DAG;
	SDLoc &DL = CLI.DL;
	SmallVectorImpl<ISD::OutputArg> &Outs = CLI.Outs;
	SmallVectorImpl<SDValue> &OutVals = CLI.OutVals;
	SmallVectorImpl<ISD::InputArg> &Ins = CLI.Ins;
	SDValue Chain = CLI.Chain;
	SDValue Callee = CLI.Callee;
	bool &isTailCall = CLI.IsTailCall;
	CallingConv::ID CallConv = CLI.CallConv;
	bool isVarArg = CLI.IsVarArg;

	MachineFunction &MF = DAG.getMachineFunction();

	// ZEE does not yet support tail call optimization.
	isTailCall = false;

	// Analyze operands of the call, assigning locations to each operand.
	SmallVector<CCValAssign, 32> ArgLocs;
	CCState CCInfo(CallConv, isVarArg, DAG.getMachineFunction(), ArgLocs,
				   *DAG.getContext());

	// If the callee is a GlobalAddress/ExternalSymbol node (quite common, every
	// direct call is) turn it into a TargetGlobalAddress/TargetExternalSymbol
	// node so that legalize doesn't hack it.
	const Function *F = nullptr;
	if (const GlobalAddressSDNode *G = dyn_cast<GlobalAddressSDNode>(Callee)) {
		const GlobalValue *GV = G->getGlobal();

		F = cast<Function>(GV);
		Callee =
			DAG.getTargetGlobalAddress(GV, DL, getPointerTy(DAG.getDataLayout()));
	} else if (const ExternalSymbolSDNode *ES =
			   dyn_cast<ExternalSymbolSDNode>(Callee)) {
		Callee = DAG.getTargetExternalSymbol(ES->getSymbol(),
											 getPointerTy(DAG.getDataLayout()));
	}

	// NOTE: argument handling during calls
	CCInfo.AnalyzeCallOperands(Outs, CC_ZEE);

	// Get a count of how many bytes are to be pushed on the stack.
	unsigned NumBytes = CCInfo.getNextStackOffset();

	Chain = DAG.getCALLSEQ_START(Chain, NumBytes, 0, DL);

	SmallVector<std::pair<unsigned, SDValue>, 8> RegsToPass;

	// First, walk the register assignments, inserting copies.
	unsigned AI, AE;
	bool HasStackArgs = false;
	for (AI = 0, AE = ArgLocs.size(); AI != AE; ++AI) {
		CCValAssign &VA = ArgLocs[AI];
		EVT RegVT = VA.getLocVT();
		SDValue Arg = OutVals[AI];

		// Promote the value if needed. With Clang this should not happen.
		switch (VA.getLocInfo()) {
		default:
			llvm_unreachable("Unknown loc info!");
		case CCValAssign::Full:
			break;
		case CCValAssign::SExt:
			Arg = DAG.getNode(ISD::SIGN_EXTEND, DL, RegVT, Arg);
			break;
		case CCValAssign::ZExt:
			Arg = DAG.getNode(ISD::ZERO_EXTEND, DL, RegVT, Arg);
			break;
		case CCValAssign::AExt:
			Arg = DAG.getNode(ISD::ANY_EXTEND, DL, RegVT, Arg);
			break;
		case CCValAssign::BCvt:
			Arg = DAG.getNode(ISD::BITCAST, DL, RegVT, Arg);
			break;
		}

		// Stop when we encounter a stack argument, we need to process them
		// in reverse order in the loop below.
		if (VA.isMemLoc()) {
			HasStackArgs = true;
			break;
		}

		// Arguments that can be passed on registers must be kept in the RegsToPass
		// vector.
		RegsToPass.push_back(std::make_pair(VA.getLocReg(), Arg));
	}

	// Second, stack arguments have to walked in reverse order by inserting
	// chained stores, this ensures their order is not changed by the scheduler
	// and that the push instruction sequence generated is correct, otherwise they
	// can be freely intermixed.
	if (HasStackArgs) {
		for (AE = AI, AI = ArgLocs.size(); AI != AE; --AI) {
			unsigned Loc = AI - 1;
			CCValAssign &VA = ArgLocs[Loc];
			SDValue Arg = OutVals[Loc];

			assert(VA.isMemLoc());

			// SP points to one stack slot further so add one to adjust it.
			SDValue PtrOff = DAG.getNode(
				ISD::ADD, DL, getPointerTy(DAG.getDataLayout()),
				DAG.getRegister(ZEE::SP, getPointerTy(DAG.getDataLayout())),
				DAG.getIntPtrConstant(VA.getLocMemOffset(), DL));

			Chain =
				DAG.getStore(Chain, DL, Arg, PtrOff,
							 MachinePointerInfo::getStack(MF, VA.getLocMemOffset()),
							 0);
		}
	}

	// Build a sequence of copy-to-reg nodes chained together with token chain and
	// flag operands which copy the outgoing args into registers.  The InFlag in
	// necessary since all emited instructions must be stuck together.
	SDValue InFlag;
	for (auto Reg : RegsToPass) {
		Chain = DAG.getCopyToReg(Chain, DL, Reg.first, Reg.second, InFlag);
		InFlag = Chain.getValue(1);
	}

	// Returns a chain & a flag for retval copy to use.
	SDVTList NodeTys = DAG.getVTList(MVT::Other, MVT::Glue);
	SmallVector<SDValue, 8> Ops;
	Ops.push_back(Chain);
	Ops.push_back(Callee);

	// Add argument registers to the end of the list so that they are known live
	// into the call.
	for (auto Reg : RegsToPass) {
		Ops.push_back(DAG.getRegister(Reg.first, Reg.second.getValueType()));
	}

	// Add a register mask operand representing the call-preserved registers.
	const TargetRegisterInfo *TRI = Subtarget.getRegisterInfo();
	const uint32_t *Mask =
		TRI->getCallPreservedMask(DAG.getMachineFunction(), CallConv);
	assert(Mask && "Missing call preserved mask for calling convention");
	Ops.push_back(DAG.getRegisterMask(Mask));

	if (InFlag.getNode()) {
		Ops.push_back(InFlag);
	}

	Chain = DAG.getNode(ZEEISD::Call, DL, NodeTys, Ops);
	InFlag = Chain.getValue(1);

	// Create the CALLSEQ_END node.
	Chain = DAG.getCALLSEQ_END(Chain, DAG.getIntPtrConstant(NumBytes, DL, true),
							   DAG.getIntPtrConstant(0, DL, true), InFlag, DL);

	if (!Ins.empty()) {
		InFlag = Chain.getValue(1);
	}

	// Handle result values, copying them out of physregs into vregs that we
	// return.
	return LowerCallResult(Chain, InFlag, CallConv, isVarArg, Ins, DL, DAG,
						   InVals);
}

/// Lower the result values of a call into the
/// appropriate copies out of appropriate physical registers.
///
SDValue ZEETargetLowering::LowerCallResult(
    SDValue Chain, SDValue InFlag, CallingConv::ID CallConv, bool isVarArg,
    const SmallVectorImpl<ISD::InputArg> &Ins, const SDLoc &dl, SelectionDAG &DAG,
    SmallVectorImpl<SDValue> &InVals) const {

	// Assign locations to each value returned by this call.
	SmallVector<CCValAssign, 32> RVLocs;
	CCState CCInfo(CallConv, isVarArg, DAG.getMachineFunction(), RVLocs,
				   *DAG.getContext());

	// Handle runtime calling convs.
	CCInfo.AnalyzeCallResult(Ins, RetCC_ZEE);

	// Copy all of the result registers out of their specified physreg.
	for (CCValAssign const &RVLoc : RVLocs) {
		Chain = DAG.getCopyFromReg(Chain, dl, RVLoc.getLocReg(), RVLoc.getValVT(),
								   InFlag)
			.getValue(1);
		InFlag = Chain.getValue(2);
		InVals.push_back(Chain.getValue(0));
	}

	return Chain;
}

SDValue
ZEETargetLowering::LowerReturn(SDValue Chain, CallingConv::ID CallConv,
								  bool IsVarArg,
								  const SmallVectorImpl<ISD::OutputArg> &Outs,
								  const SmallVectorImpl<SDValue> &OutVals,
								  const SDLoc &DL, SelectionDAG &DAG) const {
	LLVM_DEBUG(dbgs() << "### LowerReturn\n");
	LLVM_DEBUG(Chain->dumpr());

	// TODO: derived from the RISCV implementation.

	// Stores the assignment of the return value to a location.
	SmallVector<CCValAssign, 32> RVLocs;

	// Info about the registers and stack slot.
	CCState CCInfo(CallConv, IsVarArg, DAG.getMachineFunction(), RVLocs,
				   *DAG.getContext());

	CCInfo.AnalyzeReturn(Outs, RetCC_ZEE);

	SDValue Glue;
	SmallVector<SDValue, 4> RetOps(1, Chain);

	// if (RVLocs.size() == 0) RetOps.push_back(DAG.getRegister(ZEE::GR0, EVT()));

	// Copy the result values into the output registers.
	for (unsigned i = 0, e = RVLocs.size(); i < e; ++i) {
		SDValue Val = OutVals[i];
		CCValAssign &VA = RVLocs[i];
		assert(VA.isRegLoc() && "Can only return in registers!");

		// Handle a 'normal' return.
		Chain = DAG.getCopyToReg(Chain, DL, VA.getLocReg(), Val, Glue);

		// Guarantee that all emitted copies are stuck together.
		Glue = Chain.getValue(1);
		RetOps.push_back(DAG.getRegister(VA.getLocReg(), VA.getLocVT()));
	}

	RetOps[0] = Chain; // Update chain.

	// Add the glue node if we have it.
	if (Glue.getNode()) {
		RetOps.push_back(Glue);
	}

	return DAG.getNode(ZEEISD::Ret, DL, MVT::Other, RetOps);
}

// NOTE: defined in llvm/lib/CodeGen/SelectionDAG/TargetLowering.cpp
// Returns node names.
const char *ZEETargetLowering::getTargetNodeName(unsigned Opcode) const {
	switch ((ZEEISD::NodeType)Opcode) {
	case ZEEISD::FIRST_NUMBER:
		break;
	case ZEEISD::Call:
		return "ZEEISD::Call";
	case ZEEISD::Ret:
		return "ZEEISD::Ret";
	case ZEEISD::Add:
		return "ZEEISD::Add";
	case ZEEISD::Sub:
		return "ZEEISD::Sub";
	case ZEEISD::CMP:
		return "ZEEISD::CMP";
	case ZEEISD::LT:
		return "ZEEISD::LT";
	case ZEEISD::LTE:
		return "ZEEISD::LTE";
	case ZEEISD::GT:
		return "ZEEISD::GT";
	case ZEEISD::GTE:
		return "ZEEISD::GTE";
	case ZEEISD::ULT:
		return "ZEEISD::ULT";
	case ZEEISD::ULTE:
		return "ZEEISD::ULTE";
	case ZEEISD::UGT:
		return "ZEEISD::UGT";
	case ZEEISD::UGTE:
		return "ZEEISD::UGTE";
	case ZEEISD::EQ:
		return "ZEEISD::EQ";
	case ZEEISD::NEQ:
		return "ZEEISD::NEQ";
	case ZEEISD::RET_FLAG:
		return "ZEEISD::RET_FLAG";
	case ZEEISD::LOAD_SYM:
		return "ZEEISD::LOAD_SYM";
	}
	return nullptr;
}


//===----------------------------------------------------------------------===//
//                       ZK Inline Assembly Support
//===----------------------------------------------------------------------===//

Register ZEETargetLowering::getRegisterByName(
	const char *RegName, LLT /*VT*/,
	const MachineFunction & /*MF*/) const {

	std::cout << "DEBUG in getRegisterByName" << std::endl;
	
	// Only unallocatable registers should be matched here.
	Register Reg = StringSwitch<unsigned>(RegName)
		.Case("GR0", ZEE::GR0)
		.Case("SP", ZEE::SP)
		.Default(0);

	if (Reg)
		return Reg;
	report_fatal_error("Invalid register name global variable");
}

std::pair<unsigned, const TargetRegisterClass *>
ZEETargetLowering::getRegForInlineAsmConstraint(const TargetRegisterInfo *TRI,
												   StringRef Constraint,
												   MVT VT) const {

	std::cout << "DEBUG in getRegForInlineAsmConstraint" << std::endl;
	
	if (Constraint.size() == 1)
		// GCC Constraint Letters
		switch (Constraint[0]) {
		case 'r': // GENERAL_REGS
			return std::make_pair(0U, &ZEE::IntRegsRegClass);
		default:
			break;
		}

	return TargetLowering::getRegForInlineAsmConstraint(TRI, Constraint, VT);
}

// Examine constraint type and operand type and determine a weight value.
// This object must already have been set up with the operand type
// and the current alternative constraint selected.
TargetLowering::ConstraintWeight
ZEETargetLowering::getSingleConstraintMatchWeight(
    AsmOperandInfo &Info, const char *Constraint) const {

	std::cout << "DEBUG in getSingleConstraintMatchWeight" << std::endl;
	
	ConstraintWeight Weight = CW_Invalid;
	Value *CallOperandVal = Info.CallOperandVal;
	// If we don't have a value, we can't do a match,
	// but allow it at the lowest weight.
	if (CallOperandVal == nullptr)
		return CW_Default;
	// Look at the constraint type.
	switch (*Constraint) {
	case 'I': // signed 16 bit immediate
	case 'J': // integer zero
	case 'K': // unsigned 16 bit immediate
	case 'L': // immediate in the range 0 to 31
	case 'M': // signed 32 bit immediate where lower 16 bits are 0
	case 'N': // signed 26 bit immediate
	case 'O': // integer zero
		if (isa<ConstantInt>(CallOperandVal))
			Weight = CW_Constant;
		break;
	default:
		Weight = TargetLowering::getSingleConstraintMatchWeight(Info, Constraint);
		break;
	}
	return Weight;
}

// LowerAsmOperandForConstraint - Lower the specified operand into the Ops
// vector.  If it is invalid, don't add anything to Ops.
void ZEETargetLowering::LowerAsmOperandForConstraint(
    SDValue Op, std::string &Constraint, std::vector<SDValue> &Ops,
    SelectionDAG &DAG) const {

	std::cout << "DEBUG in LowerASsmOperandForConstraint" << std::endl;
	
	SDValue Result(nullptr, 0);

	// Only support length 1 constraints for now.
	if (Constraint.length() > 1)
		return;

	char ConstraintLetter = Constraint[0];
	switch (ConstraintLetter) {
	case 'I': // Signed 16 bit constant
		// If this fails, the parent routine will give an error
		if (ConstantSDNode *C = dyn_cast<ConstantSDNode>(Op)) {
			if (isInt<16>(C->getSExtValue())) {
				Result = DAG.getTargetConstant(C->getSExtValue(), SDLoc(C),
											   Op.getValueType());
				break;
			}
		}
		return;
	case 'J': // integer zero
	case 'O':
		if (ConstantSDNode *C = dyn_cast<ConstantSDNode>(Op)) {
			if (C->getZExtValue() == 0) {
				Result = DAG.getTargetConstant(0, SDLoc(C), Op.getValueType());
				break;
			}
		}
		return;
	case 'K': // unsigned 16 bit immediate
		if (ConstantSDNode *C = dyn_cast<ConstantSDNode>(Op)) {
			if (isUInt<16>(C->getZExtValue())) {
				Result = DAG.getTargetConstant(C->getSExtValue(), SDLoc(C),
											   Op.getValueType());
				break;
			}
		}
		return;
	case 'L': // immediate in the range 0 to 31
		if (ConstantSDNode *C = dyn_cast<ConstantSDNode>(Op)) {
			if (C->getZExtValue() <= 31) {
				Result = DAG.getTargetConstant(C->getZExtValue(), SDLoc(C),
											   Op.getValueType());
				break;
			}
		}
		return;
	case 'M': // signed 32 bit immediate where lower 16 bits are 0
		if (ConstantSDNode *C = dyn_cast<ConstantSDNode>(Op)) {
			int64_t Val = C->getSExtValue();
			if ((isInt<32>(Val)) && ((Val & 0xffff) == 0)) {
				Result = DAG.getTargetConstant(Val, SDLoc(C), Op.getValueType());
				break;
			}
		}
		return;
	case 'N': // signed 26 bit immediate
		if (ConstantSDNode *C = dyn_cast<ConstantSDNode>(Op)) {
			int64_t Val = C->getSExtValue();
			if ((Val >= -33554432) && (Val <= 33554431)) {
				Result = DAG.getTargetConstant(Val, SDLoc(C), Op.getValueType());
				break;
			}
		}
		return;
	default:
		break; // This will fall through to the generic implementation
	}

	if (Result.getNode()) {
		Ops.push_back(Result);
		return;
	}

	TargetLowering::LowerAsmOperandForConstraint(Op, Constraint, Ops, DAG);
}

EVT ZEETargetLowering::getSetCCResultType(const DataLayout &DL, LLVMContext &,
                                             EVT VT) const {
  if (!VT.isVector())
    return getPointerTy(DL);

  return VT.changeVectorElementTypeToInteger();
}
