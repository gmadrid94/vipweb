# 09 Screen State Copy

**Estado recomendado:** `READY_FOR_IMPLEMENTATION`
**Gate operativo aplicable:** `READY_FOR_IMPLEMENTATION` indica madurez documental, no permiso operativo por sí solo. Prevalecen `CURRENT_STATUS.md` y `machine/roadmap_gates.json`. Con el estado global actual `READY_FOR_SPRINT_0`, este documento solo puede guiar tareas permitidas por Sprint 0. No autoriza UI visible, Dashboard, Onboarding ni módulos funcionales hasta alcanzar `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT`.


## Propósito

Convertir la promesa de acompañamiento en copy verificable por pantalla y estado. La fuente machine-readable es `machine/ui_state_copy.json`.

## Regla canónica

Cada pantalla MVP debe declarar copy para todos sus estados declarados en `machine/ui_screens.json`. El copy debe ser claro, calmado y accionable.

## Cobertura mínima

| Pantalla | Estados con copy obligatorio |
|---|---|
| public_entry | loading, empty, ready, error |
| login | empty, loading, error, success |
| onboarding | loading, empty, in_progress, paused, completed, error |
| dashboard | loading, empty, ready, blocked, error |
| profile | loading, view, edit, saving, saved, blocked, error |
| notifications | loading, empty, unread, read, blocked, error |
| admin | loading, read_only, blocked, no_permission, error |
| doctor_evidence | loading, empty, passed, warning, failed, error |
| modules_catalog | loading, empty, ready, blocked, error |
| progress | loading, empty, ready, blocked, error |
| ai_workspace | loading, read_only, draft_available, blocked, no_permission, error |

## Copy de entrada pública

La entrada pública debe comunicar tres ideas verificables:

- VipWeb es un ecosistema modular de acompañamiento, no un panel técnico aislado.
- El usuario puede continuar hacia `/login` si dispone de cuenta provisionada.
- El MVP no permite auto-registro público.

## Criterios de validación

Doctor debe pasar `UI_SCREENS_DECLARE_BASE_TECHNICAL_STATES`, `UI_STATE_COPY_COVERS_ALL_SCREEN_STATES`, `PUBLIC_ENTRY_HAS_LOGIN_CTA` y `PUBLIC_ENTRY_DOES_NOT_ENABLE_PUBLIC_SIGNUP`.


## Copy específico añadido por hardening contractual

`modules_catalog`, `progress` y `ai_workspace` tienen copy por estado en `machine/ui_state_copy.json`. Estas pantallas no deben implementarse con copy genérico porque cubren decisiones de permisos, gamificación e IA operativa.
