#!/bin/sh
# Runs `docker compose down` in each subdirectory beside this script.
# Place this file in /mnt/ssdpool/appdata and execute it.

set -u

# Base directory = directory of this script
ROOT="$(cd "$(dirname "$0")" && pwd)"

found=0
for d in "$ROOT"/*/; do
  [ -d "$d" ] || continue
  found=1
  echo ">>> $d"
  (
    cd "$d" && docker compose down --remove-orphans
  ) || {
    code=$?
    echo "!! failed in $d (exit $code)"
  }
done

[ "$found" -eq 0 ] && echo "No subdirectories found under $ROOT"
echo "Done."
