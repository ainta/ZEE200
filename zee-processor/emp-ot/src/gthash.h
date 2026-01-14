#ifndef GT_HASH_H__
#define GT_HASH_H__

#include <bitset>
#include <openssl/sha.h>
#include <immintrin.h>

struct Hash256 {
public:
  Hash256() { SHA256_Init(&ctx); }

  void operator()(std::span<const std::byte> s) {
    return (*this)(s.data(), s.size());
  }
  void operator()(const std::byte* xs, std::size_t n) {
    SHA256_Update(&ctx, reinterpret_cast<const char*>(xs), n);
  }


  std::bitset<256> digest() {
    std::bitset<256> tar;
    SHA256_Final(reinterpret_cast<unsigned char*>(&tar), &ctx);
    return tar;
  }

private:
  SHA256_CTX ctx;
};


inline
std::bitset<128> hash(const void* data, std::size_t nbyte) {
  std::bitset<128> digest[2];
  SHA256((const unsigned char *)data, nbyte, (unsigned char *)digest);
  return digest[0];
}


inline std::bitset<256> hash(std::bitset<256> val) {
  Hash256 h;
  h((const std::byte*)&val, 32);
  return h.digest();
}

#endif
