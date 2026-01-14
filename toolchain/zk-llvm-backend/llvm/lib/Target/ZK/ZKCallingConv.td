// ZK Return Value Calling Convention
def RetCC_ZK : CallingConv<[
  // Promote i8/i16 arguments to i32.
  CCIfType<[i8, i16], CCPromoteToType<i32>>,

  // i32 are returned in registers R24-31
  CCIfType<[i32], CCAssignToReg<[R24, R25, R26, R27, R28, R29, R30, R31]>>,

  CCIfType<[i32], CCAssignToStack<4, 4>>
]>;

// ZK Calling Convention
def CC_ZK : CallingConv<[
  // Call by Value
  CCIfByVal<CCPassByVal<4, 4>>,

  CCIfType<[i8, i16], CCPromoteToType<i32>>,

  CCIfType<[i32], CCAssignToReg<[R4, R5, R6, R7, R8]>>,

  CCIfType<[i32], CCAssignToStack<4, 4>>
]>;

def CC_Save : CalleeSavedRegs<(add SP, PC, R0, R1, R2, R3, R9, R10, R11, R12, R13,
                               R14, R15, R16, R17, R18, R19, R20, R21, R22, R23)>;