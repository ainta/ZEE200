use std::time::Instant;
use tracing::info;

pub fn main() {
    tracing_subscriber::fmt::init();

    let n: u32 = std::env::args()
        .nth(1)
        .and_then(|s| s.parse().ok())
        .unwrap_or(10000);

    info!("=== Jolt Mergesort Benchmark ===");
    info!("Array size: n = {}", n);

    let target_dir = "/tmp/jolt-guest-targets";
    let mut program = guest::compile_mergesort(target_dir);

    let prover_preprocessing = guest::preprocess_prover_mergesort(&mut program);
    let verifier_preprocessing =
        guest::verifier_preprocessing_from_prover_mergesort(&prover_preprocessing);

    let prove_mergesort = guest::build_prover_mergesort(program, prover_preprocessing);
    let verify_mergesort = guest::build_verifier_mergesort(verifier_preprocessing);

    info!("Running proof...");
    let now = Instant::now();
    let (output, proof, program_io) = prove_mergesort(n);
    let prove_time = now.elapsed().as_secs_f64();
    info!("Prover runtime: {} s", prove_time);

    let now = Instant::now();
    let is_valid = verify_mergesort(n, output, program_io.panic, proof);
    let verify_time = now.elapsed().as_secs_f64();
    info!("Verifier runtime: {} s", verify_time);

    info!("output: {} (1 = sorted correctly)", output);
    info!("valid: {}", is_valid);

    info!("=== Summary ===");
    info!("Prove time:  {}s", prove_time);
    info!("Verify time: {}s", verify_time);
}
