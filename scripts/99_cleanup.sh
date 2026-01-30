#!/usr/bin/env bash
set -euo pipefail

rm -rf /data/profesores /data/alumnos
rm -f ../evidence/suid_files.txt

echo "[OK] Cleanup completed (users/groups kept)."

