# Logros

**Estado recomendado:** `READY_FOR_IMPLEMENTATION`
**Gate operativo aplicable:** `READY_FOR_IMPLEMENTATION` indica madurez documental, no permiso operativo por sí solo. Prevalecen `CURRENT_STATUS.md` y `machine/roadmap_gates.json`. Con el estado global actual `READY_FOR_SPRINT_0`, este documento solo puede guiar tareas permitidas por Sprint 0. No autoriza UI visible, Dashboard, Onboarding ni módulos funcionales hasta alcanzar `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT`.


| ID | Nombre | Condición | Tipo |
|---|---|---|---|
| first_step_completed | Primer paso completado | `ALL(onboarding.completed)` | acompañamiento |
| ecosystem_opened | Ecosistema abierto | `ALL(dashboard.first_viewed)` | continuidad |
| profile_ready | Perfil preparado | `ALL(profile.updated)` | preparación |
| first_module_used | Primer módulo usado | `ALL(module.used)` | adopción |
| system_checked | Sistema revisado | `ALL(system.doctor.executed)` | calidad |
| guided_by_ai | Acompañado por IA | `ALL(ai.suggestion.created)` | asistencia |

## Regla

Todo logro debe tener condición derivada de eventos canónicos y persistir el desbloqueo por usuario en `UserAchievement` con `unique(user_id, achievement_id)`.


## Catálogo vs desbloqueo runtime

`Achievement` define el catálogo versionado de logros. `UserAchievement` representa el desbloqueo real por usuario y aplica `unique(user_id, achievement_id)`. El runtime normal de gamificación no modifica `Achievement`; solo lo lee para evaluar condiciones y crear desbloqueos en `UserAchievement`.

El logro `first_module_used` depende exclusivamente de `module.used`. `module.activated` no concede progreso de adopción porque puede ser una acción administrativa del owner.

## Requisito de usuario en desbloqueos MVP

`UserAchievement.user_id` es obligatorio en el MVP. Un logro desbloqueado representa continuidad de una persona identificable dentro del ecosistema; no debe existir desbloqueo persistente sin usuario. Los eventos sin usuario pueden ser auditados, pero no desbloquean logros persistentes.
