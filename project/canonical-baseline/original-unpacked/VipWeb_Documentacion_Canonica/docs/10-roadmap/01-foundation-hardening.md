
# Fase 0 — Foundation Hardening

**Estado recomendado:** `READY_FOR_IMPLEMENTATION`
**Gate operativo aplicable:** `READY_FOR_IMPLEMENTATION` indica madurez documental, no permiso operativo por sí solo. Prevalecen `CURRENT_STATUS.md` y `machine/roadmap_gates.json`. Con el estado global actual `READY_FOR_SPRINT_0`, este documento solo puede guiar tareas permitidas por Sprint 0. No autoriza UI visible, Dashboard, Onboarding ni módulos funcionales hasta alcanzar `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT`.
  
**Fuente canónica:** `machine/roadmap_gates.json`.

## Objetivo
Cerrar `Foundation Hardening` con evidencias verificables antes de avanzar.

## Entrada obligatoria
- ZIP original preservado
- ADRs aceptadas

## Salida obligatoria
- Validación documental sin críticos
- catálogos machine válidos
- trazabilidad sincronizada

## No se puede avanzar si falta
- roles.json
- relationships.json
- module.schema.json

## Módulos afectados
- `core.doctor`
- `core.modules`

## Evidencia esperada
- `evidence/sprint-0-local-execution.md`
- `machine/traceability_matrix.json`

## Criterios de validación
Doctor debe pasar `ROADMAP_PHASES_HAVE_FULL_GATES` y la evidencia de la fase debe quedar registrada manualmente antes de ejecutar la siguiente.
