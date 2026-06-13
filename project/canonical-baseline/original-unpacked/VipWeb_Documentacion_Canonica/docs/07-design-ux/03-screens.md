# Pantallas MVP

**Estado recomendado:** `READY_FOR_IMPLEMENTATION`
**Gate operativo aplicable:** `READY_FOR_IMPLEMENTATION` indica madurez documental, no permiso operativo por sí solo. Prevalecen `CURRENT_STATUS.md` y `machine/roadmap_gates.json`. Con el estado global actual `READY_FOR_SPRINT_0`, este documento solo puede guiar tareas permitidas por Sprint 0. No autoriza UI visible, Dashboard, Onboarding ni módulos funcionales hasta alcanzar `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT`.


Fuente canónica: `machine/ui_screens.json`.

| Pantalla | Ruta | Módulo | Estados | Permiso |
|---|---|---|---|---|
| public_entry | / | `core.identity` | loading, empty, ready, error | `public.view` |
| login | /login | `core.identity` | empty, loading, error, success | `auth.login` |
| onboarding | /onboarding | `onboarding` | loading, empty, in_progress, paused, completed, error | `profile.view` |
| dashboard | /dashboard | `dashboard` | loading, empty, ready, blocked, error | `dashboard.view` |
| profile | /profile | `profile` | loading, view, edit, saving, saved, blocked, error | `profile.view` |
| notifications | /notifications | `notifications` | loading, empty, unread, read, blocked, error | `notification.view` |
| admin | /admin | `admin` | loading, read_only, blocked, no_permission, error | `admin.access` |
| doctor_evidence | /admin/evidence | `core.doctor` | loading, empty, passed, warning, failed, error | `admin.view_evidence` |
| modules_catalog | /modules | `core.modules` | loading, empty, ready, blocked, error | `module.view` |
| progress | /progress | `gamification` | loading, empty, ready, blocked, error | `gamification.view` |
| ai_workspace | /ai | `ai_assistant` | loading, read_only, draft_available, blocked, no_permission, error | `ai.read_context` |

## Entrada pública

`public_entry` es la entrada pública canónica del MVP. Su objetivo es explicar VipWeb sin exponer datos privados y derivar a `/login` mediante cuenta provisionada.

No incluye auto-registro público, alta libre ni formularios de signup.

## Pantallas añadidas por hardening contractual

| Pantalla | Motivo |
|---|---|
| `modules_catalog` | Separa el catálogo visible para usuario de la administración de módulos. |
| `progress` | Da contrato UX propio a la superficie de gamificación y progreso. |
| `ai_workspace` | Da contrato UX propio a la superficie IA owner-only con límites y guardrails visibles. |

## Criterio de aceptación

Ninguna pantalla MVP basada en ruta se implementa sin estados `loading`, `error` y al menos un estado de ausencia, bloqueo o falta de permiso: `empty`, `blocked` o `no_permission`.

Los estados de dominio (`view`, `edit`, `saving`, `saved`, `in_progress`, `completed`, `passed`, `warning`, `failed`, `read_only`, `draft_available`, etc.) pueden coexistir, pero no sustituyen los estados técnicos mínimos.

Nota: `/onboarding` requiere `profile.view` para visualizarse; `/onboarding/start` y `/onboarding/complete` requieren `profile.update`.

## Contratos de composición por pantalla

Cada pantalla MVP visible debe tener contrato en `machine/screen_component_contracts.json` antes de implementarse.

`machine/ui_screens.json` define ruta, módulo, estados y permiso primario. `machine/screen_component_contracts.json` define la composición operativa: componentes, datos consumidos, acciones, eventos, fallbacks, copy, responsive behavior, analítica, gamificación e IA helper.
