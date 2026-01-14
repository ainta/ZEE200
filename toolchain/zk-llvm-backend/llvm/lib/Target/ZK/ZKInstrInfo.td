include "ZKInstrFormats.td"

//----------------------------------------------------------------------------
// TODO: Type Profiles
//----------------------------------------------------------------------------

//----------------------------------------------------------------------------
// TODO: ZK Specific Node Definitions
//----------------------------------------------------------------------------

//----------------------------------------------------------------------------
// ZK Operand Definitions
//----------------------------------------------------------------------------

def ZKimm16 : Operand<i32>, ImmLeaf<i32, [{
    return Imm >= -32768 && Imm < 32768;
}]>;

def ZKimm32 : Operand<i32>, ImmLeaf<i32, [{
    return Imm >= -2147483648 && Imm < 2147483648;
}]>;

// TODO: may not need?
def memsrc : Operand<i32>
{
    let PrintMethod = "printMemSrcOperand";
    let EncoderMethod = "getMemSrcValue";
    let MIOperandInfo = (ops GPRegs, ZKimm16);
}

def memptr : Operand<iPTR>
{
    let PrintMethod = "printMemSrcOperand";
    let EncoderMethod = "getMemSrcValue";
    let MIOperandInfo = (ops GPRegs, ZKimm16);
}

def jmptarget : Operand<OtherVT>
{
    let PrintMethod = "printPCRelImmOperand";
}

def cc : Operand<i32>
{
    let PrintMethod = "printCCOperand";
}

//----------------------------------------------------------------------------
// ALU Instructions
// ADD, SUB, MUL, DIV(?), AND, XOR, OR(?)
// ??? EQL, GT, LT, LTE
//----------------------------------------------------------------------------

multiclass ALU<bits<5> opcode, string opstr, SDNode opnode>
{

    def rr : ALU_Inst_RR<opcode, (outs GPRegs:$ri),
                         (ins GPRegs:$rj, GPRegs:$rk),
                         !strconcat(opstr, "\t$ri, $rj, $rk"),
                         [(set GPRegs:$ri, (opnode GPRegs:$rj, GPRegs:$rk))]>
    {}

    def ri : ALU_Inst_RI<opcode, (outs GPRegs:$ri),
                         (ins GPRegs:$rj, ZKimm32:$const),
                         !strconcat(opstr, "\t$ri, $rj, $const"),
                         [(set GPRegs:$ri, (opnode GPRegs:$rj, ZKimm32:$const))]>
    {}

}

defm ADD : ALU<0b00001, "ADD", add>;
defm SUB : ALU<0b00010, "SUB", sub>;
defm MUL : ALU<0b00011, "MUL", mul>;

//----------------------------------------------------------------------------
// Data Transfer Instruction
// MOVE
//----------------------------------------------------------------------------

// TODO

//----------------------------------------------------------------------------
// Load/Store Instructions
// LOAD, STORE
//----------------------------------------------------------------------------

// TODO

//----------------------------------------------------------------------------
// Flow Control Instructions
// BEQZ, JUMP
//----------------------------------------------------------------------------

// TODO

//----------------------------------------------------------------------------
// Input Output Instructions
// INPUT, OUTPUT (tapes)
//----------------------------------------------------------------------------

// TODO

//----------------------------------------------------------------------------
// Other Instructions
// HALT, SKIP
//----------------------------------------------------------------------------

// TODO

