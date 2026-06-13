# ADR-014 — Alcance del MVP

**Estado:** Aceptada  
**Área:** Producto  
**Bloqueante:** Sí  
**Recomendación:** Opción B confirmada por usuario.

## Contexto

Esta decisión forma parte del cierre fundacional de VipWeb previo al Sprint 0. Debe considerarse vigente salvo que una ADR posterior la reemplace explícitamente.

## Decisión

VipWeb tendrá un MVP de ecosistema guiado: core, identidad, permisos, dashboard, onboarding, módulos iniciales, progreso ligero, IA básica, admin mínimo, eventos, auditoría y evidencias.

## Motivo

Demuestra la promesa de ecosistema sin sobredimensionar.

## Consecuencias

- El MVP excluye pagos, marketplace, multiempresa, IA autónoma e integraciones reales complejas.
- Dashboard y onboarding son piezas centrales.

## Dependencias

- ADR-012
- ADR-013

## Documentos afectados

- `docs/02-product/04-mvp-definition.md`
- `CURRENT_STATUS.md`

## Riesgos mitigados o residuales

- MVP demasiado técnico o demasiado grande.

## Revisión futura

Solo debe revisarse si cambia el entorno real del proyecto, si se incorpora Git/despliegue externo, si el MVP cambia de alcance o si un módulo futuro introduce requisitos incompatibles.
