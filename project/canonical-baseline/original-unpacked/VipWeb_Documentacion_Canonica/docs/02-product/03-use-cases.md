# Casos de uso MVP

**Estado recomendado:** `READY_FOR_IMPLEMENTATION`
**Gate operativo aplicable:** `READY_FOR_IMPLEMENTATION` indica madurez documental, no permiso operativo por sí solo. Prevalecen `CURRENT_STATUS.md` y `machine/roadmap_gates.json`. Con el estado global actual `READY_FOR_SPRINT_0`, este documento solo puede guiar tareas permitidas por Sprint 0. No autoriza UI visible, Dashboard, Onboarding ni módulos funcionales hasta alcanzar `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT`.


| ID | Actor | Caso de uso | Precondición | Resultado esperado | Evento |
|---|---|---|---|---|---|
| UC-001 | Visitante | Acceder a entrada pública | No autenticado | Comprende VipWeb y puede iniciar sesión con cuenta provisionada | — |
| UC-002 | Usuario registrado | Completar onboarding | Sesión activa | Estado inicial registrado y dashboard accesible | `onboarding.completed` |
| UC-003 | Usuario registrado | Consultar dashboard | Sesión activa | Ve módulos, progreso y próximo paso | `dashboard.viewed` |
| UC-004 | Usuario registrado | Actualizar perfil | Sesión activa | Perfil y contexto actualizados | `profile.updated` |
| UC-005 | Admin | Ver evidencias | Permiso `admin.view_evidence` | Ve estado Doctor y evidencias | `admin.panel.viewed` |
| UC-006 | IA asistente | Proponer mejora | Permiso `ai.suggest_changes` | Propuesta registrada sin modificar archivos | `ai.suggestion.created` |
| UC-007 | Owner | Aprobar acción AI-2 MVP restringida | Política activa y `ApprovalRecord` válido | Acción pasa a aprobada o rechazada sin aplicar cambios reales automáticamente | `ai.action.approved` |
| UC-008 | Sistema | Registrar progreso | Evento fuente válido | Progreso actualizado sin loop | `progress.updated` |
| UC-009 | Owner | Provisionar usuario MVP | Sesión owner activa, permiso `admin.manage_users` y `ApprovalRecord` válido | Usuario `registered_user` creado de forma controlada y auditable | `user.registered` |


## Política MVP de creación de usuarios

El MVP no incluye auto-registro público. La creación de usuarios se realiza mediante seed inicial para el primer `owner` y mediante provisionamiento controlado `owner`-only para usuarios `registered_user`.

La acción canónica de MVP es `USER_PROVISION_CONTROLLED`, expuesta como ruta interna `POST /admin/users/provision`, protegida por `admin.manage_users`, `ApprovalRecord`, idempotencia, auditoría y emisión de `user.registered`.

`user.registered` significa cuenta provisionada o activada dentro del ecosistema, no alta libre mediante formulario público.


## Trazabilidad de entrada pública

UC-001 se resuelve mediante la pantalla `public_entry` en la ruta `/`, con permiso `public.view` y CTA hacia `/login`.

La pantalla pública explica VipWeb sin datos privados y no habilita auto-registro público. `/login` queda como pantalla funcional de autenticación mediante cuenta provisionada.
