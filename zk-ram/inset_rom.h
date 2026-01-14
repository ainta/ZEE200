#ifndef ZK_INSET_ROM
#define ZK_INSET_ROM

#include "emp-zk/emp-zk.h"
#include <iostream>
#include "emp-tool/emp-tool.h"
// #include "ram_util.h"
#include <vector>
#if defined(__linux__)
	#include <sys/time.h>
	#include <sys/resource.h>
#elif defined(__APPLE__)
	#include <unistd.h>
	#include <sys/resource.h>
	#include <mach/mach.h>
#endif

using namespace std;
using namespace emp;

struct InsetROMTuple {
  IntFp idx;     // address / index
  IntFp version; // version counter
};

class InsetZKROM {
public:
  // Compile-time block size (fast path). Must match caller's block_size.
  static constexpr int kBlockSize = 16;

  uint64_t N; // size of the ROM (addresses 1..N)
  uint64_t T; // number of accesses

  std::vector<InsetROMTuple> read_list;
  std::vector<InsetROMTuple> write_list;

  // latest_pos[addr] = index in write_list of last write for that addr, or NO_POS
  std::vector<uint64_t> latest_pos;

  IntFp one;
  inline static constexpr uint64_t NO_POS = UINT64_MAX;

  explicit InsetZKROM(uint64_t N_) : N(N_), T(0), one(1, PUBLIC) {
    latest_pos.resize(N + 1, NO_POS); // 1..N used
  }

  void Setup(uint64_t expected_T = 0) {
    T = 0;
    read_list.clear();
    write_list.clear();
    std::fill(latest_pos.begin(), latest_pos.end(), NO_POS);

    // Reserve to avoid realloc/memcpy
    if (expected_T != 0) {
      read_list.reserve((size_t)expected_T + (size_t)N); // includes final reads
      write_list.reserve((size_t)expected_T);
    }
  }

  void Access(IntFp& id) {
    const uint64_t addr = HIGH64(id.value);

    InsetROMTuple tmp_r, tmp_w;
    tmp_r.idx = tmp_w.idx = id;

    const uint64_t pos = latest_pos[addr];

    // *** IMPORTANT: DO NOT reuse existing IntFp wires ***
    // Must re-commit as ALICE (or whatever your semantics require).
    IntFp old_version;
    if (pos == NO_POS) {
      old_version = IntFp(0, ALICE);
    } else {
      old_version = IntFp(HIGH64(write_list[pos].version.value), ALICE);
    }

    tmp_r.version = old_version;
    tmp_w.version = tmp_r.version + one;

    read_list.push_back(tmp_r);
    write_list.push_back(tmp_w);

    latest_pos[addr] = (uint64_t)(write_list.size() - 1);
    T++;
  }

  void Teardown_Batch(int& party, int& block_size) {
    if (block_size != kBlockSize) {
      std::cerr << "[InsetZKROM::Teardown_Batch] block_size mismatch: got " << block_size
                << ", expected " << kBlockSize << "\n";
      error("InsetZKROM block_size mismatch");
    }

    if (party == ALICE) Teardown_Batch_Impl<true>(party);
    else                Teardown_Batch_Impl<false>(party);
  }

private:
  struct HashParamsAndSeed {
    uint64_t A0, A1, X;
    block seed;
  };

  template <bool IsAlice>
  void batch_side(const std::vector<InsetROMTuple>& list,
                  int total,
                  uint64_t A0,
                  uint64_t A1,
                  uint64_t X,
                  PRG& prg,
                  uint64_t power_delta,
                  IntFp& prod,
                  std::array<uint64_t, kBlockSize>& acc_C,
                  uint64_t& acc_K) {
    const IntFp PAD = IntFp(1, PUBLIC); // multiplicative identity
    int now_i = 0;

    while (now_i < total) {
      uint64_t product = 1;

      std::array<uint64_t, kBlockSize + 1> C{};
      std::array<uint64_t, kBlockSize + 1> tmp_arr{};

      C.fill(0);
      C[0] = 1;

      uint64_t K = 1;
      uint64_t M = 0, x = 0;

      const int remaining = total - now_i;
      const int real_cnt = (remaining < kBlockSize) ? remaining : kBlockSize;

      // (1) real elements
      for (int i = 0; i < real_cnt; i++, now_i++) {
        const InsetROMTuple& e = list[now_i];
        IntFp t = e.idx * A0 + e.version * A1 + X;

        if constexpr (IsAlice) {
          product = mult_mod(product, HIGH64(t.value));
          M = LOW64(t.value);
          x = PR - HIGH64(t.value);

          tmp_arr[0] = 0;
          for (int j = 0; j <= i; j++) tmp_arr[j + 1] = mult_mod(x, C[j]);
          for (int j = 0; j <= i; j++) C[j] = add_mod(tmp_arr[j], mult_mod(M, C[j]));
          C[i + 1] = tmp_arr[i + 1];
        } else {
          K = mult_mod(K, LOW64(t.value));
        }
      }

      // (2) pad to full block
      for (int i = real_cnt; i < kBlockSize; i++) {
        const IntFp t = PAD;

        if constexpr (IsAlice) {
          product = mult_mod(product, HIGH64(t.value));
          M = LOW64(t.value);
          x = PR - HIGH64(t.value);

          tmp_arr[0] = 0;
          for (int j = 0; j <= i; j++) tmp_arr[j + 1] = mult_mod(x, C[j]);
          for (int j = 0; j <= i; j++) C[j] = add_mod(tmp_arr[j], mult_mod(M, C[j]));
          C[i + 1] = tmp_arr[i + 1];
        } else {
          K = mult_mod(K, LOW64(t.value));
        }
      }

      IntFp combine_term = IntFp(product, ALICE);
      prod = prod * combine_term;

      if constexpr (IsAlice) {
        C[kBlockSize - 1] = add_mod(C[kBlockSize - 1], LOW64(combine_term.value));

        uint64_t random_c;
        prg.random_data(&random_c, sizeof(uint64_t));
        random_c %= PR;

        for (int i = 0; i < kBlockSize; i++) {
          acc_C[i] = add_mod(acc_C[i], mult_mod(C[i], random_c));
        }
      } else {
        K = add_mod(K, mult_mod(power_delta, LOW64(combine_term.value)));

        uint64_t random_c;
        prg.random_data(&random_c, sizeof(uint64_t));
        random_c %= PR;

        acc_K = add_mod(acc_K, mult_mod(random_c, K));
      }
    }
  }

  template <bool IsAlice>
  void Teardown_Batch_Impl(int& party) {
    // (0) append final read for each address i=1..N
    // IMPORTANT: do NOT reuse IntFp from write_list; re-commit as ALICE.
    InsetROMTuple tmp;
    for (uint64_t i = 1; i <= N; i++) {
      tmp.idx = IntFp(i, PUBLIC);

      const uint64_t pos = latest_pos[i];
      if (pos == NO_POS) {
        tmp.version = IntFp(0, ALICE);
      } else {
        tmp.version = IntFp(HIGH64(write_list[pos].version.value), ALICE);
      }

      read_list.push_back(tmp);
    }

    // (1)+(2) params + seed in ONE message (reduces BoolIO send/recv overhead)
    HashParamsAndSeed hs{};
    if constexpr (IsAlice) {
      ZKFpExec::zk_exec->recv_data(&hs, sizeof(hs));
    } else {
      PRG tmpprg;
      tmpprg.random_data(&hs.A0, sizeof(uint64_t)); hs.A0 %= PR;
      tmpprg.random_data(&hs.A1, sizeof(uint64_t)); hs.A1 %= PR;
      tmpprg.random_data(&hs.X,  sizeof(uint64_t)); hs.X  %= PR;

      PRG().random_block(&hs.seed, 1);

      ZKFpExec::zk_exec->send_data(&hs, sizeof(hs));
    }

    const uint64_t A0 = hs.A0;
    const uint64_t A1 = hs.A1;
    const uint64_t X  = hs.X;

    PRG prg(&hs.seed);

    // accumulators
    IntFp prod_read = IntFp(1, PUBLIC);

    std::array<uint64_t, kBlockSize> acc_C{};
    acc_C.fill(0);
    uint64_t acc_K = 0;

    const uint64_t delta = ZKFpExec::zk_exec->get_delta();
    uint64_t power_delta = 1;
    for (int i = 1; i < kBlockSize; i++) power_delta = mult_mod(power_delta, delta);

    // -------- READ SIDE --------
    const int total_read = (int)(T + N);
    batch_side<IsAlice>(read_list, total_read, A0, A1, X, prg, power_delta,
                        prod_read, acc_C, acc_K);

    // -------- WRITE SIDE --------
    // prod_write = (public init factor) * (product over T real writes)
    uint64_t acc = 1;
    for (uint64_t i = 0; i < N; i++) {
      const uint64_t t_init = add_mod(mult_mod(A0, (uint64_t)(i + 1)), X);
      acc = mult_mod(acc, t_init);
    }
    IntFp prod_write = IntFp(acc, PUBLIC);

    const int total_write = (int)T;
    batch_side<IsAlice>(write_list, total_write, A0, A1, X, prg, power_delta,
                        prod_write, acc_C, acc_K);

    // -------- ZK masking (unchanged structure, fixed-size arrays) --------
    if constexpr (IsAlice) {
      std::array<uint64_t, kBlockSize> random_pad{};
      random_pad.fill(0);

      __uint128_t random_mask = ZKFpExec::zk_exec->get_one_role();
      random_pad[0] = LOW64(random_mask);
      random_pad[1] = PR - HIGH64(random_mask);

      std::array<uint64_t, kBlockSize + 1> tmp2{};

      for (int i = 1; i < kBlockSize - 1; i++) {
        random_mask = ZKFpExec::zk_exec->get_one_role();
        tmp2[0] = 0;
        uint64_t x2 = PR - HIGH64(random_mask), M2 = LOW64(random_mask);
        for (int j = 0; j <= i; j++) tmp2[j + 1] = mult_mod(x2, random_pad[j]);
        for (int j = 0; j <= i; j++) random_pad[j] = add_mod(tmp2[j], mult_mod(M2, random_pad[j]));
        random_pad[i + 1] = tmp2[i + 1];

        random_mask = ZKFpExec::zk_exec->get_one_role();
        random_pad[0] = add_mod(random_pad[0], LOW64(random_mask));
        random_pad[1] = add_mod(random_pad[1], PR - HIGH64(random_mask));
      }

      for (int i = 0; i < kBlockSize; i++) acc_C[i] = add_mod(acc_C[i], random_pad[i]);
    } else {
      uint64_t random_pad;
      __uint128_t random_mask = ZKFpExec::zk_exec->get_one_role();
      random_pad = LOW64(random_mask);
      for (int i = 1; i < kBlockSize - 1; i++) {
        random_mask = ZKFpExec::zk_exec->get_one_role();
        random_pad = mult_mod(random_pad, LOW64(random_mask));
        random_mask = ZKFpExec::zk_exec->get_one_role();
        random_pad = add_mod(random_pad, LOW64(random_mask));
      }
      acc_K = add_mod(acc_K, random_pad);
    }

    // -------- Exchange acc_C and verify polynomial proof --------
    if constexpr (IsAlice) {
      ZKFpExec::zk_exec->send_data(acc_C.data(), sizeof(uint64_t) * kBlockSize);
    } else {
      ZKFpExec::zk_exec->recv_data(acc_C.data(), sizeof(uint64_t) * kBlockSize);
    }

    if constexpr (!IsAlice) {
      uint64_t proof = 0;
      uint64_t pd = 1;
      for (int i = 0; i < kBlockSize; i++) {
        proof = add_mod(proof, mult_mod(pd, acc_C[i]));
        pd = mult_mod(pd, delta);
      }
      if (proof != acc_K) error("Prover cheat!");
    }

    // -------- Final multiset equality check --------
    IntFp final_zero = prod_read + prod_write.negate();
    batch_reveal_check_zero(&final_zero, 1);
  }
};

#endif // ZK_INSET_ROM