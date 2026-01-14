#include <vector>
#include <array>
#include <stack>
#include <fstream>
#include <iostream>
#include <limits>
#include "zkconst.h"

using namespace zkconst;

using Value = std::uint32_t;

struct Cpu {
	Value pc;
	std::vector<Value> program;
	std::array<Value, 32> registry;
	std::vector<Value> memory;
	std::stack<Value, std::vector<Value>> input;
	std::vector<Value> output;
	std::stack<Value> ret_val;
};

Cpu makeCpu(
    const std::vector<Value>& program,
    const std::vector<Value>& input,
    std::size_t powMem) {
	Cpu out;
	out.pc = 0;
	out.program = program;
	out.input = std::stack<Value, std::vector<Value>> { input };

	for (auto& r: out.registry) { r = 0; }

	while (!out.ret_val.empty()) out.ret_val.pop();

	//initialize stack register
	out.registry[7] = 1 << powMem;

	out.memory.resize(1 << powMem);
	return out;
}


enum class Op : Value {
	RET       = 0x00,
	ADD       = 0x01,
	SUB       = 0x02,
	MUL       = 0x03,
	XOR       = 0x04,
	AND       = 0x05,
	OR        = 0x06,
	LT        = 0x07,
	GT        = 0x08,
	EQ        = 0x09,
	JUMP      = 0x0a,
	BNEQZ     = 0x0b,
	INPUT     = 0x0c,
	OUTPUT    = 0x0d,
	LOAD      = 0x0e,
	STORE     = 0x0f,
	CALL      = 0x10,
	COPY      = 0x11,
	NEQ       = 0x12,
};


struct Instr {
	bool imm;
	Op op;
	Value arg0;
	Value arg1;
	Value arg2;
};


Instr decode(const Value& v) {
	const auto imm = (v & 0x80000000) != 0;
	const auto op = static_cast<Op>((v & 0x7C000000) >> OP_OFFSET);
	const auto arg0 = (v & 0x03E00000) >> REG1_OFFSET;
	const auto arg1 = (v & 0x001F0000) >> REG2_OFFSET;
	const auto arg2 = imm ? (v & 0x0000FFFF) : (v & 0x0000F800) >> REG3_OFFSET;
	return { imm, op, arg0, arg1, arg2 };
}


// Take a state transition.
// Output if the cpu has more steps to take.
bool step(Cpu& cpu) {
	auto& [pc, program, registry, memory, input, output, ret_val] = cpu;
	const auto [imm, instr, arg0, arg1, arg2] = decode(cpu.program[cpu.pc]);
	const auto src0 = registry[arg1];
	const auto src1 = imm ? ((arg2 & 0x00008000) ? (arg2 | 0xFFFF0000) : arg2) : registry[arg2];
	auto& tar = registry[arg0];

	switch (instr) {
    case Op::RET:
		if (ret_val.empty()) return false;
		pc = ret_val.top();
		ret_val.pop();
		break;

    case Op::ADD:
		tar = src0 + src1;
		++pc;
		break;

    case Op::SUB:
		tar = src0 - src1;
		++pc;
		break;

    case Op::MUL:
		tar = src0 * src1;
		++pc;
		break;

    case Op::XOR:
		tar = src0 ^ src1;
		++pc;
		break;

    case Op::AND:
		tar = src0 & src1;
		++pc;
		break;

    case Op::OR:
		tar = src0 | src1;
		++pc;
		break;

    case Op::LT:
		tar = src0 < src1;
		++pc;
		break;

    case Op::GT:
		tar = src0 > src1;
		++pc;
		break;

    case Op::EQ:
		tar = src0 == src1;
		++pc;
		break;

	case Op::NEQ:
		tar = src0 != src1;
		++pc;
		break;

    case Op::JUMP:
		// here, we use src1 because it allows jumping to immediate
		pc = src1;
		break;

	case Op::CALL:
		ret_val.push(pc+1);
		pc = src1;
		break;

    case Op::BNEQZ:
		pc = src0 == 0 ? pc+1 : src1;
		break;

    case Op::INPUT:
		tar = input.top();
		input.pop();
		++pc;
		break;

    case Op::OUTPUT:
		output.push_back(tar);
		++pc;
		break;

    case Op::LOAD:
		tar = memory[src0 + src1];
		++pc;
		break;

    case Op::STORE:
		// structure of store is different than most instructions:
		// store into src0 with offset src1 the content of tar
		memory[src0 + src1] = tar;
		++pc;
		break;

	case Op::COPY:
		tar = src1;
		++pc;
		break;
	}

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
	if (argc < 5) {
		std::cerr << "Usage: " << argv[0] << " <program> <input> <log-memory-size> <debug? {0,1}>\n";
		std::exit(1);
	}

	const std::vector<Value> program = readValueLines(argv[1]);
	const std::vector<Value> input = readValueLines(argv[2]);
	const std::size_t logMemSize = std::atoi(argv[3]);
	const bool debug = static_cast<bool>(std::atoi(argv[4]));

	auto cpu = makeCpu(program, input, logMemSize);

	while (step(cpu)) {
		if (debug) {
			std::cerr << "registry: " << std::hex;
			for (const auto& r: cpu.registry) {
				std::cerr << r << ' ';
			} std::cerr << '\n';
			std::cerr << "pc: " << cpu.pc << '\n';
			std::cerr << "program[pc]: " << cpu.program[cpu.pc] << '\n';
			std::cin.get();
		}
	}

	for (const auto& o: cpu.output) {
		std::cout << o << '\n';
	}
}
