# Registro de ejecución local de Sprint 0

Este archivo debe completarse durante la ejecución local real de Sprint 0.

## Estado

`PENDING_LOCAL_EXECUTION`

## Propósito

Registrar evidencia operativa local antes de declarar cualquier avance hacia desarrollo visible.

## Datos requeridos

- Fecha de ejecución.
- Responsable humano.
- Ruta local del proyecto: `C:/wamp64/www/vipweb`.
- Confirmación de que `C:/wamp64/www/vipweb` es el repo oficial Git.
- Rama Git vigente.
- Commit baseline antes del primer cambio protegido preparado por IA.
- Resultado de `git status` antes/después de cambios protegidos.
- Confirmación de public root WAMP: `C:/wamp64/www/vipweb/public`.
- Verificación de que carpetas privadas no son accesibles por navegador.
- Versión de Apache en WAMP.
- Versión de PHP en WAMP.
- Versión de MySQL/MariaDB en WAMP.
- Resultado de creación/verificación de estructura local.
- Ruta de `C:/wamp64/www/vipweb_backups` usada para backups.
- Ruta de `C:/wamp64/www/vipweb_tools/logs` y logs revisados por GPT.
- Resultado de ejecución de migraciones.
- Resultado de ejecución de seeds.
- Confirmación de sustitución local segura del owner seed.
- Resultado de `python scripts/update_script.py` desde `PROJECT_CONTROL_ROOT` o `python project/scripts/update_script.py` desde `APP_ROOT`.
- Bloqueos encontrados.
- Confirmación humana del gate.

## Logs externos de tools

Registrar por cada ejecución relevante:

```txt
Fecha/hora:
Task ID:
Tool ID:
Ruta de log:
Status reportado:
Revisión GPT:
Decisión humana:
```

## Restricción

Mientras este archivo no contenga evidencia local real y verificada, el estado operativo permanece en `READY_FOR_SPRINT_0` y no en `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT`.

## S0-002 — Exportar SQL inicial si existe base de datos

- Resultado: passed / no_db_declared
- Backup base: C:\wamp64\www\vipweb_backups\2026-06-13_184918__S0-001__initial-local-backup
- Evidencia S0-002: C:\wamp64\www\vipweb_backups\2026-06-13_184918__S0-001__initial-local-backup\database\S0-002_no-db.txt
- Log externo: C:\wamp64\www\vipweb_tools\logs\2026-06-13_185552__S0-002__export-sql
- Migraciones ejecutadas: no
- Seeds ejecutados: no
## Regla de uso local

- Registrar aquí solo evidencia local real ya ejecutada o validada.
- No declarar tareas como cerradas sin log, reporte o evidencia verificable.
- No registrar secretos reales, contraseñas ni datos sensibles.
- No sustituye a Git ni a backups; complementa el control operativo mientras Sprint 0 está en curso.

## Punto de partida local

- APP_ROOT: C:/wamp64/www/vipweb
- PROJECT_CONTROL_ROOT: C:/wamp64/www/vipweb/project
- PUBLIC_ROOT: C:/wamp64/www/vipweb/public
- BACKUP_ROOT: C:/wamp64/www/vipweb_backups
- EXTERNAL_ROADMAP_TOOLS_ROOT: C:/wamp64/www/vipweb_tools
- EXTERNAL_TOOL_LOG_ROOT: C:/wamp64/www/vipweb_tools/logs
- Git: obligatorio para el modelo AI-first, pero todavía sin commits según contexto operativo previo.
- ADR-026: no activada.

### S0-003 — Crear o actualizar evidence/sprint-0-local-execution.md

- Fecha local: 2026-06-13 19:10:48 +02:00
- Objetivo: asegurar el registro operativo manual de Sprint 0.
- Estado de ejecución: executed_pending_gpt_validation
- Evidencia modificada: C:/wamp64/www/vipweb/project/evidence/sprint-0-local-execution.md
- Backup inicial registrado: C:/wamp64/www/vipweb_backups/2026-06-13_184918__S0-001__initial-local-backup
- SQL inicial registrado: no_db_declared
- Evidencia SQL inicial: C:/wamp64/www/vipweb_backups/2026-06-13_184918__S0-001__initial-local-backup/database/S0-002_no-db.txt
- Log externo S0-002: C:/wamp64/www/vipweb_tools/logs/2026-06-13_185552__S0-002__export-sql
- Regla aplicada: no cerrar tareas sin log/reporte; no desarrollar UI; no ejecutar migraciones; no ejecutar seeds; no activar ADR-026 en esta tarea.
