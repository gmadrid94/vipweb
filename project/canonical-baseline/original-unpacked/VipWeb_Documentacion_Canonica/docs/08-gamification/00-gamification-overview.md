# Gamificación

**Estado recomendado:** `READY_FOR_IMPLEMENTATION`
**Gate operativo aplicable:** `READY_FOR_IMPLEMENTATION` indica madurez documental, no permiso operativo por sí solo. Prevalecen `CURRENT_STATUS.md` y `machine/roadmap_gates.json`. Con el estado global actual `READY_FOR_SPRINT_0`, este documento solo puede guiar tareas permitidas por Sprint 0. No autoriza UI visible, Dashboard, Onboarding ni módulos funcionales hasta alcanzar `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT`.


## Principio

La gamificación de VipWeb refuerza continuidad, claridad y progreso real. No debe convertir el producto en juego ni premiar acciones repetitivas sin valor.

Fuente canónica: `machine/gamification_rules.json`.

## Piezas MVP

- Progreso ligero derivado de eventos canónicos.
- Logros mínimos definidos como catálogo global en `Achievement`.
- Cooldowns y antifatiga persistidos en `GamificationRuleState`; progreso en `ProgressRecord`; desbloqueos en `UserAchievement`.
- Recompensas funcionales, no económicas.

## Contrato runtime

El único handler que puede persistir progreso gamificado es `gamification`.

- Consume eventos declarados en `processing_contract.consumes_events`.
- Escribe únicamente `ProgressRecord`, `UserAchievement` y `GamificationRuleState`. `Achievement` es catálogo global leído, no entidad de desbloqueo runtime.
- Emite `progress.updated` y `achievement.unlocked`.
- Usa idempotencia `unique(user_id, source_event_id, rule_id)`.
- Usa idempotencia `unique(user_id NOT NULL, source_event_id NOT NULL, rule_id)` y `unique(user_id NOT NULL, achievement_id)`.
- Los eventos sin `user_id` resoluble pueden auditarse, pero no generan `ProgressRecord`, `UserAchievement` ni `GamificationRuleState` en el MVP.
- Si el módulo está desactivado, los eventos permanecen en `core.events` sin generar progreso.
- Los productores de eventos, como `onboarding`, no escriben entidades de gamificación.

## Reglas canónicas

| Regla | Evento | Efecto | Puntos | Cooldown | Logro | Contexto usuario |
|---|---|---|---:|---|---|---|
| GAM-RULE-001 | `onboarding.completed` | first_step_completed | 10 | `once:user` | first_step_completed | True |
| GAM-RULE-002 | `dashboard.first_viewed` | ecosystem_opened | 5 | `once:user` | ecosystem_opened | True |
| GAM-RULE-003 | `profile.updated` | profile_ready | 5 | `once_per_day:user` | profile_ready | True |
| GAM-RULE-004 | `task.completed` | task_progress | 3 | `per_task:user:task_key` | — | True |
| GAM-RULE-005 | `system.doctor.executed` | system_checked | 5 | `once_per_day:user` | system_checked | True |
| GAM-RULE-006 | `ai.suggestion.created` | guided_by_ai | 2 | `once_per_day:user` | guided_by_ai | True |
| GAM-RULE-007 | `module.used` | module_adopted | 5 | `per_scope:user:module_id` | first_module_used | True |

## Validación

Doctor valida `GAMIFICATION_RULES_WRITE_ONLY_GAMIFICATION_ENTITIES` y `NO_EVENT_PRODUCER_WRITES_CONSUMER_ENTITY`.


## Elegibilidad machine-readable

Cada regla de `machine/gamification_rules.json` declara `eligibility` con campos requeridos, fuente de `user_id`, actores permitidos/prohibidos y estados que impiden recompensa. Esto evita que eventos automáticos, ejecuciones IA o ejecuciones Doctor críticas generen progreso no legítimo.

Un evento puede desbloquear un `Achievement` aunque no tenga regla de puntos asociada si `processing_contract.evaluates_achievement_conditions=true`.

## Corte MVP mínimo

El MVP exige un runtime mínimo de progreso, no toda la capa visual de gamificación.

Bloqueante en MVP:

- consumir `onboarding.completed`, `profile.updated` y `dashboard.first_viewed`;
- crear `ProgressRecord` idempotente;
- aplicar cooldown antifatiga;
- emitir `progress.updated`;
- exponer `/progress` con estados `empty`, `ready` y `error`;
- no bloquear onboarding ni dashboard si gamification falla.

No bloqueante en MVP:

- enriquecimiento visual de logros;
- presentación avanzada en dashboard;
- microcopy adicional de celebración.

El logro `first_module_used` depende exclusivamente de `module.used`. `module.activated` no concede progreso de adopción porque puede ser una acción administrativa del owner.

## Política MVP de usuario obligatorio

La gamificación persistente del MVP es siempre por usuario identificable. `ProgressRecord`, `UserAchievement` y `GamificationRuleState` requieren `user_id` no nulo. Si un evento canónico no contiene usuario resoluble según `eligibility.user_context_source`, el handler `gamification` debe tratarlo como evento no elegible: puede mantenerse en `core.events` o auditoría, pero no produce progreso, logro ni cooldown persistente.

La gamificación anónima, pre-login o agregada queda fuera del MVP y requeriría una ADR específica porque cambia producto, datos, métricas e idempotencia.


## Política MVP de ajustes manuales/admin

Los ajustes manuales/admin de progreso quedan fuera del MVP. Todo `ProgressRecord` debe derivar de un `DomainEvent` canónico y tener `source_event_id NOT NULL`.

Una acción futura de ajuste manual requerirá ADR o contrato post-MVP con permiso específico, `ApprovalRecord`, `idempotency_key`, auditoría y rollback append-only. Hasta entonces no debe existir acción activa `GAMIFICATION_PROGRESS_ADJUST`.

## Relación con analítica UI y eventos de vista

La gamificación no consume señales `ui_analytics`. Solo puede consumir eventos de dominio canónicos definidos en `machine/events.json`.

`dashboard.first_viewed` se mantiene como evento de dominio porque desbloquea el logro `ecosystem_opened`. Su registro debe ser idempotente y provenir de `DASHBOARD_VIEW_TRACK`, no de una carga `GET` del Dashboard.

Las vistas agregadas como `progress.viewed` o `modules_catalog.viewed` pueden ayudar a entender uso, pero no conceden puntos, logros ni progreso.
