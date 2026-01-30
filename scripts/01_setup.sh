#!/usr/bin/env bash
set -euo pipefail

# Prechecks: fallar si no existen usuarios/grupos del lab
id prof1 >/dev/null
id alum1 >/dev/null
getent group profesores >/dev/null
getent group alumnos >/dev/null

# Crear estructura de directorios
mkdir -p /data/profesores /data/alumnos

# Asignar propietario y grupo
chown root:profesores /data/profesores
chown root:alumnos /data/alumnos

# Permisos: SGID + rwx para owner/grupo, nada para otros
chmod 2770 /data/profesores
chmod 2770 /data/alumnos

# Contenido demo para probar herencia de grupo (SGID)
sudo -u prof1 bash -c 'umask 007; mkdir -p /data/profesores/prof1_dir; echo "profs" > /data/profesores/prof1_dir/note.txt'
sudo -u alum1 bash -c 'umask 007; mkdir -p /data/alumnos/alum1_dir; echo "alumnos" > /data/alumnos/alum1_dir/note.txt'

echo "[OK] setup completed"

