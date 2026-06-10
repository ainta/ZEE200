//! Mergesort program for SP1 zkVM benchmark.
//!
//! This program:
//!   - Reads n and array from stdin
//!   - Runs merge_sort on it
//!   - Checks if sorted and commits n and ok

#![no_main]
sp1_zkvm::entrypoint!(main);

use fibonacci_lib::merge_sort;

pub fn main() {
    // Read n from input
    let n: u32 = sp1_zkvm::io::read();
    let n = n as usize;

    // Read the array from input
    let mut a: Vec<i32> = Vec::with_capacity(n);
    for _ in 0..n {
        let val: i32 = sp1_zkvm::io::read();
        a.push(val);
    }

    // Create temporary buffer for merge sort
    let mut b: Vec<i32> = vec![0; n];

    // Sort the array
    if n > 0 {
        merge_sort(&mut a, &mut b, 0, n - 1);
    }

    // Check if sorted
    let mut ok: u32 = 1;
    for i in 1..n {
        if a[i - 1] > a[i] {
            ok = 0;
            break;
        }
    }

    // Commit the results
    sp1_zkvm::io::commit(&n);
    sp1_zkvm::io::commit(&ok);
}
