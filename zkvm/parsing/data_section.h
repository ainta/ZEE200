// data_section.h
#pragma once
#include <vector>
#include <string>
#include <map>
#include <variant>
#include <cstdint>
#include <stdexcept>

struct DataStmt {
  enum Kind { P2ALIGN, ZERO, BYTE, SHORT, LONG, QUAD, ASCIZ, ASCII, WEAK, COMM, SIZE, LABEL } kind;
  std::string a, b, c;   // reuse fields for params
  uint64_t    v = 0;     // numeric param if any
};

struct DataBuild {
  std::vector<uint8_t> image;
  std::map<std::string,uint32_t> sym; // globals + labels
};

class DataSection {
  std::vector<DataStmt> stmts;
  static inline uint32_t pad8(uint32_t off, uint32_t align) {
    if (align==8) align=4; // match zkassembler's tweak
    while (off % align) ++off;
    return off;
  }
  static void push_u32(std::vector<uint8_t>& out, uint32_t x) {
    out.push_back( x        &0xFF);
    out.push_back((x >> 8 ) &0xFF);
    out.push_back((x >> 16) &0xFF);
    out.push_back((x >> 24) &0xFF);
  }
  static void push_u16(std::vector<uint8_t>& out, uint16_t x) {
    out.push_back( x        &0xFF);
    out.push_back((x >> 8 ) &0xFF);
  }
  static void push_u64(std::vector<uint8_t>& out, uint64_t x) {
    for (int i=0;i<8;i++) out.push_back((x >> (8*i)) & 0xFF);
  }

  // Robust parsers with context
  static uint32_t parse_u32(const std::string& s, const char* ctx) {
    try {
      if (s.empty()) throw std::invalid_argument("empty");
      // base=0 allows 0x.. (hex) and 0.. (octal), decimal otherwise
      unsigned long v = std::stoul(s, nullptr, 0);
      if (v > 0xFFFFFFFFul) throw std::out_of_range("u32 overflow");
      return static_cast<uint32_t>(v);
    } catch (const std::exception& e) {
      throw std::runtime_error(std::string("parse_u32 failed for ") + ctx + "('" + s + "'): " + e.what());
    }
  }
  static uint64_t parse_u64(const std::string& s, const char* ctx) {
    try {
      if (s.empty()) throw std::invalid_argument("empty");
      return std::stoull(s, nullptr, 0);
    } catch (const std::exception& e) {
      throw std::runtime_error(std::string("parse_u64 failed for ") + ctx + "('" + s + "'): " + e.what());
    }
  }

  // escape-aware length calculator to mirror emit_escapes
  static size_t escaped_len(const std::string& s) {
    size_t n = 0;
    for (size_t i=0;i<s.size();++i) {
      if (s[i] != '\\') { ++n; continue; }
      if (i+1>=s.size()) break;
      char c1 = s[i+1];
      if (c1=='n' || c1=='r' || c1=='t' || c1=='\\') { ++n; ++i; }
      else if (c1>='0' && c1<='9' && i+3<s.size()
               && s[i+2]>='0'&&s[i+2]<='9' && s[i+3]>='0'&&s[i+3]<='9') {
        ++n; i+=3; // \nnn → 1 byte
      }
      // unknown sequences are ignored in emitter → count 0 additional bytes
    }
    return n;
  }

  static void emit_escapes(const std::string& s, std::vector<uint8_t>& out) {
    for (size_t i=0;i<s.size();++i) {
      if (s[i] != '\\') { out.push_back((uint8_t)s[i]); continue; }
      if (i+1>=s.size()) break;
      char n = s[i+1];
      if (n=='n'){ out.push_back('\n'); i++; }
      else if (n=='r'){ out.push_back('\r'); i++; }
      else if (n=='t'){ out.push_back('\t'); i++; }
      else if (n=='\\'){ out.push_back('\\'); i++; }
      else if (n>='0' && n<='9' && i+3<s.size()
               && s[i+2]>='0'&&s[i+2]<='9' && s[i+3]>='0'&&s[i+3]<='9') {
        int val = (s[i+3]-'0') + 8*(s[i+2]-'0') + 64*(s[i+1]-'0');
        out.push_back((uint8_t)val);
        i+=3;
      }
      // silently ignore unknown sequences (matches your behavior)
    }
  }
public:
  void add(const DataStmt& s) { stmts.push_back(s); }

  DataBuild build(const std::map<std::string,uint32_t>& label2pc = {}) const {
    DataBuild R;
    // initial 4 bytes zero, like zkassembler
    R.image = {0,0,0,0};
    uint32_t off = 4;
    // pass 1: collect symbols and compute size (track offset)
    // We need a working copy of offsets to mirror p2align/comm/size growth.
    std::map<std::string,uint32_t> tmpSym;

    auto ensure_align = [&](uint32_t a){
      uint32_t n = pad8(off, a);
      off = n;
    };

    for (auto& s : stmts) {
      switch (s.kind) {
        case DataStmt::LABEL: {
          tmpSym[s.a] = off;
          break;
        }
        case DataStmt::P2ALIGN: {
          uint32_t p2 = parse_u32(s.a, "P2ALIGN");
          ensure_align(1u << p2);
          break;
        }
        case DataStmt::ZERO: {
          off += parse_u32(s.a, "ZERO");
          break;
        }
        case DataStmt::BYTE:  { off += 1; break; }
        case DataStmt::SHORT: { off += 2; break; }
        case DataStmt::LONG:  { off += 4; break; }
        case DataStmt::QUAD:  { off += 8; break; }
        case DataStmt::ASCIZ: { off += (uint32_t)escaped_len(s.a) + 1; break; }
        case DataStmt::ASCII: { off += (uint32_t)escaped_len(s.a); break; }
        case DataStmt::WEAK:  { tmpSym[s.a]=off; off += 4; break; }
        case DataStmt::COMM: {
          uint32_t align = s.c.empty() ? 1u : parse_u32(s.c, "COMM align");
          ensure_align(align);
          uint32_t size  = parse_u32(s.b, "COMM size");
          tmpSym[s.a]=off;
          off += size;
          break;
        }
        case DataStmt::SIZE: {
          // .size directives with expressions like ".Lfunc_end-Fib" can't be evaluated
          // We just skip them as they don't affect data layout
          break;
        }
      }
    }

    // Pass 2: emit bytes
    R.image.reserve(off);
    // Ensure we have the same running offset logic:
    R.sym = tmpSym;
    off = 4;
    auto pad_to = [&](uint32_t a) {
      uint32_t n = pad8(off, a);
      while (off<n) { R.image.push_back(0); off++; }
    };
    auto put_zero = [&](uint32_t n){ while(n--){ R.image.push_back(0); off++; } };
    auto resolve32 = [&](const std::string& base, const std::string& offs)->uint32_t {
      uint32_t addr = 0;
      if (tmpSym.count(base)) addr = tmpSym[base];
      else if (label2pc.count(base)) addr = label2pc.at(base);
      else if (!base.empty() && (std::isdigit((unsigned char)base[0]) || (base.size()>1 && base[0]=='0'))) {
        addr = parse_u32(base, "LONG base-imm");
      }
      else if (base.empty()) throw std::runtime_error("Empty symbol in .long");
      else throw std::runtime_error("Unknown symbol in .long: "+base);

      if (!offs.empty()) addr += parse_u32(offs, "LONG +offs");
      return addr;
    };

    for (auto& s : stmts) {
      try {
        switch (s.kind) {
          case DataStmt::LABEL: break;
          case DataStmt::P2ALIGN: pad_to(1u << parse_u32(s.a, "P2ALIGN")); break;
          case DataStmt::ZERO: put_zero(parse_u32(s.a, "ZERO")); break;
          case DataStmt::BYTE:  { uint8_t v=(uint8_t)parse_u64(s.a, "BYTE");  R.image.push_back(v); off+=1; break; }
          case DataStmt::SHORT: { uint16_t v=(uint16_t)parse_u64(s.a, "SHORT"); push_u16(R.image,v); off+=2; break; }
          case DataStmt::LONG:  { uint32_t v = resolve32(s.a, s.b); push_u32(R.image, v); off+=4; break; }
          case DataStmt::QUAD:  { uint64_t v = parse_u64(s.a, "QUAD"); push_u64(R.image, v); off+=8; break; }
          case DataStmt::ASCIZ: { emit_escapes(s.a, R.image); R.image.push_back(0); off += (uint32_t)escaped_len(s.a) + 1; break; }
          case DataStmt::ASCII: { emit_escapes(s.a, R.image); off += (uint32_t)escaped_len(s.a); break; }
          case DataStmt::WEAK:  { push_u32(R.image, 0); off+=4; break; }
          case DataStmt::COMM:  {
            uint32_t align = s.c.empty() ? 1u : parse_u32(s.c, "COMM align");
            pad_to(align);
            put_zero(parse_u32(s.b, "COMM size"));
            break;
          }
          case DataStmt::SIZE: {
            // Only advances offset in pass1; no direct emission needed here (matches zkassembler)
            // Note: we don't try to parse s.b here since it may be an expression
            break;
          }
      }
      } catch (const std::exception& e) {
        std::string kind_name;
        switch (s.kind) {
          case DataStmt::LABEL: kind_name = "LABEL"; break;
          case DataStmt::P2ALIGN: kind_name = "P2ALIGN"; break;
          case DataStmt::ZERO: kind_name = "ZERO"; break;
          case DataStmt::BYTE: kind_name = "BYTE"; break;
          case DataStmt::SHORT: kind_name = "SHORT"; break;
          case DataStmt::LONG: kind_name = "LONG"; break;
          case DataStmt::QUAD: kind_name = "QUAD"; break;
          case DataStmt::ASCIZ: kind_name = "ASCIZ"; break;
          case DataStmt::ASCII: kind_name = "ASCII"; break;
          case DataStmt::WEAK: kind_name = "WEAK"; break;
          case DataStmt::COMM: kind_name = "COMM"; break;
          case DataStmt::SIZE: kind_name = "SIZE"; break;
          default: kind_name = "UNKNOWN"; break;
        }
        throw std::runtime_error("Error processing " + kind_name + " directive (a='" + s.a + "', b='" + s.b + "', c='" + s.c + "'): " + e.what());
      }
    }
    return R;
  }
};
