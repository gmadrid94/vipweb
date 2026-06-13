# Reglas de balance

**Estado recomendado:** `READY_FOR_IMPLEMENTATION`
**Gate operativo aplicable:** `READY_FOR_IMPLEMENTATION` indica madurez documental, no permiso operativo por sí solo. Prevalecen `CURRENT_STATUS.md` y `machine/roadmap_gates.json`. Con el estado global actual `READY_FOR_SPRINT_0`, este documento solo puede guiar tareas permitidas por Sprint 0. No autoriza UI visible, Dashboard, Onboarding ni módulos funcionales hasta alcanzar `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT`.


## Reglas antifatiga

- **NO_REFRESH_REWARD**: No se recompensa ningún renderizado, refresh o page_view repetido sin acción humana de valor.
- **COOLDOWN_REQUIRED_FOR_REPEATABLE_EVENTS**: Toda regla repetible debe declarar cooldown persistible en GamificationRuleState.
- **NO_DESTRUCTIVE_ACTION_REWARD**: No se conceden logros ni puntos por acciones destructivas.
- **NO_EMOTIONAL_MANIPULATION**: La gamificación refuerza continuidad y claridad, no manipulación emocional.
- **NO_COMPETITIVE_RANKING_MVP**: No hay ranking competitivo en MVP.
- **NO_CRITICAL_DOCTOR_SOURCE**: No hay progreso si Doctor marca inconsistencia crítica en el evento fuente.

## Persistencia

- `GamificationRuleState` conserva cooldowns por usuario, regla, scope y ventana.
- `ProgressRecord` registra `rule_id`, `effect`, `cooldown_type` y `cooldown_scope_key`.
- `UserAchievement` impide logros duplicados por usuario.

## Validación

Doctor comprueba schema, existencia de eventos, consumidor `gamification`, contexto de usuario, estado persistente de cooldown y ausencia de condiciones lógicas en string.

- `GamificationRuleState` persiste cooldowns por `user_id`, `rule_id`, `cooldown_scope_key` y ventana temporal.
- El procesador debe ignorar eventos sin contexto de usuario válido según `eligibility.user_context_source`.

## Idempotencia física por usuario

Las reglas antifatiga dependen de `user_id` no nulo. `ProgressRecord`, `UserAchievement` y `GamificationRuleState` no deben aceptar `user_id = NULL` en runtime MVP, porque las constraints únicas con columnas nulas pueden permitir duplicados equivalentes en MySQL/MariaDB.

Si el evento carece de usuario resoluble, el procesador debe clasificarlo como no elegible para gamificación persistente. Esta decisión no impide auditar el evento; solo impide conceder progreso, logros o cooldowns sin usuario.
