use std::time::Instant;
use tracing::info;

pub fn main() {
    tracing_subscriber::fmt::init();

    let iterations: u32 = std::env::args()
        .nth(1)
        .and_then(|s| s.parse().ok())
        .unwrap_or(100);

    info!("=== Jolt SHA256 Benchmark ===");
    info!("iterations = {}", iterations);

    let target_dir = "/tmp/jolt-guest-targets";
    let mut program = guest::compile_sha256_bench(target_dir);

    let prover_preprocessing = guest::preprocess_prover_sha256_bench(&mut program);
    let verifier_preprocessing =
        guest::verifier_preprocessing_from_prover_sha256_bench(&prover_preprocessing);

    let prove_sha256_bench =
        guest::build_prover_sha256_bench(program, prover_preprocessing);
    let verify_sha256_bench = guest::build_verifier_sha256_bench(verifier_preprocessing);

    let now = Instant::now();
    let (output, proof, program_io) = prove_sha256_bench(iterations);
    let prove_time = now.elapsed().as_secs_f64();
    info!("Prover runtime: {} s", prove_time);

    let now = Instant::now();
    let is_valid = verify_sha256_bench(iterations, output, program_io.panic, proof);
    let verify_time = now.elapsed().as_secs_f64();
    info!("Verifier runtime: {} s", verify_time);

    info!("ok flag (1 = hash correct): {}", output);
    info!("valid: {}", is_valid);

    info!("=== Summary ===");
    info!("Prove time:  {}s", prove_time);
    info!("Verify time: {}s", verify_time);
}
