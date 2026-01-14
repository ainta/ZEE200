#ifndef ZK_SET
#define ZK_SET

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

struct ZKSetTuple {
  IntFp idx;     // the address or index
  IntFp version; // which version it is
};


class ZKSet {
    public:
      // Compile-time block size (fast path). Must match caller's block_size.
      static constexpr int kBlockSize = 16;
    
      uint64_t N; // size of the set
      uint64_t M; // maximum value of the set (unused here)
      uint64_t T; // number of access (real writes)
    
      std::vector<ZKSetTuple> read_list;
      std::vector<ZKSetTuple> write_list;
    
      // Set elements (PUBLIC), fixed universe for membership
      std::vector<uint64_t> val;
    
      // key -> [0..N)
      std::unordered_map<uint64_t, uint32_t> key_to_i;
    
      // latest_pos_i[i] = index in write_list of last write for val[i], or NO_POS
      std::vector<uint64_t> latest_pos_i;
    
      IntFp one;
      uint64_t A0 = 0, A1 = 0; // compress tuple into one IntFp
      uint64_t X = 0;          // evaluate at this value
    
      inline static constexpr uint64_t NO_POS = UINT64_MAX;
    
      explicit ZKSet(std::vector<uint64_t>& val_in) {
        val = val_in;
        N = (uint64_t)val.size();
        M = 0;
        T = 0;
        one = IntFp(1, PUBLIC);
    
        // Build key->index map and latest_pos vector
        key_to_i.clear();
        key_to_i.reserve(val.size() * 2);
    
        latest_pos_i.assign(val.size(), NO_POS);
    
        for (uint32_t i = 0; i < (uint32_t)val.size(); i++) {
          key_to_i[val[i]] = i;
        }
      }
    
      // Optional: call this to reset & reserve to avoid reallocs.
      void Setup(uint64_t expected_T = 0) {
        T = 0;
        read_list.clear();
        write_list.clear();
        std::fill(latest_pos_i.begin(), latest_pos_i.end(), NO_POS);
    
        if (expected_T != 0) {
          read_list.reserve((size_t)expected_T + (size_t)N); // includes Commit_version final reads
          write_list.reserve((size_t)expected_T);
        }
      }
    
      void set_coeff(uint64_t a0, uint64_t a1, uint64_t x) {
        A0 = a0;
        A1 = a1;
        X  = x;
      }
    
      void Access(IntFp& id) {
        const uint64_t addr = HIGH64(id.value);
    
        auto it = key_to_i.find(addr);
        if (it == key_to_i.end()) {
          std::cerr << "[ZKSet::Access] Unknown value " << addr << " (not present in key_to_i)\n";
          error("ZKSet Access on unknown value");
        }
        const uint32_t vi = it->second;
        const uint64_t pos = latest_pos_i[vi];
    
        ZKSetTuple tmp_r, tmp_w;
        tmp_r.idx = tmp_w.idx = id;
    
        // IMPORTANT (per your constraint): do NOT reuse IntFp wires.
        // Always re-commit old_version as ALICE from raw u64.
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
    
        latest_pos_i[vi] = (uint64_t)(write_list.size() - 1);
        T++;
      }
    
      // Commit_version appends final reads (one per element in the set)
      void Commit_version() {
        ZKSetTuple tmp;
        for (uint32_t i = 0; i < (uint32_t)val.size(); i++) {
          const uint64_t v = val[i];
          tmp.idx = IntFp(v, PUBLIC);
    
          const uint64_t pos = latest_pos_i[i];
          // IMPORTANT: do NOT reuse IntFp from write_list; re-commit as ALICE.
          if (pos == NO_POS) {
            tmp.version = IntFp(0, ALICE);
          } else {
            tmp.version = IntFp(HIGH64(write_list[pos].version.value), ALICE);
          }
          read_list.push_back(tmp);
        }
      }
    
      void Teardown_Basic(int& party) {
        // assumes Commit_version() already called: read_list.size() == T + N
        const uint64_t total_read = (uint64_t)(T + N);
        if (read_list.size() != total_read) {
          std::cerr << "[ZKSet::Teardown_Basic] read_list size mismatch. expected " << total_read
                    << " got " << read_list.size() << "\n";
          error("ZKSet Teardown_Basic read_list size mismatch");
        }
        if (write_list.size() != (uint64_t)T) {
          std::cerr << "[ZKSet::Teardown_Basic] write_list size mismatch. expected " << T
                    << " got " << write_list.size() << "\n";
          error("ZKSet Teardown_Basic write_list size mismatch");
        }
    
        IntFp prod_read = IntFp(1, PUBLIC);
        for (uint64_t i = 0; i < total_read; i++) {
          prod_read = prod_read * (read_list[i].idx * A0 + read_list[i].version * A1 + X);
        }
    
        // Initial PUBLIC set factor: ∏(A0*val[i] + X)
        uint64_t acc = 1;
        for (uint64_t i = 0; i < N; i++) {
          acc = mult_mod(acc, add_mod(mult_mod(A0, val[i]), X));
        }
        IntFp prod_write = IntFp(acc, PUBLIC);
    
        // Multiply only the T real writes
        for (uint64_t i = 0; i < (uint64_t)T; i++) {
          prod_write = prod_write * (write_list[i].idx * A0 + write_list[i].version * A1 + X);
        }
    
        IntFp final_zero = prod_read + prod_write.negate();
        batch_reveal_check_zero(&final_zero, 1);
      }
    
      void Teardown_Batch(int& party, int& block_size) {
        if (block_size != kBlockSize) {
          std::cerr << "[ZKSet::Teardown_Batch] block_size mismatch: got " << block_size
                    << ", expected " << kBlockSize << "\n";
          error("ZKSet block_size mismatch");
        }
        if (party == ALICE) Teardown_Batch_Impl<true>(party);
        else                Teardown_Batch_Impl<false>(party);
      }
    
    private:
      template <bool IsAlice>
      void batch_side(const std::vector<ZKSetTuple>& list,
                      int total,
                      PRG& prg,
                      uint64_t power_delta,
                      IntFp& prod,
                      std::array<uint64_t, kBlockSize>& acc_C,
                      uint64_t& acc_K) {
        const IntFp PAD = IntFp(1, PUBLIC);
        int now_i = 0;
    
        while (now_i < total) {
          uint64_t product = 1;
    
          std::array<uint64_t, kBlockSize + 1> C{};
          std::array<uint64_t, kBlockSize + 1> tmp_arr{};
          C.fill(0);
          C[0] = 1;
    
          uint64_t K = 1;
          uint64_t M_local = 0, x_local = 0;
    
          const int remaining = total - now_i;
          const int real_cnt = (remaining < kBlockSize) ? remaining : kBlockSize;
    
          // (1) real elements
          for (int i = 0; i < real_cnt; i++, now_i++) {
            const ZKSetTuple& e = list[now_i];
            IntFp h = e.idx * A0 + e.version * A1 + X;
    
            if constexpr (IsAlice) {
              product = mult_mod(product, HIGH64(h.value));
              M_local = LOW64(h.value);
              x_local = PR - HIGH64(h.value);
    
              tmp_arr[0] = 0;
              for (int j = 0; j <= i; j++) tmp_arr[j + 1] = mult_mod(x_local, C[j]);
              for (int j = 0; j <= i; j++) C[j] = add_mod(tmp_arr[j], mult_mod(M_local, C[j]));
              C[i + 1] = tmp_arr[i + 1];
            } else {
              K = mult_mod(K, LOW64(h.value));
            }
          }
    
          // (2) pad to full block
          for (int i = real_cnt; i < kBlockSize; i++) {
            const IntFp h = PAD;
    
            if constexpr (IsAlice) {
              product = mult_mod(product, HIGH64(h.value));
              M_local = LOW64(h.value);
              x_local = PR - HIGH64(h.value);
    
              tmp_arr[0] = 0;
              for (int j = 0; j <= i; j++) tmp_arr[j + 1] = mult_mod(x_local, C[j]);
              for (int j = 0; j <= i; j++) C[j] = add_mod(tmp_arr[j], mult_mod(M_local, C[j]));
              C[i + 1] = tmp_arr[i + 1];
            } else {
              K = mult_mod(K, LOW64(h.value));
            }
          }
    
          IntFp combine_term = IntFp(product, ALICE);
          prod = prod * combine_term;
    
          if constexpr (IsAlice) {
            C[kBlockSize - 1] = add_mod(C[kBlockSize - 1], LOW64(combine_term.value));
    
            uint64_t random_c;
            prg.random_data(&random_c, sizeof(uint64_t)); random_c %= PR;
    
            for (int i = 0; i < kBlockSize; i++) {
              acc_C[i] = add_mod(acc_C[i], mult_mod(C[i], random_c));
            }
          } else {
            K = add_mod(K, mult_mod(power_delta, LOW64(combine_term.value)));
    
            uint64_t random_c;
            prg.random_data(&random_c, sizeof(uint64_t)); random_c %= PR;
    
            acc_K = add_mod(acc_K, mult_mod(random_c, K));
          }
        }
      }
    
      template <bool IsAlice>
      void Teardown_Batch_Impl(int& party) {
        // Requires Commit_version() already called.
        const int total_read = (int)(T + N);
        if ((int)read_list.size() != total_read) {
          std::cerr << "[ZKSet::Teardown_Batch] read_list size mismatch. expected " << total_read
                    << " got " << (int)read_list.size() << "\n";
          error("ZKSet Teardown_Batch read_list size mismatch");
        }
    
        const int total_write = (int)T;
        if ((int)write_list.size() != total_write) {
          std::cerr << "[ZKSet::Teardown_Batch] write_list size mismatch. expected " << total_write
                    << " got " << (int)write_list.size() << "\n";
          error("ZKSet Teardown_Batch write_list size mismatch");
        }
    
        IntFp prod_read = IntFp(1, PUBLIC);
    
        // Seed for combine term proof (same as your original)
        block seed;
        if constexpr (IsAlice) {
          ZKFpExec::zk_exec->recv_data(&seed, sizeof(block));
        } else {
          PRG().random_block(&seed, 1);
          ZKFpExec::zk_exec->send_data(&seed, sizeof(block));
        }
        PRG prg(&seed);
    
        std::array<uint64_t, kBlockSize> acc_C{};
        acc_C.fill(0);
        uint64_t acc_K = 0;
    
        const uint64_t delta = ZKFpExec::zk_exec->get_delta();
        uint64_t power_delta = 1;
        for (int i = 1; i < kBlockSize; i++) power_delta = mult_mod(power_delta, delta);
    
        // -------- READ SIDE --------
        batch_side<IsAlice>(read_list, total_read, prg, power_delta, prod_read, acc_C, acc_K);
    
        // -------- WRITE SIDE --------
        // prod_write = (public init factor) * (product over T real writes)
        uint64_t acc = 1;
        for (uint64_t i = 0; i < N; i++) {
          acc = mult_mod(acc, add_mod(mult_mod(A0, val[i]), X));
        }
        IntFp prod_write = IntFp(acc, PUBLIC);
    
        batch_side<IsAlice>(write_list, total_write, prg, power_delta, prod_write, acc_C, acc_K);
    
        // -------- ZK mask + proof check (same logic, fixed-size arrays) --------
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
    
        if constexpr (IsAlice) ZKFpExec::zk_exec->send_data(acc_C.data(), sizeof(uint64_t) * kBlockSize);
        else                   ZKFpExec::zk_exec->recv_data(acc_C.data(), sizeof(uint64_t) * kBlockSize);
    
        if constexpr (!IsAlice) {
          uint64_t proof = 0;
          uint64_t pd = 1;
          for (int i = 0; i < kBlockSize; i++) {
            proof = add_mod(proof, mult_mod(pd, acc_C[i]));
            pd = mult_mod(pd, delta);
          }
          if (proof != acc_K) error("Prover cheat!");
        }
    
        IntFp final_zero = prod_read + prod_write.negate();
        batch_reveal_check_zero(&final_zero, 1);
      }
    };
    
    #endif // ZK_SET_OPTIMIZED