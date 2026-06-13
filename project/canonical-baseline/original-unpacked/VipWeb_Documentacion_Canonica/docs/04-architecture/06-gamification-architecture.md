# 06 Gamification Architecture

**Estado recomendado:** `READY_FOR_IMPLEMENTATION`
**Gate operativo aplicable:** `READY_FOR_IMPLEMENTATION` indica madurez documental, no permiso operativo por sí solo. Prevalecen `CURRENT_STATUS.md` y `machine/roadmap_gates.json`. Con el estado global actual `READY_FOR_SPRINT_0`, este documento solo puede guiar tareas permitidas por Sprint 0. No autoriza UI visible, Dashboard, Onboarding ni módulos funcionales hasta alcanzar `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT`.
  
**Fuente canónica:** ADR-011, `machine/gamification_rules.json`, `machine/events.json`.

## Propósito
Asegurar que la gamificación forma parte de producto, datos y eventos, no solo de la capa visual.

## Arquitectura
- Los eventos de dominio alimentan progreso.
- `ProgressRecord` registra puntos derivados de eventos permitidos.
- `Achievement` define logros versionables por código y condición.
- Dashboard muestra continuidad, progreso y siguiente paso.
- Reglas antifatiga evitan loops y recompensas vacías.

## Reglas canónicas
1. No se otorgan puntos sin evento fuente o ajuste manual auditado.
2. Los logros deben tener código único y condición trazable.
3. Gamificación no puede bloquear acciones críticas de usuario.
4. La UI debe mostrar progreso sin convertirlo en obligación agresiva.

## Criterios de validación
`GAMIFICATION_RULES_HAVE_EVENT_SOURCES` debe verificar que cada fuente existe en `machine/events.json` y que las entidades relacionadas tienen constraints.

## Riesgos si se incumple
Gamificación decorativa, métricas infladas, fatiga de usuario o progreso no auditable.
