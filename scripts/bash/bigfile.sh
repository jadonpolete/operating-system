#!/usr/bin/env bash
# Usage: ./task1_bigfile.sh <filename>

set -euo pipefail

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 <filename>"
  exit 1
fi

file="$1"
limit=1048576

if [[ ! -e "$file" ]]; then
  echo "Error: File does not exist: $file"
  exit 1
fi

size=$(stat -c%s "$file")
if (( size > limit )); then
  echo "Warning: File is too large (${size} bytes)"
else
  echo "File size is within limits (${size} bytes)"
fi
