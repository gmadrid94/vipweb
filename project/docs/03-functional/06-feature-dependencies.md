# Dependencias funcionales

**Estado recomendado:** `READY_FOR_IMPLEMENTATION`  
**Gate operativo aplicable:** `READY_FOR_IMPLEMENTATION` indica madurez documental, no permiso operativo por sí solo. Prevalecen `CURRENT_STATUS.md` y `machine/roadmap_gates.json`. Con el estado global actual `READY_FOR_SPRINT_0`, este documento solo puede guiar tareas permitidas por Sprint 0. No autoriza UI visible, Dashboard, Onboarding ni módulos funcionales hasta alcanzar `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT`.

## Fuente canónica

La fuente canónica de dependencias ejecutables es `machine/backlog_items.json`.

Este documento es una **vista humana derivada**. Si existe divergencia, prevalece `machine/backlog_items.json` y debe corregirse esta tabla antes de usarla para planificar Sprint 0, Core Runtime o fases visibles.

## Reglas de uso

- No se implementa una tarea si sus dependencias documentales o machine-readable no existen y Doctor no puede validarlas.
- Ninguna tarea visible (`UX2-*`, `G3-*`, `A3-*`, `AI3-*`, `I3-*`) autoriza desarrollo funcional mientras el gate global siga en `READY_FOR_SPRINT_0`.
- Las tareas endurecidas reemplazan operativamente a las tareas base cuando existe relación de sustitución explícita.
- Las referencias a tareas base (`C1-003`, `C1-006`) solo son consolidadas o preparatorias si existe tarea endurecida asociada.

## Tabla sincronizada con `machine/backlog_items.json`

| ID | Tarea | Módulo | Prioridad | Fase | Dependencias | Evidencia |
|---|---|---|---|---|---|---|
| C1-000 | Implementar identity/session runtime | `core.identity` | P0 | 2 | S0-013, S0-006, machine/entities.json, machine/permissions.json | identity-runtime-report |
| C1-000A | Implementar provisionamiento controlado MVP | `core.identity` | P0 | 2 | S0-013, C1-000, C1-002, C1-004A, machine/action_contracts.json, machine/route_permission_matrix.json | controlled-provisioning-report |
| C1-000B | Crear AppKernel, Router y Request/Response | `core.config` | P0 | 2 | S0-013, S0-006, docs/06-technical/11-core-runtime-skeleton.md | core-http-runtime-report |
| C1-000C | Implementar ActionExecutor y ActionContractRegistry | `core.permissions` | P0 | 2 | S0-013, C1-000B, machine/action_contracts.json, machine/route_permission_matrix.json | action-executor-report |
| C1-001 | Implementar loader de módulos | `core.modules` | P0 | 2 | S0-006, S0-013 | module-loader-report |
| C1-002 | Implementar guards de permisos | `core.permissions` | P0 | 2 | S0-013, C1-000, machine/permissions.json, machine/roles.json, machine/route_permission_matrix.json | rbac-seed-report |
| C1-003 | Implementar event dispatcher interno | `core.events` | P0 | 2 | S0-013, machine/events.json | event-dispatcher-report |
| C1-003A | Implementar EventRegistry y EventDispatcher transaccional | `core.events` | P0 | 2 | S0-013, C1-000C, machine/events.json | event-dispatcher-report |
| C1-004 | Implementar audit log base | `core.audit` | P0 | 2 | S0-013, C1-003A | audit-log-report |
| C1-004A | Implementar ApprovalService runtime | `core.audit` | P0 | 2 | S0-013, C1-004, machine/entities.json, machine/action_contracts.json, docs/05-domain-data/06-approval-records.md | approval-runtime-report |
| C1-005 | Implementar config registry | `core.config` | P0 | 2 | S0-013, machine/modules.json | config-registry-report |
| C1-006 | Implementar Doctor runtime wrapper | `core.doctor` | P0 | 2 | S0-013, C1-000, machine/ai_approval_policy.json, machine/permissions.json, scripts/update_script.py | doctor-runtime-report |
| C1-006A | Implementar DoctorRuntime wrapper readonly | `core.doctor` | P0 | 2 | S0-013, C1-000C, C1-004A, scripts/update_script.py | doctor-runtime-report |
| C1-007 | Implementar suite runtime desde matriz de tests por acción | `core.doctor` | P0 | 2 | S0-013, C1-000C, machine/action_contracts.json, machine/runtime_test_matrix.json | runtime-test-matrix-report |
| C1-008 | Crear AppKernel, Request, Response y Router mínimos | `core.config` | P1 | 2 | S0-013, C1-000B | core-http-runtime-minimal-report |
| C1-009 | Crear PdoConnection y configuración local segura | `core.data` | P1 | 2 | S0-013, C1-008 | pdo-connection-security-report |
| C1-010 | Crear ActionContractRegistry | `core.permissions` | P1 | 2 | S0-013, C1-008 | action-contract-registry-report |
| C1-011 | Crear ActionExecutor mínimo para acción no IA | `core.permissions` | P1 | 2 | S0-013, C1-010, C1-002 | action-executor-non-ai-report |
| C1-012 | Añadir autorización IA estructural sin activar acciones sensibles | `ai_assistant` | P1 | 2 | S0-013, C1-010, machine/action_contracts.json, machine/route_permission_matrix.json | ai-role-authorization-structural-report |
| C1-013 | Emitir user.logged_in con envelope v1 | `core.events` | P1 | 2 | S0-013, C1-011, C1-003A, machine/events.json | user-logged-in-event-report |
| C1-014 | Persistir auditoría básica de acción/evento | `core.audit` | P1 | 2 | S0-013, C1-011, C1-013, C1-004 | audit-event-persistence-report |
| G3-001A | Motor mínimo de progreso | `gamification` | P1 | 3 | C1-003A, UX2-003, machine/screen_component_contracts.json | gamification-rules-report |
| G3-001B | Enriquecimiento visual de gamificación | `gamification` | P2 | 3 | G3-001A, UX2-007, machine/screen_component_contracts.json | dashboard-enrichment-report |
| UX2-001 | AppShell base | `dashboard` | P1 | 3 | C1-001, C1-002, machine/screen_component_contracts.json | appshell-report |
| UX2-002 | Pantalla login/logout básico | `core.identity` | P1 | 3 | C1-000, C1-002, UX2-001, machine/screen_component_contracts.json | auth-ui-e2e-report |
| UX2-003 | Onboarding progresivo | `onboarding` | P1 | 3 | UX2-001, C1-003A, UX2-005, machine/screen_component_contracts.json | onboarding-e2e-report |
| UX2-004 | Dashboard inicial | `dashboard` | P1 | 3 | UX2-001, UX2-002, UX2-003, machine/screen_component_contracts.json | dashboard-e2e-report |
| UX2-005 | Profile básico | `profile` | P1 | 3 | C1-000, C1-002, C1-003A, UX2-001, machine/screen_component_contracts.json | profile-e2e-report |
| UX2-006 | Notifications internas | `notifications` | P1 | 3 | C1-000, C1-002, C1-003A, UX2-001, machine/screen_component_contracts.json | notifications-e2e-report |
| UX2-007 | Conectar Dashboard con profile, notifications y gamification | `dashboard` | P2 | 3 | UX2-004, UX2-005, UX2-006, G3-001A, machine/screen_component_contracts.json | dashboard-enrichment-report |
| A3-001 | Admin read-only | `admin` | P1 | 4 | C1-004, C1-006A | admin-readonly-report |
| AI3-001 | AIActionLog | `ai_assistant` | P1 | 5 | C1-004, machine/ai_approval_policy.json | ai-action-log-report |
| AI3-002 | Flujo AI-0/AI-1 | `ai_assistant` | P1 | 5 | AI3-001, machine/ai_context_trust_policy.json | ai-workflow-report |
| AI3-003 | Política runtime de aprobación IA | `ai_assistant` | P1 | 5 | C1-004A, AI3-001, machine/ai_approval_policy.json, machine/action_contracts.json, machine/permissions.json, machine/route_permission_matrix.json, machine/ai_context_trust_policy.json | approval-policy-report |
| AI3-004 | Doctor asistido por IA | `ai_assistant` | P2 | 5 | AI3-002, C1-006A, machine/doctor_checks.json, machine/ai_approval_policy.json, machine/ai_context_trust_policy.json | doctor-runtime-report |
| I3-001 | Integraciones stub | `integrations` | P2 | 6 | C1-001, C1-005 | integrations-stub-report |

## Relaciones entre tareas base y tareas endurecidas

| Tarea base | Tarea endurecida | Relación operativa | Regla de ejecución |
|---|---|---|---|
| `C1-003` | `C1-003A` | `C1-003A` endurece y reemplaza operativamente el dispatcher base mediante `EventRegistry` y `EventDispatcher` transaccional. | Las dependencias posteriores deben apuntar a `C1-003A` salvo referencia consolidada explícita. |
| `C1-006` | `C1-006A` | `C1-006A` endurece y reemplaza operativamente el wrapper Doctor base mediante `DoctorRuntime` readonly. | Las dependencias posteriores deben apuntar a `C1-006A` salvo referencia consolidada explícita. |

## Tareas endurecidas obligatorias para Core Runtime

Estas tareas no deben omitirse al cerrar la fase 2:

- `C1-000A` — provisionamiento controlado MVP.
- `C1-000B` — AppKernel, Router y Request/Response.
- `C1-000C` — ActionExecutor y ActionContractRegistry.
- `C1-003A` — EventRegistry y EventDispatcher transaccional.
- `C1-004A` — ApprovalService runtime.
- `C1-006A` — DoctorRuntime wrapper readonly.
- `C1-007` — suite runtime desde matriz de tests por acción.

## Validación

Doctor debe verificar:

- `HUMAN_FEATURE_DEPENDENCIES_MATCH_MACHINE_BACKLOG`.
- `HUMAN_BACKLOG_MATCHES_MACHINE_BACKLOG_FOR_P0`.
- `BACKLOG_ITEMS_HAVE_EXECUTION_CONTRACT`.
- `READY_FOR_SPRINT0_IS_NOT_VISIBLE_FEATURE_DEVELOPMENT`.

## Decisiones aplicadas

- Identidad runtime se ejecuta en Core Runtime mediante `C1-000`.
- Login/logout visible queda separado en `UX2-002`.
- `profile` y `notifications` tienen tareas MVP explícitas.
- Dashboard usa fallbacks para IA, gamificación y notificaciones hasta `UX2-007`.
- `G3-001` queda retirado como ID ejecutable. La fuente canónica separa runtime mínimo (`G3-001A`) y enriquecimiento visual (`G3-001B`).
- `machine/backlog_items.json` prevalece sobre esta vista humana en cualquier conflicto.

## Microbacklog granular de Core Runtime

Las tareas `C1-008` a `C1-014` son la vista humana derivada del microbacklog técnico post-Sprint 0. Deben mantenerse sincronizadas con `machine/backlog_items.json`; no habilitan UI visible ni módulos funcionales.

## C1-015 — Dependencia contractual de analítica UI y eventos de vista

`C1-015` formaliza la frontera entre `analytics_refs`, `machine/analytics_events.json`, eventos de dominio persistentes y action contracts de tracking de vista.

Debe ejecutarse antes de implementar métricas, activación o gamificación dependientes de vistas (`dashboard.viewed`, `dashboard.first_viewed`, `admin.panel.viewed`).

Dependencias directas: `S0-013`, `C1-003A`, `UX2-001`, `G3-001B`.
