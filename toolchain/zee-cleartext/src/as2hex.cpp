#include <cstdio>
#include <cstdlib>
#include <iostream>
#include <string>
#include <vector>
#include <algorithm>
#include "as2hex.h"
#include "zkconst.h"

using namespace zkconst;

uint64_t Reg2Int(const std::string reg)
{
	if (reg == "%GR0") return 0;
	if (reg == "%GR1") return 1;
	if (reg == "%GR2") return 2;
	if (reg == "%GR3") return 3;
	if (reg == "%GR4") return 4;
	if (reg == "%GR5") return 5;
	if (reg == "%GR6") return 6;
	if (reg == "%SP") return 7;
	if (reg == "%RT0") return 8;
	if (reg == "%RT1") return 9;
	if (reg == "%HP") return 10;
	if (reg == "%RA") return 11;
	if (reg == "%FP") return 12;	
	if (reg == "%BASE") return 13;	
	if (reg == "%OFF") return 14;	
	if (reg == "%MASK") return 15;	
	if (reg == "%TMP0") return 16;	
	if (reg == "%TMP1") return 17;	
	if (reg == "%SFT") return 18;
	if (reg == "%POV0") return 19;
	if (reg == "%POV1") return 20;
	if (reg == "%POV2") return 21;

	// if (reg == "%GR7") return 21;
	// if (reg == "%GR8") return 22;
	// if (reg == "%GR9") return 23;
	// if (reg == "%GR10") return 24;
	// if (reg == "%GR11") return 25;
	// if (reg == "%GR12") return 26;
	// if (reg == "%GR13") return 27;
	// if (reg == "%GR14") return 28;
	// if (reg == "%GR15") return 29;
	// if (reg == "%GR16") return 30;
	// if (reg == "%GR17") return 31;
	
	std::cout << reg << std::endl;
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

uint64_t Inst2Int(std::string inst, unsigned int imm)
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

	uint64_t res = 0;

	if (inst_arr[0] == "ADD") {
		
		res |= (std::uint64_t)Op::ADD << OP_OFFSET;
		res |= Reg2Int(inst_arr[1]) << REG1_OFFSET;
		res |= Reg2Int(inst_arr[2]) << REG2_OFFSET;
		res |= Reg2Int(inst_arr[3]) << REG3_OFFSET;
		
	} else if (inst_arr[0] == "ADDI") {
		
		res |= IMM_ENABLE;
		res |= (std::uint64_t)Op::ADD << OP_OFFSET;
		res |= Reg2Int(inst_arr[1]) << REG1_OFFSET;
		res |= Reg2Int(inst_arr[2]) << REG2_OFFSET;
		res |= std::stoi(inst_arr[3]) & MASK32;

#ifdef DEBUG_IMM
		if (std::stoi(inst_arr[3]) > 65535 || std::stoi(inst_arr[3]) < -65536)
			std::cout << std::stoi(inst_arr[3]) << std::endl;
#endif
		
	} else if (inst_arr[0] == "SUB") {

		res |= (std::uint64_t)Op::SUB << OP_OFFSET;
		res |= Reg2Int(inst_arr[1]) << REG1_OFFSET;
		res |= Reg2Int(inst_arr[2]) << REG2_OFFSET;
		res |= Reg2Int(inst_arr[3]) << REG3_OFFSET;
		
	} else if (inst_arr[0] == "SUBI") {

		res |= IMM_ENABLE;
		res |= (std::uint64_t)Op::SUB << OP_OFFSET;
		res |= Reg2Int(inst_arr[1]) << REG1_OFFSET;
		res |= Reg2Int(inst_arr[2]) << REG2_OFFSET;
		res |= std::stoi(inst_arr[3]) & MASK32;

#ifdef DEBUG_IMM
		if (std::stoi(inst_arr[3]) > 65535 || std::stoi(inst_arr[3]) < -65536)
			std::cout << std::stoi(inst_arr[3]) << std::endl;
#endif
				
	} else if (inst_arr[0] == "SHL") {

		res |= (std::uint64_t)Op::SHL << OP_OFFSET;
		res |= Reg2Int(inst_arr[1]) << REG1_OFFSET;
		res |= Reg2Int(inst_arr[2]) << REG2_OFFSET;
		res |= Reg2Int(inst_arr[3]) << REG3_OFFSET;
		
	} else if (inst_arr[0] == "SHLI") {

		res |= IMM_ENABLE;
		res |= (std::uint64_t)Op::SHL << OP_OFFSET;
		res |= Reg2Int(inst_arr[1]) << REG1_OFFSET;
		res |= Reg2Int(inst_arr[2]) << REG2_OFFSET;
		res |= std::stoi(inst_arr[3]) & MASK32;

#ifdef DEBUG_IMM
		if (std::stoi(inst_arr[3]) > 65535 || std::stoi(inst_arr[3]) < -65536)
			std::cout << std::stoi(inst_arr[3]) << std::endl;
#endif		
		
	} else if (inst_arr[0] == "SRL") {

		res |= (std::uint64_t)Op::SRL << OP_OFFSET;
		res |= Reg2Int(inst_arr[1]) << REG1_OFFSET;
		res |= Reg2Int(inst_arr[2]) << REG2_OFFSET;
		res |= Reg2Int(inst_arr[3]) << REG3_OFFSET;
		
	} else if (inst_arr[0] == "SRLI") {

		res |= IMM_ENABLE;
		res |= (std::uint64_t)Op::SRL << OP_OFFSET;
		res |= Reg2Int(inst_arr[1]) << REG1_OFFSET;
		res |= Reg2Int(inst_arr[2]) << REG2_OFFSET;
		res |= std::stoi(inst_arr[3]) & MASK32;

#ifdef DEBUG_IMM
		if (std::stoi(inst_arr[3]) > 65535 || std::stoi(inst_arr[3]) < -65536)
			std::cout << std::stoi(inst_arr[3]) << std::endl;
#endif
		
	} else if (inst_arr[0] == "SRA") {

		res |= (std::uint64_t)Op::SRA << OP_OFFSET;
		res |= Reg2Int(inst_arr[1]) << REG1_OFFSET;
		res |= Reg2Int(inst_arr[2]) << REG2_OFFSET;
		res |= Reg2Int(inst_arr[3]) << REG3_OFFSET;
		
	} else if (inst_arr[0] == "SRAI") {

		res |= IMM_ENABLE;
		res |= (std::uint64_t)Op::SRA << OP_OFFSET;
		res |= Reg2Int(inst_arr[1]) << REG1_OFFSET;
		res |= Reg2Int(inst_arr[2]) << REG2_OFFSET;
		res |= std::stoi(inst_arr[3]) & MASK32;

#ifdef DEBUG_IMM
		if (std::stoi(inst_arr[3]) > 65535 || std::stoi(inst_arr[3]) < -65536)
			std::cout << std::stoi(inst_arr[3]) << std::endl;
#endif		

	} else if (inst_arr[0] == "MUL") {

		res |= (std::uint64_t)Op::MUL << OP_OFFSET;
		res |= Reg2Int(inst_arr[1]) << REG1_OFFSET;
		res |= Reg2Int(inst_arr[2]) << REG2_OFFSET;
		res |= Reg2Int(inst_arr[3]) << REG3_OFFSET;
		
	} else if (inst_arr[0] == "MULI") {

		res |= IMM_ENABLE;
		res |= (std::uint64_t)Op::MUL << OP_OFFSET;
		res |= Reg2Int(inst_arr[1]) << REG1_OFFSET;
		res |= Reg2Int(inst_arr[2]) << REG2_OFFSET;
		res |= std::stoi(inst_arr[3]) & MASK32;

#ifdef DEBUG_IMM
		if (std::stoi(inst_arr[3]) > 65535 || std::stoi(inst_arr[3]) < -65536)
			std::cout << std::stoi(inst_arr[3]) << std::endl;
#endif

	} else if (inst_arr[0] == "XOR") {

		res |= (std::uint64_t)Op::XOR << OP_OFFSET;
		res |= Reg2Int(inst_arr[1]) << REG1_OFFSET;
		res |= Reg2Int(inst_arr[2]) << REG2_OFFSET;
		res |= Reg2Int(inst_arr[3]) << REG3_OFFSET;
		
	} else if (inst_arr[0] == "XORI") {

		res |= IMM_ENABLE;
		res |= (std::uint64_t)Op::XOR << OP_OFFSET;
		res |= Reg2Int(inst_arr[1]) << REG1_OFFSET;
		res |= Reg2Int(inst_arr[2]) << REG2_OFFSET;
		res |= std::stoi(inst_arr[3]) & MASK32;

#ifdef DEBUG_IMM
		if (std::stoi(inst_arr[3]) > 65535 || std::stoi(inst_arr[3]) < -65536)
			std::cout << std::stoi(inst_arr[3]) << std::endl;
#endif		
		
	} else if (inst_arr[0] == "AND") {

		res |= (std::uint64_t)Op::AND << OP_OFFSET;
		res |= Reg2Int(inst_arr[1]) << REG1_OFFSET;
		res |= Reg2Int(inst_arr[2]) << REG2_OFFSET;
		res |= Reg2Int(inst_arr[3]) << REG3_OFFSET;
		
	} else if (inst_arr[0] == "ANDI") {

		res |= IMM_ENABLE;
		res |= (std::uint64_t)Op::AND << OP_OFFSET;
		res |= Reg2Int(inst_arr[1]) << REG1_OFFSET;
		res |= Reg2Int(inst_arr[2]) << REG2_OFFSET;
		res |= std::stoi(inst_arr[3]) & MASK32;
		
#ifdef DEBUG_IMM
		if (std::stoi(inst_arr[3]) > 65535 || std::stoi(inst_arr[3]) < -65536)
			std::cout << std::stoi(inst_arr[3]) << std::endl;
#endif
		
	} else if (inst_arr[0] == "OR") {

		res |= (std::uint64_t)Op::OR << OP_OFFSET;
		res |= Reg2Int(inst_arr[1]) << REG1_OFFSET;
		res |= Reg2Int(inst_arr[2]) << REG2_OFFSET;
		res |= Reg2Int(inst_arr[3]) << REG3_OFFSET;
		
	} else if (inst_arr[0] == "ORI") {

		res |= IMM_ENABLE;
		res |= (std::uint64_t)Op::OR << OP_OFFSET;
		res |= Reg2Int(inst_arr[1]) << REG1_OFFSET;
		res |= Reg2Int(inst_arr[2]) << REG2_OFFSET;
		res |= std::stoi(inst_arr[3]) & MASK32;

#ifdef DEBUG_IMM
		if (std::stoi(inst_arr[3]) > 65535 || std::stoi(inst_arr[3]) < -65536)
			std::cout << std::stoi(inst_arr[3]) << std::endl;
#endif
		
	} else if (inst_arr[0] == "SREM") {

		res |= (std::uint64_t)Op::SREM << OP_OFFSET;
		res |= Reg2Int(inst_arr[1]) << REG1_OFFSET;
		res |= Reg2Int(inst_arr[2]) << REG2_OFFSET;
		res |= Reg2Int(inst_arr[3]) << REG3_OFFSET;
		
	} else if (inst_arr[0] == "SREMI") {

		res |= IMM_ENABLE;
		res |= (std::uint64_t)Op::SREM << OP_OFFSET;
		res |= Reg2Int(inst_arr[1]) << REG1_OFFSET;
		res |= Reg2Int(inst_arr[2]) << REG2_OFFSET;
		res |= std::stoi(inst_arr[3]) & MASK32;

#ifdef DEBUG_IMM
		if (std::stoi(inst_arr[3]) > 65535 || std::stoi(inst_arr[3]) < -65536)
			std::cout << std::stoi(inst_arr[3]) << std::endl;
#endif
		
	} else if (inst_arr[0] == "SDIV") {

		res |= (std::uint64_t)Op::SDIV << OP_OFFSET;
		res |= Reg2Int(inst_arr[1]) << REG1_OFFSET;
		res |= Reg2Int(inst_arr[2]) << REG2_OFFSET;
		res |= Reg2Int(inst_arr[3]) << REG3_OFFSET;
		
	} else if (inst_arr[0] == "SDIVI") {

		res |= IMM_ENABLE;
		res |= (std::uint64_t)Op::SDIV << OP_OFFSET;
		res |= Reg2Int(inst_arr[1]) << REG1_OFFSET;
		res |= Reg2Int(inst_arr[2]) << REG2_OFFSET;
		res |= std::stoi(inst_arr[3]) & MASK32;

#ifdef DEBUG_IMM
		if (std::stoi(inst_arr[3]) > 65535 || std::stoi(inst_arr[3]) < -65536)
			std::cout << std::stoi(inst_arr[3]) << std::endl;
#endif
		
	} else if (inst_arr[0] == "UREM") {

		res |= (std::uint64_t)Op::UREM << OP_OFFSET;
		res |= Reg2Int(inst_arr[1]) << REG1_OFFSET;
		res |= Reg2Int(inst_arr[2]) << REG2_OFFSET;
		res |= Reg2Int(inst_arr[3]) << REG3_OFFSET;
		
	} else if (inst_arr[0] == "UREMI") {

		res |= IMM_ENABLE;
		res |= (std::uint64_t)Op::UREM << OP_OFFSET;
		res |= Reg2Int(inst_arr[1]) << REG1_OFFSET;
		res |= Reg2Int(inst_arr[2]) << REG2_OFFSET;
		res |= std::stoi(inst_arr[3]) & MASK32;

#ifdef DEBUG_IMM
		if (std::stoi(inst_arr[3]) > 65535 || std::stoi(inst_arr[3]) < -65536)
			std::cout << std::stoi(inst_arr[3]) << std::endl;
#endif
		
	} else if (inst_arr[0] == "UDIV") {

		res |= (std::uint64_t)Op::UDIV << OP_OFFSET;
		res |= Reg2Int(inst_arr[1]) << REG1_OFFSET;
		res |= Reg2Int(inst_arr[2]) << REG2_OFFSET;
		res |= Reg2Int(inst_arr[3]) << REG3_OFFSET;
		
	} else if (inst_arr[0] == "UDIVI") {

		res |= IMM_ENABLE;
		res |= (std::uint64_t)Op::UDIV << OP_OFFSET;
		res |= Reg2Int(inst_arr[1]) << REG1_OFFSET;
		res |= Reg2Int(inst_arr[2]) << REG2_OFFSET;
		res |= std::stoi(inst_arr[3]) & MASK32;
		
#ifdef DEBUG_IMM
		if (std::stoi(inst_arr[3]) > 65535 || std::stoi(inst_arr[3]) < -65536)
			std::cout << std::stoi(inst_arr[3]) << std::endl;
#endif
		
	} else if (inst_arr[0] == "LT") {

		res |= (std::uint64_t)Op::LT << OP_OFFSET;
		res |= Reg2Int(inst_arr[1]) << REG1_OFFSET;
		res |= Reg2Int(inst_arr[2]) << REG2_OFFSET;
		res |= Reg2Int(inst_arr[3]) << REG3_OFFSET;
		
	} else if (inst_arr[0] == "LTE") {

		res |= IMM_ENABLE;
		res |= (std::uint64_t)Op::LT << OP_OFFSET;
		res |= Reg2Int(inst_arr[1]) << REG1_OFFSET;
		res |= Reg2Int(inst_arr[2]) << REG2_OFFSET;
		res |= Reg2Int(inst_arr[3]) << REG3_OFFSET;
		
	} else if (inst_arr[0] == "ULT") {

		res |= (std::uint64_t)Op::ULT << OP_OFFSET;
		res |= Reg2Int(inst_arr[1]) << REG1_OFFSET;
		res |= Reg2Int(inst_arr[2]) << REG2_OFFSET;
		res |= Reg2Int(inst_arr[3]) << REG3_OFFSET;
		
	} else if (inst_arr[0] == "ULTE") {

		res |= IMM_ENABLE;
		res |= (std::uint64_t)Op::ULT << OP_OFFSET;
		res |= Reg2Int(inst_arr[1]) << REG1_OFFSET;
		res |= Reg2Int(inst_arr[2]) << REG2_OFFSET;
		res |= Reg2Int(inst_arr[3]) << REG3_OFFSET;
		
	} else if (inst_arr[0] == "EQ") {
		
		res |= (std::uint64_t)Op::EQ << OP_OFFSET;
		res |= Reg2Int(inst_arr[1]) << REG1_OFFSET;
		res |= Reg2Int(inst_arr[2]) << REG2_OFFSET;
		res |= Reg2Int(inst_arr[3]) << REG3_OFFSET;
		
	} else if (inst_arr[0] == "NEQ") {

		res |= IMM_ENABLE;
		res |= (std::uint64_t)Op::EQ << OP_OFFSET;
		res |= Reg2Int(inst_arr[1]) << REG1_OFFSET;
		res |= Reg2Int(inst_arr[2]) << REG2_OFFSET;
		res |= Reg2Int(inst_arr[3]) << REG3_OFFSET;
		
	} else if (inst_arr[0] == "JUMP") {

		res |= IMM_ENABLE;
		res |= (std::uint64_t)Op::JUMP << OP_OFFSET;
		res |= imm & MASK32;
		
	} else if (inst_arr[0] == "JUMPR") {

		// res |= IMM_ENABLE;
		res |= (std::uint64_t)Op::JUMP << OP_OFFSET;
		res |= Reg2Int(inst_arr[1]) << REG3_OFFSET;
		// res |= imm & MASK16;

	} else if (inst_arr[0] == "VMCALL") {

		res |= IMM_ENABLE;
		res |= (std::uint64_t)Op::VMCALL << OP_OFFSET;
		res |= std::stoi(inst_arr[1]) & MASK32;
		// res |= imm & MASK32;

	} else if (inst_arr[0] == "EQZ") {

		res |= (std::uint64_t)Op::EQZ << OP_OFFSET;
		res |= Reg2Int(inst_arr[1]) << REG1_OFFSET;
		res |= Reg2Int(inst_arr[2]) << REG3_OFFSET;
		// res |= imm & MASK32;

	} else if (inst_arr[0] == "MSB") {

		res |= (std::uint64_t)Op::MSB << OP_OFFSET;
		res |= Reg2Int(inst_arr[1]) << REG1_OFFSET;
		res |= Reg2Int(inst_arr[2]) << REG3_OFFSET;
		// res |= imm & MASK32;

	} else if (inst_arr[0] == "CALL") {

		res |= IMM_ENABLE;
		res |= (std::uint64_t)Op::CALL << OP_OFFSET;
		res |= imm & MASK32;

	} else if (inst_arr[0] == "CALLR") {

		// res |= IMM_ENABLE;
		res |= (std::uint64_t)Op::CALL << OP_OFFSET;
		res |= Reg2Int(inst_arr[1]) << REG3_OFFSET;
		// res |= imm & MASK16;

	} else if (inst_arr[0] == "BNEQZ") {

		res |= IMM_ENABLE;
		res |= (std::uint64_t)Op::BNEQZ << OP_OFFSET;
		res |= Reg2Int(inst_arr[1]) << REG2_OFFSET;
		res |= imm & MASK32;		

	} else if (inst_arr[0] == "INPUT") {

		res |= (std::uint64_t)Op::INPUT << OP_OFFSET;
		res |= Reg2Int(inst_arr[1]) << REG1_OFFSET;
		
	} else if (inst_arr[0] == "OUTPUT") {

		res |= (std::uint64_t)Op::OUTPUT << OP_OFFSET;
		res |= Reg2Int(inst_arr[1]) << REG1_OFFSET;

	} else if (inst_arr[0] == "LOAD") {

		res |= IMM_ENABLE;
		res |= (std::uint64_t)Op::LOAD << OP_OFFSET;
		res |= Reg2Int(inst_arr[1]) << REG1_OFFSET;
		std::string base, offset;
		MemExtract(inst_arr[2], base, offset);
		res |= Reg2Int(base) << REG2_OFFSET;
		res |= std::stoi(offset) & MASK32;
		
#ifdef DEBUG_IMM
		if (std::stoi(offset) > 65535 || std::stoi(offset) < -65536)
			std::cout << std::stoi(offset) << std::endl;
#endif

	} else if (inst_arr[0] == "LOADH") {

		res |= IMM_ENABLE;
		res |= (std::uint64_t)Op::LOADH << OP_OFFSET;
		res |= Reg2Int(inst_arr[1]) << REG1_OFFSET;
		std::string base, offset;
		MemExtract(inst_arr[2], base, offset);
		res |= Reg2Int(base) << REG2_OFFSET;
		res |= std::stoi(offset) & MASK32;

#ifdef DEBUG_IMM
		if (std::stoi(offset) > 65535 || std::stoi(offset) < -65536)
			std::cout << std::stoi(offset) << std::endl;
#endif
		
	} else if (inst_arr[0] == "LOADB") {

		res |= IMM_ENABLE;
		res |= (std::uint64_t)Op::LOADB << OP_OFFSET;
		res |= Reg2Int(inst_arr[1]) << REG1_OFFSET;
		std::string base, offset;
		MemExtract(inst_arr[2], base, offset);
		res |= Reg2Int(base) << REG2_OFFSET;
		res |= std::stoi(offset) & MASK32;

#ifdef DEBUG_IMM
		if (std::stoi(offset) > 65535 || std::stoi(offset) < -65536)
			std::cout << std::stoi(offset) << std::endl;
#endif
		
	} else if (inst_arr[0] == "ULOADH") {

		res |= IMM_ENABLE;
		res |= (std::uint64_t)Op::ULOADH << OP_OFFSET;
		res |= Reg2Int(inst_arr[1]) << REG1_OFFSET;
		std::string base, offset;
		MemExtract(inst_arr[2], base, offset);
		res |= Reg2Int(base) << REG2_OFFSET;
		res |= std::stoi(offset) & MASK32;

#ifdef DEBUG_IMM
		if (std::stoi(offset) > 65535 || std::stoi(offset) < -65536)
			std::cout << std::stoi(offset) << std::endl;
#endif
		
	} else if (inst_arr[0] == "ULOADB") {

		res |= IMM_ENABLE;
		res |= (std::uint64_t)Op::ULOADB << OP_OFFSET;
		res |= Reg2Int(inst_arr[1]) << REG1_OFFSET;
		std::string base, offset;
		MemExtract(inst_arr[2], base, offset);
		res |= Reg2Int(base) << REG2_OFFSET;
		res |= std::stoi(offset) & MASK32;

#ifdef DEBUG_IMM
		if (std::stoi(offset) > 65535 || std::stoi(offset) < -65536)
			std::cout << std::stoi(offset) << std::endl;
#endif
		
	} else if (inst_arr[0] == "STORE") {

		res |= IMM_ENABLE;
		res |= (std::uint64_t)Op::STORE << OP_OFFSET;
		res |= Reg2Int(inst_arr[1]) << REG1_OFFSET;
		std::string base, offset;
		MemExtract(inst_arr[2], base, offset);
		res |= Reg2Int(base) << REG2_OFFSET;
		res |= std::stoi(offset) & MASK32;

#ifdef DEBUG_IMM
		if (std::stoi(offset) > 65535 || std::stoi(offset) < -65536)
			std::cout << std::stoi(offset) << std::endl;
#endif
		
	} else if (inst_arr[0] == "STOREH") {

		res |= IMM_ENABLE;
		res |= (std::uint64_t)Op::STOREH << OP_OFFSET;
		res |= Reg2Int(inst_arr[1]) << REG1_OFFSET;
		std::string base, offset;
		MemExtract(inst_arr[2], base, offset);
		res |= Reg2Int(base) << REG2_OFFSET;
		res |= std::stoi(offset) & MASK32;

#ifdef DEBUG_IMM
		if (std::stoi(offset) > 65535 || std::stoi(offset) < -65536)
			std::cout << std::stoi(offset) << std::endl;
#endif
		
	} else if (inst_arr[0] == "STOREB") {

		res |= IMM_ENABLE;
		res |= (std::uint64_t)Op::STOREB << OP_OFFSET;
		res |= Reg2Int(inst_arr[1]) << REG1_OFFSET;
		std::string base, offset;
		MemExtract(inst_arr[2], base, offset);
		res |= Reg2Int(base) << REG2_OFFSET;
		res |= std::stoi(offset) & MASK32;

#ifdef DEBUG_IMM
		if (std::stoi(offset) > 65535 || std::stoi(offset) < -65536)
			std::cout << std::stoi(offset) << std::endl;
#endif
		
	} else if (inst_arr[0] == "RET") {

		// RET is 0x00000000
		
	} else if (inst_arr[0] == "HALT") {

		// res |= IMM_ENABLE;
		res |= (std::uint64_t)Op::HALT << OP_OFFSET;		
		
	} else if (inst_arr[0] == "QED") {

		// res |= IMM_ENABLE;
		res |= (std::uint64_t)Op::QED << OP_OFFSET;		
		
	} else if (inst_arr[0] == "CMOV") {

		res |= (std::uint64_t)Op::CMOV << OP_OFFSET;
		res |= Reg2Int(inst_arr[1]) << REG1_OFFSET;
		res |= Reg2Int(inst_arr[2]) << REG2_OFFSET;
		res |= Reg2Int(inst_arr[3]) << REG3_OFFSET;
				
	} else if (inst_arr[0] == "POW") {

		res |= (std::uint64_t)Op::POW << OP_OFFSET;
		res |= Reg2Int(inst_arr[1]) << REG1_OFFSET;
		res |= Reg2Int(inst_arr[2]) << REG3_OFFSET;
		
	} else if (inst_arr[0] == "POWI") {

		res |= IMM_ENABLE;
		res |= (std::uint64_t)Op::POW << OP_OFFSET;
		res |= Reg2Int(inst_arr[1]) << REG1_OFFSET;
		res |= std::stoi(inst_arr[2]) & MASK32;

#ifdef DEBUG_IMM
		if (std::stoi(inst_arr[2]) > 65535 || std::stoi(inst_arr[2]) < -65536)
			std::cout << std::stoi(inst_arr[2]) << std::endl;
#endif
		
	} else if (inst_arr[0] == "COPYR") {

		res |= (std::uint64_t)Op::COPY << OP_OFFSET;
		res |= Reg2Int(inst_arr[1]) << REG1_OFFSET;
		res |= Reg2Int(inst_arr[2]) << REG3_OFFSET;
		
	} else if (inst_arr[0] == "COPYI") {

		res |= IMM_ENABLE;
		res |= (std::uint64_t)Op::COPY << OP_OFFSET;
		res |= Reg2Int(inst_arr[1]) << REG1_OFFSET;
		res |= std::stoi(inst_arr[2]) & MASK32;

#ifdef DEBUG_IMM
		if (std::stoi(inst_arr[2]) > 65535 || std::stoi(inst_arr[2]) < -65536)
			std::cout << std::stoi(inst_arr[2]) << std::endl;
#endif
		
	} else if (inst_arr[0] == "COPYG") {

		res |= IMM_ENABLE;
		res |= (std::uint64_t)Op::COPY << OP_OFFSET;
		res |= Reg2Int(inst_arr[1]) << REG1_OFFSET;
		res |= imm & MASK32;
		
#ifdef DEBUG_IMM
		if (imm > 65535)
			std::cout << imm << std::endl;
#endif
		
	} else if (inst_arr[0] == "PC") {

		res |= IMM_ENABLE;
		res |= (std::uint64_t)Op::PC << OP_OFFSET;
		res |= Reg2Int(inst_arr[1]) << REG1_OFFSET;
		res |= std::stoi(inst_arr[2]) & MASK32;

#ifdef DEBUG_IMM
		if (std::stoi(inst_arr[2]) > 65535 || std::stoi(inst_arr[2]) < -65536)
			std::cout << std::stoi(inst_arr[2]) << std::endl;
#endif
		
	} else if (inst_arr[0] == "PROOFSTART") {

		res |= (std::uint64_t)Op::PFS << OP_OFFSET;		
		
	} else if (inst_arr[0] == "PROOFEND") {

		res |= (std::uint64_t)Op::PFE << OP_OFFSET;		
		
	} else {

		std::cout << inst_arr[0] << std::endl;
		
		printf("Illegal Op!");
		exit(-1);
		
	}

	return res;
}
