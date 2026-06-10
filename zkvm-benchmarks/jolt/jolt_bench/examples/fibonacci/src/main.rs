use std::time::Instant;
use tracing::info;

pub fn main() {
    tracing_subscriber::fmt::init();

    let n: u32 = std::env::args()
        .nth(1)
        .and_then(|s| s.parse().ok())
        .unwrap_or(20);

    info!("=== Jolt Fibonacci Benchmark ===");
    info!("n = {}", n);

    let target_dir = "/tmp/jolt-guest-targets";
    let mut program = guest::compile_fib(target_dir);

    let prover_preprocessing = guest::preprocess_prover_fib(&mut program);
    let verifier_preprocessing =
        guest::verifier_preprocessing_from_prover_fib(&prover_preprocessing);

    let prove_fib = guest::build_prover_fib(program, prover_preprocessing);
    let verify_fib = guest::build_verifier_fib(verifier_preprocessing);

    info!("Running proof...");
    let now = Instant::now();
    let (output, proof, program_io) = prove_fib(n);
    let prove_time = now.elapsed().as_secs_f64();
    info!("Prover runtime: {} s", prove_time);

    let now = Instant::now();
    let is_valid = verify_fib(n, output, program_io.panic, proof);
    let verify_time = now.elapsed().as_secs_f64();
    info!("Verifier runtime: {} s", verify_time);

    info!("fib({}) = {}", n, output);
    info!("valid: {}", is_valid);

    info!("=== Summary ===");
    info!("Prove time:  {}s", prove_time);
    info!("Verify time: {}s", verify_time);
}
