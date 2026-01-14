//zkcpu.h
#ifndef ZKCPU_H__
#define ZKCPU_H__

#include <vector>
#include <random>
#include <iostream>
#include <string>
#include <fstream>
#include <sstream>
#include <unordered_map>
#include "instruction.h"
#include "zk-ram/zkset.h"
#include "zk-ram/ram.h"
#include "parsing/register_mapping.h"
#include "rom_offsets.h"

#if defined(__linux__)
	#include <sys/time.h>
	#include <sys/resource.h>
#elif defined(__APPLE__)
	#include <unistd.h>
	#include <sys/resource.h>
	#include <mach/mach.h>
#endif

class ZKCPU {
public:
    std::size_t B; // number of branches (number of blocks)
    std::size_t m; // number of register
    std::size_t max_step; // max number of steps
    std::mt19937 gen;
    std::vector<Instruction> br;  // Sequential block IDs (0, 1, 2, ...)
    std::map<uint64_t, size_t> addr_to_idx;  // Address -> block ID mapping
    std::vector<uint64_t> idx_to_addr;  // Block ID -> address mapping
    std::unordered_map<uint64_t, f61> ram_map;  // Key-value RAM (address -> value)
    ZKSet *ZKSET;
    IZKRAM *zkram;  // Black-box RAM verification
    std::vector<OPTYPE> op_period;

    uint32_t qed_memory_addr;

    // --- User I/O state (for ASMINPUT gate) ---
    std::queue<f61> input_queue;     // FIFO queue of input values from cleartext VM
    std::vector<f61> input_record;   // Record of all input reads (for auditing)

    ZKCPU(std::size_t m, std::map<uint64_t, Instruction> &brs, std::vector<std::pair<uint64_t, uint64_t>> ram_kv = {}, std::size_t max_step = 1e9, std::vector<OPTYPE> op_period = {OPTYPE::INPUT, OPTYPE::ZKSET, OPTYPE::MEM, OPTYPE::OUTPUT}, size_t gcd_lower_bound = 0, uint32_t qed_memory_addr = 0xFFFFFFFFu) : m(m), max_step(max_step), op_period(op_period), qed_memory_addr(qed_memory_addr){
        // Build mappings and convert map to vector
        B = brs.size();
        br.reserve(B);
        idx_to_addr.reserve(B);
        size_t idx = 0;
        for(auto &pair : brs) {
            uint64_t addr = pair.first;
            addr_to_idx[addr] = idx++;
            idx_to_addr.push_back(addr);
            br.push_back(std::move(pair.second));
        }

        // Build ram_map from key-value pairs for execute_pass1 lookups
        for (const auto &kv : ram_kv) {
            //std::cout << "[DEBUG] ZKCPU constructor: adding RAM KV: " << kv.first << " -> " << kv.second << std::endl;
            ram_map[kv.first] = f61(kv.second);
        }

        zkram = new IZKRAM(ram_kv.size(), qed_memory_addr);


        for(size_t i = 0; i < br.size(); i++) {
            assert(br[i].m == m);
        }

        // Validate op_period: MEM operations must be multiple of 3 (key, old_val, new_val per access)
        {
            std::size_t mem_count = 0;
            for (auto op : op_period) {
                if (op == OPTYPE::MEM) mem_count++;
            }
        }

        // Calculate target_gcd if gcd_lower_bound is specified
        std::size_t target_gcd = 0;
        if (gcd_lower_bound > 0) {
            // Calculate K = number of INPUT operations per period
            std::size_t K = 0, num_output = 0;
            for (auto op : op_period) {
                if (op == OPTYPE::INPUT) K++;
                if (op == OPTYPE::OUTPUT) num_output++;
            }
            assert(K == num_output);
            // target_gcd = LCM(gcd_lower_bound, K) = ceiling to next multiple of K
            target_gcd = ((gcd_lower_bound + K - 1) / K) * K;
            std::cout << "[ZKCPU] GCD lower bound: " << gcd_lower_bound
                      << ", K: " << K
                      << ", target_gcd: " << target_gcd << std::endl;
        }

        std::cout << "[ZKCPU] Transforming " << br.size() << " instruction blocks into circuits..." << std::endl;
        for(size_t i = 0; i < br.size(); i++) {
            uint64_t addr = idx_to_addr[i];
            br[i].transform_circuit(addr, op_period, target_gcd);
        }
        std::cout << "[ZKCPU] Circuit transformation complete!" << std::endl;
    }

    void setup_memory(std::vector<std::pair<uint64_t, uint64_t>> &ram_kv, size_t path_length) {
        zkram->Setup(ram_kv, path_length);
        vector<uint64_t> set2_val((1<<16));
        for(int i = 0; i < (1<<16); i++) {
            set2_val[i] = i;
        }
        ZKSET = new ZKSet(set2_val);
    }

    void execute_pass1(std::vector<f61> reg, std::vector<f61> &final_reg, std::vector<uint64_t> &cids, std::vector<std::vector<f61>> &wire_vals, std::vector<f61> &in, std::vector<f61> &set2, std::vector<f61> &mem, std::vector<f61> &key, std::vector<f61> &new_val) {
        std::cout << "[DEBUG] execute_pass1: entering..." << std::endl;
        std::cout << "[DEBUG] execute_pass1: reg.size()=" << reg.size() << ", m=" << m << std::endl;
        assert(reg.size() == m);
        assert(reg[0].val == 1);  // wire_1 is always 1
        std::size_t pc_reg = 1;   // For m=2: pc is at index 1
        std::size_t step = 0;
        std::size_t proof_addr = 0xFFFFFFFF;
        std::size_t halt_addr = 0xFFFFFFFE;

        cout << "qed_memory_addr: " << qed_memory_addr << endl;
        cout << "ram_map.size(): " << ram_map.size() << endl;
        std::cout << "[DEBUG] execute_pass1: br.size()=" << br.size() << std::endl;
        std::cout << "[DEBUG] execute_pass1: addr_to_idx.size()=" << addr_to_idx.size() << std::endl;

        uint64_t pc_addr = reg[pc_reg].val;
        std::cout << "[DEBUG] execute_pass1: initial pc_addr=0x" << std::hex << pc_addr << std::dec << std::endl;
        while(step < max_step) {
            if (reg[pc_reg].val == proof_addr){
                std::cout << "QED at address 0x" << std::hex << pc_addr << std::dec << std::endl;
                break;
            }
            if(reg[pc_reg].val == halt_addr){
                std::cout << "HALT at address 0x" << std::hex << pc_addr << std::dec << std::endl;
                break;
            }
            pc_addr = reg[pc_reg].val;

            // Lookup block ID by address
            auto it = addr_to_idx.find(pc_addr);
            if (it == addr_to_idx.end()) {
                std::cerr << "[VM] Execution stopped at step=" << step
                          << " PC=0x" << std::hex << pc_addr << std::dec
                          << " (not in addr_to_idx)" << std::endl;
                std::cerr << "[VM] Total blocks executed: " << cids.size() << std::endl;
                std::cerr << "[VM] Final PC=" << reg[pc_reg].val;
                std::cerr << std::endl;
                exit(0);
            }
            size_t block_id = it->second;

            cids.push_back(block_id);  // Store block ID, not address

            std::unordered_set<uint64_t> memory_access;
            std::vector<f61> wire_val;
            br[block_id].execute_pass1(reg, reg, ram_map, memory_access, wire_val,
                input_queue, input_record);
            br[block_id].extend_in_witness(in, set2, wire_val);
            br[block_id].extend_mem_witness(mem, key, new_val, wire_val);
            wire_vals.push_back(wire_val);
            step++;
            if(memory_access.find(qed_memory_addr) != memory_access.end()){
                std::cout << "QED Address Touched! QED address: 0x" << std::hex << qed_memory_addr << std::dec << std::endl;
                break;
            }

        }
        final_reg = reg;
    }

    void execute_pass2(std::vector<uint64_t> &cids, std::vector<std::vector<f61>> &wire_vals, std::vector<f61> &l, std::vector<f61> &r) {
        for (int i = 0; i < cids.size(); i++) {
            size_t block_id = cids[i];  // Now contains block IDs (0, 1, 2, ...)
            if (block_id >= br.size()) continue;

/*
            br[block_id].print();

            for (int j = 0; j < wire_vals[i].size(); j++) {
                std::cout << "wire_vals[" << i << "][" << j << "]: " << wire_vals[i][j].val << std::endl;
            }*/


            br[block_id].forward_pass(wire_vals[i]);
            br[block_id].extend_lr_witness(l, r, wire_vals[i]);
            /*for(auto &t: br[block_id].checkzero_wires) {
                std::cout << "pass2 checkzero_wire[" << t << "]: " << wire_vals[i][t].val << std::endl;
            }

            for(auto &t: br[block_id].circuit) {
                // should print the string of the op
                // use optype_to_string
                std::cout << optype_to_string(t.op) << " ";
                std::cout << "wires: ";
                for(auto &w: t.wires) {
                    std::cout << w << " ";
                }
                std::cout << std::endl;
            }
            for (int j = 0; j < wire_vals[i].size(); j++) {
                std::cout << "wire_vals[" << i << "][" << j << "]: " << wire_vals[i][j].val << std::endl;
            }*/
        }

        // Log pass2 summary
#ifdef DEBUG
        std::cout << "[VM] execute_pass2 completed:" << std::endl;
        std::cout << "  Processed blocks: " << cids.size() << std::endl;
        std::cout << "  l.size()=" << l.size() << std::endl;
        std::cout << "  r.size()=" << r.size() << std::endl;
#endif
    }
    
    void zkset_teardown(int &party, uint64_t A0, uint64_t A1, uint64_t X, int &block_size){
        ZKSET->set_coeff(A0, A1, X);
        //ZKSET->Teardown_Basic(party);
        ZKSET->Teardown_Batch(party, block_size);
    }

    // Load input queue from a vector of uint32_t values (from cleartext VM)
    void load_input_queue(const std::vector<uint32_t>& cleartext_inputs) {
        // Clear existing queue
        while (!input_queue.empty()) {
            input_queue.pop();
        }

        // Convert uint32_t → f61 and push to queue (FIFO order)
        for (uint32_t val : cleartext_inputs) {
            input_queue.push(f61((uint64_t)val));
        }
    }

    // Load input queue from a space/newline-separated string (for testing)
    void load_input_queue_from_string(const std::string& s) {
        std::vector<uint32_t> values;
        std::stringstream ss(s);
        uint32_t x;
        while (ss >> x) {
            values.push_back(x);
        }
        load_input_queue(values);
    }

    // Load input queue from file (one integer per token)
    void load_input_queue_from_file(const std::string& path) {
        std::ifstream in(path);
        if (!in) {
            std::cerr << "[INPUT] cannot open " << path << std::endl;
            exit(1);
        }
        std::vector<uint32_t> values;
        uint32_t x;
        while (in >> x) {
            values.push_back(x);
        }
        load_input_queue(values);
    }
};

inline void cv_lr_check_full(
    int &party,
    const std::vector<OPTYPE>& op_period,      // e.g. [INPUT, ZKSET, MEM, OUTPUT]
    const std::vector<IntFp>&  cv,             // concatenated topo coefficients (one per op slot)
    const std::vector<IntFp>&  in,             // INPUT stream
    const std::vector<IntFp>&  out,            // OUTPUT stream (you called it o)
    const std::vector<IntFp>&  old_val,        // MEM old_val stream (one per MEM slot)
    const std::vector<IntFp>&  set2,           // ZKSET stream
    const std::vector<IntFp>&  p,              // fragment-end selector per fragment (length = #fragments)
    const std::vector<size_t>& p_positions_inv,// map: cv index (fragment end) -> fragment idx
    const std::vector<bool>&   is_p_positions, // flags per cv index
    const f61&                 f61_chi,
    int                        reg_size,       // m in your picture (e.g. 2)
    const int&                 path_length,    // length = path_length
    const std::vector<f61>&    init_reg,       // length = reg_size
    const std::vector<IntFp>&  l,              // payload-only, length = path_length
    const std::vector<IntFp>&  r,              // payload-only, length = path_length
    const std::vector<IntFp>&  key,            // payload-only, length = path_length
    const std::vector<IntFp>&  new_val         // payload-only, length = path_length
) {

    // --- 1) Header contribution: add_l and shift_l for (1,init_reg[0])...(1,init_reg[m-1]) ---
    // add_l = Σ_{j=0..m-1} ( χ^(2j)*1 + χ^(2j+1)*init_reg[j] )
    // shift_l = χ^(2m)
    f61 add_l = f61::zero();
    f61 shift_l = f61::unit();
    for (int j = 0; j < reg_size; j++) {
        add_l += shift_l;
        shift_l *= f61_chi;
        add_l += shift_l * init_reg[j];
        shift_l *= f61_chi;
    }

    // --- 2) RHS scalar: payload starts at χ^(2m) ---
    // RHS(payload) - add_l, then negate so we check sum_l + sum_r == 0.
    IntFp sum_r(0, PUBLIC);

    f61 tmp_chi = 1;
    for (int i = 0; i < reg_size; i++) {
        sum_r = sum_r + l[i] * tmp_chi.val; tmp_chi *= f61_chi;
        sum_r = sum_r + r[i] * tmp_chi.val; tmp_chi *= f61_chi;
    }
    for (int t = 0; t < path_length; t++) {
        sum_r = sum_r + l[t + reg_size]       * tmp_chi.val; tmp_chi *= f61_chi;
        sum_r = sum_r + r[t + reg_size]       * tmp_chi.val; tmp_chi *= f61_chi;
        sum_r = sum_r + key[t]     * tmp_chi.val; tmp_chi *= f61_chi;
        sum_r = sum_r + new_val[t] * tmp_chi.val; tmp_chi *= f61_chi;
    }


    sum_r = sum_r + (PR - add_l.val);
    sum_r = sum_r.negate();

    // --- 3) LHS scalar: scan cv and multiply by s_jump (= cur * shift_l), update cur at fragment ends ---
    auto one_minus = [](const IntFp& x) { return IntFp(1, PUBLIC) + x.negate(); };

    f61 chi = f61_chi;
    const f61 f61_chi4 = chi * chi * chi * chi; // χ^4 because payload unit is 4-wide
    IntFp cur = IntFp(1, PUBLIC);
    f61   chi_tmp = f61_chi4;                 // advances at every OUTPUT
    IntFp s_jump = cur * shift_l.val;         // Convention A: shift applied here

    // Build masked polynomial coefficients (your existing Δ^2 trick)
    bool is_alice = (party == ALICE);
    f61 C0 = f61::zero(), C1 = f61::zero(), C2 = f61::zero();
    f61 exp_proof = f61::zero(); // Bob side low-only accumulator

    auto add_term = [&](const IntFp &s, const IntFp &c, const IntFp &v) {
        if (is_alice) {
            f61 ls = f61(LOW64(s.value)), hs = f61(HIGH64(s.value));
            f61 lc = f61(LOW64(c.value)), hc = f61(HIGH64(c.value));
            f61 lv = f61(LOW64(v.value)), hv = f61(HIGH64(v.value));
            C0 += ls * lc * lv;
            C1 += hs * lc * lv + hc * ls * lv + hv * ls * lc;
            C2 += ls * hc * hv + lc * hs * hv + lv * hs * hc;
        } else {
            f61 ls = f61(LOW64(s.value));
            f61 lc = f61(LOW64(c.value));
            f61 lv = f61(LOW64(v.value));
            exp_proof += ls * lc * lv;
        }
    };

    size_t pin = 0, pout = 0, pset2 = 0, pmem = 0;

    for (size_t i = 0; i < cv.size(); ++i) {
        OPTYPE op = op_period[i % op_period.size()];
        switch (op) {
            case OPTYPE::INPUT:
                add_term(s_jump, cv[i], in[pin++]);
                break;
            case OPTYPE::ZKSET:
                add_term(s_jump, cv[i], set2[pset2++]);
                break;
            case OPTYPE::MEM:
                add_term(s_jump, cv[i], old_val[pmem++]);
                break;
            case OPTYPE::OUTPUT: {
                add_term(s_jump, cv[i], out[pout++]);

                if (is_p_positions[i]) {
                    size_t frag_idx = p_positions_inv[i];
                    IntFp pf = p[frag_idx];
                    cur = pf * chi_tmp.val + one_minus(pf) * cur;
                    s_jump = cur * shift_l.val; // Convention A
                }
                chi_tmp = chi_tmp * f61_chi4;
                break;
            }
            default:
                assert(false && "unknown OPTYPE in cv scan");
        }
    }

    // Sanity: streams fully consumed
    assert(pin == in.size());
    assert(pout == out.size());
    assert(pset2 == set2.size());
    assert(pmem == old_val.size());

    // Fold RHS sum_r into the Δ^2 polynomial, mask, and check.
    if (is_alice) {
        C1 = f61::minor(C1.val);
        C2 += f61(LOW64(sum_r.value));

        // same random padding protocol you already use
        constexpr size_t block_size = 3;
        uint64_t random_pad[block_size]; memset(random_pad, 0, sizeof(random_pad));
        __uint128_t random_mask = ZKFpExec::zk_exec->get_one_role();
        random_pad[0] = LOW64(random_mask);
        random_pad[1] = PR - HIGH64(random_mask);

        uint64_t tmp[block_size + 1];
        for (int i = 1; i < (int)block_size - 1; i++) {
            random_mask = ZKFpExec::zk_exec->get_one_role();
            tmp[0] = 0;
            uint64_t x = PR - HIGH64(random_mask), M = LOW64(random_mask);
            for (int j = 0; j <= i; j++) tmp[j + 1] = mult_mod(x, random_pad[j]);
            for (int j = 0; j <= i; j++) random_pad[j] = add_mod(tmp[j], mult_mod(M, random_pad[j]));
            random_pad[i + 1] = tmp[i + 1];

            random_mask = ZKFpExec::zk_exec->get_one_role();
            random_pad[0] = add_mod(random_pad[0], LOW64(random_mask));
            random_pad[1] = add_mod(random_pad[1], PR - HIGH64(random_mask));
        }
        C0 += f61(random_pad[0]);
        C1 += f61(random_pad[1]);
        C2 += f61(random_pad[2]);

        ZKFpExec::zk_exec->send_data(&C0, sizeof(f61));
        ZKFpExec::zk_exec->send_data(&C1, sizeof(f61));
        ZKFpExec::zk_exec->send_data(&C2, sizeof(f61));
    } else {
        f61 f61_delta = f61(ZKFpExec::zk_exec->get_delta());
        exp_proof += f61(LOW64(sum_r.value)) * f61_delta * f61_delta;

        constexpr size_t block_size = 3;
        uint64_t random_pad;
        __uint128_t random_mask = ZKFpExec::zk_exec->get_one_role();
        random_pad = LOW64(random_mask);
        for (int i = 1; i < (int)block_size - 1; i++) {
            random_mask = ZKFpExec::zk_exec->get_one_role();
            random_pad = mult_mod(random_pad, LOW64(random_mask));
            random_mask = ZKFpExec::zk_exec->get_one_role();
            random_pad = add_mod(random_pad, LOW64(random_mask));
        }
        exp_proof += f61(random_pad);

        f61 RC0, RC1, RC2;
        ZKFpExec::zk_exec->recv_data(&RC0, sizeof(f61));
        ZKFpExec::zk_exec->recv_data(&RC1, sizeof(f61));
        ZKFpExec::zk_exec->recv_data(&RC2, sizeof(f61));

        f61 lhs = (f61_delta * f61_delta) * RC2 + f61_delta * RC1 + RC0;
        if (lhs.val != exp_proof.val) {
            std::cout << "[Cheat]: linear constraint check failed" << std::endl;
            exit(-1);
        }
    }
}

#endif
