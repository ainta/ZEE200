RAYON_NUM_THREADS=1 RUST_LOG=info cargo run --release -p fibonacci -- 20 > fibonacci_20_jolt.log
RAYON_NUM_THREADS=1 RUST_LOG=info cargo run --release -p fibonacci -- 23 > fibonacci_23_jolt.log
RAYON_NUM_THREADS=1 RUST_LOG=info cargo run --release -p mergesort -- 500 > mergesort_500_jolt.log
RAYON_NUM_THREADS=1 RUST_LOG=info cargo run --release -p mergesort -- 5000 > mergesort_5000_jolt.log
RAYON_NUM_THREADS=1 RUST_LOG=info cargo run --release -p sha2-ex   -- 10   > sha256_10_jolt.log
RAYON_NUM_THREADS=1 RUST_LOG=info cargo run --release -p sha2-ex   -- 200  > sha256_200_jolt.log
