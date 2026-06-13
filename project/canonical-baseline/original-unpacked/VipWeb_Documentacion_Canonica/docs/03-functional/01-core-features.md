# Core features

**Estado recomendado:** `READY_FOR_IMPLEMENTATION`
**Gate operativo aplicable:** `READY_FOR_IMPLEMENTATION` indica madurez documental, no permiso operativo por sí solo. Prevalecen `CURRENT_STATUS.md` y `machine/roadmap_gates.json`. Con el estado global actual `READY_FOR_SPRINT_0`, este documento solo puede guiar tareas permitidas por Sprint 0. No autoriza UI visible, Dashboard, Onboarding ni módulos funcionales hasta alcanzar `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT`.


Este documento enumera únicamente features core P0. Las features UX P1 del MVP viven en `docs/03-functional/02-secondary-features.md` y en `machine/features.json`; no son core aunque dependan del core.

| Feature | Módulo | Prioridad | Criterios |
|---|---|---|---|
| Identidad y sesión local | `core.identity` | P0 | login/logout funcional; sesión protegida; eventos user.logged_in/user.logged_out; provisionamiento controlado `owner`-only mediante `USER_PROVISION_CONTROLLED`; user.registered reservado a cuentas provisionadas |
| RBAC y guards | `core.permissions` | P0 | roles canónicos sembrados; permisos existentes validados; rutas mutables protegidas |
| Registro de módulos y manifiestos | `core.modules` | P0 | manifiestos cumplen schema; módulos activos/stub distinguibles; rollback por desactivación |
| Bus interno de eventos | `core.events` | P0 | solo eventos registrados; payload versionado; eventos auditables persistidos |

## Reglas

- Ninguna feature core puede depender de un proveedor externo real.
- Toda feature mutable debe pasar por permisos.
- Toda feature que cambia estado debe emitir evento canónico o registrar auditoría.
- Todo módulo debe tener manifiesto validado antes de ejecutarse.
- `CORE_FEATURES_DO_NOT_INCLUDE_NON_CORE_MODULES` evita que AppShell, onboarding, dashboard, perfil, notificaciones, gamificación o IA se mezclen con el core fundacional.


## Política de registro MVP

El MVP opera con `controlled_provisioning_mvp_no_public_signup`: no hay `/register`, `AUTH_REGISTER_SUBMIT` ni pantalla pública de auto-registro. El primer usuario `owner` se crea por seed y los demás usuarios `registered_user` se provisionan mediante `USER_PROVISION_CONTROLLED`, acción interna `owner`-only con `ApprovalRecord`, auditoría, idempotencia y evento `user.registered`.
