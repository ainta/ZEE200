#ifndef IMPROVE_ZK_RAM
#define IMPROVE_ZK_RAM

#include "emp-zk/emp-zk.h"
#include <iostream>
#include "emp-tool/emp-tool.h"
#include "inset_rom.h"
#include <vector>
#include <unordered_map>

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

struct RAMTuple {
  IntFp idx;        // key
  IntFp timestamp;  // logical time
  IntFp val;        // value
};

class IZKRAM {
public:
  // ---- Tune this once; block_size becomes compile-time constant ----
  // If you want to change it, rebuild; Teardown_Batch will assert block_size matches.
  static constexpr int kBlockSize = 16;

  uint64_t N; // initial number of entries
  uint64_t T; // number of accesses (real writes)

  std::vector<RAMTuple> read_list;
  std::vector<RAMTuple> write_list;

  uint64_t qed_memory_addr;

  // Bound-check ROM for timestamp diffs
  InsetZKROM* bound_check_rom = nullptr;

  // Deterministic key-value list (index i is stable)
  std::vector<std::pair<uint64_t, uint64_t>> ram_kv;

  // key -> [0..N)
  std::unordered_map<uint64_t, uint32_t> key_to_i;

  // latest_pos_i[i] = index in write_list of last write for ram_kv[i], or NO_POS
  std::vector<uint64_t> latest_pos_i;

  IntFp one;

  inline static constexpr uint64_t NO_POS = UINT64_MAX;

  explicit IZKRAM(uint64_t N_, uint64_t qed_memory_addr_ = 0xFFFFFFFFu)
      : N(N_), T(0), qed_memory_addr(qed_memory_addr_) {
    std::cout << "N (initial entries): " << N << std::endl;
    if (qed_memory_addr_ != 0xFFFFFFFFu) {
      std::cout << "QED memory address: " << qed_memory_addr_ << std::endl;
    }
  }

  ~IZKRAM() {
    delete bound_check_rom;
    bound_check_rom = nullptr;
  }

  // Setup as key–value store: init_kv[i].first = key, init_kv[i].second = value
  // NOTE: We DO NOT push the initial PUBLIC tuples into write_list.
  //       They are treated as an implicit prefix of length N during Teardown_Batch.
  void Setup(std::vector<std::pair<uint64_t, uint64_t>>& ram_kv_in, uint64_t total_T) {
    one = IntFp(1, PUBLIC);

    // reset state
    T = 0;
    read_list.clear();
    write_list.clear();

    // store KV deterministically
    ram_kv = ram_kv_in;
    N = (uint64_t)ram_kv.size();

    // reserve logs (huge win: avoids realloc+memcpy during Access)
    read_list.reserve(N + total_T);  // includes final reads at teardown
    write_list.reserve(total_T);

    // Build key -> index map and latest_pos vector
    key_to_i.clear();
    key_to_i.reserve(ram_kv.size() * 2);

    latest_pos_i.assign(ram_kv.size(), NO_POS);

    for (uint32_t i = 0; i < (uint32_t)ram_kv.size(); i++) {
      key_to_i[ram_kv[i].first] = i;
    }

    // Bound-check ROM
    delete bound_check_rom;
    bound_check_rom = new InsetZKROM(total_T);
    bound_check_rom->Setup(total_T);
  }

  // Access: id = key; old_val/new_val are wires from the outer circuit
  IntFp Access(IntFp& id, IntFp& old_val, IntFp& new_val) {
    uint64_t key = HIGH64(id.value);

    auto it = key_to_i.find(key);
    if (it == key_to_i.end()) {
      std::cerr << "[IZKRAM::Access] Unknown key " << key << std::endl;
      error("IZKRAM Access on unknown key");
    }
    uint32_t ki = it->second;

    uint64_t pos = latest_pos_i[ki];

    // Previous timestamp:
    // - If never written, implicit init timestamp = 0.
    // - Otherwise, re-commit the last written timestamp from write_list[pos].
    IntFp old_timestamp;
    if (pos == NO_POS) {
      old_timestamp = IntFp(0, ALICE);
    } else {
      old_timestamp = IntFp(HIGH64(write_list[pos].timestamp.value), ALICE);
    }

    // Log read
    RAMTuple tmp_r;
    tmp_r.idx = id;
    tmp_r.timestamp = old_timestamp;
    tmp_r.val = old_val;
    read_list.push_back(tmp_r);

    // Log write
    RAMTuple tmp_w;
    tmp_w.idx = id;
    tmp_w.timestamp = IntFp(++T, PUBLIC);  // keep your existing semantics
    tmp_w.val = new_val;
    write_list.push_back(tmp_w);

    // Bound-check: timestamps must increase
    IntFp diff = tmp_w.timestamp + tmp_r.timestamp.negate();
    bound_check_rom->Access(diff);

    // Update last position for this key
    latest_pos_i[ki] = (uint64_t)(write_list.size() - 1);

    return old_val;
  }

  // Wrapper that enforces compile-time block size.
  void Teardown_Batch(int& party, int& block_size) {
    if (block_size != kBlockSize) {
      std::cerr << "[IZKRAM::Teardown_Batch] block_size mismatch: got " << block_size
                << ", expected " << kBlockSize << std::endl;
      error("block_size mismatch");
    }

    if (party == ALICE) {
      Teardown_Batch_Impl<true>(party);
    } else {
      Teardown_Batch_Impl<false>(party);
    }
  }

private:
  struct HashParamsAndSeed {
    uint64_t A0, A1, A2, X;
    block seed;
  };

  template <bool IsAlice>
  void Teardown_Batch_Impl(int& party) {
    RAMTuple tmp;
    bool qed_memory_addr_touched = false;

    // 1) Add one final read per key (deterministic order: ram_kv index order)
    for (uint32_t i = 0; i < (uint32_t)ram_kv.size(); i++) {
      uint64_t key = ram_kv[i].first;
      uint64_t init_val = ram_kv[i].second;

      uint64_t pos = latest_pos_i[i];

      uint64_t last_ts_u64;
      uint64_t last_val_u64;

      if (pos == NO_POS) {
        last_ts_u64 = 0;
        last_val_u64 = init_val;
      } else {
        last_ts_u64 = HIGH64(write_list[pos].timestamp.value);
        last_val_u64 = HIGH64(write_list[pos].val.value);
      }

      tmp.idx = IntFp(key, PUBLIC);
      tmp.timestamp = IntFp(last_ts_u64, ALICE);
      tmp.val = IntFp(last_val_u64, ALICE);
      read_list.push_back(tmp);

      // QED memory address check
      if (qed_memory_addr == key) {
        if constexpr (IsAlice) {
          if (last_ts_u64 == 0) {
            std::cerr << "QED memory address not touched" << std::endl;
            exit(0);
          }
          std::cout << "QED memory address touched at timestamp: " << last_ts_u64 << std::endl;
        }

        IntFp t = IntFp(IsAlice ? (f61::unit() / f61(last_ts_u64)).val : 0, ALICE);
        IntFp one_check = (t * tmp.timestamp).negate() + IntFp(1, PUBLIC);
        batch_reveal_check_zero(&one_check, 1);

        qed_memory_addr_touched = true;
      }
    }

    if (qed_memory_addr != 0xFFFFFFFFu && !qed_memory_addr_touched) {
      std::cerr << "QED memory address not touched" << std::endl;
      exit(0);
    }

    // 2) Bound check teardown
    int block_size = kBlockSize;
    bound_check_rom->Teardown_Batch(party, block_size);

    // 3+4) Random linear hash parameters + seed (ONE send/recv)
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
    block seed = hs.seed;

    PRG prg(&seed);
    
    uint64_t pub_init = 1;
    for (int i = 0; i < N; i++) {
      const auto& kv = ram_kv[(uint64_t)i];
      const uint64_t t_init = add_mod(add_mod(mult_mod(kv.first, A0), mult_mod(kv.second, A2)), X);
      pub_init = mult_mod(pub_init, t_init);
    }

    IntFp prod_read  = IntFp(1, PUBLIC);
    IntFp prod_write = IntFp(pub_init, PUBLIC);

    alignas(64) std::array<uint64_t, kBlockSize> acc_C{};
    acc_C.fill(0);
    uint64_t acc_K = 0;

    const uint64_t delta = ZKFpExec::zk_exec->get_delta();

    // delta^(block_size-1)
    uint64_t power_delta = 1;
    for (int i = 1; i < kBlockSize; i++) power_delta = mult_mod(power_delta, delta);

    // Total logical length = N (implicit init writes) + T (real writes)
    const uint64_t total = (uint64_t)(N + T);

    // After adding final reads above, read_list must be total.
    assert(read_list.size() == total);
    assert(write_list.size() == (uint64_t)T);

    const IntFp PAD = IntFp(1, PUBLIC);  // multiplicative identity for padding
    int now_i = 0;
    while (now_i < (int)total) {
      uint64_t product_r = 1;

      // Coeff arrays, compile-time sized
      std::array<uint64_t, kBlockSize + 1> C_r{};
      std::array<uint64_t, kBlockSize + 1> tmp_arr{};

      C_r.fill(0); C_r[0] = 1;

      uint64_t K_r = 1;

      uint64_t M = 0, x = 0;

      const int remaining = (int)total - now_i;
      const int real_cnt = (remaining < kBlockSize) ? remaining : kBlockSize;

      // ---- (A) consume real elements ----
      for (int i = 0; i < real_cnt; i++, now_i++) {
        // READ element from read_list
        const RAMTuple& rr = read_list[now_i];
        IntFp h_r = rr.idx * A0 + rr.timestamp * A1 + rr.val * A2 + X;

        if constexpr (IsAlice) {
          product_r = mult_mod(product_r, HIGH64(h_r.value));

          // update C_r
          M = LOW64(h_r.value);
          x = PR - HIGH64(h_r.value);
          tmp_arr[0] = 0;
          for (int j = 0; j <= i; j++) tmp_arr[j + 1] = mult_mod(x, C_r[j]);
          for (int j = 0; j <= i; j++) C_r[j] = add_mod(tmp_arr[j], mult_mod(M, C_r[j]));
          C_r[i + 1] = tmp_arr[i + 1];
        } else {
          K_r = mult_mod(K_r, LOW64(h_r.value));
        }
      }

      // ---- (B) pad to full block with identity factors ----
      for (int i = real_cnt; i < kBlockSize; i++) {
        const IntFp h_r = PAD;

        if constexpr (IsAlice) {
          product_r = mult_mod(product_r, HIGH64(h_r.value));

          M = LOW64(h_r.value);
          x = PR - HIGH64(h_r.value);
          tmp_arr[0] = 0;
          for (int j = 0; j <= i; j++) tmp_arr[j + 1] = mult_mod(x, C_r[j]);
          for (int j = 0; j <= i; j++) C_r[j] = add_mod(tmp_arr[j], mult_mod(M, C_r[j]));
          C_r[i + 1] = tmp_arr[i + 1];
        } else {
          K_r = mult_mod(K_r, LOW64(h_r.value));
        }
      }

      IntFp combine_r_term = IntFp(product_r, ALICE);
      prod_read  = prod_read  * combine_r_term;

      if constexpr (IsAlice) {
        C_r[kBlockSize - 1] = add_mod(C_r[kBlockSize - 1], LOW64(combine_r_term.value));

        uint64_t random_c;
        prg.random_data(&random_c, sizeof(uint64_t)); random_c %= PR;
        for (int i = 0; i < kBlockSize; i++) {
          acc_C[i] = add_mod(acc_C[i], mult_mod(C_r[i], random_c));
        }
      } else {
        K_r = add_mod(K_r, mult_mod(power_delta, LOW64(combine_r_term.value)));

        uint64_t random_c;
        prg.random_data(&random_c, sizeof(uint64_t)); random_c %= PR;
        acc_K = add_mod(acc_K, mult_mod(random_c, K_r));
      }
    }

    now_i = 0;
    while (now_i < (int)T) {
      uint64_t product_w = 1;

      // Coeff arrays, compile-time sized
      std::array<uint64_t, kBlockSize + 1> C_w{};
      std::array<uint64_t, kBlockSize + 1> tmp_arr{};

      C_w.fill(0); C_w[0] = 1;

      uint64_t K_w = 1;

      uint64_t M = 0, x = 0;

      const int remaining = (int)T - now_i;
      const int real_cnt = (remaining < kBlockSize) ? remaining : kBlockSize;

      // ---- (A) consume real elements ----
      for (int i = 0; i < real_cnt; i++, now_i++) {
        const RAMTuple& ww = write_list[(uint64_t)now_i];
        IntFp h_w = ww.idx * A0 + ww.timestamp * A1 + ww.val * A2 + X;

        if constexpr (IsAlice) {
          product_w = mult_mod(product_w, HIGH64(h_w.value));

          // update C_w
          M = LOW64(h_w.value);
          x = PR - HIGH64(h_w.value);
          tmp_arr[0] = 0;
          for (int j = 0; j <= i; j++) tmp_arr[j + 1] = mult_mod(x, C_w[j]);
          for (int j = 0; j <= i; j++) C_w[j] = add_mod(tmp_arr[j], mult_mod(M, C_w[j]));
          C_w[i + 1] = tmp_arr[i + 1];
        } else {
          K_w = mult_mod(K_w, LOW64(h_w.value));
        }
      }

      // ---- (B) pad to full block with identity factors ----
      for (int i = real_cnt; i < kBlockSize; i++) {
        const IntFp h_w = PAD;

        if constexpr (IsAlice) {
          product_w = mult_mod(product_w, HIGH64(h_w.value));

          M = LOW64(h_w.value);
          x = PR - HIGH64(h_w.value);
          tmp_arr[0] = 0;
          for (int j = 0; j <= i; j++) tmp_arr[j + 1] = mult_mod(x, C_w[j]);
          for (int j = 0; j <= i; j++) C_w[j] = add_mod(tmp_arr[j], mult_mod(M, C_w[j]));
          C_w[i + 1] = tmp_arr[i + 1];
        } else {
          K_w = mult_mod(K_w, LOW64(h_w.value));
        }
      }

      IntFp combine_w_term = IntFp(product_w, ALICE);
      prod_write = prod_write * combine_w_term;

      if constexpr (IsAlice) {
        C_w[kBlockSize - 1] = add_mod(C_w[kBlockSize - 1], LOW64(combine_w_term.value));

        uint64_t random_c;
        prg.random_data(&random_c, sizeof(uint64_t)); random_c %= PR;
        for (int i = 0; i < kBlockSize; i++) {
          acc_C[i] = add_mod(acc_C[i], mult_mod(C_w[i], random_c));
        }
      } else {
        K_w = add_mod(K_w, mult_mod(power_delta, LOW64(combine_w_term.value)));

        uint64_t random_c;
        prg.random_data(&random_c, sizeof(uint64_t)); random_c %= PR;
        acc_K = add_mod(acc_K, mult_mod(random_c, K_w));
      }
    }

    // 5) ZK masking
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

    // 6) Exchange acc_C and verify polynomial proof
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

    // 7) Final equality check
    IntFp final_zero = prod_read + prod_write.negate();
    batch_reveal_check_zero(&final_zero, 1);
  }
};

#endif // IMPROVE_ZK_RAM