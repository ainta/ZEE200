#include <iostream>
#include <sstream>
#include <vector>
#include <iomanip>
#include "Op.h"
#include <map>


std::map<std::string, std::uint32_t> labels;
std::map<std::string, std::uint32_t> vars;




std::uint32_t readArg(const std::string& s) {
  if (s[0] == '$') {
    return vars[s];
  } else {
    return std::atoi(s.c_str());
  }
}


void readLast(const std::string& s, Instr& i) {
  char first = s[0];
  if (first == '#') {
    i.isImm = true;
    i.imm = std::atoi(s.c_str() + 1);
  } else if (first == '$') {
    i.reg2 = vars[s];
  } else if (first == ':') {
    i.isImm = true;
    i.imm = labels[s.c_str() + 1];
  } else {
    i.reg2 = std::atoi(s.c_str());
  }
}


std::uint32_t line = 0;

void label(const std::string& s) {
  std::stringstream f(s);
  std::string code;
  f >> code;
  if (std::islower(code[0])) {
    // lowercase indicates a label
    code.resize(code.size()-1);
    labels[code] = line;
  } else if (code[0] == '$') {
    // variable declaration
    std::uint32_t assignment;
    f >> assignment;
    vars[code] = assignment;
  } else if (code[0] == ';') {
    // comment
  } else if (code == "SHR") {
    line += 2; // extra line increment
  } else {
    ++line;
  }
}

void token(const std::string& s) {
  std::stringstream f(s);
  std::string code;
  f >> code;

  if (std::islower(code[0]) || code[0] == '$' || code[0] == ';') {
    // do nothing
  } else {
    Instr i = { 0, 0, 0, 0, 0, 0 };

    bool outArg = true;
    int inArgs = 2;

    if (code == "QED") { i.op = OP_QED; outArg = false; inArgs = 0; }
    if (code == "HALT") { i.op = OP_HALT; outArg = false; inArgs = 0; }
    if (code == "PC") { i.op = OP_PC; inArgs = 1; }
    if (code == "MOV") { i.op = OP_MOV; inArgs = 1; }
    if (code == "CMOV") { i.op = OP_CMOV; }
    if (code == "ADD") { i.op = OP_ADD; }
    if (code == "SUB") { i.op = OP_SUB; }
    if (code == "MUL") { i.op = OP_MUL; }
    if (code == "XOR") { i.op = OP_XOR; }
    if (code == "AND") { i.op = OP_AND; }
    if (code == "OR") { i.op = OP_OR; }
    if (code == "EQZ") { i.op = OP_EQZ; }
    if (code == "MSB") { i.op = OP_MSB; inArgs = 1; }
    if (code == "POW") { i.op = OP_POW2; }
    if (code == "JMP") { i.op = OP_JUMP; outArg = false; inArgs = 1; }
    if (code == "BNZ") { i.op = OP_BNZ; outArg = false; }
    if (code == "INPUT") { i.op = OP_INPUT; }
    if (code == "LOAD") { i.op = OP_LOAD; }
    if (code == "STORE") { i.op = OP_STORE; outArg = false; }
    if (code == "ORACLE") { i.op = OP_ORACLE; outArg = false; inArgs = 1; }
    if (code == "OUTPUT") { i.op = OP_OUTPUT; outArg = false; inArgs = 1; }

    std::uint32_t x = 0, y, z;
    if (outArg) {
      std::string reg;
      f >> reg;
      i.reg0 = readArg(reg);
    }
    if (inArgs > 1) {
      std::string reg;
      f >> reg;
      i.reg1 = readArg(reg);
    }
    x = i.reg1;
    z = i.reg0;

    if (inArgs > 0) {
      std::string reg2;
      f >> reg2;
      readLast(reg2, i);
      y = i.isImm ? i.imm : i.reg2;
    }
    emit(i);
  }
}


int main() {
  std::vector<std::string> lines;
  std::string line;

  while (std::getline(std::cin, line)) {
    lines.emplace_back(line);
  }

  std::cout << std::setfill('0') << std::right << std::hex;
  for (const auto& line: lines) {
    label(line);
  }
  for (const auto& line: lines) {
    token(line);
  }
}
