#ifndef OT_HASH_H__
#define OT_HASH_H__

#include <bitset>

__attribute__((target("sse2")))
std::bitset<128> hash(const void*, std::size_t);

#endif
