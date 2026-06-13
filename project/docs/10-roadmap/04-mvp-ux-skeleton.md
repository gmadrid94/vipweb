
# Fase 3 — MVP UX Skeleton

**Estado recomendado:** `READY_FOR_IMPLEMENTATION`
**Gate operativo aplicable:** `READY_FOR_IMPLEMENTATION` indica madurez documental, no permiso operativo por sí solo. Prevalecen `CURRENT_STATUS.md` y `machine/roadmap_gates.json`. Con el estado global actual `READY_FOR_SPRINT_0`, este documento solo puede guiar tareas permitidas por Sprint 0. No autoriza UI visible, Dashboard, Onboarding ni módulos funcionales hasta alcanzar `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT`.
  
**Fuente canónica:** `machine/roadmap_gates.json`.

## Objetivo
Cerrar `MVP UX Skeleton` con evidencias verificables antes de avanzar.

## Entrada obligatoria
- Core Runtime cerrado

## Salida obligatoria
- login UI
- onboarding
- dashboard
- profile
- notifications
- estados comunes

## No se puede avanzar si falta
- AppShell
- onboarding
- dashboard
- profile
- notifications

## Módulos afectados
- `dashboard`
- `onboarding`
- `profile`
- `notifications`
- `gamification`

## Evidencia esperada
- `ux-state-report`
- `journey-e2e-report`

## Criterios de validación
Doctor debe pasar `ROADMAP_PHASES_HAVE_FULL_GATES` y la evidencia de la fase debe quedar registrada antes de ejecutar la siguiente.

## Salida obligatoria de gamificación mínima

- `gamification runtime mínimo`: consume eventos MVP, mantiene `ProgressRecord`, aplica cooldown/idempotencia y expone `/progress` con fallback.
- La capa visual completa de logros queda como enrichment no bloqueante.
- Evidencia esperada: `gamification-rules-report`.

## Validación cualitativa antes de expansión visible

Antes de ampliar funcionalidad visible más allá del MVP UX Skeleton debe ejecutarse `MVP_QUALITATIVE_VALIDATION_PROTOCOL` cuando exista superficie usable.

El gate no sustituye métricas cuantitativas, pero impide avanzar si los primeros usuarios no comprenden:

- qué es el ecosistema;
- qué hacer después del onboarding;
- por qué volver al dashboard;
- cómo interpretar progreso y acompañamiento;
- cuáles son los límites de IA.
