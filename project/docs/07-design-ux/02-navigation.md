# Navegación

**Estado recomendado:** `READY_FOR_IMPLEMENTATION`
**Gate operativo aplicable:** `READY_FOR_IMPLEMENTATION` indica madurez documental, no permiso operativo por sí solo. Prevalecen `CURRENT_STATUS.md` y `machine/roadmap_gates.json`. Con el estado global actual `READY_FOR_SPRINT_0`, este documento solo puede guiar tareas permitidas por Sprint 0. No autoriza UI visible, Dashboard, Onboarding ni módulos funcionales hasta alcanzar `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT`.
  
**Fuente canónica:** `machine/ui_screens.json` y `machine/route_permission_matrix.json`.

Este documento es una proyección humana de la fuente machine-readable. Si hay divergencia, prevalecen `machine/ui_screens.json` y `machine/route_permission_matrix.json`.

## AppShell MVP

- Header contextual.
- Navegación principal de módulos.
- Área central.
- Panel de estado/progreso.
- Zona de ayuda IA básica.
- Acceso a perfil y notificaciones.
- Fallback visual para módulos `stub` o `planned`.

## Rutas mínimas

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

## Subvistas administrativas

| Subvista | Ruta | Pantalla padre | Permiso | Regla |
|---|---|---|---|---|
| audit_log | /admin/audit | admin | `admin.view_audit` | Lectura auditada. |
| config_panel | /admin/config | admin | `system.configure` | Lectura auditada; cambios requieren rutas mutables. |
| doctor_panel | /admin/doctor | admin | `doctor.view_panel` | Panel readonly; ejecutar Doctor requiere POST. |
| domain_events_panel | /admin/events | admin | `system.view_events` | Lectura auditada de eventos de dominio/sistema. |
| permissions_panel | /admin/permissions | admin | `admin.manage_users` | Vista owner-only. |
| roles_panel | /admin/roles | admin | `admin.manage_users` | Vista owner-only. |
| module_admin_panel | /admin/modules | admin | `admin.manage_modules` | Gestión owner-only; catálogo de usuario vive en `/modules`. |
| integrations_stub_panel | /admin/integrations | admin | `integration.view` | Stub de integración sin credenciales reales. |

## Taxonomía de rutas UI

| Campo | Regla |
|---|---|
| `route_kind=screen` | Requiere `screen_id` propio en `machine/ui_screens.json`. |
| `route_kind=admin_subview` | Requiere `parent_screen_id=admin`, `screen_id=admin` y `subview_id`. |
| `route_kind=user_subview` | Requiere pantalla padre visible de usuario y `subview_id`. |
| `route_kind=action_endpoint` | No tiene pantalla propia; sus estados viven en `action_contracts`. |
| `route_kind=internal_api` | Debe declarar `ui_exemption_reason`. |

## Regla

Toda ruta visible debe tener módulo owner, permiso primario, estados de interfaz y fallback si el usuario no tiene permiso.

Ninguna ruta `/admin/*` puede permitir `registered_user`. El catálogo de módulos de usuario vive en `/modules`; `/admin/modules` queda reservado para gestión administrativa.

Nota: `/onboarding` requiere `profile.view` para visualizarse; `/onboarding/start` y `/onboarding/complete` requieren `profile.update`.
