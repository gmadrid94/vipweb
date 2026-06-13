# 03 Technical Tasks

**Estado recomendado:** `READY_FOR_IMPLEMENTATION`
**Gate operativo aplicable:** `READY_FOR_IMPLEMENTATION` indica madurez documental, no permiso operativo por sí solo. Prevalecen `CURRENT_STATUS.md` y `machine/roadmap_gates.json`. Con el estado global actual `READY_FOR_SPRINT_0`, este documento solo puede guiar tareas permitidas por Sprint 0. No autoriza UI visible, Dashboard, Onboarding ni módulos funcionales hasta alcanzar `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT`.


## Fuente canónica
`machine/backlog_items.json`.

## Regla
Toda tarea post-Sprint 0 debe tener acciones, archivos afectados, dependencias, criterios de aceptación, Doctor check, evidencia esperada, riesgo, rollback, relevancia WAMP y lectura IA.

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

## Criterios de validación
Doctor valida `BACKLOG_ITEMS_HAVE_EXECUTION_CONTRACT`, `BACKLOG_ITEMS_MATCH_SCHEMA`, `MVP_MODULES_HAVE_FULL_COVERAGE`, `P0_BACKLOG_ITEMS_ARE_TRACEABLE` y `HUMAN_BACKLOG_MATCHES_MACHINE_BACKLOG_FOR_P0`.

## Contratos de pantalla como dependencia UX

Toda tarea `UX2-*` y superficie visible relacionada con gamificación debe consultar `machine/screen_component_contracts.json` antes de implementación.

Criterio adicional de aceptación:

- la pantalla existe en `machine/ui_screens.json`;
- tiene contrato en `machine/screen_component_contracts.json`;
- las acciones, eventos, permisos, estados y fallbacks están enlazados;
- los componentes existen en el catálogo UX.

## Relaciones entre tareas base y tareas endurecidas

**Fuente canónica:** `machine/backlog_items.json` y `machine/schemas/backlog-item.schema.json`.

Para evitar ambigüedad post-Sprint 0, toda tarea derivada debe declarar si reemplaza, endurece, completa o valida una tarea previa mediante los campos machine-readable `parent_task_id`, `supersedes`, `superseded_by`, `must_close_with`, `is_umbrella`, `implementation_role` y `relationship_note`.

| Tarea base | Tarea endurecida | Relación operativa | Regla de ejecución |
|---|---|---|---|
| `C1-003` | `C1-003A` | `C1-003A` endurece y reemplaza operativamente el dispatcher base. | Las dependencias posteriores deben apuntar a `C1-003A` salvo referencia consolidada explícita. |
| `C1-006` | `C1-006A` | `C1-006A` endurece y reemplaza operativamente el wrapper Doctor base. | Las dependencias posteriores deben apuntar a `C1-006A` salvo referencia consolidada explícita. |

Una tarea marcada como `superseded_by` no debe usarse como único requisito de cierre de fase si existe una tarea endurecida P0 asociada. El gate de Core Runtime debe considerar cerrada la capacidad solo cuando la tarea endurecida esté completada o se justifique formalmente su no aplicabilidad.


## Artefactos físicos Sprint 0 añadidos

Para evitar que el Sprint 0 dependa de contratos abstractos sin materialización inicial, se incorporan artefactos base:

| Artefacto | Ruta | Fuente canónica | Check Doctor |
|---|---|---|---|
| Migraciones SQL | `database/migrations/*.sql` | `machine/entities.json`, `machine/column_contracts.json`, `machine/physical_constraints_matrix.json` | `MIGRATION_SQL_FILES_EXIST_FOR_CONTRACTS` |
| Rollbacks SQL | `database/rollbacks/*.sql` | `machine/migration_contracts.json` | `MIGRATION_SQL_FILES_EXIST_FOR_CONTRACTS` |
| Seeds mínimos | `database/seeds/*.sql` | `machine/roles.json`, `machine/permissions.json`, `machine/modules.json` | `SEED_SQL_FILES_EXIST_FOR_CORE_RUNTIME` |

Estos artefactos no autorizan desarrollo visible. Solo desbloquean ejecución controlada de Sprint 0 tras backup, verificación de entorno y evidencia.

## Regla de alcance granular para tareas post-Sprint 0

Las rutas amplias como `app/*`, `machine/*` o `scripts/*` no son alcance ejecutable directo para cambios protegidos. Pueden aparecer solo como referencia conceptual consolidada o de planificación.

Antes de ejecutar una tarea post-Sprint 0 que afecte a código, catálogos machine-readable, permisos, rutas, módulos, eventos, schemas, trazabilidad, IA operativa o backlog ejecutable, debe existir una subtarea granular con:

- `allowed_paths` concretos;
- `forbidden_paths` explícitos;
- `requires_subtask_split=false` en la subtarea ejecutable;
- `approval_scope_hash_required=true` si el cambio es sensible o preparado por IA;
- `rollback_unit` definido;
- evidencia esperada y `evidence/sprint-0-local-execution.md` actualizado.

Las tareas amplias del backlog quedan como unidades de planificación. La ejecución real se realiza mediante subtareas granulares o mediante una actualización explícita del scope antes de abrir ApprovalRecord.

`AI3-001` es bloqueante interno de Fase 5: debe completarse antes de considerar operativas acciones IA recurrentes o tareas AI3 posteriores.

## Microbacklog ejecutable de transición a Core Runtime

Las tareas `C1-008` a `C1-014` son subtareas granulares derivadas de `C1-000B`, `C1-000C`, `C1-003A` y `C1-004`. Su objetivo es reducir reinterpretación antes de programar el primer vertical slice técnico. No sustituyen los gates del roadmap ni autorizan UI visible: solo preparan runtime HTTP, DB segura, contratos de acción, autorización IA estructural, eventos y auditoría mínima.

## C1-015 — Formalizar catálogo de analítica UI y eventos de vista persistentes

- **Prioridad:** P1.
- **Módulo:** dashboard / design.ux / gamification.
- **Objetivo:** cerrar la frontera entre `analytics_refs`, eventos de dominio, métricas y gamificación.
- **Criterios de aceptación:** `machine/analytics_events.json` existe; los eventos persistentes de vista tienen action contract `POST`; Doctor valida referencias, idempotencia y ausencia de side effects en `GET`.
- **Riesgo mitigado:** tracking ad hoc, métricas no reproducibles y gamificación basada en señales UI no persistentes.
