# Lab 02 — Managing Permissions (AlmaLinux 9.6)

## Objetivo
1. Crear `/data/profesores` y `/data/alumnos`:
- miembros del grupo: lectura/escritura total
- otros: sin permisos
- todo lo creado dentro hereda el grupo (SGID)

2. Listar archivos con permiso SUID.

3. Demostrar uso de `chown -R` y `chmod -R g+rwX` (X mayúscula).

## Entorno
- AlmaLinux 9.6
- Usuarios del lab: `prof1`, `alum1`
- Grupos del lab: `profesores`, `alumnos`

---

## Ejecución
```bash
cd scritps
sudo bash 01_setup.sh
sudo bash 02_verify.sh
sudo bash 03_audit_suid.sh

```

