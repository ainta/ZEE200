set(LLVM_TARGET_DEFINITIONS ZK.td)

tablegen(LLVM ZKGenRegisterInfo.inc -gen-register-info)
tablegen(LLVM ZKGenInstrInfo.inc -gen-instr-info)
tablegen(LLVM ZKGenCallingConv.inc -gen-callingconv)
tablegen(LLVM ZKGenMCCodeEmitter.inc -gen-emitter)

add_public_tablegen_target(ZKCommonTableGen)

add_llvm_target(ZKCodeGen
  ZKTargetMachine.cpp

  )

#add_subdirectory(InstPrinter)
add_subdirectory(TargetInfo)
add_subdirectory(MCTargetDesc)
