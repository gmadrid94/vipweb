
# Fase 6 — Integrations Stub

**Estado recomendado:** `READY_FOR_IMPLEMENTATION`
**Gate operativo aplicable:** `READY_FOR_IMPLEMENTATION` indica madurez documental, no permiso operativo por sí solo. Prevalecen `CURRENT_STATUS.md` y `machine/roadmap_gates.json`. Con el estado global actual `READY_FOR_SPRINT_0`, este documento solo puede guiar tareas permitidas por Sprint 0. No autoriza UI visible, Dashboard, Onboarding ni módulos funcionales hasta alcanzar `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT`.
  
**Fuente canónica:** `machine/roadmap_gates.json`.

## Objetivo
Cerrar `Integrations Stub` con evidencias verificables antes de avanzar.

## Entrada obligatoria
- module loader y config activos

## Salida obligatoria
- catálogo stub
- sin credenciales reales
- fallback seguro

## No se puede avanzar si falta
- integration.configured
- integration.configure

## Módulos afectados
- `integrations`

## Evidencia esperada
- `integrations-stub-report`

## Criterios de validación
Doctor debe pasar `ROADMAP_PHASES_HAVE_FULL_GATES` y la evidencia de la fase debe quedar registrada antes de ejecutar la siguiente.
