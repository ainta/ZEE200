//  opcode
//  ra  - dst
//  rb  - src
//  rc  - src
//  cx  - imm

// TODO: itin?

// Generic ZK Format
// Superclass
class ZKInst<dag outs, dag ins, string asmstr, list<dag> pattern>
    : Instruction
{
    field bits<128> Inst;

    let Namespace = "ZK";
    let Size = 16;
  
    bits<5> Opcode = 0;
    let Inst{127-123} = Opcode;

    let OutOperandList = outs;
    let InOperandList = ins;
    let AsmString = asmstr;
    let Pattern = pattern;

    // let DecoderNamespace = "ZK";
    // field bits<32> SoftFail = 0;
}

class ZKPseudoInst<dag outs, dag ins, string asmstr, list<dag> pattern>
    : ZKInst<outs, ins,asmstr, pattern>
{
    let isPseudo = 1;
    let isCodeGenOnly = 1;
}

//----------------------------------------------------------------------------
// ALU Instructions
// ADD, SUB, MUL, DIV(?), AND, XOR, OR(?)
// ??? EQL, GT, LT, LTE
//----------------------------------------------------------------------------

// ALU r = r + r
class ALU_Inst_RR<bits<5> opcode, dag outs, dag ins, string asmstr, list<dag> pattern>
    : ZKInst<outs, ins, asmstr, pattern>
{
    bits<5> ri; // dst
    bits<5> rj; // src 1
    bits<5> rk; // src 2

    let Opcode = opcode;
    let Inst{95-91} = ri;
    let Inst{63-59} = rj;
    let Inst{31-27} = rk;

    // TODO: initialize other bits to zero?

    let Inst{96} = 0b0; // not immediate mode
}

// ALU r = r + i
class ALU_Inst_RI<bits<5> opcode, dag outs, dag ins, string asmstr, list<dag> pattern>
    : ZKInst<outs, ins, asmstr, pattern>
{
    bits<5> ri; // dst
    bits<5> rj; // src
    bits<32> const; // imm

    let Opcode = opcode;
    let Inst{95-91} = ri;
    let Inst{63-59} = rj;
    let Inst{31-0} = const;

    let Inst{96} = 0b1; // immediate mode
}

//----------------------------------------------------------------------------
// Data Transfer Instructions
// MOVE
//----------------------------------------------------------------------------

// r = r
class DT_Inst_RR<bits<5> opcode, dag outs, dag ins, string asmstr, list<dag> pattern>
    : ZKInst<outs, ins, asmstr, pattern>
{
    bits<5> ri; // dst
    bits<5> rj; // src

    let Opcode = opcode;
    let Inst{95-91} = ri;
    let Inst{63-59} = rj;

    let Inst{96} = 0b0; // not immediate mode    
}

// r = i
class DT_Inst_RI<bits<5> opcode, dag outs, dag ins, string asmstr, list<dag> pattern>
    : ZKInst<outs, ins, asmstr, pattern>
{
    bits<5> ri; // dst
    bits<32> const; // src

    let Opcode = opcode;
    let Inst{95-91} = ri;
    let Inst{31-0} = const;

    let Inst{96} = 0b1; // not immediate mode    
}

//----------------------------------------------------------------------------
// Load/Store Instructions
// LOAD, STORE
//----------------------------------------------------------------------------

class LS_Inst<bits<5> opcode, dag outs, dag ins, string asmstr, list<dag> pattern>
    : ZKInst<outs, ins, asmstr, pattern>
{
    bits<5> ri; // dst/src
    bits<1> control;
    bits<32> addr;

    let Opcode = opcode;
    let Inst{95-91} = ri;
    let Inst{31-0} = addr;
    let Inst{96} = control;    
}

//----------------------------------------------------------------------------
// Flow Control Instructions
// BEQZ, JUMP
//----------------------------------------------------------------------------

class FC_Inst<bits<5> opcode, dag outs, dag ins, string asmstr, list<dag> pattern>
    : ZKInst<outs, ins, asmstr, pattern>
{
    bits<5> ri;
    bits<4> condition;
    bits<1> control;
    bits<32> addr;

    let Opcode = opcode;
    let Inst{95-91} = ri;
    let Inst{63-60} = condition;
    let Inst{59} = 0b0;    
    let Inst{96} = control;
    let Inst{31-0} = addr;
}

//----------------------------------------------------------------------------
// Input Output Instructions
// INPUT, OUTPUT (tapes)
//----------------------------------------------------------------------------

class IO_Inst<bits<5> opcode, dag outs, dag ins, string asmstr, list<dag> pattern>
    : ZKInst<outs, ins, asmstr, pattern>
{
    bits<5> ri;

    let Opcode = opcode;
    let Inst{95-91} = ri;
}    

//----------------------------------------------------------------------------
// Other Instructions
// HALT, SKIP
//----------------------------------------------------------------------------

class O_Inst<bits<5> opcode, dag outs, dag ins, string asmstr, list<dag> pattern>
    : ZKInst<outs, ins, asmstr, pattern>
{
    let Opcode = opcode;    
}