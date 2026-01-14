#ifndef ADDR_H__
#define ADDR_H__


#include <Reg.h>


struct Cell {
  Reg pointer;
  Cell& operator=(const Reg&);
  Cell& operator=(std::uint32_t);
  Cell& operator=(const Input&);

  operator Reg();
};


struct Allocator {
  Allocator() : ptr(0), max(0) { };
  std::uint32_t alloc(std::size_t size);
  void free(std::size_t where, std::size_t size);

  std::uint32_t ptr;
  std::uint32_t max;
};


struct Addr {
  static Allocator addrAllocator;
  std::uint32_t where;
  std::uint32_t size;
  Addr(std::size_t size);
  Addr(const Addr&) = delete;
  Addr& operator=(const Addr&) = delete;
  Addr(Addr&&) noexcept;
  Addr& operator=(Addr&&) noexcept;
  ~Addr() noexcept;

  Cell operator*() const;
  Cell operator[](const Reg&) const;
  Cell operator[](const Expr&) const;
  Cell operator[](std::uint32_t) const;
};

#endif
