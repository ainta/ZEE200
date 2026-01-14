#include <Ram.h>
#include <Permute.h>
#include <iostream>

#include <unordered_set>
#include <set>
#include <numeric> // iota


template <Role role, std::size_t n, typename Rule>
Ram<role, n, Rule>::Ram(
    std::size_t power,
    const std::vector<std::array<std::uint32_t, n>>& init,
    CycleQueue<std::uint32_t>* accessOrder)
  : power(power),
    timestep(0),
    accessOrder(accessOrder) {
  if constexpr (role == Role::Input) {

    indexMapping->resize(1 << power);
    for (std::size_t i = 0; i < (1 << power); ++i) {
      (*indexMapping)[i] = i;
    }
  }
  ixcontent.resize(1<<power);

  for (std::size_t i = 0; i < init.size(); ++i) {
    ixcontent[i][0] = constant<role>(i);
    for (std::size_t j = 0; j < n; ++j) {
      ixcontent[i][j+1] = constant<role>(init[i][j]);
    }
  }
  for (std::size_t i = init.size(); i < ixcontent.size(); ++i) {
    ixcontent[i][0] = constant<role>(i);
    for (std::size_t j = 0; j < n; ++j) {
      ixcontent[i][j+1] = constant<role>(0);
    }
  }
}


template <Role role, std::size_t n, typename Rule>
Ram<role, n, Rule>::Ram(
    std::size_t power,
    const std::vector<std::uint32_t>& init,
    CycleQueue<std::uint32_t>* accessOrder)
  : power(power),
    timestep(0),
    accessOrder(accessOrder) {
  if constexpr (role == Role::Input) {

    indexMapping->resize(1 << power);
    for (std::size_t i = 0; i < (1 << power); ++i) {
      (*indexMapping)[i] = i;
    }
  }
  ixcontent.resize(1<<power);

  for (std::size_t i = 0; i < init.size(); ++i) {
    ixcontent[i][0] = constant<role>(i);
    ixcontent[i][1] = constant<role>(init[i]);
  }
  for (std::size_t i = init.size(); i < ixcontent.size(); ++i) {
    ixcontent[i][0] = constant<role>(i);
    ixcontent[i][1] = constant<role>(0);
  }
}


template <Role role, std::size_t n, typename Rule>
void Ram<role, n, Rule>::repartition() {
  for (std::size_t i = power; i >= 1; --i) {
    // midnight is the *period* of the partition
    if (Rule::rule(timestep, i-1)) {
      repartition(1 << i, Rule::midnight(i));
    }
  }
  if (Rule::rule(timestep, power)) { timestep = 0; }
  ++timestep;
}


template <Role role, std::size_t n, typename Rule>
void Ram<role, n, Rule>::repartition(std::size_t partitionSize, std::size_t maxDepth) {
  std::vector<std::uint32_t> sel;

  if constexpr (role == Role::Input) {

    auto end_access = accessOrder->end();
    if (std::distance(accessOrder->begin(), accessOrder->end()) > maxDepth) {
      end_access = accessOrder->begin() + maxDepth;
    }

    sel = std::vector<std::uint32_t> { accessOrder->begin(), end_access };

    std::unordered_set<std::uint32_t> s;
    auto end = std::remove_if(sel.begin(), sel.end(),
        [&s](std::uint32_t i) { return !s.insert(i).second; });
    sel.resize(std::min<std::size_t>(partitionSize/2, std::distance(sel.begin(), end)));

    for (auto& s: sel) { s = (*indexMapping)[s]; }
  }

  partition<role, std::array<Zp, n+1>>(
      indexMapping,
      sel,
      ixcontent.begin(),
      ixcontent.begin() + partitionSize);
}


constexpr std::size_t log(std::size_t x) {
  std::size_t out = 0;
  while (x > 0) {
    ++out;
    x >>= 1;
  }
  return out;
}


template <typename Rule>
bool CachePredictor<Rule>::access(std::uint32_t ix) {
  bool hit = true;
  for (std::size_t i = 0; i < pow; ++i) {
    std::unordered_set<std::uint32_t>& r = residents[i];
    if (Rule::rule(timestep, i)) {
      // flush the resident set at the same timestep BubbleRAM repartitions
      r = { };
    }

    if (hit && (r.count(ix) > 0 || (r.size() < (1 << i)))) {
      r.insert(ix);
    } else {
      // if the index is not resident and there is not space left, BubbleRAM must issue a miss
      // this also means the element cannot appear at lower levels
      hit = false;
    }
  }
  if (Rule::rule(timestep, pow)) { timestep = 0; }
  ++timestep;
  return hit;
}
