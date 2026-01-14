#include <vector>
#include <array>
#include <stack>
#include <fstream>
#include <iostream>
#include <cstring>
#include <string>
#include <map>
#include <cstdio>
#include <sstream>
#include <iomanip>
#include <sys/stat.h>
#include <sys/types.h>

#include <chrono>
#include "TimerClock.hpp"

#include "zkconst.h"
#include "as2hex.h"
#include "Oracle.h"

#ifdef STATS
#define if_stats(x) x
#else
#define if_stats(x)
#endif

using namespace zkconst;
using namespace std;
using namespace chrono;

using Memory = std::vector<zkconst::MemValue>*;

std::map<std::string, int> inst_cnt;
std::vector<zkconst::Value> output;

std::stack<uint32_t> record_input_stack;

long long insts_cnt = 0;
int proof_insts_cnt = 0;
bool proof_mode = 0;

int config_cnt = 0;
int prev_pc = 0;
int prev_insts_cnt = 0;

ofstream fout("recordinput.txt");

std::vector<std::uint64_t> pre_mem;
std::vector<std::uint32_t> pre_reg;

Value load(const Memory& memory, uint32_t reg, uint32_t sp) {

	// if (reg + 3 >= sp)
	// {
	// 	std::cout << reg << std::endl;
	// 	exit(100);
	// }

	if (reg%4)
	{
		std::cout << "NOT GOOD in LOAD" << std::endl;
		exit(100);
	}

	// Value out = static_cast<Value>((*memory)[reg + 0]) <<  0;
	// out      += static_cast<Value>((*memory)[reg + 1]) <<  8;
	// out      += static_cast<Value>((*memory)[reg + 2]) << 16;
	// out      += static_cast<Value>((*memory)[reg + 3]) << 24;
	return (*memory)[reg/4];
}

Value loadh(const Memory& memory, uint32_t reg, uint32_t sp) {
	// if (reg + 1 >= sp)
	// {
	// 	std::cout << reg << std::endl;
	// 	exit(100);
	// }
	Value out = static_cast<Value>((*memory)[reg + 0]) <<  0;
	out      += static_cast<Value>((*memory)[reg + 1]) <<  8;
	if (out & 0x8000) out += 0xFFFF0000;
	return out;
}

Value loadb(const Memory& memory, uint32_t reg, uint32_t sp) {

	// if (reg + 0 >= sp)
	// {
	// 	std::cout << reg << std::endl;
	// 	exit(100);
	// }
	Value out = static_cast<Value>((*memory)[reg + 0]) <<  0;
	if (out & 0x80) out += 0xFFFFFF00;
	return out;
}

Value uloadh(const Memory& memory, uint32_t reg, uint32_t sp) {
	// if (reg + 1 >= sp)
	// {
	// 	std::cout << reg << std::endl;
	// 	exit(100);
	// }
	Value out = static_cast<Value>((*memory)[reg + 0]) <<  0;
	out      += static_cast<Value>((*memory)[reg + 1]) <<  8;
	return out;
}

Value uloadb(const Memory& memory, uint32_t reg, uint32_t sp) {
	// if (reg + 0 >= sp)
	// {
	// 	std::cout << reg << std::endl;
	// 	exit(100);
	// }
	Value out = static_cast<Value>((*memory)[reg + 0]) <<  0;
	return out;
}

void store(Memory& memory, uint32_t where, uint32_t what) {

	if (where%4)
	{
		std::cout << "NOT GOOD in STORE" << std::endl;
		exit(100);
	}

	// if (where >= (1<<20))
	// {
	// 	std::cout << "BUG!" << std::endl;
	// 	exit(222);
	// }
	// (*memory)[where + 3] = (what >> 24) & 0xFF;
	// (*memory)[where + 2] = (what >> 16) & 0xFF;
	// (*memory)[where + 1] = (what >>  8) & 0xFF;
	// (*memory)[where + 0] = (what >>  0) & 0xFF;
	(*memory)[where/4] = what & 0xFFFFFFFF;
}

void storeh(Memory& memory, uint32_t where, uint32_t what) {
	(*memory)[where + 1] = (what >>  8) & 0xFF;
	(*memory)[where + 0] = (what >>  0) & 0xFF;
}

void storeb(Memory& memory, uint32_t where, uint32_t what) {
	(*memory)[where + 0] = (what >>  0) & 0xFF;
}

uint32_t illegal_addr;

Machine makeCpu(
    std::vector<Value>& program,
    std::vector<Value>& input,
    std::vector<Value>& data,
    std::size_t powMem,
	bool replay,
	std::size_t pc,
	std::vector<Value>& record_register,
	std::vector<Value>& record_input,
	std::vector<Value>& record_output) {
	Machine out;
	out.pc = 2;
	out.program = &program;
	out.input = new std::stack<std::uint32_t>;
	// (*out.input) = std::stack<Value, std::vector<Value>> { input };

	out.registry = new std::vector<uint32_t>;
	(*out.registry).resize(32);
	out.memory = new std::vector<uint32_t>;

	// zero initialize the registry
	for (auto& r: (*out.registry)) { r = 0; }

	// initialize stack register to point past the end of memory
	(*out.registry)[STACKPTR_REGISTER] = 1 << powMem;

	illegal_addr = 1 << (powMem-1);
	std::cout << "illegal_addr is set to " << illegal_addr << std::endl;

	{ // initialize the start of memory based on static data
		// the rest of memory is zero initialized
		(*out.memory).resize(1 << (powMem-2));
		pre_mem.resize(data.size());
		
		for (int i = 0; i < data.size(); i++)
		{
			uint32_t tmp_rev = 0;
			tmp_rev += (data[i] >> 24) & 0xFF;
			tmp_rev += ((data[i] >> 16) & 0xFF) << 8;
			tmp_rev += ((data[i] >> 8) & 0xFF) << 16;
			tmp_rev += (data[i] & 0xFF) << 24;
			// (*out.memory)[i*4] = (data[i] >> 24) & 0xFF;
			// (*out.memory)[i*4 + 1] = (data[i] >> 16) & 0xFF;
			// (*out.memory)[i*4 + 2] = (data[i] >> 8) & 0xFF;
			// (*out.memory)[i*4 + 3] = data[i] & 0xFF;
			(*out.memory)[i] = tmp_rev;
			pre_mem[i] = tmp_rev;
		}
	
		// for (std::size_t i = 0; i < data.size(); ++i) {
		//   store((*out.memory), i*4, data[i]);
		// }
	
	}

	(*out.registry)[HEAPPTR_REGISTER] = data.size() * 4;

	if (replay)
	{
		// recover pc
		out.pc = pc;
		// recover register
		for (int i = 0; i < record_register.size(); i++)
			(*out.registry)[i] = record_register[i];
		// recover input
		for (int i = 0; i < record_input.size(); i++)
			(*out.input).push(record_input[i]);
		// recover output
		for (int i = 0; i < record_output.size(); i++)
			output.push_back(record_output[i]);
	}

	return out;
}


struct Instr {
	bool imm;
	Op op;
	Value arg0;
	Value arg1;
	Value arg2;
};


Instr decode(Value& v) {
	const auto imm = (v & IMM_ENABLE) != 0;
	const auto op = static_cast<Op>((v & 0x7E00000000000000) >> OP_OFFSET);
	const auto arg0 = (v & 0x01F0000000000000) >> REG1_OFFSET;
	const auto arg1 = (v & 0x000F800000000000) >> REG2_OFFSET;
	const auto arg2 = imm ? (v & 0x00000000FFFFFFFF) : (v & 0x00007C0000000000) >> REG3_OFFSET;
	return { imm, op, arg0, arg1, arg2 };
}

const std::string RECORD_ROOT_PATH = "./record/";
const std::string CONFIG_ROOT_PATH = "./epoch_config";

void makeReord(Machine& cpu, int insts_cnt) {
	// Create DIRs
	mkdir(RECORD_ROOT_PATH.c_str(), S_IRUSR | S_IWUSR | S_IXUSR | S_IRWXG | S_IRWXO);
	std::string RECORD_PATH = RECORD_ROOT_PATH + std::to_string(insts_cnt) + '/';
	mkdir(RECORD_PATH.c_str(), S_IRUSR | S_IWUSR | S_IXUSR | S_IRWXG | S_IRWXO);
	mkdir(CONFIG_ROOT_PATH.c_str(), S_IRUSR | S_IWUSR | S_IXUSR | S_IRWXG | S_IRWXO);
	std::string CONFIG_PATH = CONFIG_ROOT_PATH + "/" + std::to_string(config_cnt) + ".config";
	std::ofstream fout;
	std::ofstream cfout;

	cfout.open(CONFIG_PATH);
	
	// record PC
	fout.open(RECORD_PATH + "pc.hex");
	// fout << std::setfill('0') << std::setw(8) << std::hex << cpu.pc << std::endl;
	fout << std::dec << cpu.pc << std::endl;
	fout.close();
	if (config_cnt) cfout << std::dec << prev_pc << std::endl << std::endl;
	prev_pc = cpu.pc;

	// record RAM
	cfout << pre_mem.size() << std::endl;
	for (int i = 0; i < pre_mem.size(); i++)
	{
		cfout << std::setfill('0') << std::setw(2) << std::hex << (pre_mem[i] & 0xff);
		cfout << std::setfill('0') << std::setw(2) << std::hex << ((pre_mem[i] >> 8) & 0xff);
		cfout << std::setfill('0') << std::setw(2) << std::hex << ((pre_mem[i] >> 16) & 0xff);
		cfout << std::setfill('0') << std::setw(2) << std::hex << ((pre_mem[i] >> 24) & 0xff);
		cfout << std::endl;
	}
	cfout << std::endl;	
	if (!config_cnt) pre_mem.resize((*cpu.memory).size());
	fout.open(RECORD_PATH + "ram.hex");
	for (int i = 0; i < (*cpu.memory).size(); i++)
	{
		pre_mem[i] = (*cpu.memory)[i];
		fout << std::setfill('0') << std::setw(2) << std::hex << ((*cpu.memory)[i] & 0xff);
		fout << std::setfill('0') << std::setw(2) << std::hex << (((*cpu.memory)[i] >> 8) & 0xff);
		fout << std::setfill('0') << std::setw(2) << std::hex << (((*cpu.memory)[i] >> 16) & 0xff);
		fout << std::setfill('0') << std::setw(2) << std::hex << (((*cpu.memory)[i] >> 24) & 0xff);
		fout << std::endl;
	}
	fout.close();

	cfout << std::dec << (insts_cnt - prev_insts_cnt) << std::endl;
	prev_insts_cnt = insts_cnt;
	cfout << std::dec << config_cnt * 100 << std::endl;
	cfout << std::dec << (config_cnt + 1) * 100 << std::endl << std::endl;  

	// record REGISTER
	if (config_cnt)
	{
		for (int i = 0; i < pre_reg.size(); i++)
			cfout << std::dec << pre_reg[i] << std::endl;
	}
	cfout << std::endl;
	fout.open(RECORD_PATH + "register.hex");
	for (int i = 0; i < (*cpu.registry).size(); i++)
	{
		pre_reg[i] = (*cpu.registry)[i];
		// fout << std::setfill('0') << std::setw(8) << std::hex << (*cpu.registry)[i] << std::endl;
		fout << std::dec << (*cpu.registry)[i] << std::endl;
	}
	fout.close();

	// record INPUT
	fout.open(RECORD_PATH + "input.hex");
	// std::stack<std::uint32_t> input = (*cpu.input);
	while (!record_input_stack.empty())
	{
		// fout << std::setfill('0') << std::setw(8) << std::hex << record_input_stack.top() << std::endl;
		fout << std::dec << record_input_stack.top() << std::endl;
		cfout << std::dec  << record_input_stack.top() << std::endl;
		record_input_stack.pop();
	}
	fout.close();

	// record OUTPUT
	fout.open(RECORD_PATH + "output.hex");
	for (int i = 0; i < output.size(); i++)
		fout << std::setfill('0') << std::setw(8) << std::hex << output[i] << std::endl;
	fout.close();

	cfout.close();
	config_cnt++;
}

long long decode_time = 0;
long long exec_time = 0;

bool first = 1;

// Take a state transition.
// Output if the cpu has more steps to take.
bool step(Machine& cpu) {

	// auto start_time_exec = system_clock::now();
	
	// auto start_time_decode = high_resolution_clock::now();	
	
	auto& [pc, registry, memory, program, input] = cpu;

	const auto [imm, instr, arg0, arg1, arg2] = decode((*cpu.program)[cpu.pc]);
	const auto src0 = (*registry)[arg1];

	const auto signextend = [](Value v) {
								return (v & 0x00008000) ? (v | 0xFFFF0000) : v;
							};

	// src1 is either a sign extended immediate or the content of the registry

	auto src1 = imm ? (arg2 & 0xFFFFFFFF) : (*registry)[arg2];
	auto& tar = (*registry)[arg0];
	auto& stackptr = (*registry)[STACKPTR_REGISTER];

	// auto end_time_decode = high_resolution_clock::now();	
	// auto duration = duration_cast<microseconds>(end_time_decode - start_time_decode);
	// decode_time += duration.count();

	// auto start_time_exec = high_resolution_clock::now();

	// return true;

	// std::cout << insts_cnt << ' ' << instr << std::endl;

	switch (instr) {

	case Op::PFS:
		// insts_cnt--;
		proof_mode = 1;
	    ++pc;
		break;

	case Op::PFE:
		// insts_cnt--;
		proof_mode = 0;
		++pc;
		break;

    case Op::VMCALL:

		// std::cout << "VMCALL " << src1 << std::endl;
		
		if_stats(inst_cnt["VMCALL"]++;)
			
		oracle(cpu, src1);
		++pc;
		break;
	  
    case Op::EQZ:
		
		if_stats(inst_cnt["EQZ"]++;)

		tar = src1 == 0 ? 1 : 0;
		++pc;
		break;
	  
    case Op::MSB:

		if_stats(inst_cnt["MSB"]++;)

		tar = ((unsigned int) src1) >> 31;
		++pc;
		break;

    case Op::HALT:

		std::cout << "DEBUG PC " << pc << std::endl;
		
		if_stats(inst_cnt["HALT"]++;)
		
		return false;

    case Op::QED:

		std::cout << "QED executed!" << std::endl;
		std::cout << (*cpu.registry)[10] << std::endl;
		
		if_stats(inst_cnt["QED"]++;)
		
		return false;
	  
    case Op::RET:
		
		if_stats(inst_cnt["RET"]++;)
		
		// if the stack pointer is the top of the stack, then halt

		// if (imm) return false;
		
		// if (stackptr == memory.size()) {
		//   return false;
		// }

		// otherwise, load the stack pointer into the pc
		// pc = load(memory, stackptr);
		// stackptr += 4;
		// std::cerr << "RET OP: " << std::dec << pc << " to " << cpu.registry[11] << std::endl;
		pc = (*cpu.registry)[11];
		break;

    case Op::CMOV:
		
		if_stats(inst_cnt["CMOV"]++;)
		
		if (src0) tar = src1;
		++pc;
		break;
	  
    case Op::ADD:

		if_stats(inst_cnt["ADD"]++;)
		
		tar = src0 + src1;
		++pc;
		break;

    case Op::SUB:

		if_stats(inst_cnt["SUB"]++;)
		
		tar = src0 - src1;
		++pc;
		break;

    case Op::MUL:

		if_stats(inst_cnt["MUL"]++;)
		
		tar = src0 * src1;
		++pc;
		break;

    case Op::XOR:

		if_stats(inst_cnt["XOR"]++;)
		
		tar = src0 ^ src1;
		++pc;
		break;

    case Op::AND:

		if_stats(inst_cnt["AND"]++;)
		
		tar = src0 & src1;
		++pc;
		break;

    case Op::OR:

		if_stats(inst_cnt["OR"]++;)
		
		tar = src0 | src1;
		++pc;
		break;

    case Op::SDIV:

		if_stats(inst_cnt["SDIV"]++;)
		
		tar = ((int)src0) / ((int)src1);
		++pc;
		break;

    case Op::SREM:

		if_stats(inst_cnt["SREM"]++;)
		
		tar = ((int)src0) % ((int)src1);
		++pc;
		break;
	  
    case Op::UDIV:

		if_stats(inst_cnt["UDIV"]++;)
		
		tar = src0 / src1;
		++pc;
		break;

    case Op::UREM:

		if_stats(inst_cnt["UREM"]++;)
		
		tar = src0 % src1;
		++pc;
		break;
	  
    case Op::LT:

		if_stats(inst_cnt["LT"]++;)
		
		src1 = (*registry)[((*cpu.program)[cpu.pc] & 0x00007C0000000000) >> REG3_OFFSET];
		if (!imm) tar = ((int)src0) < ((int)src1);
		else tar = ((int)src0) <= ((int)src1);
		++pc;
		break;

    case Op::ULT:

		if_stats(inst_cnt["ULT"]++;)
		
		src1 = (*registry)[((*cpu.program)[cpu.pc] & 0x00007C0000000000) >> REG3_OFFSET];
		if (!imm) tar = src0 < src1;
		else tar = src0 <= src1;
		++pc;
		break;

    case Op::EQ:

		if_stats(inst_cnt["EQ"]++;)
		
		src1 = (*registry)[((*cpu.program)[cpu.pc] & 0x00007C0000000000) >> REG3_OFFSET];
		if (!imm) tar = src0 == src1;
		else tar = src0 != src1;
		++pc;
		break;

    case Op::SHL:

		if_stats(inst_cnt["SHL"]++;)
		
		tar = src0 << src1;
		++pc;
		break;

    case Op::SRL:

		if_stats(inst_cnt["SRL"]++;)
		
		tar = ((unsigned int)src0) >> src1;
		++pc;
		break;

    case Op::SRA:
		
		if_stats(inst_cnt["SRA"]++;)
		
		tar = ((int)src0) >> src1;
		++pc;
		break;

    case Op::JUMP:

		if_stats(inst_cnt["JUMP"]++;)
		
		// here, we use src1 because it allows jumping to immediate
		pc = src1;
		break;

    case Op::CALL:

		if_stats(inst_cnt["CALL"]++;)
		
		// stackptr -= 4;
		// store(memory, stackptr, pc+1);
		(*cpu.registry)[11] = pc + 1;
		pc = src1;
		// std::cerr << "CALL OP: " << std::dec << pc << std::endl;
		break;

    case Op::BNEQZ:

		if_stats(inst_cnt["BNEQZ"]++;)
		
		pc = src0 == 0 ? pc+1 : src1;
		break;

    case Op::INPUT:

		if_stats(inst_cnt["INPUT"]++;)
		
		tar = input->top();

		// if (first)
		// {
		// 	std::cout << "DDD " << insts_cnt << std::endl;
		// 	first = 0;
		// }

		fout << tar << endl;

		record_input_stack.push(tar);
		
		input->pop();
		++pc;
		break;

    case Op::OUTPUT:

		if_stats(inst_cnt["OUTPUT"]++;)
		
		// std::cout << tar << std::endl;
		output.push_back(tar);
		++pc;
		break;

    case Op::LOAD:

		if_stats(inst_cnt["LOAD"]++;)

		if (src0 + src1 == illegal_addr)
		{
			std::cout << "ILLEGAL LOAD" << std::endl;
			insts_cnt--;
			pc = 1; // goto QED
			break;
		}
		
		tar = load(memory, src0 + src1, (*cpu.registry)[7]);
		++pc;
		break;

    case Op::LOADH:

		if_stats(inst_cnt["LOADH"]++;)

		tar = loadh(memory, src0 + src1, (*cpu.registry)[7]);
		++pc;
		break;

    case Op::LOADB:

		if_stats(inst_cnt["LOADB"]++;)

		tar = loadb(memory, src0 + src1, (*cpu.registry)[7]);
		++pc;
		break;

    case Op::ULOADH:

		if_stats(inst_cnt["ULOADH"]++;)

		tar = uloadh(memory, src0 + src1, (*cpu.registry)[7]);
		++pc;
		break;

    case Op::ULOADB:

		if_stats(inst_cnt["ULOADB"]++;)

		tar = uloadb(memory, src0 + src1, (*cpu.registry)[7]);
		++pc;
		break;

    case Op::STORE:

		if_stats(inst_cnt["STORE"]++;)

		if (src0 + src1 == illegal_addr)
		{
			std::cout << "ILLEGAL STORE" << std::endl;
			insts_cnt--;
			pc = 1; // goto QED
			break;
		}
		
		// structure of store is different than most instructions:
		// store into src0 with offset src1 the content of tar
		store(memory, src0 + src1, tar/*src1*/);
		++pc;
		break;

    case Op::STOREH:

		if_stats(inst_cnt["STOREH"]++;)

		storeh(memory, src0 + src1, tar);
		++pc;
		break;

    case Op::STOREB:

		if_stats(inst_cnt["STOREB"]++;)

		storeb(memory, src0 + src1, tar);
		++pc;
		break;
		
    case Op::COPY:

		if_stats(inst_cnt["COPY"]++;)

		tar = src1;
		++pc;
		break;

    case Op::POW:

		if_stats(inst_cnt["POW"]++;)

		tar = 1 << src1;
		++pc;
		break;
	  
    case Op::PC:

		if_stats(inst_cnt["PC"]++;)

		tar = pc + src1;
		++pc;
		break;

	}

	// auto end_time_exec = high_resolution_clock::now();	
	// auto duration = duration_cast<microseconds>(end_time_exec - start_time_exec);
	// exec_time += duration.count();
	
	return true;
}


std::vector<Value> readValueLines(const char* filename) {
	std::fstream f(filename, std::fstream::in);
	if (!f) {
		std::cerr << "Could not open file '" << filename << "'. Aborting.\n";
		std::exit(1);
	}

	Value v;
	f >> std::hex;
	std::vector<Value> out;
	while (f >> v) {
		f.ignore(std::numeric_limits<std::streamsize>::max(), '\n'); // skip to next line
		out.push_back(v);
	}
	return out;
}


int main(int argc, char** argv) {

	// auto start_time = system_clock::now();
	
	if (argc < 7) {
		std::cerr << "Usage: " << argv[0] << " <text> <data> <input> <log-memory-size> <debug? {0,1}> <replay? {0,1}> {<record_pc> <record_register> <record> <record>}\n";
		std::exit(1);
	}

	std::vector<Value> program = readValueLines(argv[1]);
	std::vector<Value> data = readValueLines(argv[2]);
	std::vector<Value> input = readValueLines(argv[3]);
	std::size_t logMemSize = std::atoi(argv[4]);
	const bool debug = static_cast<bool>(std::atoi(argv[5]));
	const bool replay = static_cast<bool>(std::atoi(argv[6]));
	std::size_t pc = 2;
	std::vector<Value> record_register;
	std::vector<Value> record_input;
	std::vector<Value> record_output;
	if (replay)
	{
		pc = readValueLines(argv[7])[0];
		record_register = readValueLines(argv[8]);
		record_input = readValueLines(argv[9]);
		record_output = readValueLines(argv[10]);
	}

	pre_reg.resize(32);
	pre_mem.resize(1 << (logMemSize - 2));

	auto cpu = makeCpu(program, input, data, logMemSize, replay, pc, record_register, record_input, record_output);

	// auto end_time_mcpu = system_clock::now();
	// auto duration_mcpu = duration_cast<microseconds>(end_time_mcpu - start_time);

	// auto start_time = high_resolution_clock::now();	
	TimerClock TC;
	TC.update();
	
	while (step(cpu)) {
		// break;

		insts_cnt++;
		if (proof_mode) proof_insts_cnt++;

		// if (insts_cnt == 447728) break;
		
		// 214336  285780  321503  342936  357225  385803  407236
		// 183013
		// if (insts_cnt == 137260 || insts_cnt == 137260*2 || insts_cnt == 137260*3)
		// {
		// 	makeRecord(cpu, insts_cnt);
		// 	// break;
		// }
		
		//   std::cout << "registry: " << std::hex;
		//   for (const auto& r: cpu.registry) {
		// 	  std::cout << r << ' ';
		//   } std::cout << '\n';
		// std::cout << "pc: " << cpu.pc << '\n';
		// std::cout << "program[pc]: " << cpu.program[cpu.pc] << '\n';
		
		// if (debug) {
		// 	std::cerr << "registry: " << std::hex;
		// 	for (const auto& r: (*cpu.registry)) {
		// 		std::cerr << r << ' ';
		// 	} std::cerr << '\n';
		// 	std::cerr << "pc: " << cpu.pc << '\n';
		// 	std::cerr << "program[pc]: " << (*cpu.program)[cpu.pc] << '\n';
		// 	std::cin.get();
		// }
		
	}

	insts_cnt++;
	// makeRecord(cpu, insts_cnt);	

	// auto end_time = high_resolution_clock::now();
	// auto duration = duration_cast<microseconds>(end_time - start_time);	

	std::cout << "Instruction Approximation Number: " << insts_cnt << std::endl;
	std::cout << "Proof Instruction Approximation Number: " << proof_insts_cnt << std::endl;

	for (const auto& o: output) {
		std::cout << (char)o;
	}

	std::cout << "Instruction Distribution:" << std::endl;
	for (std::map<std::string, int>::const_iterator it = inst_cnt.begin(); it != inst_cnt.end(); ++it)
		std::cout << it->first << ": " << it->second << std::endl;
	
	// cout <<  "MakeCPU Runtime: " 
	// 	 << double(duration_mcpu.count()) * microseconds::period::num / microseconds::period::den 
	// 	 << "s" << endl;
	
	// cout <<  "Total Runtime: " 
	// 	 << double(duration.count()) * microseconds::period::num / microseconds::period::den 
	// 	 << "s" << endl;

	// cout <<  "Total Runtime (without MCPU): " 
	// 	 << double(duration.count()) * 0.001
	// 	 << "ms" << endl;

	cout <<  "Total Runtime (without MCPU): " 
		 << TC.getTimerMicroSec()
		 << "us" << endl;
	
	// cout <<  "Total Decoding Time: " 
	// 	 << double(decode_time) * 0.001
	// 	 << "ms" << endl;

	// cout <<  "Total Exec Time: " 
	// 	 << exec_time * 0.001
	// 	 << "ms" << endl;
	
}
