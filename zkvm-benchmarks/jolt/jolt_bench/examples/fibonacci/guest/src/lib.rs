
#![cfg_attr(feature = "guest", no_std)]

fn fib_recursive(n: u32) -> u32 {
    if n == 1 || n == 2 {
        1
    } else {
        fib_recursive(n - 1) + fib_recursive(n - 2)
    }
}

#[jolt::provable(memory_size = 1048576, max_trace_length = 8388608)]
fn fib(n: u32) -> u32 {
    fib_recursive(n)
}
