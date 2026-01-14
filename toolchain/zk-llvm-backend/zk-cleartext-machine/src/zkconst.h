#ifndef ZKCONST_H
#define ZKCONST_H

namespace zkconst {

	const uint32_t IMM_ENABLE    = 0x80000000;

	const uint32_t MASK16    = 0x0000FFFF;

	const uint32_t IMM_OFFSET     = 31;
	const uint32_t OP_OFFSET      = 26;
	const uint32_t REG1_OFFSET    = 21;
	const uint32_t REG2_OFFSET    = 16;
	const uint32_t REG3_OFFSET    = 11;
	
	const uint32_t ADDOP       = 0x01;
	const uint32_t SUBOP       = 0x02;
	const uint32_t MULOP       = 0x03;
	const uint32_t XOROP       = 0x04;
	const uint32_t ANDOP       = 0x05;
	const uint32_t OROP        = 0x06;
	const uint32_t LTOP        = 0x07;
    const uint32_t GTOP        = 0x08;
    const uint32_t EQOP        = 0x09;
    const uint32_t JUMPOP      = 0x0a;
    const uint32_t BNEQZOP     = 0x0b;
	const uint32_t INPUTOP     = 0x0c;
    const uint32_t OUTPUTOP    = 0x0d;
    const uint32_t LOADOP      = 0x0e;
	const uint32_t STOREOP     = 0x0f;
	const uint32_t CALLOP      = 0x10;
	const uint32_t COPYOP      = 0x11;
	const uint32_t NEQOP       = 0x12;

}


#endif
