#pragma once
#include "machine.h"
#include <iostream>
#include <sys/stat.h>

namespace cleartext {

/**
 * Oracle dispatcher - calls the appropriate oracle based on oracle_id
 */
void oracle(CleartextMachine& m, uint32_t oracle_id);

/**
 * Query whether a host file descriptor is currently open (tracked by oracles).
 * Includes standard descriptors 0, 1, 2 as always-open.
 */
bool is_host_fd_open(int fd);

/**
 * Oracle 0: open_oracle - open a file
 * Reads filename from memory, opens file with given flags and mode
 * Pushes file descriptor (or -1 on error, then errno)
 */
void open_oracle(CleartextMachine& cpu);

/**
 * Oracle 1: read_oracle - read from file descriptor
 * Reads up to len bytes from fd into buffer
 * Pushes bytes in reverse order, then byte count
 */
void read_oracle(CleartextMachine& cpu);

/**
 * Oracle 4: argc_oracle - read a string from stdin
 * Reads one line, pushes null terminator then characters in reverse order
 * This creates FIFO behavior when popped from stack
 */
void argc_oracle(CleartextMachine& cpu);

/**
 * Oracle 5: stdin_oracle - read a single integer from stdin
 * Reads one integer and pushes it onto the input stack
 */
void stdin_oracle(CleartextMachine& cpu);

/**
 * Oracle 9: gettime_oracle - get current time
 * Pushes current Unix timestamp
 */
void gettime_oracle(CleartextMachine& cpu);

/**
 * Oracle 10: stat_oracle - get file status
 * Reads filename from memory, calls stat()
 * Pushes stat structure fields in reverse order, then result
 */
void stat_oracle(CleartextMachine& cpu);

/**
 * Oracle 11: fstat_oracle - get file status by descriptor
 * Reads fd from register, calls fstat()
 * Pushes stat structure fields in reverse order, then result
 */
void fstat_oracle(CleartextMachine& cpu);

/**
 * Oracle 12: unlink_oracle - delete a file
 * Reads filename from memory, calls unlink()
 * Pushes result (or -1, then errno)
 */
void unlink_oracle(CleartextMachine& cpu);

/**
 * Oracle 13: chmod_oracle - change file permissions
 * Reads filename from memory and mode from register
 * Pushes result (or -1, then errno)
 */
void chmod_oracle(CleartextMachine& cpu);

/**
 * Oracle 14: close_oracle - close file descriptor
 * Reads fd from register, calls close()
 * Pushes result (or -1, then errno)
 */
void close_oracle(CleartextMachine& cpu);

/**
 * Oracle 15: isatty_oracle - check if fd is a terminal
 * Reads fd from register, calls isatty()
 * Pushes 1 if tty, 0 (then errno) otherwise
 */
void isatty_oracle(CleartextMachine& cpu);

/**
 * Oracle 16: lseek_oracle - seek in file
 * Reads fd, offset, whence from registers
 * Pushes new offset (or -1, then errno)
 */
void lseek_oracle(CleartextMachine& cpu);

} // namespace cleartext
