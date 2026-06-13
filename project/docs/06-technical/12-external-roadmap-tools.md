# 12 External Roadmap Tools

**Estado recomendado:** `CANONICAL`  
**Fuente machine-readable:** `machine/external_tool_contracts.json`.

## Propósito

Definir la capa de tools externas que permite ejecutar el roadmap de VipWeb con un modelo AI-first aunque GPT/Codex no puedan operar directamente sobre Windows, WAMP, MySQL/MariaDB o el filesystem local del owner.

## Raíces

```txt
WAMP_WWW_ROOT = C:/wamp64/www
OFFICIAL_REPO_ROOT = C:/wamp64/www/vipweb
PUBLIC_DOCUMENT_ROOT = C:/wamp64/www/vipweb/public
BACKUP_ROOT = C:/wamp64/www/vipweb_backups
EXTERNAL_ROADMAP_TOOLS_ROOT = C:/wamp64/www/vipweb_tools
EXTERNAL_TOOL_LOG_ROOT = C:/wamp64/www/vipweb_tools/logs
INTERNAL_PROJECT_TOOLS_ROOT = C:/wamp64/www/vipweb/tools
```

## Separación obligatoria

| Capa | Ruta | Propósito |
|---|---|---|
| Proyecto oficial | `C:/wamp64/www/vipweb` | Código, documentación canónica, contratos y runtime. Debe estar bajo Git. |
| Tools internas | `C:/wamp64/www/vipweb/tools` | Operaciones propias del proyecto y wrappers internos. |
| Backups externos | `C:/wamp64/www/vipweb_backups` | Copias recuperables fuera del repo oficial. |
| Tools externas | `C:/wamp64/www/vipweb_tools` | Ejecutar tareas de roadmap que necesitan acceso local real. |
| Logs externos | `C:/wamp64/www/vipweb_tools/logs` | Evidencia cruda de cada ejecución externa. |

## Regla de independencia

Cada tool externa debe poder ejecutarse con `.bat` o `.cmd`. Puede delegar en PowerShell, PHP, Python, MySQL CLI o utilidades de Windows, pero el punto de entrada para el owner debe ser un archivo lanzable directamente.

Cada tool debe declarar:

- `tool_id`;
- fase/tarea de roadmap asociada;
- objetivo;
- entradas requeridas;
- raíces donde puede escribir;
- raíces donde no puede escribir;
- si requiere backup previo;
- si requiere Git limpio;
- si es destructiva;
- si es idempotente;
- outputs esperados;
- formato de log;
- criterio de revisión GPT.

## Formato de log por ejecución

Cada ejecución debe crear una carpeta nueva:

```txt
C:/wamp64/www/vipweb_tools/logs/YYYY-MM-DD_HHMMSS__TASK-ID__tool-name/
```

Contenido mínimo recomendado:

```txt
run.log
result.json
stdout.txt
stderr.txt
context.json
files_created.json
files_modified.json
git_status_before.txt
git_status_after.txt
```

Reglas:

- No sobrescribir logs anteriores.
- No borrar logs automáticamente.
- El log más reciente se pasa a GPT para revisión.
- Tools futuras pueden leer logs anteriores como contexto operativo.
- La tool no puede declarar una fase como validada; solo puede reportar hechos.
- La evidencia canónica puede generarse como borrador, pero la validación final es humana.

## WAMP public root

El owner ha declarado que WAMP ya sirve `C:/wamp64/www/vipweb/public` como carpeta pública.

La tool externa de Sprint 0 debe verificar:

1. existe `C:/wamp64/www/vipweb/public`;
2. la URL local responde desde `public/`;
3. `app/`, `config/`, `project/`, `database/`, `machine/`, `evidence/`, `vipweb_backups/` y `vipweb_tools/` no son accesibles públicamente;
4. no se ha configurado Apache para servir la raíz privada del proyecto.

## Límite de autoridad

Una tool externa puede:

- leer versiones reales del entorno;
- crear backups;
- exportar SQL;
- ejecutar comandos locales autorizados;
- ejecutar migraciones/seeds cuando exista tarea y backup;
- ejecutar validadores readonly;
- escribir logs externos.

Una tool externa no puede:

- marcar `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT`;
- inventar aprobación humana;
- sustituir `ApprovalRecord`;
- declarar ADR-026 activa sin activation_record real;
- borrar backups antiguos automáticamente;
- escribir secretos en logs;
- exponer carpetas privadas vía navegador;
- aplicar cambios protegidos preparados por IA si falta gate.

## Revisión GPT

Después de cada ejecución:

1. El owner pega o sube el log más reciente.
2. GPT compara `result.json`, `run.log`, salidas y contrato esperado.
3. GPT indica si la tool hizo lo esperado, si hay bloqueo o si debe repetirse.
4. El owner registra manualmente la evidencia relevante en `evidence/sprint-0-local-execution.md`.

## Contrato machine-readable

La fuente estructurada de esta política está en `machine/external_tool_contracts.json`.
