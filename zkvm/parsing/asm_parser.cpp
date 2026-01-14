#ifndef ASM_PARSER_CPP_INCLUDED
#define ASM_PARSER_CPP_INCLUDED

// asm_parser.cpp
// A robust line-based parser for the custom ISA assembly shown in the sample.
// Produces a list of code lines (labels + instructions) and a list of data stmts.
// Public API (put this in asm_parser.h if you prefer):
//
//   struct Operand {
//     enum Kind { REG, IMM, MEM, SYM } kind;
//     std::string text;  // canonical textual form for debugging/printing
//     int64_t imm = 0;
//     struct { int32_t disp; std::string baseReg; } mem;
//     std::string reg;   // "%GR6", "%FP", etc
//     std::string sym;   // "Fib", ".LBB0_1", "exit", ".L.str", ...
//   };
//
//   struct AsmInstr {
//     std::string op;            // "LOAD", "CALL", "JUMP", "NOP", ...
//     std::vector<Operand> ops;  // parsed operands (also available via .raw)
//     std::string raw;           // raw (operands-only) for debugging
//     size_t lineno = 0;
//   };
//
//   struct Labeled {
//     std::string label;    // empty if none
//     AsmInstr instr;       // op may be empty if it’s a pure label
//   };
//
//   struct ParseResult {
//     std::vector<Labeled> code;
//     std::map<std::string, std::size_t> label2index; // label -> index in code
//     std::vector<DataStmt> data; // for DataSection (see data_section.h from earlier)
//   };
//
//   ParseResult parse_asm_file(const std::string& path);
//
// ---------------------------------------------------------------------------

#include <cctype>
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <fstream>
#include <map>
#include <set>
#include <sstream>
#include <stdexcept>
#include <string>
#include <vector>

#include "data_section.h" // Uses DataStmt from the DataSection header I shared earlier
#include "register_mapping.h"

// ----------------- Helper utilities -----------------

static inline std::string ltrim(std::string s)
{
    size_t i = 0;
    while (i < s.size() && std::isspace((unsigned char)s[i]))
        ++i;
    s.erase(0, i);
    return s;
}
static inline std::string rtrim(std::string s)
{
    if (s.empty())
        return s;
    size_t i = s.size();
    while (i && std::isspace((unsigned char)s[i - 1]))
        --i;
    s.erase(i);
    return s;
}
static inline std::string trim(std::string s) { return rtrim(ltrim(std::move(s))); }

static inline bool starts_with(const std::string &s, const char *p)
{
    return s.rfind(p, 0) == 0;
}

static inline bool is_digit_or_sign(char c)
{
    return (c == '-' || c == '+' || (c >= '0' && c <= '9'));
}

static inline bool is_ident_start(char c)
{
    return std::isalpha((unsigned char)c) || c == '_' || c == '.';
}

static inline bool is_ident_body(char c)
{
    return std::isalnum((unsigned char)c) || c == '_' || c == '.' || c == '$';
}

// ----------------- Operand model -----------------

struct Operand
{
    enum Kind
    {
        REG,
        IMM,
        MEM,
        SYM
    } kind = SYM;
    std::string text;
    int64_t imm = 0;
    struct
    {
        int32_t disp = 0;
        std::string baseReg;
        std::size_t base_idx = SIZE_MAX;
    } mem;
    std::string reg;                // like %GR6
    std::size_t reg_idx = SIZE_MAX; // zkvm register index
    std::string sym;                // like Fib or .LBB0_1
};

// Parsed instruction
struct AsmInstr
{
    std::string op;
    std::vector<Operand> ops;
    std::string raw; // text after opcode (for diagnostics)
    size_t lineno = 0;
};

// Code line with optional leading label
struct Labeled
{
    std::string label; // empty if none
    AsmInstr instr;    // empty op if only a label line
};

// ----------------- Directive / opcode knowledge -----------------

static const std::set<std::string> kTextSections = {
    ".text"};

static const std::set<std::string> kDataSections = {
    ".data"};

static bool is_rodata(const std::string &s)
{
    return starts_with(s, ".rodata");
}

static const std::set<std::string> kSkipDirectives = {
    ".file", ".globl", ".ident", ".note.GNU-stack"
    // ".type" and ".size" get handled specially below
};

static const std::set<std::string> kOpcodes = {
    // Memory
    "NOP", "LOAD", "STORE",
    "LOADB", "STOREB", "ULOADB", "SLOADB",
    "LOADH", "STOREH", "ULOADH",

    // Arithmetic and logic
    "ADD", "ADDI", "SUB", "SUBI", "MUL", "MULI",
    "AND", "ANDI", "OR", "ORI", "XOR", "XORI",

    // Shifts
    "SHL", "SHLI", "SRL", "SRLI", "SRA", "SRAI",

    // Comparisons / bit tests
    "ULT", "ULTE", "LT", "LTE", "EQ", "NEQ", "EQZ", "MSB",

    // Copies / moves
    "CMOV", "COPYR", "COPYI", "COPYG", "PC",

    // Control flow
    "CALL", "CALLR", "JUMP", "BNEQZ", "RET", "HALT", "QED",

    // Division / remainder (unsigned and signed, reg/imm)
    "UDIV", "UDIVI", "UREM", "UREMI",
    "SDIV", "SDIVI", "SREM", "SREMI",

    // I/O and specials
    "VMCALL", "INPUT", "OUTPUT"
    // zkvm-specific and llvm-generated opcodes
};

// ----------------- Tokenization for operands -----------------

// Split by commas, respecting parentheses (for 24(%FP)) and ignoring spaces
static std::vector<std::string> split_operands(const std::string &s)
{
    std::vector<std::string> out;
    std::string cur;
    int paren = 0;
    for (size_t i = 0; i < s.size(); ++i)
    {
        char c = s[i];
        if (c == '(')
        {
            paren++;
            cur.push_back(c);
        }
        else if (c == ')')
        {
            paren--;
            cur.push_back(c);
        }
        else if (c == ',' && paren == 0)
        {
            out.push_back(trim(cur));
            cur.clear();
        }
        else
        {
            cur.push_back(c);
        }
    }
    if (!trim(cur).empty())
        out.push_back(trim(cur));
    return out;
}

static Operand parse_one_operand(const std::string &tok, const RegisterMapping *reg_map = nullptr)
{
    Operand o;
    o.text = tok;

    // Memory: disp(base)
    // Examples:   24(%FP)   0(%GR6)   -4(%SP)
    auto lp = tok.find('(');
    auto rp = tok.find(')');
    if (lp != std::string::npos && rp != std::string::npos && rp > lp)
    {
        auto dispStr = trim(tok.substr(0, lp));
        auto base = trim(tok.substr(lp + 1, rp - (lp + 1)));
        if (!base.empty() && base[0] == '%')
        {
            o.kind = Operand::MEM;
            o.mem.baseReg = base;
            o.mem.disp = dispStr.empty() ? 0 : (int32_t)std::stol(dispStr);
            // Resolve base register index
            if (reg_map)
            {
                o.mem.base_idx = reg_map->get_register_index(base);
            }
            return o;
        }
    }

    // Register: %GRn, %FP, %SP, %RA, %RT0, %RT1
    if (!tok.empty() && tok[0] == '%')
    {
        o.kind = Operand::REG;
        o.reg = tok;
        // Resolve register index
        if (reg_map)
        {
            o.reg_idx = reg_map->get_register_index(tok);
            // Debug: Check if register resolution failed
            if (o.reg_idx == SIZE_MAX)
            {
                std::cerr << "[parser] WARNING: register '" << tok << "' not resolved by reg_map\n";
            }
        }
        else
        {
            std::cerr << "[parser] WARNING: no reg_map provided for register '" << tok << "'\n";
        }
        return o;
    }

    // Immediate: decimal with optional sign
    if (!tok.empty() && is_digit_or_sign(tok[0]))
    {
        // simple decimal; if you need hex, add a 0x branch
        o.kind = Operand::IMM;
        o.imm = std::stoll(tok);
        return o;
    }

    // Symbol (label or extern)
    o.kind = Operand::SYM;
    o.sym = tok;
    return o;
}

// ----------------- Data directive parsing (to DataStmt) -----------------

static bool parse_data_line(const std::string &line, DataStmt &out)
{
    // Expect: label:, .p2align N, .zero N, .byte V, .short V, .long expr, .quad V,
    //         .asciz "str", .ascii "str", .weak name, .comm name, size, align
    //         .size sym, N   (in data we treat as size-block advancement)
    // Also labels without ':' are allowed like ".L.str NOP" -> we’ll record label then ignore NOP in data section.

    std::istringstream ss(line);
    std::string first;
    if (!(ss >> first))
        return false;

    // Normalize first
    std::string d = first;

    // Label detection: handles regular labels, labels with ':', and local .L* labels in data sections
    // Note: parse_data_line is only called in DATA sections, so .L* labels here are data labels,
    // not code labels like .LBB* which appear in TEXT sections
    bool is_known_directive = (d == ".p2align" || d == ".zero" || d == ".byte" ||
                                d == ".short" || d == ".long" || d == ".quad" ||
                                d == ".asciz" || d == ".ascii" || d == ".weak" ||
                                d == ".comm" || d == ".size" || d == ".type" ||
                                is_rodata(d) || d == ".bss" || d == ".data");

    if (first.back() == ':' || (!is_known_directive && first[0] != '\t' && first[0] != ' ')) {
        // It's a label: either "label:" or "label" or ".Lxxx" (local label in data)
        std::string label = first;
        if (label.back() == ':')
            label.pop_back();

        out = DataStmt{};
        out.kind = DataStmt::LABEL;
        out.a = label;
        return true;
    }

    if (d == ".p2align")
    {
        std::string n;
        ss >> n;
        out = DataStmt{};
        out.kind = DataStmt::P2ALIGN;
        out.a = n;
        return true;
    }
    if (d == ".zero")
    {
        std::string n;
        ss >> n;
        out = DataStmt{};
        out.kind = DataStmt::ZERO;
        out.a = n;
        return true;
    }
    if (d == ".byte")
    {
        std::string v;
        ss >> v;
        out = DataStmt{};
        out.kind = DataStmt::BYTE;
        out.a = v;
        return true;
    }
    if (d == ".short")
    {
        std::string v;
        ss >> v;
        out = DataStmt{};
        out.kind = DataStmt::SHORT;
        out.a = v;
        return true;
    }
    if (d == ".long")
    {
        std::string expr;
        ss >> expr;
        out = DataStmt{};
        out.kind = DataStmt::LONG;
        // split label+off by '+'
        auto p = expr.find('+');
        if (p == std::string::npos)
        {
            out.a = expr;
        }
        else
        {
            out.a = expr.substr(0, p);
            out.b = expr.substr(p + 1);
        }
        return true;
    }
    if (d == ".quad")
    {
        std::string v;
        ss >> v;
        out = DataStmt{};
        out.kind = DataStmt::QUAD;
        out.a = v;
        return true;
    }
    if (d == ".asciz" || d == ".ascii")
    {
        std::string rest;
        std::getline(ss, rest);
        rest = trim(rest);
        if (!rest.empty() && rest.front() == '"' && rest.back() == '"')
        {
            rest = rest.substr(1, rest.size() - 2);
        }
        out = DataStmt{};
        out.kind = (d == ".asciz") ? DataStmt::ASCIZ : DataStmt::ASCII;
        out.a = rest;
        return true;
    }
    if (d == ".weak")
    {
        std::string name;
        ss >> name;
        out = DataStmt{};
        out.kind = DataStmt::WEAK;
        out.a = name;
        return true;
    }
    if (d == ".comm")
    {
        // .comm name, size, align  (commas may or may not have spaces)
        // Read rest of line and split by comma
        std::string rest;
        std::getline(ss, rest);
        rest = trim(rest);

        // Split by comma
        std::vector<std::string> parts;
        std::stringstream ss2(rest);
        std::string part;
        while (std::getline(ss2, part, ',')) {
            parts.push_back(trim(part));
        }

        // .comm expects: name, size, align
        std::string name, size, align;
        if (parts.size() >= 1) name = parts[0];
        if (parts.size() >= 2) size = parts[1];
        if (parts.size() >= 3) align = parts[2];

        out = DataStmt{};
        out.kind = DataStmt::COMM;
        out.a = name;
        out.b = size;
        out.c = align;
        return true;
    }
    if (d == ".size")
    {
        // .size sym, N   OR .size sym, end-sym (we mimic zkassembler by growing size by N)
        std::string symComma, n;
        ss >> symComma >> n;
        if (!symComma.empty() && symComma.back() == ',')
            symComma.pop_back();
        if (!n.empty() && n.back() == ',')
            n.pop_back();

        out = DataStmt{};
        out.kind = DataStmt::SIZE;
        out.a = symComma;
        // If expression like ".Lend - .Lstart" appears, we can’t eval here; follow zkassembler trick:
        // treat b as numeric if it parses; otherwise approximate by 0 (or ignore). Here keep as-is;
        // DataSection::build only increments offset by stoul(b) and ignores non-numeric.
        out.b = n;
        return true;
    }

    return false;
}

// ----------------- Instruction parsing -----------------

static AsmInstr parse_instr_core(const std::string &op, const std::string &rest, size_t lineno, const RegisterMapping *reg_map = nullptr)
{
    AsmInstr ins;
    ins.op = op;
    ins.raw = trim(rest);
    ins.lineno = lineno;

    if (ins.raw.empty())
        return ins;

    auto parts = split_operands(ins.raw);
    ins.ops.reserve(parts.size());
    for (auto &p : parts)
    {
        ins.ops.push_back(parse_one_operand(p, reg_map));
    }
    return ins;
}

// A line in .text (or code-like sections). This supports:
// - "Label:" or "Label NOP" forms (label + optional instruction on one line)
// - pure instruction lines
// - empty/comment lines
static Labeled parse_text_line(const std::string &rawLine, size_t lineno, const RegisterMapping *reg_map = nullptr)
{
    // Split off comments `; ...`
    auto semi = rawLine.find(';');
    std::string line = (semi == std::string::npos) ? rawLine : rawLine.substr(0, semi);
    line = trim(line);
    Labeled L;

    if (line.empty())
        return L; // empty

    // zkassembler logic: Check for "ANYTHING NOP" FIRST
    // This handles labels like .LBB0_2, main, Fib, etc.
    bool is_label_nop = false;
    {
        std::istringstream ss_pre(line);
        std::string first_tok, second_tok;
        ss_pre >> first_tok >> second_tok;
        if (second_tok == "NOP") {
            is_label_nop = true;
        }
    }

    // Only check for directives if NOT "ANYTHING NOP"
    if (!is_label_nop && line[0] == '.')
    {
        // .type and .size often appear inside .text; we ignore them for code
        // (their data-time effect is handled in data mode).
        std::string d;
        {
            std::istringstream ss(line);
            ss >> d;
        }
        if (kSkipDirectives.count(d) || d == ".type" || d == ".size")
        {
            return L; // ignore in code
        }
        // Unknown directive in text: ignore
        return L;
    }

    // Tokenize first two space-separated tokens to detect "Label NOP"
    std::istringstream ss(line);
    std::string first, second;
    ss >> first;
    if (first.empty())
        return L;

    std::string theRest;
    {
        std::string tmp;
        std::getline(ss, tmp);
        theRest = trim(tmp);
    }

    auto isOpcode = [&](const std::string &s) -> bool
    {
        if (kOpcodes.count(s))
            return true;
        // Heuristic: uppercase words of letters/numbers/underscores are opcodes
        bool upperish = !s.empty();
        for (char c : s)
        {
            if (!(std::isupper((unsigned char)c) || std::isdigit((unsigned char)c) || c == '_'))
            {
                upperish = false;
                break;
            }
        }
        return upperish;
    };

    // Use the is_label_nop flag we already computed
    if (is_label_nop)
    {
        std::string label = first;
        if (!label.empty() && label.back() == ':')
            label.pop_back();
        L.label = label;

        // If there is text after the label, treat it as an instruction line
        if (!theRest.empty())
        {
            std::istringstream ss2(theRest);
            std::string op;
            ss2 >> op;
            std::string restOps;
            std::getline(ss2, restOps);
            L.instr = parse_instr_core(op, restOps, lineno, reg_map);
        }
        else
        {
            // Pure label
            L.instr = AsmInstr{};
            L.instr.lineno = lineno;
        }
        return L;
    }

    // Case B: pure instruction: first token is opcode
    if (isOpcode(first))
    {
        L.instr = parse_instr_core(first, theRest, lineno, reg_map);
        return L;
    }

    // Fallback: if reaches here, treat as unknown -> ignore
    return L;
}

// ----------------- Main parser -----------------

struct ParseResult
{
    std::vector<Labeled> code;
    std::map<std::string, std::size_t> label2index;
    std::vector<DataStmt> data;
    std::size_t register_count;

    // Helper to create register mapping consistent with this parse result
    RegisterMapping create_register_mapping() const
    {
        return RegisterMapping(register_count);
    }
};


static AsmInstr make_op(std::string op, size_t lineno = 0) {
    AsmInstr i;
    i.op = std::move(op);
    i.lineno = lineno;
    return i;
}

static Labeled make_label_op(std::string label, std::string op, size_t lineno = 0) {
    Labeled L;
    L.label = std::move(label);
    L.instr = make_op(std::move(op), lineno);
    return L;
}

static Labeled make_op_only(std::string op, size_t lineno = 0) {
    Labeled L;
    L.instr = make_op(std::move(op), lineno);
    return L;
}

static void rebuild_label2index(ParseResult& R) {
    R.label2index.clear();
    for (size_t i = 0; i < R.code.size(); i++) {
        if (!R.code[i].label.empty()) {
            R.label2index[R.code[i].label] = i;
        }
    }
}

// Inserts:
//   Proof: NOP
//   QED
//   Cheat: NOP
//   HALT
static void inject_proof_cheat_stubs(ParseResult& R) {
    // Don’t double-inject if file already has these labels
    if (R.label2index.count("Proof") || R.label2index.count("Cheat")) return;

    // If there is no code section parsed, nothing to do
    if (R.code.empty()) return;

    std::vector<Labeled> prefix;
    prefix.reserve(4);

    prefix.push_back(make_label_op("Proof", "NOP", 0));
    prefix.push_back(make_op_only("QED", 0));
    prefix.push_back(make_label_op("Cheat", "NOP", 0));
    prefix.push_back(make_op_only("HALT", 0));

    // Prepend
    prefix.insert(prefix.end(), R.code.begin(), R.code.end());
    R.code.swap(prefix);

    // Rebuild label index (indices shifted)
    rebuild_label2index(R);
}


// Forward declare resolve_copyg_to_copyi for use in parse_asm_file
static void resolve_copyg_to_copyi(ParseResult &R);

ParseResult parse_asm_file(const std::string &path, std::size_t register_count = 20)
{
    std::ifstream fin(path);
    if (!fin)
        throw std::runtime_error("asm_parser: failed to open: " + path);

    enum Sect
    {
        NONE,
        TEXT,
        DATA
    } sect = NONE;

    // Create register mapping for this parse session
    RegisterMapping reg_map(register_count);

    ParseResult R;
    R.register_count = register_count;
    std::string raw;
    size_t lineno = 0;

    while (std::getline(fin, raw))
    {
        ++lineno;

        // Strip comments, but keep full raw for data-string parsing
        std::string line = raw;
        auto semi = line.find(';');
        if (semi != std::string::npos)
            line = line.substr(0, semi);
        line = trim(line);
        if (line.empty())
            continue;

        // Section switches
        // Section switches
        if (line[0] == '.')
        {
            std::string d;
            {
                std::istringstream ds(line);
                ds >> d;
            }
            if (kTextSections.count(d))
            {
                sect = TEXT;
                continue;
            }
            if (kDataSections.count(d) || is_rodata(d) || d == ".bss")
            {
                sect = DATA;
                continue;
            }

            // Some assemblers emit .comm declarations while still in .text; treat them as data
            if (sect == TEXT && d == ".comm")
            {
                DataStmt s;
                if (parse_data_line(line, s))
                {
                    R.data.push_back(std::move(s));
                }
                continue;
            }

            // In TEXT, we ignore most directives (handled in instruction parser)
            // In DATA, we try to parse them to DataStmt below. So don't "continue" here for DATA.
            if (sect == TEXT)
            {
                // Some directives inside text we still want to ignore globally
                if (kSkipDirectives.count(d) || d == ".type" || d == ".size")
                {
                    continue;
                }
            }
        }

        if (sect == DATA)
        {
            DataStmt s;
            if (parse_data_line(line, s))
            {
                R.data.push_back(std::move(s));
                continue;
            }
            // If the data line is like ".L.str NOP" we parsed label already; the trailing "NOP" can be ignored.
            // Unknown in data: ignore silently (matches your assembler’s permissive style)
            continue;
        }

        if (sect == TEXT)
        {
            auto L = parse_text_line(raw, lineno, &reg_map);
            // Add code line if there is a label or an opcode
            if (!L.label.empty() || !L.instr.op.empty())
            {
                if (!L.label.empty())
                {
                    R.label2index[L.label] = R.code.size();
                }
                R.code.push_back(std::move(L));
            }
            continue;
        }

        // If not in any known section yet, ignore (e.g., early .file)
    }

    // Inject Proof/Cheat entry stubs at parse time (without changing input asm)
    inject_proof_cheat_stubs(R);

    // Resolve COPYG to COPYI before returning (zee-cleartext style)
    resolve_copyg_to_copyi(R);

    return R;
}

// ----------------- Optional: tiny printer (handy for debugging) -----------------
// #ifdef ASM_PARSER_DEBUG_MAIN
#include <iostream>
static const char *kKindName[] = {"REG", "IMM", "MEM", "SYM"};

/**
 * Resolve COPYG instructions at parse time (zee-cleartext style)
 * Converts: COPYG %GR1, __malloc_av_
 * To:       COPYI %GR1, <actual_address>
 */
static void resolve_copyg_to_copyi(ParseResult &R)
{
    std::cout << "\n[COPYG RESOLUTION] Starting COPYG -> COPYI conversion..." << std::endl;

    // First, build data_symbols map from data section
    DataSection data_sec;
    for (auto& stmt : R.data) {
        data_sec.add(stmt);
    }

    std::cout << "[COPYG RESOLUTION] Added " << R.data.size() << " data statements" << std::endl;

    // Build with label2pc map to resolve cross-references
    std::map<std::string, uint32_t> label2pc;
    for (auto& kv : R.label2index) {
        label2pc[kv.first] = static_cast<uint32_t>(kv.second);
    }

    std::cout << "[COPYG RESOLUTION] Building data section with " << label2pc.size() << " labels..." << std::endl;

    DataBuild data_build;
    try {
        data_build = data_sec.build(label2pc);
    } catch (const std::exception& e) {
        std::cerr << "[COPYG RESOLUTION] ERROR building data section: " << e.what() << std::endl;
        throw;
    }

    const auto& data_symbols = data_build.sym;

#ifdef DEBUG
    std::cout << "[COPYG RESOLUTION] Found " << data_symbols.size() << " data symbols:" << std::endl;
    for (const auto& sym : data_symbols) {
        std::cout << "  " << sym.first << " -> 0x" << std::hex << sym.second << std::dec << std::endl;
    }
#endif
    // Now iterate through all instructions and resolve COPYG
    int copyg_count = 0;
    int resolved_count = 0;

    for (auto& labeled : R.code) {
        AsmInstr& instr = labeled.instr;

        if (instr.op == "COPYG" && instr.ops.size() == 2) {
            copyg_count++;
            // instr.ops[0] is the destination register
            // instr.ops[1] should be a symbol (possibly with offset like __malloc_av_+8)

            if (instr.ops[1].kind == Operand::SYM) {
                std::string sym = instr.ops[1].sym;

                // Parse "base+offset" or "base-offset"
                std::string base;
                int32_t offset = 0;
                bool negative = false;

                size_t plus_pos = sym.find('+');
                size_t minus_pos = sym.find('-');

                if (plus_pos != std::string::npos) {
                    base = sym.substr(0, plus_pos);
                    offset = std::stoi(sym.substr(plus_pos + 1));
                } else if (minus_pos != std::string::npos) {
                    base = sym.substr(0, minus_pos);
                    offset = std::stoi(sym.substr(minus_pos + 1));
                    negative = true;
                } else {
                    base = sym;
                }

                // Look up base in data_symbols or label2pc
                uint32_t addr = 0;
                bool found = false;
                auto it = data_symbols.find(base);
                if (it != data_symbols.end()) {
                    addr = it->second;
                    found = true;
#ifdef DEBUG
                    std::cout << "[COPYG->COPYI] Found '" << base << "' in data_symbols at 0x"
                              << std::hex << addr << std::dec << std::endl;
#endif
                } else {
                    auto it2 = label2pc.find(base);
                    if (it2 != label2pc.end()) {
                        addr = it2->second;
                        found = true;
#ifdef DEBUG
                        std::cout << "[COPYG->COPYI] Found '" << base << "' in label2pc at 0x"
                                  << std::hex << addr << std::dec << std::endl;
#endif
                    } else {
                        std::cerr << "[COPYG->COPYI] ERROR: Symbol '" << base << "' not found!" << std::endl;
                    }
                }

                // Apply offset
                if (negative) {
                    addr -= offset;
                } else {
                    addr += offset;
                }

                // Convert to COPYI with immediate value
                instr.op = "COPYI";
                instr.ops[1].kind = Operand::IMM;
                instr.ops[1].imm = static_cast<int64_t>(addr);
                instr.ops[1].sym.clear();

                if (found) {
                    resolved_count++;
#ifdef DEBUG
                    std::cout << "[COPYG->COPYI] ✓ Converted COPYG " << instr.ops[0].reg << ", " << sym
                              << " -> COPYI " << instr.ops[0].reg << ", 0x"
                              << std::hex << addr << std::dec << std::endl;
#endif
                } else {
#ifdef DEBUG
                    std::cout << "[COPYG->COPYI] ✗ Failed to resolve COPYG " << instr.ops[0].reg << ", " << sym << std::endl;
#endif
                }
            }
        }
    }

    //std::cout << "\n[COPYG RESOLUTION] Summary: Processed " << copyg_count
    //          << " COPYG instructions, successfully resolved " << resolved_count << std::endl;
    if (copyg_count != resolved_count) {
        std::cerr << "[COPYG RESOLUTION] WARNING: " << (copyg_count - resolved_count)
                  << " COPYG instructions failed to resolve!" << std::endl;
    }
}

static void dump(const ParseResult &R)
{
    std::cout << "== CODE ==\n";
    for (size_t i = 0; i < R.code.size(); ++i)
    {
        const auto &L = R.code[i];
        if (!L.label.empty())
            std::cout << L.label << ":\n";
        if (!L.instr.op.empty())
        {
            std::cout << "  " << L.instr.op;
            if (!L.instr.ops.empty())
                std::cout << "  ";
            for (size_t j = 0; j < L.instr.ops.size(); ++j)
            {
                const auto &o = L.instr.ops[j];
                if (j)
                    std::cout << ", ";
                if (o.kind == Operand::MEM)
                    std::cout << o.mem.disp << "(" << o.mem.baseReg << "[" << o.mem.base_idx << "])";
                else if (o.kind == Operand::REG)
                    std::cout << o.reg << "[" << o.reg_idx << "]";
                else if (o.kind == Operand::IMM)
                    std::cout << o.imm;
                else
                    std::cout << o.sym;
            }
            std::cout << "\n";
        }
    }
    std::cout << "\n== DATA ==\n";
    for (auto &s : R.data)
    {
        switch (s.kind)
        {
        case DataStmt::LABEL:
            std::cout << s.a << ":\n";
            break;
        case DataStmt::P2ALIGN:
            std::cout << ".p2align " << s.a << "\n";
            break;
        case DataStmt::ZERO:
            std::cout << ".zero " << s.a << "\n";
            break;
        case DataStmt::BYTE:
            std::cout << ".byte " << s.a << "\n";
            break;
        case DataStmt::SHORT:
            std::cout << ".short " << s.a << "\n";
            break;
        case DataStmt::LONG:
            std::cout << ".long " << s.a << (s.b.empty() ? "" : ("+" + s.b)) << "\n";
            break;
        case DataStmt::QUAD:
            std::cout << ".quad " << s.a << "\n";
            break;
        case DataStmt::ASCIZ:
            std::cout << ".asciz \"" << s.a << "\"\n";
            break;
        case DataStmt::ASCII:
            std::cout << ".ascii \"" << s.a << "\"\n";
            break;
        case DataStmt::WEAK:
            std::cout << ".weak " << s.a << "\n";
            break;
        case DataStmt::COMM:
            std::cout << ".comm " << s.a << ", " << s.b << ", " << s.c << "\n";
            break;
        case DataStmt::SIZE:
            std::cout << ".size " << s.a << ", " << s.b << "\n";
            break;
        }
    }
}
#ifdef ASM_PARSER_DEBUG_MAIN
int main(int argc, char **argv)
{
    if (argc < 2)
    {
        std::fprintf(stderr, "usage: %s file.s\n", argv[0]);
        return 2;
    }
    auto R = parse_asm_file(argv[1]);
    dump(R);
    return 0;
}
#endif

#endif // ASM_PARSER_CPP_INCLUDED
