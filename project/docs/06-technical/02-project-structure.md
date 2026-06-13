# 02 Project Structure

**Estado recomendado:** `READY_FOR_IMPLEMENTATION`  
**Gate operativo aplicable:** `READY_FOR_IMPLEMENTATION` indica madurez documental, no permiso operativo por sí solo. Prevalecen `CURRENT_STATUS.md` y `machine/roadmap_gates.json`. Con el estado global actual `READY_FOR_SPRINT_0`, este documento solo puede guiar tareas permitidas por Sprint 0. No autoriza UI visible, Dashboard, Onboarding ni módulos funcionales hasta alcanzar `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT`.

## Decisión de layout

La baseline `1.2` adopta una raíz runtime limpia, una raíz documental/de control separada y raíces externas para backups/tools de roadmap:

```txt
WAMP_WWW_ROOT = C:/wamp64/www
APP_ROOT = OFFICIAL_REPO_ROOT = C:/wamp64/www/vipweb
PROJECT_CONTROL_ROOT = C:/wamp64/www/vipweb/project
PUBLIC_DOCUMENT_ROOT = C:/wamp64/www/vipweb/public
BACKUP_ROOT = C:/wamp64/www/vipweb_backups
EXTERNAL_ROADMAP_TOOLS_ROOT = C:/wamp64/www/vipweb_tools
EXTERNAL_TOOL_LOG_ROOT = C:/wamp64/www/vipweb_tools/logs
INTERNAL_PROJECT_TOOLS_ROOT = C:/wamp64/www/vipweb/tools
```

Salvo indicación contraria, las rutas `docs/`, `machine/`, `database/`, `scripts/`, `templates/` y `evidence/` son relativas a `PROJECT_CONTROL_ROOT`.

## Estructura esperada bajo WAMP www

```txt
www/
  vipweb/
    public/
    app/
    config/
    project/
    tools/
    logs/
    tmp/
  vipweb_backups/
  vipweb_tools/
    logs/
```

## Estructura esperada en APP_ROOT

```txt
vipweb/
  public/
    index.php
  app/
    Core/
    Modules/
    Shared/
  config/
  project/
  tools/
  logs/
  tmp/
```

## Estructura esperada en PROJECT_CONTROL_ROOT

```txt
project/
  README.md
  CURRENT_STATUS.md
  docs/
  machine/
  database/
    migrations/
    rollbacks/
    seeds/
  scripts/
  templates/
  evidence/
  changelog/
  canonical-baseline/
```

## Diferencia entre tools internas y tools externas

| Carpeta | Naturaleza | Pertenece al proyecto oficial | Propósito |
|---|---:|---:|---|
| `C:/wamp64/www/vipweb/tools` | Interna | Sí | Operaciones propias del producto: reset local, wrappers internos, Doctor wrapper o mantenimiento runtime. |
| `C:/wamp64/www/vipweb_tools` | Externa | No debe depender del runtime del producto | Ejecutar fases del roadmap que GPT/Codex no pueden ejecutar directamente: backups, checks WAMP, export SQL, migraciones, seeds, logs y verificación local. |

Las tools externas no sustituyen a las tools internas. Son una capa operativa de ejecución local para el modelo AI-first.

## Reglas de visibilidad

- `public/` es el único punto previsto para contenido visible.
- WAMP ya está configurado por el owner para servir `C:/wamp64/www/vipweb/public` como carpeta pública; Sprint 0 debe verificar y preservar esta configuración.
- `app/`, `config/`, `project/`, `tools/`, `logs/` y `tmp/` son privados/locales.
- `vipweb_backups/` y `vipweb_tools/` son carpetas hermanas externas y no deben exponerse por navegador.
- No debe existir flujo que sirva directamente `C:/wamp64/www/vipweb` como raíz pública de aplicación.

## Regla de implementación

La estructura detallada del Core Runtime vive en `docs/06-technical/11-core-runtime-skeleton.md`. Esta estructura es el contrato mínimo para iniciar programación sin reinterpretar el core.

Flujo obligatorio para acciones mutables:

```txt
Controller
  → ActionExecutor
    → ActionContractRegistry
    → PermissionGuard
    → ApprovalService si aplica
    → Servicio de dominio
    → AuditLogger
    → EventDispatcher
```

## Reglas

- `machine/` define contratos; `app/` los implementa.
- `scripts/update_script.py` valida sin modificar y vive bajo `PROJECT_CONTROL_ROOT`.
- `evidence/` almacena registros de ejecución local y reportes versionados; no sustituye a `logs/`.
- `changelog/` resume fases cerradas; no sustituye a `evidence/`.
- `tools/` dentro de `vipweb` contiene wrappers internos del proyecto; no sustituye a `scripts/` ni a `vipweb_tools`.
- `vipweb_tools` contiene tools externas de roadmap; debe generar logs por ejecución en `vipweb_tools/logs`.
- `logs/` dentro de `vipweb` contiene salidas crudas generadas por tools internas/scripts.
- `tmp/` contiene artefactos prescindibles y no canónicos.
- `project/canonical-baseline/` es histórico e intocable; no se usa como fuente operativa.
- Cada módulo debe tener carpeta, manifest derivado y rollback cuando proceda.
- Ningún controlador ejecuta mutaciones directamente: siempre pasa por `ActionExecutor`.
- Las aprobaciones runtime pertenecen a `core.audit.ApprovalService`.

## Criterios de validación

El loader debe poder relacionar módulo runtime con `machine/modules.json` y bloquear módulos sin contrato.

El validador actual debe pasar `PROJECT_CLEAN_ROOT_LAYOUT_DECLARED`. Las comprobaciones de `PUBLIC_DOCUMENT_ROOT`, `vipweb_tools` y Git deben ejecutarse localmente durante Sprint 0 mediante logs revisables por GPT.
