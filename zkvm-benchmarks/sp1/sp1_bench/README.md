# SP1 Benchmark Workspace

This workspace contains the SP1 guest programs and host runner for the ZEE200
zkVM comparison benchmarks.

Use the scripts in `../scripts/` from `zkvm-benchmarks/sp1`:

```bash
./scripts/build-guests.sh
./scripts/run-stark.sh
./scripts/run-groth16.sh
```

The host runner is in `script/src/bin/main.rs`. It supports:

- `--program fibonacci --n 20`
- `--program fibonacci --n 23`
- `--program mergesort --n 500`
- `--program mergesort --n 5000`
- `--program sha256 --n 10`
- `--program sha256 --n 200`

Use `--prove` for SP1 STARK proofs and `--prove --groth16` for SP1 Groth16
wrapped proofs.
