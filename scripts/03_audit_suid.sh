#!/usr/bin/env bash
set -euo pipefail

mkdir -p ../evidence

find / -perm -4000 -type f -exec ls -l {} \; 2>/dev/null \
  | tee ../evidence/suid_files.txt >/dev/null

echo "[OK] Saved: evidence/suid_files.txt"

