include "llvm/Target/Target.td"

include "ZKRegisterInfo.td"
include "ZKCallingConv.td"
include "ZKInstrInfo.td"

def ZKInstrInfo : InstrInfo;

// ZK Processors Supported

class Proc<string Name, list <SubtargetFeature> Features>
    : Processor<Name, NoItineraries, Features>;

def : Proc<"generic", []>;

// Declare the target

def ZK : Target
{
    let InstructionSet = ZKInstrInfo;    
}