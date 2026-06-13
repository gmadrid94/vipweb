# 07 MVP Coverage Matrix

**Estado recomendado:** `READY_FOR_IMPLEMENTATION`
**Gate operativo aplicable:** `READY_FOR_IMPLEMENTATION` indica madurez documental, no permiso operativo por sí solo. Prevalecen `CURRENT_STATUS.md` y `machine/roadmap_gates.json`. Con el estado global actual `READY_FOR_SPRINT_0`, este documento solo puede guiar tareas permitidas por Sprint 0. No autoriza UI visible, Dashboard, Onboarding ni módulos funcionales hasta alcanzar `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT`.
  
**Fuente canónica:** `machine/mvp_coverage_matrix.json`.

## Cobertura MVP

| Módulo | Features | Backlog | Pantallas | Subvistas | Ruta | Permiso | Cobertura UI | Estado |
|---|---|---|---|---|---|---|---|---|
| core.identity | F-CORE-001 | C1-000, UX2-002, C1-000A | public_entry, login | - | /, /login | public.view, auth.login | screen | covered |
| core.permissions | F-CORE-002 | C1-002, C1-000C | admin | roles_panel, permissions_panel | /admin/roles, /admin/permissions | admin.manage_users | subview | covered |
| core.modules | F-CORE-003 | C1-001 | modules_catalog, admin | module_admin_panel | /modules, /admin/modules | module.view, admin.manage_modules | screen_and_subview | covered |
| core.events | F-CORE-004 | C1-003, C1-003A | admin | domain_events_panel | /admin/events | system.view_events | subview | covered |
| core.audit | - | C1-004, C1-004A | admin | audit_log | /admin/audit | admin.view_audit | subview | covered |
| core.config | - | C1-005, C1-000B | admin | config_panel | /admin/config | system.configure | subview | covered |
| core.doctor | - | C1-006, C1-006A, C1-007 | admin, doctor_evidence | doctor_panel | /admin/doctor | system.run_doctor.readonly | screen_and_subview | covered |
| dashboard | F-UX-001, F-UX-003 | UX2-001, UX2-004, UX2-007 | dashboard | - | /dashboard | dashboard.view | screen | covered |
| onboarding | F-UX-002 | UX2-003 | onboarding | - | /onboarding | profile.view | screen | covered |
| profile | F-UX-004 | UX2-005 | profile | - | /profile | profile.view | screen | covered |
| notifications | F-UX-005 | UX2-006 | notifications | - | /notifications | notification.view | screen | covered |
| admin | - | A3-001 | admin | - | /admin | admin.access | screen | covered |
| gamification | F-GAM-001 | G3-001A, G3-001B | progress, dashboard | - | /progress | gamification.view | screen | covered |
| ai_assistant | F-AI-001 | AI3-001, AI3-002, AI3-003, AI3-004 | ai_workspace | - | /ai | ai.read_context | screen | covered |
| integrations | F-INT-001 | I3-001 | admin | integrations_stub_panel | /admin/integrations | integration.view | stub_subview | covered_by_stub |

## Regla de cobertura UI

`status=covered` no puede usarse con `screen_ids: []`, salvo que `ui_coverage_kind=internal_api` y exista `coverage_exemption_reason` explícito. Las subvistas administrativas deben declarar `screen_ids`, `subview_ids` y pantalla padre en `machine/route_permission_matrix.json`.

Doctor valida `MVP_MODULES_HAVE_FULL_COVERAGE`, `MVP_COVERAGE_CANNOT_BE_COVERED_WITH_EMPTY_SCREEN_IDS`, `VISIBLE_GET_ROUTES_HAVE_SCREEN_COVERAGE` y `P0_BACKLOG_ITEMS_HAVE_MVP_OR_GATE_COVERAGE`.
