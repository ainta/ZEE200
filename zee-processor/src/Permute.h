#ifndef PERMUTE_H__
#define PERMUTE_H__

#include <vector>
#include <span>
#include <unordered_set>
#include <Share.h>
#include <iostream>


using namespace GT;

using Programming = std::vector<bool>;

using Permutation = std::vector<std::uint32_t>;

using Choice = std::vector<std::uint32_t>;


Programming programPermutation(const Permutation&);


template <Role role>
struct ProgrammingIterator;

template<>
struct ProgrammingIterator<Role::Input> {
  Programming& programming;
  std::uint32_t ix;

  ProgrammingIterator& operator++() {
    ++ix;
    return *this;
  }

  bool operator*() {
    return { programming[ix] };
  }
};

template<>
struct ProgrammingIterator<Role::Prover> {
  constexpr ProgrammingIterator() noexcept { }
  constexpr ProgrammingIterator(Programming&, std::uint32_t) noexcept { }
  ProgrammingIterator& operator++() { return *this; }
  bool operator*() { return false; }
};

template<>
struct ProgrammingIterator<Role::Verifier> {
  constexpr ProgrammingIterator() noexcept { }
  constexpr ProgrammingIterator(Programming&, std::uint32_t) noexcept { }
  ProgrammingIterator& operator++() { return *this; }
  bool operator*() { return false; }
};

template<>
struct ProgrammingIterator<Role::Check> {
  constexpr ProgrammingIterator() noexcept { }
  constexpr ProgrammingIterator(Programming&, std::uint32_t) noexcept { }
  ProgrammingIterator& operator++() { return *this; }
  bool operator*() { return false; }
};


template <Role role, typename T>
void permuteRec(
    ProgrammingIterator<role>& it,
    const typename std::vector<T>::iterator begin,
    const typename std::vector<T>::iterator end) {

  const std::uint32_t n = end-begin;
  const std::uint32_t n2 = n/2;

  const auto swaps = [&] {
    for (std::uint32_t i = 0; i < n2; ++i) {
      auto b = *it;
      ++it;
      T& x = *(begin + 2*i);
      T& y = *(begin + 2*i + 1);
      bswap<role>(b, x, y);
    }
  };

  switch (n) {
    case 0:
    case 1:
      return;
    case 2:
      swaps();
      return;
    default:
    {
      swaps();

      std::vector<T> subLayer(n);
      for (std::uint32_t i = 0; i < n2; ++i) {
        subLayer[i] = *(begin + 2*i);
        subLayer[n2 + i] = *(begin + 2*i + 1);
      }

      permuteRec<role, T>(it, subLayer.begin(), subLayer.begin()+n2);
      permuteRec<role, T>(it, subLayer.begin()+n2, subLayer.end());

      for (std::uint32_t i = 0; i < n2; ++i) {
        *(begin + 2*i) = subLayer[i];
        *(begin + 2*i + 1) = subLayer[i + n2];
      }

      swaps();
    }
  }
}


template <Role role, typename T>
void permute(
    const Known<role == Role::Input, Permutation>& perm,
    typename std::vector<T>::iterator begin,
    typename std::vector<T>::iterator end) {

  Programming p;
  if constexpr (role == Role::Input) {
    p = programPermutation(*perm);
  }
  auto it = ProgrammingIterator<role> { p, 0 };
  permuteRec<role, T>(it, begin, end);
}


void programPartition(
    std::size_t n,
    Choice::iterator selection_beg,
    Choice::iterator selection_end,
    std::size_t beg,
    std::vector<bool>& swaps);


template <Role role, typename T>
void partitionRec(
    std::size_t n,
    Known<role == Role::Input, std::vector<std::size_t>>& mapping,
    ProgrammingIterator<role>& swaps,
    const typename std::vector<T>::iterator begin) {

  if (n <= 1) {
    return;
  }

  const auto n2 = n >> 1;

  partitionRec<role, T>(n2, mapping, swaps, begin);
  partitionRec<role, T>(n2, mapping, swaps, begin + n2);

  for (std::size_t i = 0; i < n2; ++i) {
    auto b = *swaps;
    if constexpr (role == Role::Input) {
      if (b) {
        const auto& x = *(begin+i);
        const auto& y = *(begin+i + n2);
        std::swap((*mapping)[x[0].content], (*mapping)[y[0].content]);
      }
    }
    bswap<role>(b, *(begin + i), *(begin + i + n2));
    ++swaps;
  }
}


template <Role role, typename T>
void partition(
    Known<role == Role::Input, std::vector<std::size_t>>& mapping,
    Known<role == Role::Input, Choice> choices,
    typename std::vector<T>::iterator begin,
    typename std::vector<T>::iterator end) {

  const auto n = std::distance(begin, end);

  std::vector<bool> ss;
  if constexpr (role == Role::Input) {
    programPartition(n, choices->begin(), choices->end(), 0, ss);
  }
  ProgrammingIterator<role> it { ss, 0 };
  partitionRec<role, T>(n, mapping, it, begin);
}

#endif
