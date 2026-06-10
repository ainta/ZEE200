use clap::{Parser, ValueEnum};
use sp1_sdk::{EnvProver, HashableKey, ProverClient, SP1Stdin};
use std::time::Instant;

#[derive(Debug, Clone, ValueEnum)]
enum Program {
    Mergesort,
    Fibonacci,
    Sha256,
}

fn load_elf(program: &Program) -> Vec<u8> {
    let manifest_dir = env!("CARGO_MANIFEST_DIR");
    let elf_name = match program {
        Program::Mergesort => "mergesort-program",
        Program::Fibonacci => "fibonacci-program",
        Program::Sha256 => "sha256-program",
    };
    let elf_path = std::path::Path::new(manifest_dir)
        .join("..")
        .join("target/riscv32im-succinct-zkvm-elf/release")
        .join(elf_name);
    std::fs::read(&elf_path)
        .unwrap_or_else(|e| panic!("failed to read ELF at {}: {e}", elf_path.display()))
}

/// Command line arguments
#[derive(Parser, Debug)]
#[command(author, version, about, long_about = None)]
struct Args {
    /// Program to run: mergesort, fibonacci, or sha256
    #[arg(long, value_enum, default_value = "mergesort")]
    program: Program,

    #[arg(long)]
    execute: bool,

    #[arg(long)]
    prove: bool,

    /// Use Plonk wrapper instead of core/STARK (requires gnark docker).
    #[arg(long)]
    plonk: bool,

    #[arg(long)]
    groth16: bool,

    #[arg(long, default_value = "100")]
    n: u32,
}

fn main() {
    sp1_sdk::utils::setup_logger();
    dotenv::dotenv().ok();

    let args = Args::parse();

    if args.execute == args.prove {
        eprintln!("Error: You must specify either --execute or --prove");
        std::process::exit(1);
    }

    let client = ProverClient::from_env();

    match args.program {
        Program::Mergesort => run_mergesort(&args, client),
        Program::Fibonacci => run_fibonacci(&args, client),
        Program::Sha256 => run_sha256(&args, client),
    }
}

fn run_mergesort(args: &Args, client: EnvProver) {
    let elf = load_elf(&Program::Mergesort);

    // Build input: n followed by reversed array [n-1, n-2, ..., 1, 0]
    let mut stdin = SP1Stdin::new();
    stdin.write(&args.n);
    for i in (0..args.n as i32).rev() {
        stdin.write(&i);
    }

    println!("=== SP1 Mergesort Benchmark ===");
    println!("Array size: n = {}", args.n);
    println!();

    if args.execute {
        println!("Executing (no proof)...");
        let start = Instant::now();
        let (mut output, report) = client.execute(&elf, &stdin).run().unwrap();
        let exec_time = start.elapsed();

        println!("Execution time: {:?}", exec_time);

        let n: usize = output.read();
        let ok: u32 = output.read();
        println!("n = {}, ok = {} (1 = sorted correctly)", n, ok);
        println!(
            "RISC-V instructions (execute): {}",
            report.total_instruction_count()
        );
    } else {
        // For proving, first do a non-zk execution to measure instruction count.
        let stdin_for_exec = stdin.clone();
        let (_, report) = client.execute(&elf, &stdin_for_exec).run().unwrap();
        println!(
            "RISC-V instructions (execute before prove): {}",
            report.total_instruction_count()
        );

        let (pk, vk) = client.setup(&elf);
        println!("Verification key: {}", vk.bytes32());

        if args.groth16 {
            println!("Running Groth16 proving...");
            let start = Instant::now();
            let proof = client
                .prove(&pk, &stdin)
                .groth16()
                .run()
                .expect("failed to generate Groth16 proof");
            let prove_time = start.elapsed();

            println!("Groth16 proving time: {:?}", prove_time);

            client.verify(&proof, &vk).expect("failed to verify");
            println!("Groth16 verification: OK");

            let mut pv = proof.public_values.clone();
            let n: usize = pv.read();
            let ok: u32 = pv.read();
            println!("n = {}, ok = {} (1 = sorted correctly)", n, ok);
        } else if args.plonk {
            println!("Running Plonk proving...");
            let start = Instant::now();
            let proof = client
                .prove(&pk, &stdin)
                .plonk()
                .run()
                .expect("failed to generate Plonk proof");
            let prove_time = start.elapsed();

            println!("Plonk proving time: {:?}", prove_time);

            client.verify(&proof, &vk).expect("failed to verify");
            println!("Plonk verification: OK");

            let mut pv = proof.public_values.clone();
            let n: usize = pv.read();
            let ok: u32 = pv.read();
            println!("n = {}, ok = {} (1 = sorted correctly)", n, ok);
        } else {
            println!("Running STARK proving...");
            let start = Instant::now();
            let proof = client
                .prove(&pk, &stdin)
                .run()
                .expect("failed to generate proof");
            let prove_time = start.elapsed();

            println!("STARK proving time: {:?}", prove_time);

            client.verify(&proof, &vk).expect("failed to verify");
            println!("STARK verification: OK");

            let mut pv = proof.public_values.clone();
            let n: usize = pv.read();
            let ok: u32 = pv.read();
            println!("n = {}, ok = {} (1 = sorted correctly)", n, ok);
        }
    }
}

fn run_fibonacci(args: &Args, client: EnvProver) {
    let elf = load_elf(&Program::Fibonacci);

    // Build input: just n
    let mut stdin = SP1Stdin::new();
    stdin.write(&args.n);

    println!("=== SP1 Fibonacci Benchmark ===");
    println!("n = {}", args.n);
    println!();

    if args.execute {
        println!("Executing (no proof)...");
        let start = Instant::now();
        let (mut output, report) = client.execute(&elf, &stdin).run().unwrap();
        let exec_time = start.elapsed();

        println!("Execution time: {:?}", exec_time);

        let n: u32 = output.read();
        let result: u32 = output.read();
        println!("fib({}) = {}", n, result);
        println!(
            "RISC-V instructions (execute): {}",
            report.total_instruction_count()
        );
    } else {
        // For proving, first do a non-zk execution to measure instruction count.
        let stdin_for_exec = stdin.clone();
        let (_, report) = client.execute(&elf, &stdin_for_exec).run().unwrap();
        println!(
            "RISC-V instructions (execute before prove): {}",
            report.total_instruction_count()
        );

        let (pk, vk) = client.setup(&elf);
        println!("Verification key: {}", vk.bytes32());

        if args.groth16 {
            println!("Running Groth16 proving...");
            let start = Instant::now();
            let proof = client
                .prove(&pk, &stdin)
                .groth16()
                .run()
                .expect("failed to generate Groth16 proof");
            let prove_time = start.elapsed();

            println!("Groth16 proving time: {:?}", prove_time);

            client.verify(&proof, &vk).expect("failed to verify");
            println!("Groth16 verification: OK");

            let mut pv = proof.public_values.clone();
            let n: u32 = pv.read();
            let result: u32 = pv.read();
            println!("fib({}) = {}", n, result);
        } else if args.plonk {
            println!("Running Plonk proving...");
            let start = Instant::now();
            let proof = client
                .prove(&pk, &stdin)
                .plonk()
                .run()
                .expect("failed to generate Plonk proof");
            let prove_time = start.elapsed();

            println!("Plonk proving time: {:?}", prove_time);

            client.verify(&proof, &vk).expect("failed to verify");
            println!("Plonk verification: OK");

            let mut pv = proof.public_values.clone();
            let n: u32 = pv.read();
            let result: u32 = pv.read();
            println!("fib({}) = {}", n, result);
        } else {
            println!("Running STARK proving...");
            let start = Instant::now();
            let proof = client
                .prove(&pk, &stdin)
                .run()
                .expect("failed to generate proof");
            let prove_time = start.elapsed();

            println!("STARK proving time: {:?}", prove_time);

            client.verify(&proof, &vk).expect("failed to verify");
            println!("STARK verification: OK");

            let mut pv = proof.public_values.clone();
            let n: u32 = pv.read();
            let result: u32 = pv.read();
            println!("fib({}) = {}", n, result);
        }
    }
}

fn run_sha256(args: &Args, client: EnvProver) {
    let elf = load_elf(&Program::Sha256);

    // Build input: number of iterations
    let mut stdin = SP1Stdin::new();
    stdin.write(&args.n);

    println!("=== SP1 SHA256 Benchmark ===");
    println!("iterations = {}", args.n);
    println!();

    if args.execute {
        println!("Executing (no proof)...");
        let start = Instant::now();
        let (mut output, report) = client.execute(&elf, &stdin).run().unwrap();
        let exec_time = start.elapsed();

        println!("Execution time: {:?}", exec_time);

        let iterations: u32 = output.read();
        let ok: u32 = output.read();
        println!("iterations = {}, ok = {} (1 = hash correct)", iterations, ok);
        println!(
            "RISC-V instructions (execute): {}",
            report.total_instruction_count()
        );
    } else {
        // For proving, first do a non-zk execution to measure instruction count.
        let stdin_for_exec = stdin.clone();
        let (_, report) = client.execute(&elf, &stdin_for_exec).run().unwrap();
        println!(
            "RISC-V instructions (execute before prove): {}",
            report.total_instruction_count()
        );

        let (pk, vk) = client.setup(&elf);
        println!("Verification key: {}", vk.bytes32());

        if args.groth16 {
            println!("Running Groth16 proving...");
            let start = Instant::now();
            let proof = client
                .prove(&pk, &stdin)
                .groth16()
                .run()
                .expect("failed to generate Groth16 proof");
            let prove_time = start.elapsed();

            println!("Groth16 proving time: {:?}", prove_time);

            client.verify(&proof, &vk).expect("failed to verify");
            println!("Groth16 verification: OK");

            let mut pv = proof.public_values.clone();
            let iterations: u32 = pv.read();
            let ok: u32 = pv.read();
            println!("iterations = {}, ok = {} (1 = hash correct)", iterations, ok);
        } else if args.plonk {
            println!("Running Plonk proving...");
            let start = Instant::now();
            let proof = client
                .prove(&pk, &stdin)
                .plonk()
                .run()
                .expect("failed to generate Plonk proof");
            let prove_time = start.elapsed();

            println!("Plonk proving time: {:?}", prove_time);

            client.verify(&proof, &vk).expect("failed to verify");
            println!("Plonk verification: OK");

            let mut pv = proof.public_values.clone();
            let iterations: u32 = pv.read();
            let ok: u32 = pv.read();
            println!("iterations = {}, ok = {} (1 = hash correct)", iterations, ok);
        } else {
            println!("Running STARK proving...");
            let start = Instant::now();
            let proof = client
                .prove(&pk, &stdin)
                .run()
                .expect("failed to generate proof");
            let prove_time = start.elapsed();

            println!("STARK proving time: {:?}", prove_time);

            client.verify(&proof, &vk).expect("failed to verify");
            println!("STARK verification: OK");

            let mut pv = proof.public_values.clone();
            let iterations: u32 = pv.read();
            let ok: u32 = pv.read();
            println!("iterations = {}, ok = {} (1 = hash correct)", iterations, ok);
        }
    }
}
