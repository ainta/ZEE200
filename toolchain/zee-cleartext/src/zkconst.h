#ifndef ZKCONST_H
#define ZKCONST_H


#include <cstdint>


namespace zkconst {


using Value = std::uint64_t;
using MemValue = std::uint32_t;

constexpr uint64_t IMM_ENABLE  = 0x8000000000000000;

constexpr uint64_t MASK32      = 0xFFFFFFFF;

constexpr uint64_t IMM_OFFSET  = 31 + 32;
constexpr uint64_t OP_OFFSET   = 25 + 32;
constexpr uint64_t REG1_OFFSET = 20 + 32;
constexpr uint64_t REG2_OFFSET = 15 + 32;
constexpr uint64_t REG3_OFFSET = 10 + 32;

constexpr uint32_t STACKPTR_REGISTER = 7;
constexpr uint32_t HEAPPTR_REGISTER = 10;

enum Op : uint32_t {

  // Instructions existing in both sides
	
  QED       = 0x00,
  HALT      = 0x01,
  COPY      = 0x02,
  CMOV      = 0x03,
  ADD       = 0x04,
  SUB       = 0x05,
  MUL       = 0x06,
  XOR       = 0x07,
  AND       = 0x08,
  OR        = 0x09,
  EQZ       = 0x0a,
  MSB       = 0x0b,
  POW       = 0x0c,
  JUMP      = 0x0d,
  BNEQZ     = 0x0e,
  INPUT     = 0x0f,
  LOAD      = 0x10,
  STORE     = 0x11,
  PC        = 0x12,
  VMCALL    = 0x13,
  OUTPUT    = 0x14,  

  // Instructions only existing in Cleartext side
  
  SHL       = 0x15,
  SRL       = 0x16,
  SRA       = 0x17,  
  LT        = 0x18,  
  EQ        = 0x19,
  ULT       = 0x1a,    
  CALL      = 0x1b,    
  STOREH    = 0x1c,
  STOREB    = 0x1d,
  ULOADH    = 0x1e,
  ULOADB    = 0x1f,
  LOADH     = 0x20,
  LOADB     = 0x21,  
  SDIV      = 0x22,
  UDIV      = 0x23,
  SREM      = 0x24,
  UREM      = 0x25,
  RET       = 0x26,

  PFS       = 0x27,
  PFE       = 0x28,
  
};


}


#endif
