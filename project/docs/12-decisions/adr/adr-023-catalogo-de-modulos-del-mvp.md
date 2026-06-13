# ADR-023 — Catálogo de módulos del MVP

**Estado:** Aceptada  
**Área:** Arquitectura/Producto  
**Bloqueante:** Sí  
**Recomendación:** 15 módulos iniciales: 7 core y 8 funcionales.

## Contexto

Esta decisión forma parte del cierre fundacional de VipWeb previo al Sprint 0. Debe considerarse vigente salvo que una ADR posterior la reemplace explícitamente.

## Decisión

El MVP incluirá core.identity, core.permissions, core.modules, core.events, core.audit, core.config, core.doctor, dashboard, onboarding, profile, notifications, admin, gamification, ai_assistant e integrations.

## Motivo

Demuestra ecosistema modular sin sobrecargar.

## Consecuencias

- Cada módulo debe tener manifiesto, permisos, eventos, dependencias, README y tests mínimos.
- Billing, marketplace, analytics avanzado, automation engine, teams, advanced AI y OAuth externo quedan fuera.

## Dependencias

- ADR-001
- ADR-002
- ADR-014

## Documentos afectados

- `docs/04-architecture/02-modules.md`
- `machine/modules.json`

## Riesgos mitigados o residuales

- MVP pobre si hay menos módulos o demasiado grande si entran módulos futuros.

## Revisión futura

Solo debe revisarse si cambia el entorno real del proyecto, si se incorpora Git/despliegue externo, si el MVP cambia de alcance o si un módulo futuro introduce requisitos incompatibles.
