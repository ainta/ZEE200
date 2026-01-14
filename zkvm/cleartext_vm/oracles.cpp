#include "oracles.h"
#include <string>
#include <cstring>
#include <unistd.h>
#include <fcntl.h>
#include <sys/stat.h>
#include <time.h>
#include <errno.h>
#include <set>

namespace cleartext {

namespace {

// Track host file descriptors opened via open_oracle / closed via close_oracle.
// These are used by the cleartext executor to route OUTPUT bytes to the right host fd.
static std::set<int> g_open_fds;

// Helper: Read null-terminated string from memory starting at byte address
static std::string read_string_from_memory(const CleartextMachine& cpu, uint32_t byte_addr) {
    std::string result;
    for (uint32_t i = byte_addr; ; i++) {
        uint32_t word_addr = i >> 2;
        uint32_t byte_offset = i & 3;

        if (word_addr >= cpu.memory.size()) break;

        uint8_t byte = (cpu.memory[word_addr] >> (byte_offset * 8)) & 0xFF;
        if (byte == 0) break;

        result += static_cast<char>(byte);
    }

    return result;
}

// Translate guest/newlib open() flags (from newlib's sys/_default_fcntl.h)
// to host/Linux O_* flags used by ::open().
//
// Guest encodings (newlib):
//   O_RDONLY   = 0
//   O_WRONLY   = 1
//   O_RDWR     = 2
//   O_APPEND   = 0x0008
//   O_CREAT    = 0x0200
//   O_TRUNC    = 0x0400
//   O_EXCL     = 0x0800
//   O_NONBLOCK = 0x4000
//   O_NOCTTY   = 0x8000
//
// These differ from the host's <fcntl.h> values, so we must translate.
static int translate_guest_open_flags_to_host(int guest_flags) {
    // Access mode is in the low 2 bits.
    int guest_accmode = guest_flags & 0x3;
    int host_flags = 0;

    switch (guest_accmode) {
        case 1: // O_WRONLY
            host_flags |= O_WRONLY;
            break;
        case 2: // O_RDWR
            host_flags |= O_RDWR;
            break;
        default: // O_RDONLY (0) or anything else → read-only
            host_flags |= O_RDONLY;
            break;
    }

    // Map common option bits.
    if (guest_flags & 0x0008) host_flags |= O_APPEND;   // O_APPEND
    if (guest_flags & 0x0200) host_flags |= O_CREAT;    // O_CREAT
    if (guest_flags & 0x0400) host_flags |= O_TRUNC;    // O_TRUNC
    if (guest_flags & 0x0800) host_flags |= O_EXCL;     // O_EXCL
    if (guest_flags & 0x4000) host_flags |= O_NONBLOCK; // O_NONBLOCK
    if (guest_flags & 0x8000) host_flags |= O_NOCTTY;   // O_NOCTTY

    return host_flags;
}

} // anonymous namespace

void open_oracle(CleartextMachine& cpu) {
    // Register mapping from syscalls.c:_open (lines 129-136):
    // COPYR %TMP0, name   -> registry[14] = filename address
    // COPYR %TMP1, flags  -> registry[15] = flags
    // COPYR %OFF, mode    -> registry[16] = mode
    // Updated: indices changed after removing unused registers

    uint32_t filename_addr = cpu.registry[14];  // %TMP0 (was 15)
    int guest_flags = static_cast<int>(cpu.registry[15]);  // %TMP1 (was 16)
    int mode = static_cast<int>(cpu.registry[16]);  // %OFF (was 23)

    std::string filename = read_string_from_memory(cpu, filename_addr);

    int host_flags = translate_guest_open_flags_to_host(guest_flags);
    int fd = open(filename.c_str(), host_flags, mode);

    std::cout << "[Oracle 0] open(\"" << filename << "\", " << guest_flags << ", " << mode
              << ") = " << fd << std::endl;

    if (fd >= 0) {
        g_open_fds.insert(fd);
    } else {
        cpu.input.push(errno);
    }
    cpu.input.push(static_cast<uint32_t>(fd));
}

void read_oracle(CleartextMachine& cpu) {
    // Register mapping from syscalls.c:_read:
    // COPYR %TMP0, %GR1   -> registry[14] = fd (from GR1)
    // COPYR %TMP1, %GR2   -> registry[15] = buffer ptr (from GR2, not used in oracle)
    // COPYR %OFF, %GR3    -> registry[16] = length (from GR3)
    // Updated: indices changed after removing unused registers

    int fd = static_cast<int>(cpu.registry[14]);   // %TMP0 (was 15)
    int len = static_cast<int>(cpu.registry[16]);  // %OFF (was 23)

    char* buf = new char[len];
    int res = read(fd, buf, len);

    std::cout << "[Oracle 1] read(" << fd << ", buf, " << len << ") = " << res << std::endl;

    // Push bytes in REVERSE order (same as zeecompiler)
    // Stack is LIFO, so push last-to-first to pop first-to-last
    for (int i = res - 1; i >= 0; i--) {
        cpu.input.push(static_cast<uint32_t>(static_cast<uint8_t>(buf[i])));
    }
    cpu.input.push(static_cast<uint32_t>(res));

    delete[] buf;
}

void argc_oracle(CleartextMachine& cpu) {
    std::string s;
    std::getline(std::cin, s);

    // Push null terminator first, then characters in reverse (same as zeecompiler)
    cpu.input.push(0);
    for (int i = s.length() - 1; i >= 0; i--) {
        cpu.input.push(static_cast<uint32_t>(s[i]));
    }

    std::cout << "[Oracle 4] argc_oracle: read \"" << s << "\" (" << s.length() << " chars)" << std::endl;
}

void stdin_oracle(CleartextMachine& cpu) {
    int tmp;
    std::cin >> tmp;
    cpu.input.push(static_cast<uint32_t>(tmp));

    std::cout << "[Oracle 5] stdin_oracle: read " << tmp << std::endl;
}

void gettime_oracle(CleartextMachine& cpu) {
    time_t t = time(0);
    cpu.input.push(static_cast<uint32_t>(t));

    std::cout << "[Oracle 9] gettime_oracle: " << t << std::endl;
}

void stat_oracle(CleartextMachine& cpu) {
    // Register mapping from syscalls.c:_stat (lines 326-331):
    // COPYR %TMP0, file -> registry[14] = filename address
    // Updated: indices changed after removing unused registers

    uint32_t filename_addr = cpu.registry[14];  // %TMP0 (was 15)
    std::string filename = read_string_from_memory(cpu, filename_addr);

    struct stat buf;
    int res = stat(filename.c_str(), &buf);

    std::cout << "[Oracle 10] stat(\"" << filename << "\") = " << res << std::endl;

    if (res == -1) {
        cpu.input.push(errno);
        cpu.input.push(static_cast<uint32_t>(-1));
    } else {
        // Push stat fields in REVERSE order (syscalls.c:343-381)
        cpu.input.push(static_cast<uint32_t>(buf.st_dev));
        cpu.input.push(static_cast<uint32_t>(buf.st_ino));
        cpu.input.push(static_cast<uint32_t>(buf.st_mode));
        cpu.input.push(static_cast<uint32_t>(buf.st_nlink));
        cpu.input.push(static_cast<uint32_t>(buf.st_uid));
        cpu.input.push(static_cast<uint32_t>(buf.st_gid));
        cpu.input.push(static_cast<uint32_t>(buf.st_rdev));
        cpu.input.push(static_cast<uint32_t>(buf.st_size));
        cpu.input.push(static_cast<uint32_t>(buf.st_blksize));
        cpu.input.push(static_cast<uint32_t>(buf.st_blocks));
        cpu.input.push(static_cast<uint32_t>(buf.st_atime));
        cpu.input.push(static_cast<uint32_t>(buf.st_mtime));
        cpu.input.push(static_cast<uint32_t>(buf.st_ctime));
        cpu.input.push(static_cast<uint32_t>(res));
    }
}

void fstat_oracle(CleartextMachine& cpu) {
    // Register mapping from syscalls.c:_fstat (lines 263-268):
    // COPYR %TMP0, file -> registry[14] = fd
    // Updated: indices changed after removing unused registers

    int fd = static_cast<int>(cpu.registry[14]);  // %TMP0 (was 15)

    struct stat buf;
    int res = fstat(fd, &buf);

    std::cout << "[Oracle 11] fstat(" << fd << ") = " << res << std::endl;

    if (res == -1) {
        cpu.input.push(errno);
        cpu.input.push(static_cast<uint32_t>(-1));
    } else {
        // Push stat fields in REVERSE order (syscalls.c:280-319)
        cpu.input.push(static_cast<uint32_t>(buf.st_dev));
        cpu.input.push(static_cast<uint32_t>(buf.st_ino));
        cpu.input.push(static_cast<uint32_t>(buf.st_mode));
        cpu.input.push(static_cast<uint32_t>(buf.st_nlink));
        cpu.input.push(static_cast<uint32_t>(buf.st_uid));
        cpu.input.push(static_cast<uint32_t>(buf.st_gid));
        cpu.input.push(static_cast<uint32_t>(buf.st_rdev));
        cpu.input.push(static_cast<uint32_t>(buf.st_size));
        cpu.input.push(static_cast<uint32_t>(buf.st_blksize));
        cpu.input.push(static_cast<uint32_t>(buf.st_blocks));
        cpu.input.push(static_cast<uint32_t>(buf.st_atime));
        cpu.input.push(static_cast<uint32_t>(buf.st_mtime));
        cpu.input.push(static_cast<uint32_t>(buf.st_ctime));
        cpu.input.push(static_cast<uint32_t>(res));
    }
}

void unlink_oracle(CleartextMachine& cpu) {
    // Register mapping from syscalls.c:_unlink (lines 412-417):
    // COPYR %TMP0, name -> registry[14] = filename address
    // Updated: indices changed after removing unused registers

    uint32_t filename_addr = cpu.registry[14];  // %TMP0 (was 15)
    std::string filename = read_string_from_memory(cpu, filename_addr);

    int res = unlink(filename.c_str());

    std::cout << "[Oracle 12] unlink(\"" << filename << "\") = " << res << std::endl;

    if (res == -1) {
        cpu.input.push(errno);
    }
    cpu.input.push(static_cast<uint32_t>(res));
}

void chmod_oracle(CleartextMachine& cpu) {
    // Register mapping from syscalls.c:chmod (lines 388-394):
    // COPYR %TMP0, pathname -> registry[14] = filename address
    // COPYR %TMP1, mode     -> registry[15] = mode
    // Updated: indices changed after removing unused registers

    uint32_t filename_addr = cpu.registry[14];  // %TMP0 (was 15)
    mode_t mode = static_cast<mode_t>(cpu.registry[15]);  // %TMP1 (was 16)

    std::string filename = read_string_from_memory(cpu, filename_addr);

    int res = chmod(filename.c_str(), mode);

    std::cout << "[Oracle 13] chmod(\"" << filename << "\", " << mode << ") = " << res << std::endl;

    if (res == -1) {
        cpu.input.push(errno);
    }
    cpu.input.push(static_cast<uint32_t>(res));
}

void close_oracle(CleartextMachine& cpu) {
    // Register mapping from syscalls.c:_close (lines 180-185):
    // COPYR %TMP0, file -> registry[14] = fd
    // Updated: indices changed after removing unused registers

    int fd = static_cast<int>(cpu.registry[14]);  // %TMP0 (was 15)

    // Note: _close in syscalls.c checks isatty first and returns 0 for stdin/stdout/stderr
    // For simplicity in cleartext, we'll just call close
    int res = close(fd);

    std::cout << "[Oracle 14] close(" << fd << ") = " << res << std::endl;

    // Track closure of host descriptors we opened.
    g_open_fds.erase(fd);

    if (res == -1) {
        cpu.input.push(errno);
    }
    cpu.input.push(static_cast<uint32_t>(res));
}

void isatty_oracle(CleartextMachine& cpu) {
    // Register mapping from syscalls.c:_isatty (lines 152-157):
    // COPYR %TMP0, fd -> registry[14] = fd
    // Updated: indices changed after removing unused registers

    int fd = static_cast<int>(cpu.registry[14]);  // %TMP0 (was 15)

    int res = isatty(fd);

    std::cout << "[Oracle 15] isatty(" << fd << ") = " << res << std::endl;

    // syscalls.c:_isatty returns 1 for tty, 0 (with errno) otherwise
    if (res == 0) {
        cpu.input.push(errno);
    }
    cpu.input.push(static_cast<uint32_t>(res));
}

void lseek_oracle(CleartextMachine& cpu) {
    // Register mapping from syscalls.c:_lseek (lines 51-58):
    // COPYR %TMP0, file -> registry[14] = fd
    // COPYR %TMP1, ptr  -> registry[15] = offset
    // COPYR %OFF, dir   -> registry[16] = whence
    // Updated: indices changed after removing unused registers

    int fd = static_cast<int>(cpu.registry[14]);  // %TMP0 (was 15)
    int offset = static_cast<int>(cpu.registry[15]);  // %TMP1 (was 16)
    int whence = static_cast<int>(cpu.registry[16]);  // %OFF (was 23)

    int res = lseek(fd, offset, whence);

    std::cout << "[Oracle 16] lseek(" << fd << ", " << offset << ", " << whence << ") = " << res << std::endl;

    if (res == -1) {
        cpu.input.push(errno);
    }
    cpu.input.push(static_cast<uint32_t>(res));
}

bool is_host_fd_open(int fd) {
    if (fd < 0) return false;
    // Treat standard descriptors as always open.
    if (fd == 0 || fd == 1 || fd == 2) return true;
    return g_open_fds.find(fd) != g_open_fds.end();
}

void oracle(CleartextMachine& m, uint32_t oracle_id) {
    switch (oracle_id) {
        case 0:
            open_oracle(m);
            break;
        case 1:
            read_oracle(m);
            break;
        case 4:
            argc_oracle(m);
            break;
        case 5:
            stdin_oracle(m);
            break;
        case 9:
            gettime_oracle(m);
            break;
        case 10:
            stat_oracle(m);
            break;
        case 11:
            fstat_oracle(m);
            break;
        case 12:
            unlink_oracle(m);
            break;
        case 13:
            chmod_oracle(m);
            break;
        case 14:
            close_oracle(m);
            break;
        case 15:
            isatty_oracle(m);
            break;
        case 16:
            lseek_oracle(m);
            break;
        default:
            std::cerr << "[Cleartext VM] Error: Oracle " << oracle_id
                      << " not implemented" << std::endl;
            std::cerr << "  Implemented oracles: 0, 1, 4, 5, 9, 10, 11, 12, 13, 14, 15, 16" << std::endl;
            exit(1);
    }
}

} // namespace cleartext
