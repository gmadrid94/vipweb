# 00 Technical Overview

**Estado recomendado:** `READY_FOR_IMPLEMENTATION`
**Gate operativo aplicable:** `READY_FOR_IMPLEMENTATION` indica madurez documental, no permiso operativo por sí solo. Prevalecen `CURRENT_STATUS.md` y `machine/roadmap_gates.json`. Con el estado global actual `READY_FOR_SPRINT_0`, este documento solo puede guiar tareas permitidas por Sprint 0. No autoriza UI visible, Dashboard, Onboarding ni módulos funcionales hasta alcanzar `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT`.


## Propósito
Convertir la documentación fundacional en una base WAMP local ejecutable sin comprometer la portabilidad futura.

## Reglas técnicas
- PHP/MySQL/Apache local son punto de partida, no dependencia irreversible.
- Todo cambio debe registrarse en `evidence/sprint-0-local-execution.md`.
- Los catálogos `machine/*.json` son semillas y contratos.
- Antes de código visible: backup, SQL si existe, Doctor y seeds mínimos.
- No se guardan secretos reales en el repositorio.

## Criterios de validación
Sprint 0 puede empezar si existen backup, registro operativo, catálogos válidos, Doctor verde y rollback documentado.
