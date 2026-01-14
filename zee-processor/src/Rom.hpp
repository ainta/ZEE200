#include <Rom.h>
#include <Permute.h>
#include <map>
#include <Protocol.h>

#include <iostream>


template <Role role>
Rom<role>::Rom(
    const std::vector<std::array<Zp, 2>>& c,
    CycleQueue<std::uint32_t>* accessOrder)
  : accessOrder(accessOrder) {
  pow = 0;
  while (c.size() > (1 << pow)) {
    ++pow;
  }

  ixcontent.resize(1 << pow);

  const auto n = c.size();
  for (std::uint32_t i = 0; i < n; ++i) {
    ixcontent[i] = std::array { constant<role>(i), c[i][0], c[i][1] };
  }
  for (std::uint32_t i = n; i < ixcontent.size(); ++i) {
    ixcontent[i] = std::array { constant<role>(i), constant<role>(0), constant<role>(0) };
  }
  current = (1 << pow) - 1;
}


template <Role role>
std::array<Zp, 3> Rom<role>::read() {
  const auto n = ixcontent.size();
  ++current;
  if (current % n == 0) {
    arrangeContents();
    current = 0;
  }

  return ordered[current];
}


template <Role role>
void Rom<role>::arrangeContents() {
  const auto n = ixcontent.size();
  std::vector<std::uint32_t> p1, p2;
  std::vector<bool> sel;

  if constexpr (role == Role::Input) {
    auto& o = *accessOrder;
    std::vector<std::uint32_t> order(n);

    for (std::uint32_t i = 0; i < n; ++i) {
      if (o.size() > 0) {
        order[i] = o.front();
        o.pop_front();
      } else {
        order[i] = 0;
      }
    }

    // determine how many times each index is used
    std::vector<std::uint32_t> usage(n, 0);
    for (auto o: order) {
      ++usage[o];
    }

    // determine which indices are unused.
    std::vector<std::uint32_t> unused;
    for (std::uint32_t i = 0; i < n; ++i) {
      if (usage[i] == 0) {
        unused.push_back(i);
      }
    }

    // assemble the first permutation
    // for each used element with usage n, draw n-1 elements from
    // the unused pile
    std::vector<std::uint32_t> perm1(n);

    std::vector<std::uint32_t> firstLoc(n);

    std::vector<bool> selection;
    selection.reserve(n);

    std::uint32_t pos = 0;
    for (std::uint32_t i = 0; i < n; ++i) {
      auto u = usage[i];
      if (u > 0) {
        firstLoc[i] = pos;
        perm1[i] = pos;
        ++pos;
        selection.push_back(true);
        for (std::uint32_t j = 1; j < u; ++j) {
          perm1[unused.back()] = pos;
          ++pos;
          selection.push_back(false);
          unused.pop_back();
        }
      }
    }

    std::vector<std::uint32_t> perm2(n);

    for (std::uint32_t i = 0; i < n; ++i) {
      perm2[firstLoc[order[i]]] = i;
      ++firstLoc[order[i]];
    }

    p1 = perm1;
    p2 = perm2;
    sel = selection;
  }

  ordered = ixcontent;

  // use this permutation on the content
  permute<role, std::array<Zp, 3>>(p1, ordered.begin(), ordered.end());

  // now, propagate copies over the permuted content.
  std::uint32_t ix = 0;
  auto carry = ordered[0];
  for (std::uint32_t i = 0; i < n; ++i) {
    bool b = false;
    if constexpr (role == Role::Input) {
      b = sel[ix];
    }
    ++ix;
    bswap<role>(b, carry, ordered[i]);
    ordered[i] = carry;
  }

  // finally, permute into order.
  permute<role, std::array<Zp, 3>>(p2, ordered.begin(), ordered.end());
}
