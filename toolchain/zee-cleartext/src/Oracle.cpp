#include "Oracle.h"
#include <iostream>
#include <stack>
#include <map>
#include <unistd.h>
#include <fcntl.h>
#include <algorithm>
#include <sys/stat.h>
#include <vector>
#include <ctime>
#include <errno.h>

struct Node
{
	int idx;
	int key;
	bool operator < (const Node x) const {  
		return key > x.key;    
	}  	
};

void chmod_oracle(Machine &cpu)
{
	std::string filename = "";
	for (int i = (*cpu.registry)[16]; /*(*cpu.memory)[i] != '\0'*/; i++)
	{
		char tmpc;
		tmpc = ((*cpu.memory)[i/4] >> (8 * (i%4))) & 0xFF;
		if (tmpc == '\0') break;
		filename += tmpc;
	}
	mode_t mode = (*cpu.registry)[17];
	int res = chmod(filename.c_str(), mode);
	if (res == -1) cpu.input->push(errno);
	cpu.input->push(res);		
}

void isatty_oracle(Machine &cpu)
{
	int fd = (*cpu.registry)[16];
	int res = isatty(fd);
	if (res == 0) cpu.input->push(errno);
	cpu.input->push(res);
}

void close_oracle(Machine &cpu)
{
	int fd = (*cpu.registry)[16];
	int res = close(fd);
	if (res == -1) cpu.input->push(errno);
	cpu.input->push(res);
}

void gettime_oracle(Machine &cpu)
{
	int res = time(0);
	cpu.input->push(res);
}

void unlink_oracle(Machine &cpu)
{
	std::string filename = "";
	for (int i = (*cpu.registry)[16]; /*(*cpu.memory)[i] != '\0'*/; i++)
	{
		char tmpc;
		tmpc = ((*cpu.memory)[i/4] >> (8 * (i%4))) & 0xFF;
		if (tmpc == '\0') break;
		filename += tmpc;
	}
	int res = unlink(filename.c_str());
	// std::cout << filename << ' ' << res << ' ' << errno << std::endl;
	if (res == -1) cpu.input->push(errno);
	cpu.input->push(res);		
}
	
void stat_oracle(Machine &cpu)
{
	std::string filename = "";
	for (int i = (*cpu.registry)[16]; /*(*cpu.memory)[i] != '\0'*/; i++)
	{
		char tmpc;
		tmpc = ((*cpu.memory)[i/4] >> (8 * (i%4))) & 0xFF;
		if (tmpc == '\0') break;
		filename += tmpc;
	}
    struct stat buf;
    int res = stat(filename.c_str(), &buf);
	if (res == 0)
	{
		cpu.input->push(buf.st_dev);
		cpu.input->push(buf.st_ino);
		cpu.input->push(buf.st_mode);
		cpu.input->push(buf.st_nlink);
		cpu.input->push(buf.st_uid);
		cpu.input->push(buf.st_gid);
		cpu.input->push(buf.st_rdev);
		cpu.input->push(buf.st_size);
		cpu.input->push(buf.st_blksize);
		cpu.input->push(buf.st_blocks);
		cpu.input->push(buf.st_atime);
		cpu.input->push(buf.st_mtime);
		cpu.input->push(buf.st_ctime);
		cpu.input->push(res);
	}
	else
	{
		cpu.input->push(errno);
		cpu.input->push(res);
	}
}

void fstat_oracle(Machine &cpu)
{
	int fd = (*cpu.registry)[16];
    struct stat buf;
    int res = fstat(fd, &buf);
	if (res == 0)
	{
		cpu.input->push(buf.st_dev);
		cpu.input->push(buf.st_ino);
		cpu.input->push(buf.st_mode);
		cpu.input->push(buf.st_nlink);
		cpu.input->push(buf.st_uid);
		cpu.input->push(buf.st_gid);
		cpu.input->push(buf.st_rdev);
		cpu.input->push(buf.st_size);
		cpu.input->push(buf.st_blksize);
		cpu.input->push(buf.st_blocks);
		cpu.input->push(buf.st_atime);
		cpu.input->push(buf.st_mtime);
		cpu.input->push(buf.st_ctime);
		cpu.input->push(res);
	}
	else
	{
		cpu.input->push(errno);
		cpu.input->push(res);
	}
}


void kth_oracle(Machine &cpu)
{
	unsigned int base = (*cpu.registry)[16];
	unsigned int n = (*cpu.registry)[17];
	unsigned int k = (*cpu.registry)[14];
	std::vector<Node> v;
	v.clear();
	v.resize(n);
	for (int i = 0; i < n; i++)
	{
		v[i].idx = i;
		v[i].key = (*cpu.memory)[base/4+i];
	}
	sort(v.begin(), v.end());
	cpu.input->push(v[n-k].idx);
}

void sort_oracle(Machine &cpu)
{
	unsigned int base = (*cpu.registry)[16];
	unsigned int n = (*cpu.registry)[17];
	std::vector<Node> v;
	v.clear();
	v.resize(n);
	for (int i = 0; i < n; i++)
	{
		v[i].idx = i;
		v[i].key = (*cpu.memory)[base/4+i];
	}
	sort(v.begin(), v.end());
	for (int i = 0; i < n; i++)
		cpu.input->push(v[i].idx);
}

void prover_input_oracle(Machine& m) {
	// std::uint32_t v;
	// std::cin >> v;
	std::cout << "STACK " << (*m.registry)[7] << std::endl;
	// m.tape->push_back(v);
}

void srl_oracle(Machine &cpu)
{
	unsigned int dividend = (*cpu.registry)[16];
	unsigned int divisor = (*cpu.registry)[17];
	cpu.input->push(dividend >> divisor);
}

void udiv_oracle(Machine &cpu) {
	// std::cout << "VMCALL_UDIV!" << std::endl;
	unsigned int dividend = (*cpu.registry)[16];
	unsigned int divisor = (*cpu.registry)[17];
	cpu.input->push(dividend % divisor);
	unsigned int q = dividend / divisor;
	unsigned int pov0 = q >> 16;
	unsigned int sft = q & 65535;
	unsigned int base = divisor >> 16;
	unsigned int off = divisor & 65535;
	unsigned int pov1 = (sft * off) >> 16;
	cpu.input->push(pov1);
	cpu.input->push(off);
	cpu.input->push(base);
	cpu.input->push(sft);
	cpu.input->push(pov0);
	// cpu.input->push(dividend / divisor);
	// (*cpu.registry)[16] = dividend / divisor;
	// (*cpu.registry)[17] = dividend % divisor;
}

void div_oracle(Machine &cpu) {
	// std::cout << "VMCALL_DIV!" << std::endl;
	int dividend = (*cpu.registry)[16];
	int divisor = (*cpu.registry)[17];
	cpu.input->push(dividend % divisor);
	cpu.input->push(dividend / divisor);
	// (*cpu.registry)[16] = dividend / divisor;
	// (*cpu.registry)[17] = dividend % divisor;
}

void open_oracle(Machine &cpu) {
	std::cout << "VMCALL_OPEN!" << std::endl;
	std::string filename = "";
	for (int i = (*cpu.registry)[16]; /*(*cpu.memory)[i] != '\0'*/; i++)
	{
		char tmpc;
		tmpc = ((*cpu.memory)[i/4] >> (8 * (i%4))) & 0xFF;
		if (tmpc == '\0') break;
		filename += tmpc;
	}
	int oflag = (*cpu.registry)[17];
	int mode = (*cpu.registry)[14];
	int fn = open(filename.c_str(), oflag, mode);
	if (fn == -1) cpu.input->push(errno);
	cpu.input->push(fn);
	
	std::cout << "OPEN: " << filename << " FD: " << fn << std::endl;	
}

void read_oracle(Machine &cpu) {
	std::cout << "VMCALL_READ!" << std::endl;

	int fd = (*cpu.registry)[16];
	int len = (*cpu.registry)[14];
	char * buf = new char[len];

	int res = read(fd, buf, len);

	for (int i = res - 1; i >= 0; i--) cpu.input->push(buf[i]);
	cpu.input->push(res);
}

void lseek_oracle(Machine &cpu) {	
	int file = (*cpu.registry)[16];
	int ptr = (*cpu.registry)[17];
	int dir = (*cpu.registry)[14];

	int res = lseek(file, ptr, dir);
	if (res == -1) cpu.input->push(errno);
	cpu.input->push(res);
}

// one number one time
void stdin_oracle(Machine &cpu) {
	int tmp;
	// std::cout << "STDIN OC INPUT: " << std::endl;
	std::cin >> tmp;
	cpu.input->push(tmp);
}

void argc_oracle(Machine &cpu) {
	std::string s;
	getline(std::cin, s);
	cpu.input->push(0);
	for (int i = s.length() - 1; i >= 0; i--)
		cpu.input->push(s[i]);
}

void oracle(Machine& m, std::uint32_t oracle_id) {
	// std::cout <<"DEBUG" << std::endl;
	switch (oracle_id) {
    case 0:
		open_oracle(m);
		break;
	case 1:
		read_oracle(m);
		break;
    case 2:
		udiv_oracle(m);
		break;
    case 3:
		div_oracle(m);
		break;
	case 4:
		argc_oracle(m);
		break;
	case 5:
		stdin_oracle(m);
		break;
	case 6:
		srl_oracle(m);
		break;
	case 7:
		sort_oracle(m);
		break;
	case 8:
		kth_oracle(m);
		break;
	case 9:
		gettime_oracle(m);
		break;
	case 10:
		stat_oracle(m);
		break;
	case 11:
		fstat_oracle(m);
		break;
	case 12:
		unlink_oracle(m);
		break;
	case 13:
		chmod_oracle(m);
		break;
	case 14:
		close_oracle(m);
		break;
	case 15:
		isatty_oracle(m);
		break;
	case 16:
		lseek_oracle(m);
		break;
    default:
		std::cerr << "Unknown oracle ID: `" << oracle_id << "`.\n";
		std::exit(1);
		break;
	}
}
