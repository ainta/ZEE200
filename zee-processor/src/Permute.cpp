#include <Permute.h>
#include <numeric> // std::iota

#include <iostream>

using PartHalf = std::vector<std::pair<std::uint32_t, std::uint32_t>>;

using Partition = std::pair<PartHalf, PartHalf>;


Partition glob(const Permutation& perm) {
  const auto n = perm.size();
  const auto n2 = n/2;
  Partition out;
  out.first.resize(n2);
  out.second.resize(n2, { -1, -1 });

  for (std::uint32_t i = 0; i < n2; ++i) {
    out.first[i] = { perm[2*i] / 2, perm[2*i+1] / 2 };
  }

  const auto pushColumn = [&](auto col, auto row) {
    if (out.second[col].first == (std::uint32_t)(-1)) {
      out.second[col].first = row;
    } else {
      out.second[col].second = row;
    }
  };

  for (std::uint32_t i = 0; i < n2; ++i) {
    const auto [j, k] = out.first[i];
    pushColumn(j, i);
    pushColumn(k, i);
  }
  return out;
};


std::pair<Permutation, Permutation> split(const Partition& part) {
  const auto n = part.first.size();
  Permutation p0(n);
  Permutation p1(n);

  // Establish a set of all rows.
  // As we go, we will erase the content of the set until it is empty.
  std::vector<bool> visited(n, false);
  std::uint32_t nVisited = 0;

  std::uint32_t start = 0;

  const auto nextUnvisited = [&] {
    for (; start < n; ++start) {
      if (!visited[start]) {
        return start;
      }
    }
    assert(false);
    return 0u;
  };

  while (nVisited < n) {
    // select an arbitrary starting point.
    auto i = nextUnvisited();
    visited[i] = true;
    ++nVisited;

    // look at the two columns corresponding to the selected row.
    // the first column will be assigned to the first partition
    // and the second to the second
    auto [j, k] = part.first[i];

    p0[i] = j;
    p1[i] = k;

    // Now, if j == k then it means there is a self-cycle (i.e. the entry for the
    // partition matrix is a 2). Otherwise, the cycle is large and we must follow
    // it around the partition matrix.
    if (j != k) {
      // We know we have completed the cycle when we return to the starting row.
      // Therefore, memoize the starting row.
      const auto start = i;
      bool lookingRow = false;

      auto row = i;
      auto col = k;

      // We alternate between inspecting partition rows and columns to follow the
      // cycle. Stop once we return to the starting row (i.e. we are looking at a
      // row and the row is start).
      while (!(lookingRow && row == start)) {
        if (lookingRow) {
          // If we are looking at a row, we will assign the corresponding
          // discovered column to the second partition.
          // This choice is mandated by the fact that we added the first
          // column to P0 on our initial condition and followed the second column.
          visited[row] = true;
          ++nVisited;
          const auto [col1, col2] = part.first[row];
          // the discovered column is the one we are not currently looking at.
          col = col == col1 ? col2 : col1;
          p1[row] = col;
        } else {
          // Otherwise, assign the discovered row corresponding to the column to
          // the first partition.
          const auto [row1, row2] = part.second[col];
          // the discovered row is the one we are not currently looking at.
          row = row == row1 ? row2 : row1;
          p0[row] = col;
        }
        // swap between looking at rows and columns
        lookingRow = !lookingRow;
      }
    }
  }
  return { p0, p1 };
}


void mark(
    Programming::iterator inps,
    Programming::iterator outs,
    const Permutation& toMark,
    const Permutation& marks) {
  const auto n = marks.size();

  for (std::uint32_t i = 0; i < n; ++i) {
    const auto ix0 = toMark[2*i];
    const auto ix1 = toMark[2*i + 1];

    if (ix0 / 2 == marks[i]) {
      *(inps + i) = false;
      *(outs + (ix0/2)) = ix0 % 2 != 0;
    } else {
      *(inps + i) = true;
      *(outs + (ix1/2)) = ix1 % 2 != 0;
    }
  }
}

std::uint32_t programmingSize(const Permutation& perm) {
  std::uint32_t n = perm.size();
  std::uint32_t logn = 0;

  std::uint32_t mask = 1;
  while ((n & mask) == 0) {
    mask <<= 1;
    ++logn;
  }
  assert(n - mask == 0);

  return (n * logn - (n/2));
}


void programRec(
    Programming::iterator beg,
    const Permutation& perm) {
  const auto n = perm.size();
  if (n == 1) {
    return;
  }

  const auto s = programmingSize(perm);

  const auto part = glob(perm);
  const auto [perm0, perm1] = split(part);

  mark(beg, beg + s - (n/2), perm, perm0);

  const auto s0 = programmingSize(perm0);
  programRec(beg + n/2, perm0);
  programRec(beg + n/2 + s0, perm1);
}


Programming programPermutation(const Permutation& perm) {
  Programming p(programmingSize(perm));
  programRec(p.begin(), perm);
  return p;
}


void programPartition(
    std::size_t n,
    Choice::iterator selection_beg,
    Choice::iterator selection_end,
    std::size_t beg,
    std::vector<bool>& swaps
    ) {
  if (n <= 1) {
    return;
  }

  const auto n2 = n >> 1;


  const auto selection_mid = std::partition(
      selection_beg,
      selection_end,
      [&] (auto s) { return s < n2; });

  std::for_each(
      selection_mid,
      selection_end,
      [&] (auto& s) { s -= n2; });

  const auto mid = beg + std::distance(selection_beg, selection_mid);
  const auto end = beg + std::distance(selection_beg, selection_end);

  programPartition(n2, selection_beg, selection_mid, beg % n2, swaps);
  programPartition(n2, selection_mid, selection_end, mid % n2, swaps);

  for (std::size_t i = 0; i < n2; ++i) {
    swaps.push_back(
        (i + n2 >= beg && i + n2 < mid) ||
        (i >= mid && i < end) ||
        (i + n >= mid && i + n < end));
  }
}
