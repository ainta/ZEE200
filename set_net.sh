#!/usr/bin/env bash
set -euo pipefail

# Configure local network bandwidth and delay using tc.
# Usage:
#   IF=<iface> ./set_net.sh <rate_mbit:100|500|1000> <one_way_delay_ms>
# By default IF=lo (loopback). The delay is one-way; RTT is roughly 2×delay.
#
# Example: ~1 Gbit/s, ~2 ms RTT on loopback:
#   ./set_net.sh 1000 1

RATE_MBIT="${1:?usage: $0 <rate_mbit:100|500|1000> <delay_ms>}"
DELAY_MS="${2:?usage: $0 <rate_mbit:100|500|1000> <delay_ms>}"
IF="${IF:-lo}"

# Burst size chosen to be roughly ~10 ms worth of traffic at the given rate.
case "$RATE_MBIT" in
  100)  BURST="128kb"  ;;
  500)  BURST="640kb"  ;;
  1000) BURST="1280kb" ;;
  *)    BURST="256kb"  ;;
esac

# Reset any existing qdisc configuration on the interface.
sudo tc qdisc del dev "$IF" root 2>/dev/null || true

# Root: TBF (Token Bucket Filter) to cap bandwidth.
sudo tc qdisc add dev "$IF" root handle 1: tbf rate "${RATE_MBIT}mbit" burst "$BURST" latency 400ms

# Child: netem to inject delay.
sudo tc qdisc add dev "$IF" parent 1:1 handle 10: netem delay "${DELAY_MS}ms"

echo "Applied: ${RATE_MBIT}mbit, ${DELAY_MS}ms (one-way) on $IF (RTT ≈ $((DELAY_MS * 2)) ms)"
sudo tc -s qdisc show dev "$IF"
