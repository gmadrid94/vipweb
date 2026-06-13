
# Fase 1 — Technical Skeleton / Sprint 0

**Estado recomendado:** `READY_FOR_IMPLEMENTATION`
**Gate operativo aplicable:** `READY_FOR_IMPLEMENTATION` indica madurez documental, no permiso operativo por sí solo. Prevalecen `CURRENT_STATUS.md` y `machine/roadmap_gates.json`. Con el estado global actual `READY_FOR_SPRINT_0`, este documento solo puede guiar tareas permitidas por Sprint 0. No autoriza UI visible, Dashboard, Onboarding ni módulos funcionales hasta alcanzar `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT`.
  
**Fuente canónica:** `machine/roadmap_gates.json`.

## Objetivo
Cerrar `Technical Skeleton / Sprint 0` con evidencias verificables antes de avanzar.


## Relación con Sprint 0

La Fase 1 — Technical Skeleton se ejecuta operativamente mediante Sprint 0.

Sprint 0 no es una fase previa a Technical Skeleton. Es el conjunto de tareas `S0-000` a `S0-013` que materializa esta fase.

La Fase 1 se considera cerrada cuando `S0-013` queda completado y existe evidencia canónica válida.

## Entrada obligatoria
- Foundation Hardening cerrado
- validación documental sin críticos
- Catálogos machine-readable válidos

## Salida obligatoria
- Sprint 0 cerrado mediante `S0-013`
- estructura WAMP creada
- scripts seguros
- config sin secretos
- migraciones iniciales creadas
- `schema_migrations` ledger creado
- migraciones iniciales ejecutadas localmente y registradas en ledger
- seeds iniciales creados
- seeds iniciales ejecutados localmente
- seed owner fail-closed validado
- `scripts/update_script.py` sin fallos
- evidencia inicial generada
- trazabilidad validada

## No se puede avanzar si falta
- backup
- config local
- `database/migrations`
- `database/migrations/000_create_schema_migrations.sql`
- `schema_migrations` ledger
- `database/seeds`
- seed owner fail-closed
- `scripts/update_script.py`

## Módulos afectados
- `core.config`
- `core.doctor`
- `core.events`

## Evidencia esperada
- `evidence/sprint-0-local-execution.md`
- `evidence/sprint-0-local-execution.md`
- `evidence/sprint-0-local-execution.md`
- `schema-migrations-ledger-validation-report`
- `migration-sql-apply-report`
- `core-seed-sql-apply-report`

## Criterios de validación
Doctor debe pasar `ROADMAP_PHASES_HAVE_FULL_GATES` y la evidencia de la fase debe quedar registrada manualmente antes de ejecutar la siguiente.

## ADR-026 preflight

La Fase 1 incluye `S0-000A` como preflight obligatorio para cambios protegidos preparados por IA. Ninguna tarea que cree o modifique estructura, scripts, schemas, catálogos, permisos, rutas, migraciones o contratos técnicos debe ejecutarse con cambios IA aplicados si el preflight indica que ADR-026 debe activarse y todavía no existe Git local mínimo.
