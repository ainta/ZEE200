#include "ZKFrameLowering.h"
// #include "ZKInstrInfo.h"
// #include "ZKMachineFunctionInfo.h"
// #include "ZKSubtarget.h"
#include "llvm/CodeGen/MachineFrameInfo.h"
#include "llvm/CodeGen/MachineFunction.h"
#include "llvm/CodeGen/MachineInstrBuilder.h"
#include "llvm/CodeGen/MachineRegisterInfo.h"

using namespace llvm;

ZKFrameLowering::ZKFrameLowering(const ZKSubtarget &STI)
    : TargetFrameLowering(TargetFrameLowering::StackGrowsUp, 
                          /*StackAlignment=*/4,
                          /*LocalAreaOffset=*/0) {}

bool ZKFrameLowering::hasFP(const MachineFunction &MF) const { return true; }

void ZKFrameLowering::emitPrologue(MachineFunction &MF,
									MachineBasicBlock &MBB) const {}

void ZKFrameLowering::emitEpilogue(MachineFunction &MF,
									MachineBasicBlock &MBB) const {}

MachineBasicBlock::iterator
ZKFrameLowering::eliminateCallFramePseudoInstr(MachineFunction &MF,
												MachineBasicBlock &MBB,
    											MachineBasicBlock::iterator I)
	const {
	const ZKInstrInfo &TII =
		*static_cast<const ZKInstrInfo *>(MF.getSubtarget().getInstrInfo());
	unsigned StackAlign = getStackAlignment();

	if (!hasReservedCallFrame(MF)) {
		// If the stack pointer can be changed after prologue, turn the
		// adjcallstackup instruction into a 'sub SP, <amt>' and the
		// adjcallstackdown instruction into 'add SP, <amt>'
		// TODO: consider using push / pop instead of sub + store / add
		MachineInstr &Old = *I;
		uint64_t Amount = Old.getOperand(0).getImm();
		if (Amount != 0) {
			// We need to keep the stack aligned properly.  To do this, we round the
			// amount of space needed for the outgoing arguments up to the next
			// alignment boundary.
			Amount = (Amount+StackAlign-1)/StackAlign*StackAlign;

			MachineInstr *New = nullptr;
			if (Old.getOpcode() == TII.getCallFrameSetupOpcode()) {
				New =
					BuildMI(MF, Old.getDebugLoc(), TII.get(ZK::SUBri), ZK::SP)
					.addReg(ZK::SP)
					.addImm(Amount);
			} else {
				assert(Old.getOpcode() == TII.getCallFrameDestroyOpcode());
				// factor out the amount the callee already popped.
				uint64_t CalleeAmt = Old.getOperand(1).getImm();
				Amount -= CalleeAmt;
				if (Amount)
					New = BuildMI(MF, Old.getDebugLoc(), TII.get(ZK::ADDri),
								  ZK::SP)
						.addReg(ZK::SP)
						.addImm(Amount);
			}

			if (New) {
				// The SRW implicit def is dead.
				New->getOperand(3).setIsDead();

				// Replace the pseudo instruction with a new instruction...
				MBB.insert(I, New);
			}
		}
	} else if (I->getOpcode() == TII.getCallFrameDestroyOpcode()) {
		// If we are performing frame pointer elimination and if the callee pops
		// something off the stack pointer, add it back.
		if (uint64_t CalleeAmt = I->getOperand(1).getImm()) {
			MachineInstr &Old = *I;
			MachineInstr *New =
				BuildMI(MF, Old.getDebugLoc(), TII.get(ZK::SUBri), ZK::SP)
				.addReg(ZK::SP)
				.addImm(CalleeAmt);
			// The SRW implicit def is dead.
			New->getOperand(3).setIsDead();

			MBB.insert(I, New);
		}
	}

	return MBB.erase(I);
}

bool
ZKFrameLowering::spillCalleeSavedRegisters(MachineBasicBlock &MBB,
                                            MachineBasicBlock::iterator MI,
											const std::vector<CalleeSavedInfo> &CSI,
											const TargetRegisterInfo *TRI) const {
	if (CSI.empty())
		return false;

	DebugLoc DL;
	if (MI != MBB.end()) DL = MI->getDebugLoc();

	MachineFunction &MF = *MBB.getParent();
	const TargetInstrInfo &TII = *MF.getSubtarget().getInstrInfo();
	ZKMachineFunctionInfo *MFI = MF.getInfo<ZKMachineFunctionInfo>();
	MFI->setCalleeSavedFrameSize(CSI.size() * 2);

	for (unsigned i = CSI.size(); i != 0; --i) {
		unsigned Reg = CSI[i-1].getReg();
		// Add the callee-saved register as live-in. It's killed at the spill.
		MBB.addLiveIn(Reg);
		BuildMI(MBB, MI, DL, TII.get(ZK::PUSH))
			.addReg(Reg, RegState::Kill);
	}
	return true;
}

bool
ZKFrameLowering::restoreCalleeSavedRegisters(MachineBasicBlock &MBB,
                                              MachineBasicBlock::iterator MI,
											  const std::vector<CalleeSavedInfo> &CSI,
											  const TargetRegisterInfo *TRI) const {
	if (CSI.empty())
		return false;

	DebugLoc DL;
	if (MI != MBB.end()) DL = MI->getDebugLoc();

	MachineFunction &MF = *MBB.getParent();
	const TargetInstrInfo &TII = *MF.getSubtarget().getInstrInfo();

	for (unsigned i = 0, e = CSI.size(); i != e; ++i)
		BuildMI(MBB, MI, DL, TII.get(ZK::POP), CSI[i].getReg());

	return true;
}

bool ZKFrameLowering::hasReservedCallFrame(const MachineFunction &MF) const {
	return !MF.getFrameInfo().hasVarSizedObjects();
}

void ZKFrameLowering::processFunctionBeforeFrameFinalized(MachineFunction &MF,
														   RegScavenger *) const {
	// Create a frame entry for the FP register that must be saved.
	if (hasFP(MF)) {
		int FrameIdx = MF.getFrameInfo().CreateFixedObject(4, -4, true);
		(void)FrameIdx;
		assert(FrameIdx == MF.getFrameInfo().getObjectIndexBegin() &&
			   "Slot for FP register must be last in order to be found!");
	}
}
