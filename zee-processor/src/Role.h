#ifndef ROLE_H__
#define ROLE_H__

#include <cassert>


enum class Role {
  Input,
  Prover,
  Check,
  Verifier,
};


template <bool owned, typename T>
struct Known;

template <typename T>
struct Known<true, T> {
  constexpr Known() noexcept { }
  constexpr Known(T content) noexcept : content(content) { }

  const T& operator*() const { return content; }
  T& operator*() { return content; }
  const T* operator->() const { return &content; }
  T* operator->() { return &content; }
  operator T() const { return content; }

  T content;
};


template <typename T>
struct Known<false, T> {
  constexpr Known() noexcept { }
  constexpr Known(const T&) noexcept { }
};


#endif
