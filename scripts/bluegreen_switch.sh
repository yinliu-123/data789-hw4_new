#!/usr/bin/env bash
set -euo pipefail
# Flip the blue-green Service selector between colors (instant, atomic cutover).
# Usage: ./scripts/bluegreen_switch.sh <blue|green>
COLOR="${1:?usage: bluegreen_switch.sh <blue|green>}"
case "$COLOR" in blue|green) ;; *) echo "color must be 'blue' or 'green'"; exit 1;; esac

kubectl patch service trustbank-fraud-bg \
  -p "{\"spec\":{\"selector\":{\"app\":\"trustbank-fraud-bg\",\"color\":\"${COLOR}\"}}}"
echo "✅ trustbank-fraud-bg now routing to → ${COLOR}"
