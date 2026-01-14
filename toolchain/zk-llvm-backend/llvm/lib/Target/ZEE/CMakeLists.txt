set(LLVM_TARGET_DEFINITIONS ZEE.td)

tablegen(LLVM ZEEGenAsmMatcher.inc -gen-asm-matcher)
tablegen(LLVM ZEEGenAsmWriter.inc -gen-asm-writer)
tablegen(LLVM ZEEGenCallingConv.inc -gen-callingconv)
#tablegen(LLVM ZEEGenCompressInstEmitter.inc -gen-compress-inst-emitter)
tablegen(LLVM ZEEGenDAGISel.inc -gen-dag-isel)
tablegen(LLVM ZEEGenDisassemblerTables.inc -gen-disassembler)
tablegen(LLVM ZEEGenGlobalISel.inc -gen-global-isel)
tablegen(LLVM ZEEGenInstrInfo.inc -gen-instr-info)
tablegen(LLVM ZEEGenMCCodeEmitter.inc -gen-emitter)
tablegen(LLVM ZEEGenMCPseudoLowering.inc -gen-pseudo-lowering)
tablegen(LLVM ZEEGenRegisterBank.inc -gen-register-bank)
tablegen(LLVM ZEEGenRegisterInfo.inc -gen-register-info)
tablegen(LLVM ZEEGenSubtargetInfo.inc -gen-subtarget)
#tablegen(LLVM ZEEGenSystemOperands.inc -gen-searchable-tables)

add_public_tablegen_target(ZEECommonTableGen)

add_llvm_target(ZEECodeGen
  ZEEAsmPrinter.cpp
  ZEEFrameLowering.cpp
  ZEEISelDAGToDAG.cpp
  ZEEISelLowering.cpp
  ZEEInstrInfo.cpp
  ZEEMCInstLower.cpp
  ZEERegisterInfo.cpp
  ZEESubtarget.cpp
  ZEETargetMachine.cpp
  ZEETargetObjectFile.cpp
  )

# TODO: skip AsmParser for now.
#add_subdirectory(AsmParser)
add_subdirectory(Disassembler)
add_subdirectory(MCTargetDesc)
add_subdirectory(TargetInfo)
