# ADR-013 — Modelo de negocio inicial

**Estado:** Aceptada  
**Área:** Negocio  
**Bloqueante:** No  
**Recomendación:** Opción B confirmada por usuario.

## Contexto

Esta decisión forma parte del cierre fundacional de VipWeb previo al Sprint 0. Debe considerarse vigente salvo que una ADR posterior la reemplace explícitamente.

## Decisión

VipWeb usará un modelo freemium modular progresivo: primero base útil y después módulos avanzados, integraciones, IA operativa o capacidades profesionales monetizables.

## Motivo

Encaja con modularidad y permite monetización futura sin sobrecargar el MVP.

## Consecuencias

- Separar core incluido de módulos premium futuros.
- No implementar pagos en MVP.
- Medir uso por módulo.

## Dependencias

- ADR-012

## Documentos afectados

- `docs/01-business/04-business-model.md`
- `docs/02-product/05-feature-classification.md`

## Riesgos mitigados o residuales

- Core/premium mal clasificado si se decide tarde.

## Revisión futura

Solo debe revisarse si cambia el entorno real del proyecto, si se incorpora Git/despliegue externo, si el MVP cambia de alcance o si un módulo futuro introduce requisitos incompatibles.
