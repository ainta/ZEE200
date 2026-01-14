#ifndef AS2HEX_H
#define AS2HEX_H

#include <cstring>
#include <sstream>

unsigned int Reg2Int(const std::string reg);
unsigned int Inst2Int(std::string inst, unsigned int imm = 0);

#endif
