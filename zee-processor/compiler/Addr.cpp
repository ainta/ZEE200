#include <Addr.h>


std::uint32_t Allocator::alloc(std::size_t size) {
  ptr += size;
  max = std::max(max, ptr);
  return ptr - size;
}


void Allocator::free(std::size_t where, std::size_t size) {
  if (where+size == ptr) {
    ptr = where;
  }
}


Allocator Addr::addrAllocator;


Addr::Addr(std::size_t size) {
  where = addrAllocator.alloc(size);
}


Addr::Addr(Addr&& o) noexcept {
  where = o.where;
  size = o.size;
  o.size = -1;
  o.where = -1;
}


Addr& Addr::operator=(Addr&& o) noexcept {
  addrAllocator.free(where, size);
  where = o.where;
  size = o.size;
  o.size = -1;
  o.where = -1;
  return *this;
}


Addr::~Addr() noexcept {
  addrAllocator.free(where, size);
}

Cell Addr::operator*() const {
  Cell out;
  out.pointer = where;
  return out;
}


Cell Addr::operator[](const Reg& offset) const {
  Cell out;
  out.pointer = where + offset;
  return out;
}


Cell Addr::operator[](const Expr& offset) const {
  Cell out;
  out.pointer = offset;
  out.pointer += where;
  return out;
}


Cell Addr::operator[](std::uint32_t x) const {
  Cell out;
  out.pointer = where + x;
  return out;
}


