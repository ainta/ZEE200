#include "ZKTargetMachine.h"
#include "MCTargetDesc/ZKMCTargetDesc.h"
#include "llvm/CodeGen/Passes.h"
#include "llvm/CodeGen/TargetPassConfig.h"
#include "llvm/CodeGen/TargetLoweringObjectFileImpl.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/PassManager.h"
#include "llvm/Support/TargetRegistry.h"

#include <iostream>


using namespace llvm;

static std::string computeDataLayout(const Triple &TT, StringRef CPU,
                                     const TargetOptions &Options) {
	// Build the data layout
	// http://llvm.org/docs/LangRef.html#data-layout

	std::string dataLayout = "";

	dataLayout += "e"; // Little-endian
	dataLayout += "-m:e"; // ELF style name mangling
	dataLayout += "-p:32:32"; // Set 32-bit pointer size with 32-bit alignment
	dataLayout += "-i1:8:32"; // Align i1 to a 32-bit word
	dataLayout += "-i8:8:32"; // Align i8 to a 32-bit word
	dataLayout += "-i16:16:32"; // Align i16 to a 32-bit word
	dataLayout += "-i64:32"; // Align i64 to a 32-bit word
	dataLayout += "-f64:32"; // Align f64 to a 32-bit word
	dataLayout += "-a:0:32"; // Align aggregates to a 32-bit word
	dataLayout += "-n32"; // Set native integer width to 32-bits

	return dataLayout;
}

static Reloc::Model getEffectiveRelocModel(const Triple &TT,
                                           Optional<Reloc::Model> RM) {
	if (!RM.hasValue())
		// Default relocation model on Darwin is PIC.
		return TT.isOSBinFormatMachO() ? Reloc::PIC_ : Reloc::Static;

	// DynamicNoPIC is only used on darwin.
	if (*RM == Reloc::DynamicNoPIC && !TT.isOSDarwin())
		return Reloc::Static;

	return *RM;
}

ZKTargetMachine::ZKTargetMachine(const Target &T, const Triple &TT,
								 StringRef CPU, StringRef FS,
								 const TargetOptions &Options,
								 Optional<Reloc::Model> RM,
								 Optional<CodeModel::Model> CM,
								 CodeGenOpt::Level OL, bool JIT)
    : LLVMTargetMachine(T, computeDataLayout(TT, CPU, Options), TT, CPU, FS, Options,
						getEffectiveRelocModel(TT, RM),
						getEffectiveCodeModel(CM, CodeModel::Small), OL),
      // Subtarget(TT, CPU, FS, *this),
      TLOF(std::make_unique<TargetLoweringObjectFileELF>()) {
	initAsmInfo();
}

namespace {

// ZK Code Gen Pass Config
	class ZKPassConfig : public TargetPassConfig {
	public:
		
		ZKPassConfig(ZKTargetMachine &TM, PassManagerBase *PM)
			: TargetPassConfig(TM, *PM)
			{}

		ZKTargetMachine &getZKTargetMachine() const {
			return getTM<ZKTargetMachine>();
		}

		bool addInstSelector() override;
		
	};
	
} // namespace

TargetPassConfig *ZKTargetMachine::createPassConfig(PassManagerBase &PM) {
	std::cout << "DEBUG in ZKTargetMachine::createPassConfig" << std::endl;
    return new ZKPassConfig(*this, &PM);
}

// Install an instruction selector pass.
bool ZKPassConfig::addInstSelector()
{
	std::cout << "DEBUG in ZKPassConfig::addInstSelector" << std::endl;
	return false;	
}

// Force static initialization.
extern "C" void LLVMInitializeZKTarget() {
	// Register the target.
	RegisterTargetMachine<ZKTargetMachine> X(getTheZKTarget());
}


