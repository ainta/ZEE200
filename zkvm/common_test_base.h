#include <random>
#include <map>
#include <utility>
#include <array>
#include <vector>
#include "zkvm/zkcpu.h"
#include "emp-zk/emp-zk.h"
#include <iostream>
#include "emp-tool/emp-tool.h"
#include "zk-ram/zk-ram.h"
#include "zkvm/register_layout.h"
#if defined(__linux__)
	#include <sys/time.h>
	#include <sys/resource.h>
#elif defined(__APPLE__)
	#include <unistd.h>
	#include <sys/resource.h>
	#include <mach/mach.h>
#endif

using namespace emp;
using namespace std;

const int threads = 1;

uint64_t comm(BoolIO<NetIO> *ios[threads]) {
	uint64_t c = 0;
	for(int i = 0; i < threads; ++i)
		c += ios[i]->counter;
	return c;
}
uint64_t comm2(BoolIO<NetIO> *ios[threads]) {
	uint64_t c = 0;
	for(int i = 0; i < threads; ++i)
		c += ios[i]->io->counter;
	return c;
}

size_t gcd(size_t a, size_t b) {
    if (b == 0) return a;
    return gcd(b, a % b);
}

void common_test_circuit_zk(BoolIO<NetIO> *ios[threads], int party, size_t reg_size, std::map<uint64_t, Instruction> &brs, std::vector<std::pair<uint64_t, uint64_t>> &ram_kv, size_t ram_size_bytes, size_t max_step, vector<OPTYPE> op_period, uint64_t start_address = 0, const std::vector<uint32_t>& cleartext_inputs = std::vector<uint32_t>(), uint32_t heap_base_bytes = 0, size_t gcd_lower_bound = 0, uint32_t qed_memory_addr = 0xFFFFFFFFu) {

    std::cout << "[ZK] Starting ZK protocol initialization..." << std::endl;
    std::cout << "[ZK] Party: " << party << ", Register size: " << reg_size << ", Instructions: " << brs.size() << std::endl;

    // testing communication
    uint64_t com1 = comm(ios);
    uint64_t com11 = comm2(ios);

    // initial zk exec
    auto init_start = clock_start();
    setup_zk_arith<BoolIO<NetIO>>(ios, threads, party);
    auto init_time = time_from(init_start);

    // set up randomized CPU (with circuits as instructions)
    std::random_device::result_type cir_seed;
    if (party == ALICE) {
        std::random_device rd; // obtain a random number from hardware
        cir_seed = rd();
        ZKFpExec::zk_exec->send_data(&cir_seed, sizeof(std::random_device::result_type));
    } else {
        ZKFpExec::zk_exec->recv_data(&cir_seed, sizeof(std::random_device::result_type));
    }

    size_t branch_size = brs.size();

    // Registers-as-RAM: append register slots and ROM as KV pairs.
    // NOTE: RAM is now a key-value store with byte addresses as keys.
    {
        const std::size_t orig_size = ram_size_bytes;  // Original RAM size in bytes

        // Use default layout for the virtual register space (m=20).
        RegisterLayout layout = RegisterLayout::make_default(20);
        const std::size_t first_idx = layout.arch_min;
        const std::size_t last_idx  = layout.arch_max;

        const std::size_t num_slots =
            (last_idx >= first_idx) ? (last_idx - first_idx + 1) : 0;

        const std::size_t rom_extra =
            RomOffsets::XOR32_SIZE +
            RomOffsets::AND32_SIZE +
            RomOffsets::OR32_SIZE  +
            RomOffsets::BYTE_SHIFT_POW2_SIZE +
            RomOffsets::MOD4_SIZE +
            RomOffsets::HIGH8_SIZE;

        ram_kv.reserve(ram_kv.size() + 1 + num_slots + rom_extra);

        ram_kv.push_back({0x7FFFFFFF, 0});

        // Initialize all register slots to 0 (with SP/FP/HP pre-set).
        for (std::size_t reg_idx = first_idx; reg_idx <= last_idx; ++reg_idx) {
            uint32_t value = 0;
            if (reg_idx == layout.sp_idx || reg_idx == layout.fp_idx) {
                value = static_cast<uint32_t>(orig_size);
            } else if (reg_idx == layout.hp_idx) {
                value = heap_base_bytes;
            }
            uint64_t byte_addr = layout.slot_addr(reg_idx);
            ram_kv.push_back({byte_addr, value});
        }

        // --- Append ROM tables at fixed high addresses ---
        // XOR table: 256x256 table of byte-wise XOR
        for (std::size_t i = 0; i < RomOffsets::XOR32_SIZE; ++i) {
            uint64_t a = (i >> 8) & 0xFF;
            uint64_t b = i & 0xFF;
            uint64_t addr = RomOffsets::XOR_OFFSET + i;
            uint64_t val  = (a ^ b) & 0xFF;
            ram_kv.push_back({addr, val});
        }

        // AND table
        for (std::size_t i = 0; i < RomOffsets::AND32_SIZE; ++i) {
            uint64_t a = (i >> 8) & 0xFF;
            uint64_t b = i & 0xFF;
            uint64_t addr = RomOffsets::AND_OFFSET + i;
            uint64_t val  = (a & b) & 0xFF;
            ram_kv.push_back({addr, val});
        }

        // OR table
        for (std::size_t i = 0; i < RomOffsets::OR32_SIZE; ++i) {
            uint64_t a = (i >> 8) & 0xFF;
            uint64_t b = i & 0xFF;
            uint64_t addr = RomOffsets::OR_OFFSET + i;
            uint64_t val  = (a | b) & 0xFF;
            ram_kv.push_back({addr, val});
        }

        // POW2 / BYTE_SHIFT_POW2 table
        for (std::size_t i = 0; i < RomOffsets::BYTE_SHIFT_POW2_SIZE; ++i) {
            uint64_t addr = RomOffsets::POW2_OFFSET + i;
            uint64_t val  = (1ULL << i);
            ram_kv.push_back({addr, val});
        }

        // MOD4 ROM to ram_kv
        for (std::size_t i = 0; i < RomOffsets::MOD4_SIZE; i++) {
            uint64_t rom_addr = RomOffsets::MOD4_OFFSET + i;
            uint64_t val = i % 4;
            ram_kv.push_back({rom_addr, val});
        }
        // HIGH8 ROM to ram_kv: returns high 8 bits of 16-bit input
        for (std::size_t i = 0; i < RomOffsets::HIGH8_SIZE; i++) {
            uint64_t rom_addr = RomOffsets::HIGH8_OFFSET + i;
            uint64_t val = i >> 8;
            ram_kv.push_back({rom_addr, val});
        }
#ifdef DEBUG
        std::cout << "[ZK] Unified RAM (with registers and ROM): " << ram_kv.size() << " KV pairs" << std::endl;
#endif
    }

    std::cout << "[ZK] Initializing ZKCPU with " << brs.size() << " instruction blocks..." << std::endl;
    ZKCPU zkcpu(reg_size, brs, ram_kv, max_step, op_period, gcd_lower_bound, qed_memory_addr);
    std::cout << "[ZK] ZKCPU initialization complete." << std::endl;

    // Input queue populated by cleartext VM execution (VMCALL oracles)
    if (!cleartext_inputs.empty()) {
        std::cout << "Loading " << cleartext_inputs.size() << " cleartext inputs into input queue" << std::endl;
        zkcpu.load_input_queue(cleartext_inputs);
    }


    cout << "Branch size, rom size, ram size finished" << endl;
    std::cout << "CPU has been initialized." << std::endl;

    std::vector<f61> init_reg(reg_size);
    // [wire_1, pc] for m=2 black-box RAM model
    init_reg[0] = 1;              // wire_1: always 1
    init_reg[1] = start_address;  // pc: program counter (byte address)


    // prover calculates witness
    std::vector<f61> l_val, r_val;
    std::vector<f61> in_val, set2_val, mem_val, key_val, new_val_val;
    std::vector<uint64_t> cids;  // Contains block IDs (0, 1, 2, ...), not addresses
    std::vector<f61> final_reg;
    std::vector<std::vector<f61>> wire_vals;
    std::size_t path_length; // number of period repetitions (# of units in cv)

    if (party == ALICE) {
        zkcpu.execute_pass1(init_reg, final_reg, cids, wire_vals, in_val, set2_val, mem_val, key_val, new_val_val);

        // path_length = number of periods = in_val.size() / op_count[INPUT]
        path_length = in_val.size() / zkcpu.br[0].op_count[OPTYPE::INPUT];

        // --- Execution statistics for ZKCPU (prover side only) ---
        // Count how many times each block (Instruction) is executed
        std::vector<uint64_t> block_exec_counts(zkcpu.br.size(), 0);
        for (auto block_id : cids) {
            if (block_id < block_exec_counts.size()) {
                block_exec_counts[block_id]++;
            }
        }

        struct BlockStats {
            std::size_t block_id;
            uint64_t    exec_count;
            uint64_t    iid_exec;
            uint64_t    oid_exec;
            uint64_t    mem_exec;
            uint64_t    ZKSET_exec;
        };

        std::vector<BlockStats> stats;
        stats.reserve(zkcpu.br.size());

        for (std::size_t i = 0; i < zkcpu.br.size(); i++) {
            uint64_t exec = block_exec_counts[i];
            if (exec == 0) continue; // Skip blocks never executed

            const Instruction& inst = zkcpu.br[i];
            uint64_t iid_count    = static_cast<uint64_t>(inst.iid.size());
            uint64_t oid_count    = static_cast<uint64_t>(inst.oid.size());
            uint64_t mem_count    = static_cast<uint64_t>(inst.old_val_id.size() - inst.num_dummy_mem_accesses);
            uint64_t ZKSET_count = static_cast<uint64_t>(inst.set2id.size());

            stats.push_back(BlockStats{
                i,
                exec,
                iid_count,
                oid_count,
                mem_count,
                ZKSET_count
            });
        }

        // Sort blocks from most executed to least executed
        std::sort(stats.begin(), stats.end(),
                  [](const BlockStats& a, const BlockStats& b) {
                      if (a.exec_count != b.exec_count) return a.exec_count > b.exec_count;
                      return a.block_id < b.block_id;
                  });

        if (!stats.empty()) {
            std::cout << "[ZKCPU] Block execution statistics (most to least executed):" << std::endl;
            std::cout << "[ZKCPU] block_id  addr       execs   iid   oid   mem_access   ZKSET   operations" << std::endl;

            // show most executed 100 blocks
            for (int i = 0; i < std::min(100, (int)stats.size()); i++) {
                const auto& s = stats[i];
                uint64_t addr = (s.block_id < zkcpu.idx_to_addr.size()) ? zkcpu.idx_to_addr[s.block_id] : 0;

                // Count operations by type in bank
                const Instruction& inst = zkcpu.br[s.block_id];
                std::map<OPTYPE, int> op_counts;
                for (std::size_t j = inst.m; j < inst.bank.size(); j++) {
                    op_counts[inst.bank[j].op]++;
                }

                // Build operation string
                std::string ops_str;
                for (const auto& [op, cnt] : op_counts) {
                    if (!ops_str.empty()) ops_str += " ";
                    ops_str += optype_to_string(op);
                    if (cnt > 1) ops_str += "x" + std::to_string(cnt);
                }

                std::cout << "[ZKCPU] "
                          << s.block_id << "\t0x" << std::hex << addr << std::dec
                          << "\t" << s.exec_count
                          << "\t" << s.iid_exec
                          << "\t" << s.oid_exec
                          << "\t" << s.mem_exec
                          << "\t" << s.ZKSET_exec
                          << "\t" << ops_str
                          << std::endl;
            }
        }

        ZKFpExec::zk_exec->send_data(&path_length, sizeof(size_t));
        ZKFpExec::zk_exec->send_data(final_reg.data(),
                                     sizeof(f61) * final_reg.size());
    } else { // V:Bob
        ZKFpExec::zk_exec->recv_data(&path_length, sizeof(size_t));
        final_reg.resize(reg_size);
        ZKFpExec::zk_exec->recv_data(final_reg.data(),
                                     sizeof(f61) * final_reg.size());
    }

#ifdef DEBUG
    std::cout << "final reg size: " << final_reg.size() << std::endl;

    std::cout << "final reg: ";
    for(auto &t: final_reg){
        cout << t.val << ", ";
    }
    cout << endl;

    std::cout << "path length: " << path_length << std::endl;
#endif

    // proof start sync
    if (party == ALICE) {
        int ack = 0;
        ZKFpExec::zk_exec->send_data(&ack, sizeof(int));
    } else {
        int ack;
        ZKFpExec::zk_exec->recv_data(&ack, sizeof(int));
    }

    std::cout << "Synced" << std::endl;
	uint64_t delta = ZKFpExec::zk_exec->get_delta();    
    f61 f61_delta(delta);
	
	auto start = clock_start();

    zkcpu.setup_memory(ram_kv, path_length);

    // P:Alice commits in
    constexpr std::size_t NUM_OPTYPES = SREM + 1;
    std::array<std::size_t, NUM_OPTYPES> op_count{};
    for (auto op : zkcpu.op_period) {
        op_count[op]++;
    }

    std::size_t in_size =
        path_length * op_count[OPTYPE::INPUT];
    std::size_t set2_size =
        path_length * op_count[OPTYPE::ZKSET];
    std::vector<IntFp> in(in_size);
    std::vector<IntFp> set2(set2_size);

    IntFp one = IntFp(1, PUBLIC);
    IntFp zero = IntFp(0, PUBLIC);
    if (party == ALICE) {
        for (size_t i = 0; i < in_size; i++) {
            in[i] = IntFp(in_val[i].val, ALICE);
        }
        for (size_t i = 0; i < set2_size; i++) {
            set2[i] = IntFp(set2_val[i].val, ALICE);
        }
    } else {
        for (size_t i = 0; i < in_size; i++) {
            in[i] = IntFp(0, ALICE);
        }
        for (size_t i = 0; i < set2_size; i++) {
            set2[i] = IntFp(0, ALICE);
        }
    }
    std::cout << "in,set2 committed" << std::endl;


    std::size_t mem_op_count =
        path_length * op_count[OPTYPE::MEM];
    std::vector<IntFp> key(mem_op_count);
    std::vector<IntFp> old_val(mem_op_count);
    std::vector<IntFp> new_val(mem_op_count);

    if (party == ALICE) {
        for (size_t i = 0; i < mem_op_count; i++) {
            key[i] = IntFp(key_val[i].val, ALICE);
            old_val[i] = IntFp(mem_val[i].val, ALICE);
            new_val[i] = IntFp(new_val_val[i].val, ALICE);
        }
    } else {
        for (size_t i = 0; i < mem_op_count; i++) {
            key[i] = IntFp(0, ALICE);
            old_val[i] = IntFp(0, ALICE);
            new_val[i] = IntFp(0, ALICE);
        }
    }
    std::cout << "key, old_val, new_val committed" << std::endl;

    // ZKSET access (kept for range checks)
    std::cout << "set2" << std::endl;
    for (auto &t: set2) zkcpu.ZKSET->Access(t);
    zkcpu.ZKSET->Commit_version();
    std::cout << "set2 finished" << std::endl;

    // IZKRAM access with (key, val, rw) tuples from mem_val
    // Following ZKSET style: commit all accesses then teardown
    std::cout << "zkram access" << std::endl;
    std::cout << "mem_op_count: " << mem_op_count << std::endl;
    for (size_t i = 0; i < mem_op_count; i++) {
        zkcpu.zkram->Access(key[i], old_val[i], new_val[i]);
    }
    std::cout << "zkram access finished" << std::endl;


    // V issues uniform chkzero_coeff for checkzero constraints
    struct CoeffPack {
        uint64_t mem_coeffs[3];
        uint64_t chkzero_coeff;
    } cp{};

    if (party == ALICE) {
        ZKFpExec::zk_exec->recv_data(&cp, sizeof(cp));
        for (int i = 0; i < 3; i++) {
            cp.mem_coeffs[i] %= PR; // to prevent cheating V
        }
        cp.chkzero_coeff %= PR;
    } else {
        PRG().random_data(&cp, sizeof(cp));
        for (int i = 0; i < 3; i++) {
            cp.mem_coeffs[i] %= PR;
        }
        cp.chkzero_coeff %= PR;
        ZKFpExec::zk_exec->send_data(&cp, sizeof(cp));
    }

    uint64_t *mem_coeffs = cp.mem_coeffs;
    uint64_t chkzero_coeff = cp.chkzero_coeff;

    std::cout << "mem, chkzero coeff finished" << std::endl;
    for (size_t i = 0; i < zkcpu.br.size(); i++){
        zkcpu.br[i].fill_checkzero_coeffs(chkzero_coeff);
    }

    if (party == ALICE) {
        for (auto &t: init_reg){
            l_val.push_back(f61::unit());
            r_val.push_back(f61(t));
        }
        zkcpu.execute_pass2(cids, wire_vals, l_val, r_val);
        // l_val, r_val contains the whole witness, including the final register values
        // vector l, r does not contain the final register values

        std::size_t lr_size =
            path_length * op_count[OPTYPE::OUTPUT];
        assert(l_val.size() == lr_size + reg_size);
        std::cout << "Pass2 finished" << std::endl;
    }

    std::size_t o_size =
        path_length * op_count[OPTYPE::OUTPUT];
#ifdef DEBUG
    cout << "l_val size: " << l_val.size() << endl;
    cout << "r_val size: " << r_val.size() << endl;
    cout << "Path Length: " << path_length << std::endl;
#endif
    cout << "Time: " << init_time+time_from(start) << " us" << std::endl;


    // P:Alice commits l, r, o, key, new_val
    std::vector<IntFp> l(o_size + reg_size);
    std::vector<IntFp> r(o_size + reg_size);
    std::vector<IntFp> o(o_size);
    if (party == ALICE) {
        for (size_t i = 0; i < l.size(); i++) {
            l[i] = IntFp(l_val[i].val, ALICE);
            r[i] = IntFp(r_val[i].val, ALICE);
        }
    } else {
        for (size_t i = 0; i < l.size(); i++) {
            l[i] = IntFp(0, ALICE);
            r[i] = IntFp(0, ALICE);
        }
    }
    for (size_t i = 0; i < o_size; i++) {
        o[i] = l[i] * r[i];
    }
    std::cout << "l, r, o finished" << std::endl;
    cout << "Time: " << init_time+time_from(start) << " us" << std::endl;


    int block_size = 16;  // batch size for efficiency
    // ZKSET teardown (range checks)
    zkcpu.zkset_teardown(party, mem_coeffs[0], mem_coeffs[1], mem_coeffs[2], block_size);
    std::cout << "ZKSET teardown finished" << std::endl;
    cout << "Time: " << init_time+time_from(start) << " us" << std::endl;

    // IZKRAM teardown for black-box RAM verification
    zkcpu.zkram->Teardown_Batch(party, block_size);
    std::cout << "zkram teardown finished" << std::endl;
    cout << "Time: " << init_time+time_from(start) << " us" << std::endl;


    size_t gcd_path_length = 0;

    for (size_t i = 0; i < zkcpu.br.size(); i++) {
        gcd_path_length = gcd(gcd_path_length, zkcpu.br[i].path_length);
    }

    // P:Alice commits 0-1 program p and index indicator id
    std::vector<IntFp> p(path_length / gcd_path_length);
    std::vector<IntFp> id(path_length / gcd_path_length);

    const size_t p_length = p.size();

    cout << "p_length: " << p_length << endl;

    if (party == ALICE) {
        size_t scan_i = 0;
        for (int i = 0; i < cids.size(); i++) {
            size_t block_id = cids[i];  // Now block ID (0, 1, 2, ...)
            size_t sub_path_length = zkcpu.br[block_id].path_length;
            for (int j = 0; j < sub_path_length / gcd_path_length - 1; j++) {
                p[scan_i] = IntFp(0, ALICE);
                id[scan_i++] = IntFp(block_id, ALICE);  // Store block ID
            }
            p[scan_i] = IntFp(1, ALICE);
            id[scan_i++] = IntFp(block_id, ALICE);  // Store block ID
        }
    } else {
        for (int i = 0; i < path_length / gcd_path_length; i++) {
            p[i] = IntFp(0, ALICE);
            id[i] = IntFp(0, ALICE);
        }
    }
    std::cout << "p, id finished" << std::endl;
    cout << "Time: " << init_time+time_from(start) << " us" << std::endl;
    // V: issue uniform \chi to generate topology vectors
    uint64_t chi;
    if (party == ALICE) {
		ZKFpExec::zk_exec->recv_data(&chi, sizeof(uint64_t));
        std::cout << "chi received" << std::endl;
        chi = chi % PR; // to prevent cheating V
    } else {
		PRG().random_data(&chi, sizeof(uint64_t));
		chi = chi % PR;
		ZKFpExec::zk_exec->send_data(&chi, sizeof(uint64_t));	        
        std::cout << "chi sent" << std::endl;
    }
    std::cout << "chi finished" << std::endl;
    f61 f61_chi(chi);
    std::vector<std::vector<f61>> topo_vec(branch_size);  // Sequential indexing with block IDs
    for (size_t i = 0; i < zkcpu.br.size(); i++){
        zkcpu.br[i].comp_topo_vec_pselect(f61_chi, topo_vec[i]);
    }
    std::cout << "topo vec finished" << std::endl;
    // Calculate the actual topology vector length based on operation period
    size_t topo_vec_length = path_length * zkcpu.op_period.size();

    std::cout << topo_vec_length << std::endl;

    // P: commits concatenated topology vector cv
    std::vector<IntFp> cv(topo_vec_length);
    if (party == ALICE) {
        size_t scan_i = 0;
        for (int i = 0; i < cids.size(); i++) {
            size_t block_id = cids[i];  // Block ID (0, 1, 2, ...)
            for (int j = 0; j < topo_vec[block_id].size(); j++)
                cv[scan_i++] = IntFp(topo_vec[block_id][j].val, ALICE);
        }
    } else {
        for (int i = 0; i < topo_vec_length; i++)
            cv[i] = IntFp(0, ALICE);
    }
#ifdef DEBUG
    std::cout << "cv finished" << std::endl;
    cout << "Time: " << init_time+time_from(start) << " us" << std::endl;
#endif
    // prove p \times (1-p) = \vec{0} && last{p} = 1; I.e., p is a 0-1 program
    IntFp notlastp = p[p_length-1].negate() + 1;
    batch_reveal_check_zero(&notlastp, 1);
    if (party == ALICE) {
		uint64_t chal; // random challenge
		ZKFpExec::zk_exec->recv_data(&chal, sizeof(uint64_t));
        chal = chal % PR;

        f61 f61_chal(chal);
        f61 coeff = f61::unit();
        f61 C0 = f61::zero(), C1 = f61::zero();
        
        for (int i = 0; i < p_length; i++) {
            IntFp notp = p[i].negate() + 1;
            f61 f61_p = f61(LOW64(p[i].value));
            f61 f61_notp = f61(LOW64(notp.value));
            C0 += coeff * f61_p * f61_notp;
            if (HIGH64(p[i].value) == 0) {
                C1 += coeff * f61_p;
            } else { // == 1
                C1 += coeff * f61_notp;
            }
            coeff *= f61_chal;
        }

        // mask the proofs with random_mask
        __uint128_t random_mask = ZKFpExec::zk_exec->get_one_role();
        C1 += f61(HIGH64(random_mask));
        C1 = f61::minor(C1.val);
        C0 += f61(LOW64(random_mask));

        ZKFpExec::zk_exec->send_data(&C0, sizeof(f61));
        ZKFpExec::zk_exec->send_data(&C1, sizeof(f61));        

    } else {
		uint64_t chal; // random challenge
		PRG().random_data(&chal, sizeof(uint64_t));
		chal = chal % PR;
		ZKFpExec::zk_exec->send_data(&chal, sizeof(uint64_t));	
        
        f61 f61_chal(chal);
        f61 coeff = f61::unit();
        f61 acc = f61::zero();

        for (int i = 0; i < p_length; i++) {
            IntFp notp = p[i].negate() + 1;
            acc += coeff * f61(LOW64(p[i].value)) * f61(LOW64(notp.value));
            coeff *= f61_chal;
        }

        // mask the proofs with random_mask
        __uint128_t random_mask = ZKFpExec::zk_exec->get_one_role();
        acc += f61(LOW64(random_mask));
        
        f61 C0, C1;
        ZKFpExec::zk_exec->recv_data(&C0, sizeof(f61));
        ZKFpExec::zk_exec->recv_data(&C1, sizeof(f61));  

        // std::cout << (f61_delta*C1 + C0).val << std::endl;
        // std::cout << acc.val << std::endl;
        if ((f61_delta*C1 + C0).val == acc.val) std::cout << "[Check]: p is a 0-1 program" << std::endl;
        else {
            std::cout << "[Cheat]: p is not a 0-1 program" << std::endl;
            //exit(-1);
        }
    }
    std::cout << "0-1 program finished" << std::endl;
    cout << "Time: " << init_time+time_from(start) << " us" << std::endl;
    
    // ZKUROM (tail-heavy)
    // Update the tail-heavy check to use the actual topology vector positions
    std::vector<size_t> p_positions;
    std::vector<size_t> p_positions_inv(cv.size());
    std::vector<bool> is_p_positions(cv.size());
    size_t p_pos_idx = 0;
    size_t gcd_cv_length = gcd_path_length * zkcpu.op_period.size();
    std::cout << "[Debug] gcd_path_length = " << gcd_path_length << std::endl;
    std::cout << "[Debug] zkcpu.br[0].op_count[OUTPUT] = " << zkcpu.br[0].op_count[OPTYPE::OUTPUT] << std::endl;
    std::cout << "[Debug] zkcpu.op_period.size() = " << zkcpu.op_period.size() << std::endl;
    std::cout << "[Debug] gcd_cv_length = " << gcd_cv_length << std::endl;
    for (size_t i = 0; i < cv.size(); i++) {
        if ( (i+1) % gcd_cv_length == 0) {
            p_positions.push_back(i);
            p_positions_inv[i] = p_pos_idx;
            is_p_positions[i] = true;
            p_pos_idx++;
        }
    }

    if (party == ALICE) {
        uint64_t chal; // random challenge
        ZKFpExec::zk_exec->recv_data(&chal, sizeof(uint64_t));
        chal = chal % PR;

        f61 f61_chal(chal);
        f61 coeff = f61::unit();
        f61 C0 = f61::zero(), C1 = f61::zero();
        
        for (int i = 0; i < p_length; i++) {
            IntFp cvm1 = cv[p_positions[i]] + (PR - 1);
            f61 f61_p = f61(LOW64(p[i].value));
            f61 f61_cvm1 = f61(LOW64(cvm1.value));
            C0 += coeff * f61_p * f61_cvm1;
            C1 += coeff * f61_p * f61(HIGH64(cvm1.value)) + coeff * f61_cvm1 * f61(HIGH64(p[i].value));
            coeff *= f61_chal;
        }

        // mask the proofs with random_mask
        __uint128_t random_mask = ZKFpExec::zk_exec->get_one_role();
        C1 += f61(HIGH64(random_mask));
        C1 = f61::minor(C1.val);
        C0 += f61(LOW64(random_mask));

        ZKFpExec::zk_exec->send_data(&C0, sizeof(f61));
        ZKFpExec::zk_exec->send_data(&C1, sizeof(f61));        
    } else {
        uint64_t chal; // random challenge
        PRG().random_data(&chal, sizeof(uint64_t));
        chal = chal % PR;
        ZKFpExec::zk_exec->send_data(&chal, sizeof(uint64_t));	
        
        f61 f61_chal(chal);
        f61 coeff = f61::unit();
        f61 acc = f61::zero();

        for (int i = 0; i < p_length; i++) {
            IntFp cvm1 = cv[p_positions[i]] + (PR - 1);
            acc += coeff * f61(LOW64(p[i].value)) * f61(LOW64(cvm1.value));
            coeff *= f61_chal;
        }

        // mask the proofs with random_mask
        __uint128_t random_mask = ZKFpExec::zk_exec->get_one_role();
        acc += f61(LOW64(random_mask));
        
        f61 C0, C1;
        ZKFpExec::zk_exec->recv_data(&C0, sizeof(f61));
        ZKFpExec::zk_exec->recv_data(&C1, sizeof(f61));  

        // std::cout << (f61_delta*C1 + C0).val << std::endl;
        // std::cout << acc.val << std::endl;
        if ((f61_delta*C1 + C0).val == acc.val) std::cout << "[Check]: each fragment ends with 0" << std::endl;
        else {
            std::cout << "[Cheat]: some fragment ends with non-zero" << std::endl;
            exit(-1);
        }
    }
    std::cout << "zkurom tail heavy finished" << std::endl;
    std::cout << "Time: " << init_time+time_from(start) << " us" << std::endl;

    // V issues uniform \gamma to compress vectors to tokens (macs)   
    uint64_t gamma;
    if (party == ALICE) {
        ZKFpExec::zk_exec->recv_data(&gamma, sizeof(uint64_t));
        gamma = gamma % PR; // to prevent cheating V
    } else {
        PRG().random_data(&gamma, sizeof(uint64_t));
        gamma = gamma % PR;
        ZKFpExec::zk_exec->send_data(&gamma, sizeof(uint64_t));	        
    }
    f61 f61_gamma(gamma);
    f61 f61_gamma2 = f61_gamma * f61_gamma;
    std::vector<uint64_t> init_mac(branch_size);
    // compute token
    for (int i = 0; i < branch_size; i++) {
        f61 coeff = f61::unit();
        f61 acc = f61::zero();
        for (int j = 0; j < topo_vec[i].size(); j++) {
            acc += coeff * topo_vec[i][j];
            coeff *= f61_gamma;            
        }
        init_mac[i] = acc.val;
        // cout << "mac " << i << ":" << init_mac[i] << endl;
    }
    ZKROM macrom(branch_size);
    macrom.Public_Setup(init_mac);
    std::vector<IntFp> mac(p_length);
    for (int i = 0; i < p_length; i++) mac[i] = macrom.Access(id[i]);
    macrom.Teardown_Batch_Public(party, 16);
    std::cout << "[Check]: zkrom is performed correctly" << std::endl;
    cout << "Time: " << init_time+time_from(start) << " us" << std::endl;
    // prove zkurom is formed correctly
    // linear scan to generate (1,gamma,...,gamma^?,1,...,gamma^?,1...)
    // Optimized ZKUROM MAC stitching check:
    // - O(|cv|) work (same asymptotics), but fewer branches + no mod
    // - collapses many batch_reveal_check_zero calls into ONE

    auto one_minus = [](const IntFp& x) { return IntFp(1, PUBLIC) + x.negate(); };

    const size_t frag_len = gcd_cv_length;
    assert(p_length == p.size());
    assert(p_length == mac.size());

    // challenge from verifier (Bob) like your other checks
    uint64_t chal;
    if (party == ALICE) {
        ZKFpExec::zk_exec->recv_data(&chal, sizeof(uint64_t));
        chal %= PR;
    } else {
        PRG().random_data(&chal, sizeof(uint64_t));
        chal %= PR;
        ZKFpExec::zk_exec->send_data(&chal, sizeof(uint64_t));
    }
    f61 f61_chal(chal);

    // Accumulators for stitched block MAC
    IntFp block_acc(0, PUBLIC);   // current block's stitched MAC value (IntFp)
    IntFp base(1, PUBLIC);        // gamma-shift base within current block

    // Collapse all end-of-block constraints into one
    IntFp agg(0, PUBLIC);
    f61 coeff = f61::unit();

    for (size_t frag = 0; frag < p_length; ++frag) {
        // Compute fragment polynomial F_frag = sum cv[...] * gamma^j
        IntFp frag_acc(0, PUBLIC);
        f61 pow = f61::unit();
        const size_t off = frag * frag_len;

        for (size_t j = 0; j < frag_len; ++j) {
            frag_acc = frag_acc + cv[off + j] * pow.val;
            pow = pow * f61_gamma;          // pow = gamma^(j+1)
        }
        // now pow == gamma^(frag_len)

        // Stitch this fragment into current block
        block_acc = block_acc + base * frag_acc;

        // Enforce correctness only when this frag ends a block (p=1)
        // diff = p * (block_acc - mac[frag])
        IntFp pf = p[frag];
        IntFp diff = pf * (block_acc + mac[frag].negate());

        // aggregate with random coeff (single reveal later)
        agg = agg + diff * coeff.val;
        coeff = coeff * f61_chal;

        // Update base and block_acc for next fragment without branching:
        // if p=0: base *= gamma^frag_len, block_acc keeps accumulating
        // if p=1: base = 1, block_acc = 0
        IntFp omp = one_minus(pf);
        base      = omp * (base * pow.val) + pf;     // pf==1 -> 1, pf==0 -> base*gamma^L
        block_acc = omp * block_acc;                 // pf==1 -> 0, pf==0 -> keep
    }

    // One check instead of per-block-end checks
    batch_reveal_check_zero(&agg, 1);
    std::cout << "[Check]: each fragment is from zkurom (optimized)" << std::endl;

    std::cout << "Time: " << init_time+time_from(start) << " us" << std::endl;


    // prove o \otimes p = \vec{0}, i.e., every instruction's checking output is 0

    std::cout << "[Debug] cv.size() = " << cv.size() << std::endl;
    std::cout << "[Debug] op_period.size() = " << zkcpu.op_period.size() << std::endl;
    std::cout << "[Debug] is_p_positions.size() = " << is_p_positions.size() << std::endl;
    std::cout << "[Debug] o.size() = " << o.size() << std::endl;
    std::cout << "[Debug] p.size() = " << p.size() << std::endl;
    std::cout << "[Debug] p_length = " << p_length << std::endl;

    size_t o_pv = 0;
    std::vector<size_t> o_positions;
    for (int i = 0; i < cv.size(); i++) {
        if(zkcpu.op_period[i % zkcpu.op_period.size()] == OPTYPE::OUTPUT) {
            if(is_p_positions[i]) o_positions.push_back(o_pv);
            o_pv++;
        }
    }
    std::cout << "[Debug] After loop: o_pv = " << o_pv << ", o_positions.size() = " << o_positions.size() << std::endl;
    assert(o_positions.size() == p_length);

    if (party == ALICE) {
        uint64_t chal; // random challenge
        ZKFpExec::zk_exec->recv_data(&chal, sizeof(uint64_t));
        chal = chal % PR;

        f61 f61_chal(chal);
        f61 coeff = f61::unit();
        f61 C0 = f61::zero(), C1 = f61::zero();
        
        for (int i = 0; i < p_length; i++) {
            f61 f61_p = f61(LOW64(p[i].value));
            f61 f61_o = f61(LOW64(o[o_positions[i]].value));
            C0 += coeff * f61_p * f61_o;
            C1 += coeff * f61_p * f61(HIGH64(o[o_positions[i]].value)) + coeff * f61_o * f61(HIGH64(p[i].value));
            coeff *= f61_chal;
        }

        // mask the proofs with random_mask
        __uint128_t random_mask = ZKFpExec::zk_exec->get_one_role();
        C1 += f61(HIGH64(random_mask));
        C1 = f61::minor(C1.val);
        C0 += f61(LOW64(random_mask));

        ZKFpExec::zk_exec->send_data(&C0, sizeof(f61));
        ZKFpExec::zk_exec->send_data(&C1, sizeof(f61));        
    } else {
        uint64_t chal; // random challenge
        PRG().random_data(&chal, sizeof(uint64_t));
        chal = chal % PR;
        ZKFpExec::zk_exec->send_data(&chal, sizeof(uint64_t));	
        
        f61 f61_chal(chal);
        f61 coeff = f61::unit();
        f61 acc = f61::zero();

        for (int i = 0; i < p_length; i++) {
            acc += coeff * f61(LOW64(p[i].value)) * f61(LOW64(o[o_positions[i]].value));
            coeff *= f61_chal;
        }

        // mask the proofs with random_mask
        __uint128_t random_mask = ZKFpExec::zk_exec->get_one_role();
        acc += f61(LOW64(random_mask));
        
        f61 C0, C1;
        ZKFpExec::zk_exec->recv_data(&C0, sizeof(f61));
        ZKFpExec::zk_exec->recv_data(&C1, sizeof(f61));  

        // std::cout << (f61_delta*C1 + C0).val << std::endl;
        // std::cout << acc.val << std::endl;
        if ((f61_delta*C1 + C0).val == acc.val) std::cout << "[Check]: each instruction checking's output is 0" << std::endl;
        else {
            std::cout << "[Cheat]: some instruction checking's output is non-zero" << std::endl;
            exit(-1);
        }
    }
    std::cout << "p, o finished" << std::endl;
    cout << "Time: " << init_time+time_from(start) << " us" << std::endl;

    cv_lr_check_full(
        party,
        zkcpu.op_period,
        cv,
        in, o, old_val, set2,
        p,
        p_positions_inv,
        is_p_positions,
        f61_chi,
        reg_size,
        path_length,
        init_reg,
        l,
        r,
        key,
        new_val
    );

    std::cout << "tight zk cpu test passed" << std::endl;

    cout << "Time: " << init_time+time_from(start) << " us" << std::endl;
    IntFp a = IntFp(1, ALICE);
    IntFp b = IntFp(0, ALICE);
    IntFp c = a*b;
    batch_reveal_check_zero(&c, 1);


    // batch_reveal_check_zero(&tmp[0], tmp.size());

    finalize_zk_arith<BoolIO<NetIO>>();
    auto timeuse = time_from(start);	
    //cout << "Path Length: " << path_length << std::endl;
    cout << init_time+timeuse << " us\t" << party << " " << endl;
    std::cout << std::endl;

    uint64_t com2 = comm(ios) - com1;
    uint64_t com22 = comm2(ios) - com11;
    std::cout << "communication (B): " << com2 << std::endl;
    std::cout << "communication (B): " << com22 << std::endl;

    #if defined(__linux__)
    struct rusage rusage;
    if (!getrusage(RUSAGE_SELF, &rusage))
        std::cout << "[Linux]Peak resident set size: " << (size_t)rusage.ru_maxrss << std::endl;
    else std::cout << "[Linux]Query RSS failed" << std::endl;
    #elif defined(__APPLE__)
    struct mach_task_basic_info info;
    mach_msg_type_number_t count = MACH_TASK_BASIC_INFO_COUNT;
    if (task_info(mach_task_self(), MACH_TASK_BASIC_INFO, (task_info_t)&info, &count) == KERN_SUCCESS)
        std::cout << "[Mac]Peak resident set size: " << (size_t)info.resident_size_max << std::endl;
    else std::cout << "[Mac]Query RSS failed" << std::endl;
    #endif
}
