# Clasificación de features

**Estado recomendado:** `READY_FOR_IMPLEMENTATION`
**Gate operativo aplicable:** `READY_FOR_IMPLEMENTATION` indica madurez documental, no permiso operativo por sí solo. Prevalecen `CURRENT_STATUS.md` y `machine/roadmap_gates.json`. Con el estado global actual `READY_FOR_SPRINT_0`, este documento solo puede guiar tareas permitidas por Sprint 0. No autoriza UI visible, Dashboard, Onboarding ni módulos funcionales hasta alcanzar `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT`.


Fuente canónica: `machine/features.json`.

| ID | Feature | Módulo | Prioridad | Fase | Criterios | Clasificación comercial | Superficie |
|---|---|---|---|---|---|---|---|
| F-AI-001 | IA asistente AI-0/AI-1 | `ai_assistant` | P1 | ai_assisted_ops | lee contexto, propone sin modificar, registra AIActionLog | internal_only | ai_operations |
| F-CORE-001 | Identidad y sesión local | `core.identity` | P0 | core_runtime | runtime de sesión protegido, contrato técnico login/logout disponible, eventos user.logged_in/user.logged_out; user.registered reservado a provisionamiento controlado | core_included | core_internal |
| F-CORE-002 | RBAC y guards | `core.permissions` | P0 | core_runtime | roles canónicos sembrados, permisos existentes validados, rutas mutables protegidas | core_included | core_internal |
| F-CORE-003 | Registro de módulos y manifiestos | `core.modules` | P0 | core_runtime | manifiestos cumplen schema, módulos activos/stub distinguibles, rollback por desactivación | core_included | core_internal |
| F-CORE-004 | Bus interno de eventos | `core.events` | P0 | core_runtime | solo eventos registrados, payload versionado, eventos auditables persistidos | core_included | core_internal |
| F-GAM-001 | Progreso y logros mínimos | `gamification` | P2 | mvp_ux | deriva de eventos fuente, evita loops, visible en dashboard | free_mvp | user_facing |
| F-INT-001 | Integraciones stub | `integrations` | P2 | integrations_stub | sin credenciales reales, configurable como catálogo, eventos integration.configured | future_premium_candidate | integration_surface |
| F-UX-001 | AppShell MVP | `dashboard` | P1 | mvp_ux | header contextual, navegación modular, zona principal, panel de estado/progreso | free_mvp | user_facing |
| F-UX-002 | Onboarding progresivo | `onboarding` | P1 | mvp_ux | retomable, no bloquea navegación básica, emite onboarding.started/completed | free_mvp | user_facing |
| F-UX-003 | Dashboard inicial | `dashboard` | P1 | mvp_ux | módulos visibles, próximo paso, progreso ligero, estado Doctor resumido | free_mvp | user_facing |
| F-UX-004 | Profile básico | `profile` | P1 | mvp_ux | perfil visible, edición mínima controlada, emite profile.updated | free_mvp | user_facing |
| F-UX-005 | Notifications internas | `notifications` | P1 | mvp_ux | lista de avisos internos, estados empty/unread/read, sin proveedor externo real | free_mvp | user_facing |

## Regla

Toda feature P0/P1 debe vincular módulo, evento, permiso y criterio de aceptación antes de implementación.

La clasificación comercial es **no operativa**: no activa pagos ni planes en MVP. Sirve para evitar rediseño futuro entre core incluido, free MVP, candidatos premium, módulos internos y superficies de integración.
