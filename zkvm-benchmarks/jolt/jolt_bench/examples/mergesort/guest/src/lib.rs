#![cfg_attr(feature = "guest", no_std)]

extern crate alloc;
use alloc::vec;
use alloc::vec::Vec;

fn merge_sort(f: &mut [i32], b: &mut [i32], l: usize, r: usize) {
    if r == l {
        return;
    }
    let mid = (l + r) >> 1;
    merge_sort(f, b, l, mid);
    merge_sort(f, b, mid + 1, r);

    let mut ll = l;
    let mut rr = mid + 1;
    let mut tmp = l;

    while ll <= mid && rr <= r {
        if f[ll] < f[rr] {
            b[tmp] = f[ll];
            ll += 1;
        } else {
            b[tmp] = f[rr];
            rr += 1;
        }
        tmp += 1;
    }

    while ll <= mid {
        b[tmp] = f[ll];
        ll += 1;
        tmp += 1;
    }
    while rr <= r {
        b[tmp] = f[rr];
        rr += 1;
        tmp += 1;
    }

    for i in l..=r {
        f[i] = b[i];
    }
}

#[jolt::provable(memory_size = 1048576, max_trace_length = 8388608)]
fn mergesort(n: u32) -> u32 {
    let n = n as usize;

    // Generate shuffled array: reverse order for worst case
    let mut a: Vec<i32> = (0..n as i32).rev().collect();
    let mut b: Vec<i32> = vec![0i32; n];

    // Perform merge sort
    if n > 0 {
        merge_sort(&mut a, &mut b, 0, n - 1);
    }

    // Verify sorted (expecting 0, 1, 2, ..., n-1)
    let mut ok: u32 = 1;
    for i in 0..n {
        if a[i] != i as i32 {
            ok = 0;
        }
    }

    ok
}
