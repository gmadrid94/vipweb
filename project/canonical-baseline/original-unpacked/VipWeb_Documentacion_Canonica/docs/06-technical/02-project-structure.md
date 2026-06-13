# 02 Project Structure

**Estado recomendado:** `READY_FOR_IMPLEMENTATION`
**Gate operativo aplicable:** `READY_FOR_IMPLEMENTATION` indica madurez documental, no permiso operativo por sí solo. Prevalecen `CURRENT_STATUS.md` y `machine/roadmap_gates.json`. Con el estado global actual `READY_FOR_SPRINT_0`, este documento solo puede guiar tareas permitidas por Sprint 0. No autoriza UI visible, Dashboard, Onboarding ni módulos funcionales hasta alcanzar `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT`.


## Estructura esperada
```txt
/public
  index.php
/app
  /Core
    /Bootstrap
    /Http
    /Database
    /Identity
    /Permissions
    /Actions
    /Audit
    /Events
    /Modules
    /Config
    /Doctor
  /Modules
  /Shared
/config
/database
  /migrations
  /rollbacks
  /seeds
/docs
/machine
/scripts
/templates
/evidence
```

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

- `/machine` define contratos; `/app` los implementa.
- `/scripts/update_script.py` valida sin modificar.
- `/evidence` almacena reportes versionados, no estados inventados.
- Cada módulo debe tener carpeta, manifest derivado y rollback.
- Ningún controlador ejecuta mutaciones directamente: siempre pasa por `ActionExecutor`.
- Las aprobaciones runtime pertenecen a `core.audit.ApprovalService`.

## Criterios de validación

El loader debe poder relacionar módulo runtime con `machine/modules.json` y bloquear módulos sin contrato.

Doctor debe pasar `CORE_RUNTIME_SKELETON_DECLARED`.
