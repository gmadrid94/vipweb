# ADR-007 — Canon documental y fuente de verdad

**Estado:** Aceptada  
**Área:** Documentación  
**Bloqueante:** Sí  
**Recomendación:** Markdown modular + JSON/YAML machine-readable + ADRs.

## Contexto

Esta decisión forma parte del cierre fundacional de VipWeb previo al Sprint 0. Debe considerarse vigente salvo que una ADR posterior la reemplace explícitamente.

## Decisión

VipWeb usará documentación modular como fuente principal, ADRs como máxima autoridad para decisiones críticas y catálogos machine-readable para IA y scripts.

## Motivo

Evita contradicciones y permite operación por humanos e IA.

## Consecuencias

- Ningún cambio crítico es válido sin documentación.
- Los catálogos JSON deben sincronizarse.
- PROJECT_STATE será resumen, no autoridad frente a ADR.

## Dependencias

- ADR-001

## Documentos afectados

- `docs/12-decisions/00-decision-log.md`
- `docs/09-ai-operations/07-machine-readable-docs.md`

## Riesgos mitigados o residuales

- Caos documental si código, backlog y docs divergen.

## Revisión futura

Solo debe revisarse si cambia el entorno real del proyecto, si se incorpora Git/despliegue externo, si el MVP cambia de alcance o si un módulo futuro introduce requisitos incompatibles.
