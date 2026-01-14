#include <cstdio>
#include <cstdlib>
#include <iostream>
#include <string>
#include <vector>
#include <algorithm>
#include "as2hex.h"
#include "zkconst.h"

using namespace zkconst;

unsigned int Reg2Int(const std::string reg)
{
	if (reg == "%GR0") return 0;
	if (reg == "%GR1") return 1;
	if (reg == "%GR2") return 2;
	if (reg == "%GR3") return 3;
	if (reg == "%GR4") return 4;
	if (reg == "%GR5") return 5;
	if (reg == "%GR6") return 6;
	if (reg == "%GR7") return 7;
	if (reg == "%RT0") return 8;
	if (reg == "%RT1") return 9;
	printf("Illegal Register!\n");
	exit(-1);
}

void MemExtract(std::string mem, std::string & base, std::string & offset)
{
	int len = mem.length();
	offset = "";
	base = "";
	int i;
	for (i = 0; i < len; i++)
	{
		if (mem[i] == '(') break;
		offset += mem[i];
	}
	for (i++; i < len; i++)
	{
		if (mem[i] == ')') break;
		base += mem[i];
	}
}

unsigned int Inst2Int(std::string inst, unsigned int imm)
{	

	replace(inst.begin(), inst.end(), '\t', ' ');
	replace(inst.begin(), inst.end(), ',', ' ');
	inst.erase(remove(inst.begin(), inst.end(), '\n'), inst.end());
	for (int i = 0; i < inst.length(); i++)
		if (inst[i] != ' ')
		{
			inst.erase(0, i);
			break;
		}
	for (int i = inst.length(); i > 0; i--)
		if (inst[i-1] != ' ')
		{
			inst.erase(i);
			break;
		}
	std::string init_res = "";
	for(int i = 0; inst[i] != '\0'; i++)
    {
        if(inst[i] != ' ' )
            init_res.append(1, inst[i]);
        else
            if(inst[i+1] != ' ')
                init_res.append(1, inst[i]);
    }
		
	std::vector<std::string> inst_arr;
	std::stringstream input(init_res);
	std::string temp;
    while(getline(input, temp, ' '))
        inst_arr.push_back(temp);

	unsigned int res = 0;

	if (inst_arr[0] == "ADD") {
		
		res |= ADDOP << OP_OFFSET;
		res |= Reg2Int(inst_arr[1]) << REG1_OFFSET;
		res |= Reg2Int(inst_arr[2]) << REG2_OFFSET;
		res |= Reg2Int(inst_arr[3]) << REG3_OFFSET;
		
	} else if (inst_arr[0] == "ADDI") {
		
		res |= IMM_ENABLE;
		res |= ADDOP << OP_OFFSET;
		res |= Reg2Int(inst_arr[1]) << REG1_OFFSET;
		res |= Reg2Int(inst_arr[2]) << REG2_OFFSET;
		res |= std::stoi(inst_arr[3]) & MASK16;
		
	} else if (inst_arr[0] == "SUB") {

		res |= SUBOP << OP_OFFSET;
		res |= Reg2Int(inst_arr[1]) << REG1_OFFSET;
		res |= Reg2Int(inst_arr[2]) << REG2_OFFSET;
		res |= Reg2Int(inst_arr[3]) << REG3_OFFSET;
		
	} else if (inst_arr[0] == "SUBI") {

		res |= IMM_ENABLE;
		res |= SUBOP << OP_OFFSET;
		res |= Reg2Int(inst_arr[1]) << REG1_OFFSET;
		res |= Reg2Int(inst_arr[2]) << REG2_OFFSET;
		res |= std::stoi(inst_arr[3]) & MASK16;

	} else if (inst_arr[0] == "MUL") {

		res |= MULOP << OP_OFFSET;
		res |= Reg2Int(inst_arr[1]) << REG1_OFFSET;
		res |= Reg2Int(inst_arr[2]) << REG2_OFFSET;
		res |= Reg2Int(inst_arr[3]) << REG3_OFFSET;
		
	} else if (inst_arr[0] == "MULI") {

		res |= IMM_ENABLE;
		res |= MULOP << OP_OFFSET;
		res |= Reg2Int(inst_arr[1]) << REG1_OFFSET;
		res |= Reg2Int(inst_arr[2]) << REG2_OFFSET;
		res |= std::stoi(inst_arr[3]) & MASK16;
		
	} else if (inst_arr[0] == "XOR") {

		res |= XOROP << OP_OFFSET;
		res |= Reg2Int(inst_arr[1]) << REG1_OFFSET;
		res |= Reg2Int(inst_arr[2]) << REG2_OFFSET;
		res |= Reg2Int(inst_arr[3]) << REG3_OFFSET;
		
	} else if (inst_arr[0] == "XORI") {

		res |= IMM_ENABLE;
		res |= XOROP << OP_OFFSET;
		res |= Reg2Int(inst_arr[1]) << REG1_OFFSET;
		res |= Reg2Int(inst_arr[2]) << REG2_OFFSET;
		res |= std::stoi(inst_arr[3]) & MASK16;
		
	} else if (inst_arr[0] == "AND") {

		res |= ANDOP << OP_OFFSET;
		res |= Reg2Int(inst_arr[1]) << REG1_OFFSET;
		res |= Reg2Int(inst_arr[2]) << REG2_OFFSET;
		res |= Reg2Int(inst_arr[3]) << REG3_OFFSET;
		
	} else if (inst_arr[0] == "ANDI") {

		res |= IMM_ENABLE;
		res |= ANDOP << OP_OFFSET;
		res |= Reg2Int(inst_arr[1]) << REG1_OFFSET;
		res |= Reg2Int(inst_arr[2]) << REG2_OFFSET;
		res |= std::stoi(inst_arr[3]) & MASK16;
		
	} else if (inst_arr[0] == "OR") {

		res |= OROP << OP_OFFSET;
		res |= Reg2Int(inst_arr[1]) << REG1_OFFSET;
		res |= Reg2Int(inst_arr[2]) << REG2_OFFSET;
		res |= Reg2Int(inst_arr[3]) << REG3_OFFSET;
		
	} else if (inst_arr[0] == "ORI") {

		res |= IMM_ENABLE;
		res |= OROP << OP_OFFSET;
		res |= Reg2Int(inst_arr[1]) << REG1_OFFSET;
		res |= Reg2Int(inst_arr[2]) << REG2_OFFSET;
		res |= std::stoi(inst_arr[3]) & MASK16;
		
	} else if (inst_arr[0] == "LT") {

		res |= LTOP << OP_OFFSET;
		res |= Reg2Int(inst_arr[1]) << REG1_OFFSET;
		res |= Reg2Int(inst_arr[2]) << REG2_OFFSET;
		res |= Reg2Int(inst_arr[3]) << REG3_OFFSET;
		
	} else if (inst_arr[0] == "LTI") {

		res |= IMM_ENABLE;
		res |= LTOP << OP_OFFSET;
		res |= Reg2Int(inst_arr[1]) << REG1_OFFSET;
		res |= Reg2Int(inst_arr[2]) << REG2_OFFSET;
		res |= std::stoi(inst_arr[3]) & MASK16;
		
	} else if (inst_arr[0] == "GT") {

		res |= GTOP << OP_OFFSET;
		res |= Reg2Int(inst_arr[1]) << REG1_OFFSET;
		res |= Reg2Int(inst_arr[2]) << REG2_OFFSET;
		res |= Reg2Int(inst_arr[3]) << REG3_OFFSET;
		
	} else if (inst_arr[0] == "GTI") {

		res |= IMM_ENABLE;
		res |= GTOP << OP_OFFSET;
		res |= Reg2Int(inst_arr[1]) << REG1_OFFSET;
		res |= Reg2Int(inst_arr[2]) << REG2_OFFSET;
		res |= std::stoi(inst_arr[3]) & MASK16;
		
	} else if (inst_arr[0] == "EQ") {

		
		res |= EQOP << OP_OFFSET;
		res |= Reg2Int(inst_arr[1]) << REG1_OFFSET;
		res |= Reg2Int(inst_arr[2]) << REG2_OFFSET;
		res |= Reg2Int(inst_arr[3]) << REG3_OFFSET;
		
	} else if (inst_arr[0] == "EQI") {

		res |= IMM_ENABLE;
		res |= EQOP << OP_OFFSET;
		res |= Reg2Int(inst_arr[1]) << REG1_OFFSET;
		res |= Reg2Int(inst_arr[2]) << REG2_OFFSET;
		res |= std::stoi(inst_arr[3]) & MASK16;
		
	} else if (inst_arr[0] == "NEQ") {

		
		res |= NEQOP << OP_OFFSET;
		res |= Reg2Int(inst_arr[1]) << REG1_OFFSET;
		res |= Reg2Int(inst_arr[2]) << REG2_OFFSET;
		res |= Reg2Int(inst_arr[3]) << REG3_OFFSET;
		
	} else if (inst_arr[0] == "NEQI") {

		res |= IMM_ENABLE;
		res |= NEQOP << OP_OFFSET;
		res |= Reg2Int(inst_arr[1]) << REG1_OFFSET;
		res |= Reg2Int(inst_arr[2]) << REG2_OFFSET;
		res |= std::stoi(inst_arr[3]) & MASK16;
		
	} else if (inst_arr[0] == "JUMP") {

		res |= IMM_ENABLE;
		res |= JUMPOP << OP_OFFSET;
		res |= imm & MASK16;
		
	} else if (inst_arr[0] == "CALL") {

		res |= IMM_ENABLE;
		res |= CALLOP << OP_OFFSET;
		res |= imm & MASK16;

	} else if (inst_arr[0] == "BNEQZ") {

		res |= IMM_ENABLE;
		res |= BNEQZOP << OP_OFFSET;
		res |= Reg2Int(inst_arr[1]) << REG2_OFFSET;
		res |= imm & MASK16;		

	} else if (inst_arr[0] == "INPUT") {

		res |= INPUTOP << OP_OFFSET;
		res |= Reg2Int(inst_arr[1]) << REG1_OFFSET;
		
	} else if (inst_arr[0] == "OUTPUT") {

		res |= OUTPUTOP << OP_OFFSET;
		res |= Reg2Int(inst_arr[1]) << REG1_OFFSET;

	} else if (inst_arr[0] == "LOAD") {

		res |= IMM_ENABLE;
		res |= LOADOP << OP_OFFSET;
		res |= Reg2Int(inst_arr[1]) << REG1_OFFSET;
		std::string base, offset;
		MemExtract(inst_arr[2], base, offset);
		res |= Reg2Int(base) << REG2_OFFSET;
		res |= std::stoi(offset) & MASK16;
		
	} else if (inst_arr[0] == "STORE") {

		res |= IMM_ENABLE;
		res |= STOREOP << OP_OFFSET;
		res |= Reg2Int(inst_arr[1]) << REG1_OFFSET;
		std::string base, offset;
		MemExtract(inst_arr[2], base, offset);
		res |= Reg2Int(base) << REG2_OFFSET;
		res |= std::stoi(offset) & MASK16;
		
	} else if (inst_arr[0] == "RET") {

		// RET is 0x00000000
		
	} else if (inst_arr[0] == "COPYR") {

		res |= COPYOP << OP_OFFSET;
		res |= Reg2Int(inst_arr[1]) << REG1_OFFSET;
		res |= Reg2Int(inst_arr[2]) << REG3_OFFSET;
		
	} else if (inst_arr[0] == "COPYI") {

		res |= IMM_ENABLE;
		res |= COPYOP << OP_OFFSET;
		res |= Reg2Int(inst_arr[1]) << REG1_OFFSET;
		res |= std::stoi(inst_arr[2]) & MASK16;
		
	} else {
		
		printf("Illegal Op!");
		exit(-1);
		
	}

	return res;
}
