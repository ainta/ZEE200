#pragma once

#include <memory>

// Include all gate implementations
#include "base_gate.h"
#include "gate_registry.h"
#include "add32_gate.h"
#include "sub32_gate.h"
#include "mul32_gate.h"
#include "and32_gate.h"
#include "and32i_gate.h"
#include "or32_gate.h"
#include "xor32_gate.h"
#include "or32i_gate.h"
#include "xor32i_gate.h"
#include "eqz_gate.h"
#include "load_gate.h"
#include "store_gate.h"
// #include "rom_gate.h"  // ROM is now accessed via unified RAM
#include "udiv_gate.h"
#include "urem_gate.h"
#include "ult_gate.h"
#include "srli_gate.h"
#include "msb_gate.h"
#include "mul32i_gate.h"
#include "lt_gate.h"
#include "srai_gate.h"
#include "sra_gate.h"
#include "asminput_gate.h"
#include "vmcall_gate.h"
#include "pow2_gate.h"
#include "mod4_gate.h"

// Recursive gates (high-level operations that use other gates)
#include "uloadb_gate.h"
#include "loadb_gate.h"
#include "uloadh_gate.h"
#include "loadh_gate.h"
#include "storeb_gate.h"
#include "storeh_gate.h"

// Implementation of gate registry initialization
inline void GateRegistry::initialize_gates() {
    register_gate(std::unique_ptr<BaseGate>(new Add32Gate()));
    register_gate(std::unique_ptr<BaseGate>(new Sub32Gate()));
    register_gate(std::unique_ptr<BaseGate>(new Mul32Gate()));
    register_gate(std::unique_ptr<BaseGate>(new And32Gate()));
    register_gate(std::unique_ptr<BaseGate>(new And32IGate()));
    register_gate(std::unique_ptr<BaseGate>(new Or32Gate()));
    register_gate(std::unique_ptr<BaseGate>(new Xor32Gate()));
    register_gate(std::unique_ptr<BaseGate>(new Or32IGate()));
    register_gate(std::unique_ptr<BaseGate>(new Xor32IGate()));
    register_gate(std::unique_ptr<BaseGate>(new EqzGate()));
    register_gate(std::unique_ptr<BaseGate>(new LoadGate()));
    register_gate(std::unique_ptr<BaseGate>(new StoreGate()));
    register_gate(std::unique_ptr<BaseGate>(new UdivGate()));
    register_gate(std::unique_ptr<BaseGate>(new UremGate()));
    register_gate(std::unique_ptr<BaseGate>(new UltGate()));
    register_gate(std::unique_ptr<BaseGate>(new SrliGate()));
    register_gate(std::unique_ptr<BaseGate>(new MsbGate()));
    register_gate(std::unique_ptr<BaseGate>(new Mul32IGate()));
    register_gate(std::unique_ptr<BaseGate>(new LtGate()));
    register_gate(std::unique_ptr<BaseGate>(new SraiGate()));
    register_gate(std::unique_ptr<BaseGate>(new SraGate()));
    register_gate(std::unique_ptr<BaseGate>(new AsmInputGate()));
    register_gate(std::unique_ptr<BaseGate>(new VmcallGate()));
    register_gate(std::unique_ptr<BaseGate>(new Pow2Gate()));
    register_gate(std::unique_ptr<BaseGate>(new Mod4Gate()));

    // Recursive gates
    register_gate(std::unique_ptr<BaseGate>(new UloadbGate()));
    register_gate(std::unique_ptr<BaseGate>(new LoadbGate()));
    register_gate(std::unique_ptr<BaseGate>(new UloadhGate()));
    register_gate(std::unique_ptr<BaseGate>(new LoadhGate()));
    register_gate(std::unique_ptr<BaseGate>(new StorebGate()));
    register_gate(std::unique_ptr<BaseGate>(new StorehGate()));
}
