#ifndef AS2HEX_H
#define AS2HEX_H

#include <cstring>
#include <sstream>
#include <cstdint>

uint64_t Reg2Int(const std::string reg);
uint64_t Inst2Int(std::string inst, unsigned int imm = 0);

#endif
