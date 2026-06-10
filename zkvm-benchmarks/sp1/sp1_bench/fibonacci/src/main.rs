//! Recursive Fibonacci program for SP1 zkVM benchmark.
//!
//! This program:
//!   - Reads n from stdin
//!   - Computes fib(n) recursively
//!   - Commits n and result

#![no_main]
sp1_zkvm::entrypoint!(main);

fn fib(n: u32) -> u32 {
    if n == 1 || n == 2 {
        1
    } else {
        fib(n - 1) + fib(n - 2)
    }
}

pub fn main() {
    // Read n from input
    let n: u32 = sp1_zkvm::io::read();

    // Compute fib(n) recursively
    let result = fib(n);

    // Commit the results
    sp1_zkvm::io::commit(&n);
    sp1_zkvm::io::commit(&result);
}
