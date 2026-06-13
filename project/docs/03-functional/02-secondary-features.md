# Secondary features

**Estado recomendado:** `READY_FOR_IMPLEMENTATION`
**Gate operativo aplicable:** `READY_FOR_IMPLEMENTATION` indica madurez documental, no permiso operativo por sí solo. Prevalecen `CURRENT_STATUS.md` y `machine/roadmap_gates.json`. Con el estado global actual `READY_FOR_SPRINT_0`, este documento solo puede guiar tareas permitidas por Sprint 0. No autoriza UI visible, Dashboard, Onboarding ni módulos funcionales hasta alcanzar `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT`.


Estas features forman parte del MVP UX o de la expansión controlada, pero no pertenecen al core fundacional.

| Feature | Módulo | Motivo de secundario | Condición de entrada |
|---|---|---|---|
| AppShell MVP | `dashboard` | Experiencia base de navegación, no core runtime | Identidad, permisos y módulos activos |
| Onboarding progresivo | `onboarding` | Acompañamiento inicial, no bloquea sesión básica | Identidad y perfil disponibles |
| Dashboard inicial | `dashboard` | Primera superficie de continuidad | AppShell y módulos visibles |
| Profile básico | `profile` | Preferencias y continuidad personal, no core | Identidad activa |
| Notificaciones internas | `notifications` | Mejora acompañamiento, no bloquea sesión | Bus de eventos activo |
| Progreso ligero | `gamification` | Refuerza continuidad, no bloquea core | Eventos y dashboard activos |
| Integraciones stub | `integrations` | Prepara expansión, no conecta proveedor real | Module loader y config registry |
| IA AI-2 borrador | `ai_assistant` | Útil pero requiere aprobación | AIActionLog y approval policy |

Doctor valida `SECONDARY_FEATURES_INCLUDE_MVP_UX_FEATURES` y `FEATURES_MARKDOWN_MATCH_MACHINE`.
