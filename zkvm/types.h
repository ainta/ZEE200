#pragma once
#include "emp-tool/emp-tool.h"
class f5 {
public:
    int val;

    f5() {val = 0;}
    f5(int val) : val(((val%5)+5)%5) {}

    static f5 minor(int x) {
        x = -x;
        x = ((x % 5) + 5) % 5;
        return x;
    }

    f5 & operator+= (f5 const & rhs) { 
        val += rhs.val; 
        val %= 5;
        return *this; 
    }
    f5 & operator+= (f5 && rhs) { 
        val += rhs.val;
        val %= 5;
        return *this;
    }
    f5 & operator*= (f5 const & rhs) {
        val *= rhs.val;
        val %= 5;
        return *this;
    }
    f5 & operator*= (f5 && rhs) {
        val *= rhs.val;
        val %= 5;
        return *this;
    }

    f5 operator+(f5 rhs) &  { return rhs += *this; }
    f5 operator+(f5 rhs) && { return rhs += std::move(*this); }
    f5 operator*(f5 rhs) &  { return rhs *= *this; }
    f5 operator*(f5 rhs) && { return rhs *= std::move(*this); }

    static f5 unit() {
        return f5(1);
    }

    static f5 zero() {
        return f5(0);
    }
};

class f61 {
public:
    uint64_t val;

    f61(uint64_t val) : val(val) {}
    f61() : val(0) {}

    static f61 unit() {
        return f61(1);
    }
    static f61 zero() {
        return f61(0);
    }
    static f61 minor(uint64_t x) {
        return f61(PR - x);
    }

    f61 & operator+= (f61 const & rhs) { 
        val = add_mod(val, rhs.val);         
        return *this; 
    }
    f61 & operator+= (f61 && rhs) { 
        val = add_mod(val, rhs.val);
        return *this;
    }
    f61 & operator*= (f61 const & rhs) {
        val = mult_mod(val, rhs.val);
        return *this;
    }
    f61 & operator*= (f61 && rhs) {
        val = mult_mod(val, rhs.val);
        return *this;
    }
    f61 operator+(f61 rhs) &  { return rhs += *this; }
    f61 operator+(f61 rhs) && { return rhs += std::move(*this); }
    f61 operator*(f61 rhs) &  { return rhs *= *this; }
    f61 operator*(f61 rhs) && { return rhs *= std::move(*this); } 
    f61 operator/ (const f61 & rhs) const {
        return rhs.inv_mod() * val;
    }
    f61 inv_mod() const {
        uint64_t po = (1LL<<61) - 3;
        uint64_t res = 1, tmp = val;
        for(int i = 0; i < 61; i++) {
            if((po >> i) & 1) res = mult_mod(res, tmp);
            tmp = mult_mod(tmp, tmp);
        }
        return f61(res);
    }
};

enum OPTYPE {
    INPUT, LINEAR, MUL, ROM, REG, STORE, LOAD, ZKSET, CHKZERO, OUTPUT, ADD32, MUL32, SUB32, EQZ, XOR32, AND32, OR32, UDIV, UREM, ULT, ULTE, MSB, SRLI, MUL32I, LT, LTE, SHLI, SHL, SRA, SRAI, ASMINPUT, VMCALL, POW2, MEM, MOD4,
    // High-level memory operations (recursive gates)
    ULOADB,   // Unsigned load byte
    LOADB,    // Signed load byte
    ULOADH,   // Unsigned load halfword
    LOADH,    // Signed load halfword
    STOREB,   // Store byte
    STOREH,   // Store halfword
    // High-level arithmetic (recursive gates)
    SDIV,     // Signed division
    SREM,     // Signed remainder
    // Immediate variants for bitwise operations
    AND32I,
    OR32I,
    XOR32I
};
inline const char* optype_to_string(OPTYPE op) {
    switch(op) {
        case INPUT: return "INPUT";
        case LINEAR: return "LINEAR";
        case MUL: return "MUL";
        case ROM: return "ROM";
        case REG: return "REG";
        case STORE: return "STORE";
        case LOAD: return "LOAD";
        case ZKSET: return "ZKSET";
        case CHKZERO: return "CHKZERO";
        case OUTPUT: return "OUTPUT";
        case ADD32: return "ADD32";
        case MUL32: return "MUL32";
        case SUB32: return "SUB32";
        case EQZ: return "EQZ";
        case XOR32: return "XOR32";
        case AND32: return "AND32";
        case OR32: return "OR32";
        case UDIV: return "UDIV";
        case UREM: return "UREM";
        case ULT: return "ULT";
        case ULTE: return "ULTE";
        case LT: return "LT";
        case LTE: return "LTE";
        case MSB: return "MSB";
        case SRLI: return "SRLI";
        case SRA: return "SRA";
        case SHLI: return "SHLI";
        case SHL: return "SHL";
        case SRAI: return "SRAI";
        case MUL32I: return "MUL32I";
        case ASMINPUT: return "ASMINPUT";
        case VMCALL: return "VMCALL";
        case POW2: return "POW2";
        case MEM: return "MEM";
        case MOD4: return "MOD4";
        case ULOADB: return "ULOADB";
        case LOADB: return "LOADB";
        case ULOADH: return "ULOADH";
        case LOADH: return "LOADH";
        case STOREB: return "STOREB";
        case STOREH: return "STOREH";
        case SDIV: return "SDIV";
        case SREM: return "SREM";
        case AND32I: return "AND32I";
        case OR32I:  return "OR32I";
        case XOR32I: return "XOR32I";
        default: return "UNKNOWN";
    }
}
