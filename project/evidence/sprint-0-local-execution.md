# Registro de ejecución local de Sprint 0

Este archivo debe completarse durante la ejecución local real de Sprint 0.

## Estado

`LOCAL_SPRINT_0_EVIDENCE_RECORDED_PENDING_S0_013`

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
- Git: operativo; repo oficial con baseline commit existente en rama `main`. Working tree limpio antes de S0-012; durante S0-012 solo se modifica este archivo de evidencia.
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


## Resumen canonico de Sprint 0 previo a S0-012

- S0-000: entorno WAMP/PHP/MariaDB/Apache validado; localhost responde 200; exposicion privada detectada 0.
- S0-000B: estructura externa AI-first validada; vipweb_backups y vipweb_tools fuera del repo oficial.
- S0-001: backup local inicial creado bajo C:/wamp64/www/vipweb_backups.
- S0-002: export SQL inicial cerrado con no_db_declared; no habia base VipWeb previa declarada.
- S0-003: archivo de evidencia local creado o actualizado.
- S0-000A: ADR-026 evaluada; no activada.
- Estabilizacion Git local: repo operativo, rama main, baseline commit existente y working tree limpio al cierre.
- S0-004: estructura base de carpetas creada.
- S0-005: ADRs aceptadas vigentes registradas; queda warning 28 vs 29 ADRs sin corregir.
- S0-006: catalogos JSON vigentes creados.
- S0-007: script de validacion documental canonico mantenido.
- S0-008: configuracion WAMP sin secretos reales creada.
- S0-009: migraciones SQL base existentes validadas; no ejecutadas en esa tarea.
- S0-009A: ledger local schema_migrations validado.
- S0-009B: 26 migraciones aplicadas en base local vipweb; ledger con 26 filas applied y checksum_algorithm=sha256.
- S0-010: seeds SQL iniciales validados; no ejecutados en esa tarea.
- S0-010B: seeds iniciales ejecutados; owner seed privado local aplicado; ai_admin deshabilitado por defecto y no asignado por defecto.
- S0-011: python project/scripts/update_script.py ejecutado en modo readonly con exit=0 y status=passed.

Estado tras este resumen:
- Sprint 0 completo: NO cerrado todavia.
- Siguiente tarea pendiente: S0-013.
- Desarrollo visible: NO autorizado.
- Roadmap modificado durante S0-012: no.
- Machine-readable modificado durante S0-012: no.
- ADR-026 activada durante S0-012: no.
## S0-012 — Completar evidencia inicial canónica manualmente

Estado: evidencia inicial registrada; pendiente de revisión GPT para cierre de S0-012.

Evidencia completada durante S0-012 mediante edición automática controlada y autorizada explícitamente por el usuario humano en este chat.

Confirmaciones:
- Sprint 0 completo: NO cerrado todavía.
- Siguiente tarea pendiente: S0-013 — Validar matriz de trazabilidad y cerrar Sprint 0.
- ADR-026: NO activada.
- Codex usado en S0-012: no.
- Roadmap modificado en S0-012: no.
- Machine-readable modificado en S0-012: no.
- Migraciones ejecutadas en S0-012: no.
- Seeds ejecutados en S0-012: no.
- UI visible desarrollada: no.
- Funcionalidades visibles desarrolladas: no.
- Secretos reales incluidos en esta evidencia: no.

Ejecución S0-012:
- Fecha/hora local: 2026-06-15 22:08:40.
- Tool externa: manual-evidence-completion-v4-auto.
- Ruta de log externo: C:\wamp64\www\vipweb_tools\logs\2026-06-15_220838__S0-012__manual-evidence-completion-v4-auto.
- Resultado: pendiente de revisión GPT tras corrección v5b.

Evidencia local ya revisada:
- S0-009B ejecutó 26 migraciones en base de datos local `vipweb`.
- `schema_migrations` quedó con 26 filas `applied` y `checksum_algorithm=sha256`.
- S0-010B ejecutó seeds iniciales sobre `vipweb`.
- Conteos revisados tras seeds: `users=1`, `roles=8`, `permissions=30`, `modules=15`, `system_settings=7`.
- Owner seed privado local aplicado.
- `ai_admin` permanece `disabled_by_default` y no asignado por defecto.
- S0-011 ejecutó `python project\scripts\update_script.py` con `exit=0` y `status=passed`.
- Git quedó limpio al cierre de S0-011.

Warning vigente no corregido:
- S0-005: `project/machine/sprint0_tasks.json` declara 28 ADRs aceptadas para S0-005, pero decision log y `machine/decisions.json` declaran 29.
- No se modifica roadmap ni machine-readable durante S0-012.

Restricción vigente:
- Mientras S0-013 no cierre Sprint 0, el estado operativo permanece antes de desarrollo visible.
- No se autoriza UI visible, Dashboard, Onboarding ni módulos funcionales.
