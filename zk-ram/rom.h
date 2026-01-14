#ifndef IMPROVE_ZK_ROM
#define IMPROVE_ZK_ROM

#include "emp-zk/emp-zk.h"
#include "emp-tool/emp-tool.h"

#include <array>
#include <cstdint>
#include <cstring>
#include <iostream>
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

struct ROMTuple {
  IntFp idx;     // address/index
  IntFp version; // version
  IntFp val;     // value
};

class ZKROM {
public:
  // --- Compile-time block size (fast path). Must match caller's block_size. ---
  static constexpr int kBlockSize = 16;

  uint64_t N; // size of the ROM
  uint64_t T; // number of accesses (real writes)

  std::vector<ROMTuple> read_list;
  std::vector<ROMTuple> write_list;

  // latest_pos[addr] = index in write_list of last write for addr
  std::vector<uint64_t> latest_pos;

  IntFp one;

  // For public init factor (Teardown_Batch_Public)
  std::vector<uint64_t> public_init_val;

  explicit ZKROM(uint64_t N_) : N(N_), T(0), one(1, PUBLIC) {
    latest_pos.resize(N, 0);
  }

  // Public init: write_list[0..N-1] are PUBLIC init tuples.
  // NOTE: addr range is assumed 0..N-1 (as in your current code).
  void Public_Setup(std::vector<uint64_t>& init_val) {
    if (init_val.size() < (size_t)N) {
      std::cerr << "[ZKROM::Public_Setup] init_val too small: got " << init_val.size()
                << " expected >= " << N << "\n";
      error("ZKROM Public_Setup init_val size mismatch");
    }

    // reset state
    T = 0;
    read_list.clear();
    write_list.clear();
    public_init_val.clear();

    write_list.reserve((size_t)N);
    public_init_val.reserve((size_t)N);
    latest_pos.assign(N, 0);

    ROMTuple tmp;
    for (uint64_t i = 0; i < N; i++) {
      // tmp.idx     = IntFp(i, PUBLIC);
      // tmp.version = IntFp(0, PUBLIC);
      // tmp.val     = IntFp(init_val[i], PUBLIC);
      // write_list.push_back(tmp);

      public_init_val.push_back(init_val[i]);
      latest_pos[i] = i; // initial write is at index i
    }
  }

  // Access: read old value, then write back with version increment (same value)
  // IMPORTANT: keep semantics (re-commit old_version/old_val as ALICE from raw HIGH64).
  IntFp Access(IntFp& id) {
    const uint64_t addr = HIGH64(id.value);

    ROMTuple tmp_w, tmp_r;
    tmp_r.idx = tmp_w.idx = id;

    const uint64_t pos = latest_pos[addr];

    // two inputs (RE-COMMIT as ALICE; do NOT reuse IntFp wires)
    IntFp old_version = IntFp(pos < N ? 0 : HIGH64(write_list[pos-N].version.value), ALICE);
    IntFp old_val     = IntFp(pos < N ? public_init_val[pos] : HIGH64(write_list[pos-N].val.value), ALICE);

    tmp_r.version = old_version;
    tmp_r.val     = old_val;

    tmp_w.version = tmp_r.version + one;
    tmp_w.val     = tmp_r.val;

    read_list.push_back(tmp_r);
    write_list.push_back(tmp_w);

    // update latest_pos: new write is at index (N + T) in original scheme
    latest_pos[addr] = (uint64_t)(N + T);
    T++;

    return old_val;
  }

  // =========================
  // Optimized Teardown (Public init)
  // =========================
  void Teardown_Batch_Public(int& party, int block_size) {
    if (block_size != kBlockSize) {
      std::cerr << "[ZKROM::Teardown_Batch_Public] block_size mismatch: got " << block_size
                << ", expected " << kBlockSize << "\n";
      error("ZKROM block_size mismatch");
    }

    if (party == ALICE) Teardown_Batch_Public_Impl<true>(party);
    else                Teardown_Batch_Public_Impl<false>(party);
  }

  // (Keep your old Teardown_Basic if you still want it; not rewritten here.)
  // The Batch version is the hot path and is what devfiler usually shows.

private:
  struct HashParamsAndSeed {
    uint64_t A0, A1, A2, X;
    block seed;
  };

  template <bool IsAlice>
  void Teardown_Batch_Public_Impl(int& party) {
    // (0) Append final read for each addr (0..N-1)
    ROMTuple tmp;
    for (uint64_t i = 0; i < N; i++) {
      tmp.idx = IntFp(i, PUBLIC);
      const uint64_t pos = latest_pos[i];

      // IMPORTANT: re-commit as ALICE from raw HIGH64 (do NOT reuse IntFp wires)
      tmp.version = IntFp(pos < N ? 0 : HIGH64(write_list[pos-N].version.value), ALICE);
      tmp.val     = IntFp(public_init_val[i], PUBLIC); //IntFp(HIGH64(write_list[pos].val.value),     ALICE);

      read_list.push_back(tmp);
    }

    // (1) Params + seed in ONE message (reduces BoolIO send/recv overhead)
    HashParamsAndSeed hs{};
    if constexpr (IsAlice) {
      ZKFpExec::zk_exec->recv_data(&hs, sizeof(hs));
    } else {
      PRG tmpprg;
      tmpprg.random_data(&hs.A0, sizeof(uint64_t)); hs.A0 %= PR;
      tmpprg.random_data(&hs.A1, sizeof(uint64_t)); hs.A1 %= PR;
      tmpprg.random_data(&hs.A2, sizeof(uint64_t)); hs.A2 %= PR;
      tmpprg.random_data(&hs.X,  sizeof(uint64_t)); hs.X  %= PR;

      PRG().random_block(&hs.seed, 1);
      ZKFpExec::zk_exec->send_data(&hs, sizeof(hs));
    }

    const uint64_t A0 = hs.A0;
    const uint64_t A1 = hs.A1;
    const uint64_t A2 = hs.A2;
    const uint64_t X  = hs.X;

    // public init factor: ∏_{i=0..N-1} ( i*A0 + 0*A1 + init[i]*A2 + X )
    uint64_t pub_init = 1;
    for (uint64_t i = 0; i < N; i++) {
      // i*A0 + init[i]*A2 + X
      const uint64_t t_init = add_mod(add_mod(mult_mod(i, A0), mult_mod(public_init_val[i], A2)), X);
      pub_init = mult_mod(pub_init, t_init);
    }

    IntFp prod_read  = IntFp(1, PUBLIC);
    IntFp prod_write = IntFp(pub_init, PUBLIC);

    // PRG for polynomial proof randomness
    PRG prg(&hs.seed);

    // accumulators
    std::array<uint64_t, kBlockSize> acc_C{};
    acc_C.fill(0);
    uint64_t acc_K = 0;

    const uint64_t delta = ZKFpExec::zk_exec->get_delta();
    uint64_t power_delta = 1;
    for (int i = 1; i < kBlockSize; i++) power_delta = mult_mod(power_delta, delta);

    const IntFp PAD = IntFp(1, PUBLIC);

    // total logical length on READ side is N+T (T reads from Access + N final reads appended)
    const int total = (int)(N + T);

    // WRITE side: only T real writes beyond init; in this batching we align them at indices 0..T-1
    // and pad for indices >= T.
    int now = 0;
    while (now < total) {
      uint64_t product_r = 1;
      uint64_t product_w = 1;

      std::array<uint64_t, kBlockSize + 1> C_r{};
      std::array<uint64_t, kBlockSize + 1> C_w{};
      std::array<uint64_t, kBlockSize + 1> tmp_arr{};

      C_r.fill(0); C_r[0] = 1;
      C_w.fill(0); C_w[0] = 1;

      uint64_t K_r = 1, K_w = 1;
      uint64_t M = 0, x = 0;

      // Process exactly kBlockSize slots, padding when out of range.
      for (int i = 0; i < kBlockSize; i++) {
        const int g = now + i;

        // READ term: real if g < total else PAD
        IntFp h_r = (g < total)
          ? (read_list[g].idx * A0 + read_list[g].version * A1 + read_list[g].val * A2 + X)
          : PAD;

        // WRITE term: real only if g < (int)T, and lives at write_list[g]
        IntFp h_w = (g < (int)T)
          ? (write_list[g].idx * A0 + write_list[g].version * A1 + write_list[g].val * A2 + X)
          : PAD;

        if constexpr (IsAlice) {
          product_r = mult_mod(product_r, HIGH64(h_r.value));
          product_w = mult_mod(product_w, HIGH64(h_w.value));

          // poly update for READ
          M = LOW64(h_r.value); x = PR - HIGH64(h_r.value);
          tmp_arr[0] = 0;
          for (int j = 0; j <= i; j++) tmp_arr[j + 1] = mult_mod(x, C_r[j]);
          for (int j = 0; j <= i; j++) C_r[j] = add_mod(tmp_arr[j], mult_mod(M, C_r[j]));
          C_r[i + 1] = tmp_arr[i + 1];

          // poly update for WRITE
          M = LOW64(h_w.value); x = PR - HIGH64(h_w.value);
          tmp_arr[0] = 0;
          for (int j = 0; j <= i; j++) tmp_arr[j + 1] = mult_mod(x, C_w[j]);
          for (int j = 0; j <= i; j++) C_w[j] = add_mod(tmp_arr[j], mult_mod(M, C_w[j]));
          C_w[i + 1] = tmp_arr[i + 1];
        } else {
          K_r = mult_mod(K_r, LOW64(h_r.value));
          K_w = mult_mod(K_w, LOW64(h_w.value));
        }
      }

      now += kBlockSize;

      IntFp combine_r = IntFp(product_r, ALICE);
      IntFp combine_w = IntFp(product_w, ALICE);

      prod_read  = prod_read  * combine_r;
      prod_write = prod_write * combine_w;

      if constexpr (IsAlice) {
        C_r[kBlockSize - 1] = add_mod(C_r[kBlockSize - 1], LOW64(combine_r.value));
        C_w[kBlockSize - 1] = add_mod(C_w[kBlockSize - 1], LOW64(combine_w.value));

        uint64_t random_c;
        prg.random_data(&random_c, sizeof(uint64_t)); random_c %= PR;
        for (int i = 0; i < kBlockSize; i++) acc_C[i] = add_mod(acc_C[i], mult_mod(C_r[i], random_c));

        prg.random_data(&random_c, sizeof(uint64_t)); random_c %= PR;
        for (int i = 0; i < kBlockSize; i++) acc_C[i] = add_mod(acc_C[i], mult_mod(C_w[i], random_c));
      } else {
        K_r = add_mod(K_r, mult_mod(power_delta, LOW64(combine_r.value)));
        K_w = add_mod(K_w, mult_mod(power_delta, LOW64(combine_w.value)));

        uint64_t random_c;
        prg.random_data(&random_c, sizeof(uint64_t)); random_c %= PR;
        acc_K = add_mod(acc_K, mult_mod(random_c, K_r));

        prg.random_data(&random_c, sizeof(uint64_t)); random_c %= PR;
        acc_K = add_mod(acc_K, mult_mod(random_c, K_w));
      }
    }

    // -------- ZK mask + proof check (unchanged, fixed-size arrays) --------
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

        uint64_t x2 = PR - HIGH64(random_mask);
        uint64_t M2 = LOW64(random_mask);

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

    // Final multiset equality check
    IntFp final_zero = prod_read + prod_write.negate();
    batch_reveal_check_zero(&final_zero, 1);
  }
};

#endif // IMPROVE_ZK_ROM
