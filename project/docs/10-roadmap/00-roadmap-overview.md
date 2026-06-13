# 00 Roadmap Overview

**Estado recomendado:** `CANONICAL`  
**Fuente canónica:** `machine/roadmap_gates.json`.

## Propósito
Mantener un único roadmap operativo que pueda ser seguido por personas, Doctor e IA sin reinterpretar fases ni saltar dependencias.

## Gates canónicos
- 0. Fase 0 — Foundation Hardening.
- 1. Fase 1 — Technical Skeleton / Sprint 0.
- 2. Fase 2 — Core Runtime.
- 3. Fase 3 — MVP UX Skeleton.
- 4. Fase 4 — Admin Read-only.
- 5. Fase 5 — AI-Assisted Operations.
- 6. Fase 6 — Integrations Stub.

## Relación Sprint 0 / Fase 1

Sprint 0 materializa operativamente la Fase 1 — Technical Skeleton. No es una entrada previa a esa fase; es su ejecución controlada y queda cerrado por `S0-013`.

## Regla de prevalencia
Si cualquier documento humano contradice `machine/roadmap_gates.json`, prevalece `machine/roadmap_gates.json`.

## Regla de avance
No avanzar de fase sin cumplir `entry`, `exit`, `evidence` y `blocking_if_missing`. Los documentos `LEGACY_REFERENCE` no autorizan implementación.

## Criterios de validación
Doctor debe pasar `ROADMAP_PHASES_HAVE_FULL_GATES` y `ROADMAP_HUMAN_DOCS_MATCH_MACHINE_GATES`.

## Preflight ADR-026 en Fase 1

Dentro de `Technical Skeleton / Sprint 0`, la tarea `S0-000A` evalúa si se activa ADR-026 antes de aplicar cambios protegidos preparados por IA.

Esta regla mantiene alineado el roadmap con IA operativa y control de cambios: en el modelo AI-first el proyecto oficial debe estar bajo Git, y ADR-026 debe activarse con datos locales reales antes de aplicar cambios protegidos preparados por IA.

## Alineación post-auditoría de gates

- Fase 1 mantiene Sprint 0 como base, pero exige que `S0-000A` y `protected_ai_write_gate` estén resueltos cuando existan cambios protegidos preparados por IA.

- Fase 1 valida que `UserContext` y `OnboardingSession` usan `user_id NOT NULL` y DCE-009/DCE-010 antes de ejecutar migraciones; esto evita rediseño temprano de onboarding, perfil y gamificación.
- Fase 2 no considera cerrado Core Runtime si `core.events` o `core.doctor` dependen solo de tareas base superseded; debe cerrarse `C1-003A` y `C1-006A` o documentarse una excepción aprobada.
- UI visible continúa bloqueada hasta `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT` y requiere contratos de accesibilidad por pantalla.
- Fase 5 puede entrar en `AI_ASSISTED_SETUP` sin `AIActionLog`, pero no puede cerrarse ni declarar `AI_ASSISTED_OPERATIONAL` hasta completar `AI3-001` y registrar `AIActionLog` como salida bloqueante.


## Modelo AI-first de ejecución

El roadmap se ejecuta bajo el modelo `AI_FIRST_LOCAL_EXECUTION`:

- GPT analiza, planifica y revisa logs.
- Codex prepara cambios dentro de `C:/wamp64/www/vipweb` cuando el gate lo permita.
- Las tools externas de `C:/wamp64/www/vipweb_tools` ejecutan tareas locales que requieren acceso real a WAMP, MySQL/MariaDB, Git o filesystem.
- El owner humano lanza `.bat/.cmd`, introduce datos privados, aprueba gates y registra evidencia final.

La fuente específica de ejecución AI-first es `docs/10-roadmap/09-ai-first-roadmap-execution.md`.

`C:/wamp64/www/vipweb` es el repo oficial Git. `C:/wamp64/www/vipweb_tools` no sustituye a `C:/wamp64/www/vipweb/tools`; son capas distintas.
