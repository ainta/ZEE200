#ifndef REG_H__
#define REG_H__

#include <array>
#include <vector>
#include <string>
#include <set>


void emit(const char*, std::uint32_t, std::uint32_t, std::uint32_t);
void emit(const char*, std::uint32_t, std::uint32_t);
void emit(const char*, std::uint32_t);

struct Reg;

struct Program {
  static std::vector<std::string> instructions;
  static std::size_t nInstructions;
  static void generate(const Reg&);
};


struct Expr {
  Expr() { }
  Expr(const char* op, std::uint32_t arg0, std::uint32_t arg1)
    : op(op), arg0(arg0), arg1(arg1), nArg(2) { }
  Expr(const char* op, std::uint32_t arg0)
    : op(op), arg0(arg0), nArg(1) { }

  const char* op;
  std::uint32_t arg0;
  std::uint32_t arg1;
  std::size_t nArg;

  operator Reg();
};

struct Input {
};

static constexpr Input input;

struct Cell;


struct RegPool {
  RegPool(const std::set<std::uint32_t>& a) : available(a) { }
  std::set<std::uint32_t> available;
  std::uint32_t alloc();
  void free(std::uint32_t);
};


struct Reg {
  public:
    static RegPool pool;

    Reg();
    Reg(const Reg&);
    Reg(Reg&&);
    Reg& operator=(const Reg&);
    Reg& operator=(Reg&&) noexcept;
    ~Reg();

    Reg& operator=(const Expr&);
    Reg& operator=(std::uint32_t);
    Reg& operator=(const Cell&);
    Reg& operator=(const Input&);

    Cell operator*() const;
    Cell operator[](const Reg&) const;
    Cell operator[](const Expr&) const;
    Cell operator[](std::uint32_t) const;

    const std::uint32_t id;

  private:
    Reg(std::uint32_t id) : id(id) { }
};


[[nodiscard]] Expr operator+(const Reg&, const Reg&);
[[nodiscard]] Expr operator+(const std::uint32_t&, const Reg&);
[[nodiscard]] Expr operator+(const Reg&, const std::uint32_t&);
inline Reg& operator+=(Reg& x, const Reg& y) { x = x + y; return x; }
inline Reg& operator+=(Reg& x, uint32_t y) { x = x + y; return x; }
inline Reg& operator++(Reg& x) { x += 1; return x; }
inline Reg& operator++(Reg& x, int) { x += 1; return x; }

[[nodiscard]] Expr operator-(const Reg&, const Reg&);
[[nodiscard]] Expr operator-(const std::uint32_t&, const Reg&);
[[nodiscard]] Expr operator-(const Reg&, const std::uint32_t&);
inline Reg& operator-=(Reg& x, const Reg& y) { x = x - y; return x; }
inline Reg& operator-=(Reg& x, uint32_t y) { x = x - y; return x; }
inline Reg& operator--(Reg& x) { x -= 1; return x; }
inline Reg& operator--(Reg& x, int) { x -= 1; return x; }

[[nodiscard]] Expr operator*(const Reg&, const Reg&);
[[nodiscard]] Expr operator*(const std::uint32_t&, const Reg&);
[[nodiscard]] Expr operator*(const Reg&, const std::uint32_t&);
inline Reg& operator*=(Reg& x, const Reg& y) { x = x * y; return x; }
inline Reg& operator*=(Reg& x, uint32_t y) { x = x * y; return x; }

[[nodiscard]] Expr operator<(const Reg&, const Reg&);
[[nodiscard]] Expr operator<(const std::uint32_t&, const Reg&);
[[nodiscard]] Expr operator<(const Reg&, const std::uint32_t&);

[[nodiscard]] Expr operator>(const Reg&, const Reg&);
[[nodiscard]] Expr operator>(const std::uint32_t&, const Reg&);
[[nodiscard]] Expr operator>(const Reg&, const std::uint32_t&);

[[nodiscard]] Expr operator<=(const Reg&, const Reg&);
[[nodiscard]] Expr operator<=(const std::uint32_t&, const Reg&);
[[nodiscard]] Expr operator<=(const Reg&, const std::uint32_t&);

[[nodiscard]] Expr operator>=(const Reg&, const Reg&);
[[nodiscard]] Expr operator>=(const std::uint32_t&, const Reg&);
[[nodiscard]] Expr operator>=(const Reg&, const std::uint32_t&);

[[nodiscard]] Expr operator==(const Reg&, const Reg&);
[[nodiscard]] Expr operator==(const std::uint32_t&, const Reg&);
[[nodiscard]] Expr operator==(const Reg&, const std::uint32_t&);

[[nodiscard]] Expr operator!=(const Reg&, const Reg&);
[[nodiscard]] Expr operator!=(const std::uint32_t&, const Reg&);
[[nodiscard]] Expr operator!=(const Reg&, const std::uint32_t&);

[[nodiscard]] Expr operator&(const Reg&, const Reg&);
[[nodiscard]] Expr operator&(const std::uint32_t&, const Reg&);
[[nodiscard]] Expr operator&(const Reg&, const std::uint32_t&);
inline Reg& operator&=(Reg& x, const Reg& y) { x = x & y; return x; }
inline Reg& operator&=(Reg& x, uint32_t y) { x = x & y; return x; }

[[nodiscard]] Expr operator|(const Reg&, const Reg&);
[[nodiscard]] Expr operator|(const std::uint32_t&, const Reg&);
[[nodiscard]] Expr operator|(const Reg&, const std::uint32_t&);
inline Reg& operator|=(Reg& x, const Reg& y) { x = x | y; return x; }
inline Reg& operator|=(Reg& x, uint32_t y) { x = x | y; return x; }

[[nodiscard]] Expr operator^(const Reg&, const Reg&);
[[nodiscard]] Expr operator^(const std::uint32_t&, const Reg&);
[[nodiscard]] Expr operator^(const Reg&, const std::uint32_t&);
inline Reg& operator^=(Reg& x, const Reg& y) { x = x ^ y; return x; }
inline Reg& operator^=(Reg& x, uint32_t y) { x = x ^ y; return x; }

[[nodiscard]] Expr operator~(const Reg&);


/* inline Expr operator>>(const Reg& r, std::uint32_t i) { */
/* } */


#endif
