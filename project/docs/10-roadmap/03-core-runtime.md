
# Fase 2 — Core Runtime

**Estado recomendado:** `READY_FOR_IMPLEMENTATION`
**Gate operativo aplicable:** `READY_FOR_IMPLEMENTATION` indica madurez documental, no permiso operativo por sí solo. Prevalecen `CURRENT_STATUS.md` y `machine/roadmap_gates.json`. Con el estado global actual `READY_FOR_SPRINT_0`, este documento solo puede guiar tareas permitidas por Sprint 0. No autoriza UI visible, Dashboard, Onboarding ni módulos funcionales hasta alcanzar `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT`.
  
**Fuente canónica:** `machine/roadmap_gates.json`.

## Objetivo
Cerrar `Core Runtime` con evidencias verificables antes de avanzar.

## Entrada obligatoria
- Technical Skeleton cerrado
- migraciones ordenadas
- `schema_migrations` ledger aplicado
- migraciones iniciales ejecutadas localmente
- seeds iniciales ejecutados localmente

## Salida obligatoria
- identity/session runtime
- permissions
- modules
- events
- audit
- config
- doctor runtime

## No se puede avanzar si falta
- RBAC
- event dispatcher
- module loader

## Módulos afectados
- `core.identity`
- `core.permissions`
- `core.modules`
- `core.events`
- `core.audit`
- `core.config`
- `core.doctor`

## Evidencia esperada
- `identity-runtime-report`
- `migration-report`
- `seed-report`
- `doctor-runtime-report`

## Criterios de validación
Doctor debe pasar `ROADMAP_PHASES_HAVE_FULL_GATES` y la evidencia de la fase debe quedar registrada antes de ejecutar la siguiente.


## Endurecimiento operativo post-auditoría

La fase Core Runtime debe cerrar explícitamente antes de `MVP UX Skeleton`:

- `ApprovalService` transversal en `core.audit`;
- consumo atómico de `ApprovalRecord`;
- `ActionExecutor` + `ActionContractRegistry`;
- skeleton PHP mínimo según `docs/06-technical/11-core-runtime-skeleton.md`;
- `USER_PROVISION_CONTROLLED` para crear usuarios `registered_user` sin auto-registro público;
- `DoctorRuntime` readonly sin escritura automática de evidencia.

## Vertical slices obligatorios

1. `VS-CORE-001` — Login/logout + RBAC + Audit + Event.
2. `VS-CORE-002` — ApprovalService + acción crítica de prueba.
3. `VS-CORE-003` — ModuleLoader + Doctor runtime readonly.
4. `VS-CORE-004` — Provisionamiento controlado MVP.

## Tareas P0 trazadas de Core Runtime

Además de las salidas funcionales de la fase, las tareas P0 de hardening runtime deben quedar enlazadas en backlog, trazabilidad, cobertura MVP/gates y Doctor:

- `C1-000A` — provisionamiento controlado MVP.
- `C1-000B` — AppKernel, Router y Request/Response.
- `C1-000C` — ActionExecutor y ActionContractRegistry.
- `C1-003A` — EventRegistry y EventDispatcher transaccional.
- `C1-004A` — ApprovalService runtime.
- `C1-006A` — DoctorRuntime wrapper readonly.
- `C1-007` — suite runtime derivada de `machine/runtime_test_matrix.json`.

Doctor valida esta trazabilidad mediante `P0_BACKLOG_ITEMS_ARE_TRACEABLE`, `P0_BACKLOG_ITEMS_HAVE_MVP_OR_GATE_COVERAGE` y `HUMAN_BACKLOG_MATCHES_MACHINE_BACKLOG_FOR_P0`.

## Cierre de capacidades endurecidas

El cierre de Core Runtime no debe basarse únicamente en tareas base cuando exista una tarea endurecida asociada en `machine/backlog_items.json`.

Reglas aplicables:

- `core.events` se considera listo para fases posteriores cuando `C1-003A` esté cerrado o exista una excepción explícita aprobada.
- `core.doctor` se considera listo para fases posteriores cuando `C1-006A` esté cerrado o exista una excepción explícita aprobada.
- Las tareas `C1-003` y `C1-006` permanecen como referencia consolidada/base, pero no sustituyen por sí solas al objetivo operativo endurecido.
- El Doctor debe poder detectar relaciones `superseded_by`/`supersedes` inconsistentes en backlog machine-readable.

## Primer tramo granular recomendado

Antes de avanzar hacia UI visible o módulos funcionales, Core Runtime debe cerrar el microbacklog técnico `C1-008` a `C1-014`:

1. HTTP kernel/router/request/response.
2. `PdoConnection` seguro con prepared statements.
3. `ActionContractRegistry`.
4. `ActionExecutor` no IA.
5. Autorización IA estructural con `ai_roles`, sin activar acciones AI-2 sensibles.
6. Primer evento `user.logged_in` con envelope v1.
7. Auditoría mínima acción/evento.

Este tramo reduce riesgo de rediseño y mantiene bloqueadas Dashboard, Onboarding visual, gamificación visible e integraciones reales hasta sus gates correspondientes.
