#include "zkvm/cleartext_vm/cleartext_executor.cpp"
#include "zkvm/common_test_base.h"
#include "zkvm/instruction_builder.cpp"
#include "zkvm/parsing/basic_block_parser.cpp"
#include "zkvm/parsing/data_section.h"
#include "zkvm/parsing/label_resolver.cpp"
#include "zkvm/parsing/pc_update.cpp"
#include "zkvm/rom_offsets.h"
#include "zkvm/translation/gate_translator.cpp"
#include <getopt.h>

/**
 * Generic assembly test for tight-zkvm
 * Can run any assembly file specified via command line with named arguments
 */

// Command-line options structure
// Note: These options are optional to specify, but when specified, require a value
// (hence required_argument, not optional_argument which has different semantics)
static struct option long_options[] = {
    {"party",       required_argument, 0, 'p'},
    {"port",        required_argument, 0, 'P'},
    {"address",     required_argument, 0, 'a'},
    {"asm",         required_argument, 0, 'f'},
    {"gcd",         required_argument, 0, 'g'},
    {"ram-size",    required_argument, 0, 'r'},
    {"qed-addr",    required_argument, 0, 'q'},
    {"start-label", required_argument, 0, 's'},
    {"max-step",    required_argument, 0, 'm'},
    {"help",        no_argument,       0, 'h'},
    {0, 0, 0, 0}
};

void print_usage(const char* program_name) {
    std::cerr << "Usage: " << program_name << " [options]\n\n";
    std::cerr << "Required arguments:\n";
    std::cerr << "  -p, --party <1|2>         Party: 1 (prover) or 2 (verifier)\n";
    std::cerr << "  -P, --port <port>         Network port (e.g., 12345)\n";
    std::cerr << "  -a, --address <addr>      IP address (use 0 for server)\n";
    std::cerr << "  -f, --asm <file>          Assembly file (.s) to execute\n\n";
    std::cerr << "Optional arguments:\n";
    std::cerr << "  -g, --gcd <num>           GCD lower bound (default: 4)\n";
    std::cerr << "  -r, --ram-size <bytes>    RAM size in bytes (default: 262144 = 256 KiB)\n";
    std::cerr << "  -q, --qed-addr <addr>     QED memory address in bytes (default: not set)\n";
    std::cerr << "                            If set, proves program touches this address\n";
    std::cerr << "  -s, --start-label <label> Entry point label (default: 'start')\n";
    std::cerr << "  -m, --max-step <num>      Max execution steps (default: 2000000000)\n";
    std::cerr << "  -h, --help                Show this help message\n\n";
    std::cerr << "Examples:\n";
    std::cerr << "  " << program_name << " -p 1 -P 12345 -a 0 -f test.s\n";
    std::cerr << "  " << program_name << " --party 1 --port 12345 --address 0 --asm test.s \\\n";
    std::cerr << "                       --gcd 2 --ram-size 524288 --qed-addr 16384\n";
}

int main(int argc, char** argv) {
    // Initialize with defaults
    int party = -1;
    int port = -1;
    std::string address;
    std::string asm_file;
    std::size_t gcd_lower_bound = 4;
    std::size_t ram_size_bytes = (1 << 18);  // 256 KiB default
    uint32_t qed_memory_addr = 0xFFFFFFFFu;
    std::string start_label = "start";
    std::size_t max_step = 2000000000;

    // Parse command-line arguments
    int opt;
    int option_index = 0;
    while ((opt = getopt_long(argc, argv, "p:P:a:f:g:r:q:s:m:h",
                              long_options, &option_index)) != -1) {
        switch (opt) {
            case 'p':
                party = std::stoi(optarg);
                break;
            case 'P':
                port = std::stoi(optarg);
                break;
            case 'a':
                address = optarg;
                break;
            case 'f':
                asm_file = optarg;
                break;
            case 'g':
                gcd_lower_bound = std::stoull(optarg);
                break;
            case 'r':
                ram_size_bytes = std::stoull(optarg);
                break;
            case 'q':
                qed_memory_addr = std::stoull(optarg);
                break;
            case 's':
                start_label = optarg;
                break;
            case 'm':
                max_step = std::stoull(optarg);
                break;
            case 'h':
                print_usage(argv[0]);
                return 0;
            default:
                print_usage(argv[0]);
                return 1;
        }
    }

    // Validate required arguments
    if (party == -1 || port == -1 || address.empty() || asm_file.empty()) {
        std::cerr << "Error: Missing required arguments\n\n";
        print_usage(argv[0]);
        return 1;
    }

    // Validate party value
    if (party != 1 && party != 2) {
        std::cerr << "Error: Party must be 1 (prover) or 2 (verifier)" << std::endl;
        return 1;
    }

#ifdef DEBUG
    std::cout << "=== Generic Assembly ZK Test ===" << std::endl;
    std::cout << "Party: " << party << " (Port: " << port
              << ", Address: " << address << ")" << std::endl;
    std::cout << "Assembly file: " << asm_file << std::endl;
    std::cout << "Start label: " << start_label << std::endl;
    std::cout << "Max steps: " << max_step << std::endl;
    std::cout << "GCD lower bound: " << gcd_lower_bound << std::endl;
#endif

    try {
        // Step 1: Parse assembly to basic blocks
#ifdef DEBUG
        std::cout << "\n1. Parsing assembly..." << std::endl;
#endif
        BasicBlockResult blocks = BasicBlockParser::parse_to_blocks(asm_file, 20);
#ifdef DEBUG
        std::cout << "   Parsed " << blocks.blocks.size() << " basic blocks"
                  << std::endl;

        for (auto &t : blocks.blocks) {
            std::cout << "   Block " << t.block_id << " has " << t.instructions.size()
                      << " instructions" << std::endl;
            for (auto &i : t.instructions) {
                std::cout << "      " << i.op << std::endl;
            }
        }
#endif

        // Step 2: Build data section
#ifdef DEBUG
        std::cout << "\n2. Building data section..." << std::endl;
        std::cout << "   Found " << blocks.data.size() << " data statements"
                  << std::endl;
#endif

        DataSection data_section;
        for (size_t i = 0; i < blocks.data.size(); i++) {
            data_section.add(blocks.data[i]);
        }

        // Build label_to_address map for text section labels
        std::map<std::string, uint32_t> label_to_addr;
        for (const auto &pair : blocks.label_to_address) {
            label_to_addr[pair.first] = (uint32_t)pair.second;
        }

        // Build data section with text labels for cross-references
#ifdef DEBUG
        std::cout << "   Building data section..." << std::endl;
#endif
        DataBuild data_build;
        try {
            data_build = data_section.build(label_to_addr);
#ifdef DEBUG
            std::cout << "   Built data section with " << data_build.sym.size()
                      << " symbols" << std::endl;
            std::cout << "   Data image size: " << data_build.image.size() << " bytes"
                      << std::endl;

            // Print data symbols
            if (data_build.sym.size() > 0) {
                std::cout << "   Data symbols:" << std::endl;
                for (const auto &sym : data_build.sym) {
                    std::cout << "      " << sym.first << " -> " << sym.second
                              << std::endl;
                }
            }
#endif
        } catch (const std::exception &e) {
            std::cerr << "   ERROR building data section: " << e.what() << std::endl;
            std::cerr << "   Falling back to empty data section" << std::endl;
            data_build.sym = std::map<std::string, uint32_t>();
            data_build.image = std::vector<uint8_t>();
        }

        // Step 3: Calculate RAM size (needed for cleartext execution)
        std::size_t data_size_bytes = data_build.image.size();
        std::size_t ram_size_words = ram_size_bytes / 4;
#ifdef DEBUG
        std::cout << "   RAM size: " << ram_size_words << " words ("
                  << ram_size_bytes << " bytes)" << std::endl;
#endif



        const uint32_t data_base_addr = 0;
        const uint32_t data_end_addr =
            data_base_addr + static_cast<uint32_t>(data_size_bytes);
#ifdef DEBUG
        std::cout << "   Data base = 0x" << std::hex << data_base_addr
                  << ", data_end = 0x" << data_end_addr
                  << ", image bytes = " << std::dec << data_size_bytes << std::endl;
#endif
        const uint32_t data_end_aligned = (data_end_addr / 4 + 1) * 4;

        // Step 4: Run cleartext execution (prover only)
        std::vector<uint32_t> cleartext_inputs;
        if (party == 1) {
#ifdef DEBUG
            std::cout << "\n4. Running cleartext execution (prover only)..."
                      << std::endl;
#endif

            // Flatten all assembly instructions from all blocks
            // Build instruction-index label map at the same time
            std::vector<AsmInstr> all_assembly;
            std::map<std::string, size_t> instr_index_labels;
            size_t cur_index = 0;

            for (const auto &block : blocks.blocks) {
                // Record block label at start of its instructions
                if (!block.label.empty()) {
                    instr_index_labels[block.label] = cur_index;
#ifdef DEBUG
                    std::cout << "   [Label] " << block.label << " -> index " << cur_index
                              << std::endl;
#endif
                }

                for (const auto &instr : block.instructions) {
                    if (!instr.op.empty()) {
                        all_assembly.push_back(instr);
                        cur_index++;
                    }
                }
            }

#ifdef DEBUG
            std::cout << "   Total assembly instructions: " << all_assembly.size()
                      << std::endl;
            std::cout << "   Total labels: " << instr_index_labels.size()
                      << std::endl;
#endif

            // Execute in cleartext mode with labels and data symbols
            // Pass ram_size_words (word count), not bytes
            cleartext_inputs = cleartext::execute_cleartext_from_assembly(
                all_assembly, ram_size_words, max_step, instr_index_labels,
                data_build.sym,
                data_build.image, // Load data section into RAM
                0, // Data base address (matches zeecompiler: data starts at RAM[0])
                qed_memory_addr
            );

#ifdef DEBUG
            std::cout << "   Cleartext execution produced " << cleartext_inputs.size()
                      << " input values" << std::endl;
#endif
        }

        // Step 5: Build instructions
        std::cout << "\n[Build] Building instructions from " << blocks.blocks.size()
                  << " basic blocks..." << std::endl;
        auto instructions =
            InstructionBuilder::build_instructions(blocks, data_build.sym);
        std::cout << "[Build] Built " << instructions.size() << " instructions"
                  << std::endl;

        // Find start address
        uint64_t start_addr = 0;
        bool found_start = false;
        for (const auto &pair : blocks.label_to_address) {
            if (pair.first == start_label || pair.first == "_" + start_label) {
                start_addr = pair.second;
                found_start = true;
#ifdef DEBUG
                std::cout << "   Found start label '" << pair.first << "' at address 0x"
                          << std::hex << start_addr << std::dec << std::endl;
#endif
                break;
            }
        }

        if (!found_start) {
            std::cerr << "   WARNING: Start label '" << start_label << "' not found"
                      << std::endl;
            std::cerr << "   Available labels:" << std::endl;
            for (const auto &pair : blocks.label_to_address) {
                std::cerr << "      " << pair.first << " -> 0x" << std::hex
                          << pair.second << std::dec << std::endl;
            }
            std::cerr << "   Defaulting to address 0x0" << std::endl;
        }

        // Step 6: Initialize RAM with data section as key-value pairs
        std::size_t reg_size = 2;  // Black-box RAM model: [wire_1, pc]
        // RAM uses byte addresses as keys (only word-aligned addresses used)
        std::cout << "[Build] Initializing RAM as KV pairs..." << std::endl;
        std::vector<std::pair<uint64_t, uint64_t>> ram_kv;

        for (std::size_t i = 0; i < ram_size_bytes; i += 4) {
            uint32_t word = 0;
            if (i + 0 < data_build.image.size())
                word |= (uint32_t)data_build.image[i + 0];
            if (i + 1 < data_build.image.size())
                word |= (uint32_t)data_build.image[i + 1] << 8;
            if (i + 2 < data_build.image.size())
                word |= (uint32_t)data_build.image[i + 2] << 16;
            if (i + 3 < data_build.image.size())
                word |= (uint32_t)data_build.image[i + 3] << 24;
            ram_kv.push_back({i, word});  // (byte address, value)
        }
        std::cout << "[Build] RAM initialized with " << ram_kv.size() << " KV pairs" << std::endl;

        // Step 7: Set up ZK parameters
#ifdef DEBUG
        std::cout << "\n8. Setting up ZK parameters..." << std::endl;
#endif
        // Operation period for the linear-check protocol.
        // NOTE: The current ZK aggregation logic (cv/l/r topology) assumes
        // exactly one INPUT, one MEM, one ZKSET, and one OUTPUT per period.
        // Changing this pattern requires changing Instruction::comp_topo_vec_pselect
        // and cv_lr_check_full to keep prover/verifier message schedules aligned.
        std::vector<OPTYPE> op_period = {
            OPTYPE::INPUT,
            OPTYPE::MEM,
            OPTYPE::ZKSET,
            OPTYPE::OUTPUT
        };

        // Step 8: Create network IO
        std::cout << "[Network] Creating network connections..." << std::endl;
        NetIO *ios[threads];
        for (int i = 0; i < threads; ++i) {
            ios[i] = new NetIO(party == 1 ? nullptr : address.c_str(), port + i);
        }
        std::cout << "[Network] NetIO initialized" << std::endl;

        BoolIO<NetIO> *bio[threads];
        for (int i = 0; i < threads; ++i) {
            bio[i] = new BoolIO<NetIO>(ios[i], party == 1);
        }
        std::cout << "[Network] BoolIO initialized, ready to start ZK protocol"
                  << std::endl;
        common_test_circuit_zk(bio, party, reg_size, instructions, ram_kv,
                               ram_size_bytes, max_step, op_period, start_addr, cleartext_inputs,
                               data_end_aligned, gcd_lower_bound, qed_memory_addr);

#ifdef DEBUG
        std::cout << "\n✅ Assembly ZK test completed successfully!" << std::endl;
#endif

        // Cleanup
        for (int i = 0; i < threads; ++i) {
            delete bio[i];
            delete ios[i];
        }

        return 0;

    } catch (const std::exception &e) {
        std::cerr << "\n❌ Error in assembly ZK test: " << e.what() << std::endl;
        return 1;
    }
}
