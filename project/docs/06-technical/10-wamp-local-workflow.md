# Workflow local Windows/WAMP

## Estado vigente

VipWeb se desarrollará inicialmente en un servidor local Windows con WAMP y modelo local AI-first asistido por GPT, Codex y tools externas.

```txt
Windows
WAMP
Apache
PHP
MySQL/MariaDB
WAMP_WWW_ROOT = C:/wamp64/www
APP_ROOT = OFFICIAL_REPO_ROOT = C:/wamp64/www/vipweb
PROJECT_CONTROL_ROOT = C:/wamp64/www/vipweb/project
PUBLIC_DOCUMENT_ROOT = C:/wamp64/www/vipweb/public
BACKUP_ROOT = C:/wamp64/www/vipweb_backups
EXTERNAL_ROADMAP_TOOLS_ROOT = C:/wamp64/www/vipweb_tools
EXTERNAL_TOOL_LOG_ROOT = C:/wamp64/www/vipweb_tools/logs
Git requerido para el proyecto oficial en modo AI-first
Sin despliegue externo
sin secretos reales en documentación o configuración local
```

## Hecho operativo local declarado

WAMP ya está configurado por el owner para mostrar `C:/wamp64/www/vipweb/public` como carpeta pública. Sprint 0 debe verificarlo y registrar evidencia, no rediseñarlo.

## Regla principal

Antes de tocar código, estructura, base de datos, permisos, scripts o documentación crítica:

> Crear copia completa de carpeta + exportar SQL si existe base de datos + confirmar Git limpio cuando el cambio sea protegido o preparado por IA.

## Estructura local recomendada

```txt
C:/wamp64/www/vipweb/
C:/wamp64/www/vipweb_backups/
C:/wamp64/www/vipweb_tools/
C:/wamp64/www/vipweb_tools/logs/
```

Cada backup importante debe contener:

```txt
/project_files
/database/vipweb_backup.sql
/project/evidence/sprint-0-local-execution.md
/logs
/metadata
```

## Raíz limpia

La raíz local del proyecto oficial debe permanecer limitada a:

```txt
vipweb/
  public/
  app/
  config/
  project/
  tools/
  logs/
  tmp/
```

Los directorios canónicos `docs/`, `machine/`, `database/`, `scripts/`, `templates/` y `evidence/` viven dentro de `project/`. Las rutas documentales se escriben relativas a `PROJECT_CONTROL_ROOT` para no romper manifests ni referencias internas.

## Tools internas y externas

- `C:/wamp64/www/vipweb/tools`: tools internas del proyecto, versionadas con el repo oficial.
- `C:/wamp64/www/vipweb_tools`: tools externas para ejecutar fases del roadmap que GPT/Codex no pueden realizar directamente.
- `C:/wamp64/www/vipweb_tools/logs`: logs inmutables por ejecución que se pasan a GPT.

## Flujo obligatorio antes de cambios

1. Confirmar tarea/gate vigente en `CURRENT_STATUS.md` y `machine/roadmap_gates.json`.
2. Ejecutar la tool externa correspondiente cuando la tarea requiera acceso local real.
3. Guardar su log en `C:/wamp64/www/vipweb_tools/logs`.
4. Pasar el log más reciente a GPT para revisión.
5. Copiar `C:/wamp64/www/vipweb/` a una carpeta de backup con fecha y motivo cuando aplique.
6. Exportar SQL si existe base de datos local.
7. Registrar el cambio previsto en `evidence/sprint-0-local-execution.md`.
8. Ejecutar `python project/scripts/update_script.py` desde `APP_ROOT` o `python scripts/update_script.py` desde `PROJECT_CONTROL_ROOT`.
9. Confirmar `git status` limpio antes de cambios protegidos preparados por IA.
10. Aplicar cambios permitidos por el gate vigente.
11. Repetir validación readonly.
12. Registrar manualmente resultados relevantes en `evidence/sprint-0-local-execution.md`.

## Rollback manual

1. Parar WAMP si hace falta.
2. Renombrar carpeta rota: `vipweb_broken_YYYY-MM-DD`.
3. Copiar backup bueno como `vipweb`.
4. Restaurar SQL desde backup si procede.
5. Reiniciar WAMP.
6. Probar navegador local.
7. Registrar restauración en `evidence/sprint-0-local-execution.md`.
8. Conservar logs externos de la ejecución que provocó el rollback.

## Git en modo AI-first

El proyecto oficial `C:/wamp64/www/vipweb` debe estar enlazado a Git.

Esto no elimina los backups. Git aporta diff, baseline y trazabilidad de cambios preparados por IA. Los backups aportan recuperación completa de carpeta y base SQL.

Antes de aplicar cambios protegidos preparados por IA debe existir:

- `S0-000A` cerrado;
- ADR-026 activada por owner humano si aplica el trigger;
- backup completo;
- export SQL si existe base local;
- commit baseline real;
- working tree limpio;
- Doctor/validador readonly previo y posterior;
- ApprovalRecord cuando corresponda;
- evidencia local.

## Modo de desarrollo

El objetivo operativo para este roadmap es:

```txt
development_mode = ai_prepared_changes_enabled
```

Pero el modo solo queda operativo para cambios protegidos cuando `S0-000A` registre los datos locales reales y se cumpla ADR-026.

La IA puede detectar el bloqueo y preparar el borrador de activación. No puede activar ADR-026, crear ApprovalRecord humano ni declarar commit baseline.

## Regla de logs externos

Cada tool externa debe crear una carpeta nueva:

```txt
C:/wamp64/www/vipweb_tools/logs/YYYY-MM-DD_HHMMSS__TASK-ID__tool-name/
```

El log de cada ejecución se revisa con GPT antes de avanzar. Los logs anteriores se conservan para que futuras tools puedan leerlos como contexto.

## Regla de versión PHP

- `runtime_target_php_version`: PHP 8.4+.
- `runtime_minimum_php_version`: la versión instalada en WAMP local y registrada en evidencia.
- `runtime_verified_php_version`: resultado de `php -v` capturado en Sprint 0.
- Hasta verificar el entorno, el código runtime debe evitar sintaxis o features específicas de PHP 8.4.

## Regla de backup de evidencias

Todo backup operativo debe conservar conjuntamente:

- `project/evidence/sprint-0-local-execution.md`
- logs relevantes bajo `logs/` si existen
- logs externos relevantes bajo `C:/wamp64/www/vipweb_tools/logs`
- SQL exportado si existe base local

La ruta directa sin carpeta fechada no es canónica y no debe usarse como ejemplo operativo.
