# Eventos de gamificación

**Estado recomendado:** `READY_FOR_IMPLEMENTATION`
**Gate operativo aplicable:** `READY_FOR_IMPLEMENTATION` indica madurez documental, no permiso operativo por sí solo. Prevalecen `CURRENT_STATUS.md` y `machine/roadmap_gates.json`. Con el estado global actual `READY_FOR_SPRINT_0`, este documento solo puede guiar tareas permitidas por Sprint 0. No autoriza UI visible, Dashboard, Onboarding ni módulos funcionales hasta alcanzar `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT`.


| Evento fuente | Handler | Efecto | Entidad afectada |
|---|---|---|---|
| `onboarding.completed` | `gamification` | first_step_completed | `ProgressRecord` / `UserAchievement` |
| `dashboard.first_viewed` | `gamification` | ecosystem_opened | `ProgressRecord` / `UserAchievement` |
| `profile.updated` | `gamification` | profile_ready | `ProgressRecord` / `UserAchievement` |
| `task.completed` | `gamification` | task_progress | `ProgressRecord` / `UserAchievement` |
| `system.doctor.executed` | `gamification` | system_checked | `ProgressRecord` / `UserAchievement` |
| `ai.suggestion.created` | `gamification` | guided_by_ai | `ProgressRecord` / `UserAchievement` |
| `module.used` | `gamification` | module_adopted | `ProgressRecord` / `UserAchievement` |

## Regla

No se aceptan eventos de gamificación que no existan en `machine/events.json`.

El productor del evento no escribe progreso. El productor emite el evento; `gamification` lo consume, aplica cooldown/idempotencia y persiste sus entidades owned.
