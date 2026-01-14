#include <Reg.h>
#include <Addr.h>
#include <iostream>
#include <sstream>


RegPool Reg::pool = std::set<uint32_t>
  { 0,1,2,3,4,
    5,6,7,8,9,
    10,11,12,13,14,
    15,16,17,18,19,
    20,21,22,23,24,
    25,26,27,28,29,
    30,31 };


std::vector<std::string> Program::instructions;
std::size_t Program::nInstructions = 0;


void Program::generate(const Reg& output) {
  std::cerr << "MAX USED MEMORY ADDRESS: " << Addr::addrAllocator.max << '\n';
  for (const auto& i: instructions) {
    std::cout << i << '\n';
  }
  std::cout << "COPY " << output.id << " 0\n";
  std::cout << "HALT\n";
}



void emit(const char* s, std::uint32_t a, std::uint32_t b, std::uint32_t c) {
  std::stringstream ss;
  ss << s << ' ' << a << ' ' << b << ' ' << c;
  Program::instructions.push_back(ss.str());
  ++Program::nInstructions;
}


void emit(const char* s, std::uint32_t a, std::uint32_t b) {
  std::stringstream ss;
  ss << s << ' ' << a << ' ' << b;
  Program::instructions.push_back(ss.str());
  ++Program::nInstructions;
}


void emit(const char* s, std::uint32_t a) {
  std::stringstream ss;
  ss << s << ' ' << a;
  Program::instructions.push_back(ss.str());
  ++Program::nInstructions;
}


std::uint32_t RegPool::alloc() {
  if (available.empty()) {
    std::cerr << "insufficient registers!\n";
    std::exit(1);
  }

  const auto it = available.begin();
  available.erase(it);
  return *it;
}


void RegPool::free(std::uint32_t x) {
  available.insert(x);
}


Reg::Reg() : id(pool.alloc()) { }


Reg::Reg(const Reg& o) : id(pool.alloc()) {
  emit("COPY", o.id, id);
}


Reg::Reg(Reg&& o) : id(pool.alloc()) {
  emit("COPY", o.id, id);
}


Reg::~Reg() {
  pool.free(id);
}


Reg& Reg::operator=(const Reg& o) {
  emit("COPY", o.id, id);
  return *this;
}


Reg& Reg::operator=(Reg&& o) noexcept {
  emit("COPY", o.id, id);
  return *this;
}


Reg& Reg::operator=(const Expr& e) {
  if (e.nArg == 2) {
    emit(e.op, e.arg0, e.arg1, id);
  } else {
    emit(e.op, e.arg0, id);
  }
  return *this;
}


Reg& Reg::operator=(std::uint32_t x) {
  emit("COPYI", x, id);
  return *this;
}

Reg& Reg::operator=(const Input&) {
  emit("INPUT", id);
  return *this;
}


Expr::operator Reg() {
  Reg fresh;
  fresh = *this;
  return fresh;
}


Reg& Reg::operator=(const Cell& o) {
  emit("LOAD", o.pointer.id, id);
  return *this;
}


Cell::operator Reg() {
  Reg fresh;
  emit("LOAD", pointer.id, fresh.id);
  return fresh;
}


Cell& Cell::operator=(const Reg& o) {
  emit("STORE", pointer.id, o.id);
  return *this;
}


Cell& Cell::operator=(std::uint32_t o) {
  emit("STOREI", pointer.id, o);
  return *this;
}


Cell& Cell::operator=(const Input& i) {
  Reg fresh;
  fresh = i;
  *this = fresh;
  return *this;
}


Cell Reg::operator*() const {
  Cell out;
  out.pointer = *this;
  return out;
}


Cell Reg::operator[](const Reg& offset) const {
  Cell out;
  out.pointer = *this + offset;
  return out;
}


Cell Reg::operator[](const Expr& offset) const {
  Cell out;
  out.pointer = offset;
  out.pointer += *this;
  return out;
}


Cell Reg::operator[](std::uint32_t x) const {
  Cell out;
  out.pointer = *this + x;
  return out;
}



// Binary operations

Expr operator+(const Reg& r0, const Reg& r1) {
  return Expr { "ADD", r0.id, r1.id };
}

Expr operator+(const Reg& r, const std::uint32_t& x) {
  return Expr { "ADDI", r.id, x };
}

Expr operator+(const std::uint32_t& x, const Reg& r) { return r + x; }


Expr operator-(const Reg& r0, const Reg& r1) {
  return Expr { "SUB", r0.id, r1.id };
}

Expr operator-(const Reg& r, const std::uint32_t& x) {
  return Expr { "SUBI", r.id, x };
}

Expr operator-(const std::uint32_t& x, const Reg& r) {
  Reg fresh;
  fresh = x;
  return fresh - r;
}


Expr operator*(const Reg& r0, const Reg& r1) {
  return Expr { "MUL", r0.id, r1.id };
}

Expr operator*(const Reg& r, const std::uint32_t& x) {
  return Expr { "MULI", r.id, x };
}

Expr operator*(const std::uint32_t& x, const Reg& r) { return r * x; }


Expr operator<(const Reg& r0, const Reg& r1) {
  return Expr { "LT", r0.id, r1.id };
}

Expr operator<(const Reg& r, const std::uint32_t& x) {
  return Expr { "LTI", r.id, x };
}

Expr operator<(const std::uint32_t& x, const Reg& r) { return r > x; }


Expr operator>(const Reg& r0, const Reg& r1) {
  return Expr { "GT", r0.id, r1.id };
}

Expr operator>(const Reg& r, const std::uint32_t& x) {
  return Expr { "GTI", r.id, x };
}

Expr operator>(const std::uint32_t& x, const Reg& r) { return r < x; }


Expr operator<=(const Reg& r0, const Reg& r1) {
  return Expr { "LTE", r0.id, r1.id };
}

Expr operator<=(const Reg& r, const std::uint32_t& x) {
  return Expr { "LTEI", r.id, x };
}

Expr operator<=(const std::uint32_t& x, const Reg& r) { return r >= x; }


Expr operator>=(const Reg& r0, const Reg& r1) {
  return Expr { "GTE", r0.id, r1.id };
}

Expr operator>=(const Reg& r, const std::uint32_t& x) {
  return Expr { "GTEI", r.id, x };
}

Expr operator>=(const std::uint32_t& x, const Reg& r) { return r <= x; }


Expr operator==(const Reg& r0, const Reg& r1) {
  return Expr { "EQL", r0.id, r1.id };
}

Expr operator==(const Reg& r, const std::uint32_t& x) {
  return Expr { "EQLI", r.id, x };
}

Expr operator==(const std::uint32_t& x, const Reg& r) { return r == x; }


Expr operator!=(const Reg& r0, const Reg& r1) {
  return Expr { "NEQ", r0.id, r1.id };
}

Expr operator!=(const Reg& r, const std::uint32_t& x) {
  return Expr { "NEQI", r.id, x };
}

Expr operator!=(const std::uint32_t& x, const Reg& r) { return r != x; }


Expr operator&(const Reg& r0, const Reg& r1) {
  return Expr { "AND", r0.id, r1.id };
}

Expr operator&(const Reg& r, const std::uint32_t& x) {
  return Expr { "ANDI", r.id, x };
}

Expr operator&(const std::uint32_t& x, const Reg& r) { return r & x; }


Expr operator|(const Reg& r0, const Reg& r1) {
  return Expr { "OR", r0.id, r1.id };
}

Expr operator|(const Reg& r, const std::uint32_t& x) {
  return Expr { "ORI", r.id, x };
}

Expr operator|(const std::uint32_t& x, const Reg& r) { return r | x; }


Expr operator^(const Reg& r0, const Reg& r1) {
  return Expr { "XOR", r0.id, r1.id };
}

Expr operator^(const Reg& r, const std::uint32_t& x) {
  return Expr { "XORI", r.id, x };
}

Expr operator^(const std::uint32_t& x, const Reg& r) { return r ^ x; }

Expr operator~(const Reg& r) { return Expr { "NOT", r.id }; }
