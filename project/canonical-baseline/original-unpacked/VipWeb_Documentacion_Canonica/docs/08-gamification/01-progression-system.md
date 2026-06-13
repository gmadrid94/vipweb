# Sistema de progresión

**Estado recomendado:** `READY_FOR_IMPLEMENTATION`
**Gate operativo aplicable:** `READY_FOR_IMPLEMENTATION` indica madurez documental, no permiso operativo por sí solo. Prevalecen `CURRENT_STATUS.md` y `machine/roadmap_gates.json`. Con el estado global actual `READY_FOR_SPRINT_0`, este documento solo puede guiar tareas permitidas por Sprint 0. No autoriza UI visible, Dashboard, Onboarding ni módulos funcionales hasta alcanzar `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT`.


| Evento | Efecto | Puntos | Cooldown |
|---|---|---|---|
| onboarding.completed | first_step_completed | 10 | once |
| dashboard.first_viewed | ecosystem_opened | 5 | once |
| profile.updated | profile_ready | 5 | once_per_day |
| task.completed | task_progress | 3 | per_task |
| system.doctor.executed | system_checked | 5 | once_per_day |
| ai.suggestion.created | guided_by_ai | 2 | once_per_day |
| module.used | module_adopted | 5 | per_scope |

## Regla

`ProgressRecord` solo se crea desde eventos declarados en `machine/gamification_rules.json` y existentes en `machine/events.json`.

## Runtime mínimo MVP

El runtime mínimo bloqueante de MVP se limita a convertir eventos fuente en `ProgressRecord` y `progress.updated` con idempotencia, cooldown y fallback. La visualización avanzada de logros se implementa como enriquecimiento posterior no bloqueante.

El logro `first_module_used` depende exclusivamente de `module.used`. `module.activated` no concede progreso de adopción porque puede ser una acción administrativa del owner.


## Política MVP event-driven

En el MVP, `ProgressRecord.source_event_id` es obligatorio (`NOT NULL`). Los ajustes manuales/admin quedan fuera del MVP porque introducirían una acción sensible sin permiso, aprobación, idempotencia ni rollback propios.

Regla operativa: si un evento fuente no existe o no tiene usuario resoluble, no se crea `ProgressRecord`; el caso queda como evento auditable o fallback sin estado gamificado persistente.

Cualquier ajuste manual futuro deberá declararse como capacidad post-MVP mediante contrato específico, permiso explícito, `ApprovalRecord`, `idempotency_key`, auditoría y política de reversión.
