# Modelo de dominio

**Estado recomendado:** `READY_FOR_IMPLEMENTATION`
**Gate operativo aplicable:** `READY_FOR_IMPLEMENTATION` indica madurez documental, no permiso operativo por sí solo. Prevalecen `CURRENT_STATUS.md` y `machine/roadmap_gates.json`. Con el estado global actual `READY_FOR_SPRINT_0`, este documento solo puede guiar tareas permitidas por Sprint 0. No autoriza UI visible, Dashboard, Onboarding ni módulos funcionales hasta alcanzar `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT`.


## Principio

VipWeb usa un modelo domain-first. Las migraciones, seeds, eventos, permisos y contratos de módulo se derivan de entidades y relaciones canónicas, no de decisiones improvisadas de implementación.

## Fuentes canónicas

- Entidades: `machine/entities.json`.
- Relaciones y orden de migración: `machine/relationships.json`.
- Eventos: `machine/events.json`.
- Roles: `machine/roles.json`.
- Permisos: `machine/permissions.json`.

## Gate

No se implementan migraciones si la entidad no declara campos mínimos, constraints, owner, sensibilidad, política de borrado y orden de migración.
