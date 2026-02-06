#!/usr/bin/env bash
# Adds OLD_ prefix to all .txt files in current directory

shopt -s nullglob
for f in *.txt; do
  # Skip already-renamed files
  [[ "$f" == OLD_* ]] && continue
  mv -- "$f" "OLD_$f"
done
echo "Done renaming .txt files."
