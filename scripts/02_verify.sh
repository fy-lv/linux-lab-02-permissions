#!/usr/bin/env bash
set -euo pipefail

# Prechecks
id prof1 >/dev/null
id alum1 >/dev/null
getent group profesores >/dev/null
getent group alumnos >/dev/null
test -d /data/profesores
test -d /data/alumnos

echo "== Users & groups =="
id prof1
id alum1
echo

echo "== Directory perms (expect drwxrws---) =="
ls -ld /data/profesores /data/alumnos
echo

echo "== SGID inheritance check =="
ls -l /data/profesores/prof1_dir/note.txt
ls -l /data/alumnos/alum1_dir/note.txt
echo

echo "== Negative test: alum1 should NOT list /data/profesores =="
if sudo -u alum1 ls /data/profesores >/dev/null 2>&1; then
  echo "[FAIL] alum1 accessed /data/profesores (should be denied)"
  exit 1
else
  echo "[OK] Permission denied as expected."
fi
echo

echo "== Demo chown -R and chmod -R g+rwX =="
mkdir -p /data/profesores/shared/subdir
touch /data/profesores/shared/file1.txt
touch /data/profesores/shared/subdir/file2.txt

chown -R root:profesores /data/profesores/shared
chmod -R g+rwX /data/profesores/shared

echo "Tree permissions:"
find /data/profesores/shared -maxdepth 2 -printf "%M %u:%g %p\n"
echo

echo "[OK] Verification completed."

