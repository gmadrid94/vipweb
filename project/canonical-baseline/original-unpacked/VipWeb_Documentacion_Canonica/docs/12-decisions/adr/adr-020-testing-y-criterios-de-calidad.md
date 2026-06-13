# ADR-020 — Testing y criterios de calidad

**Estado:** Aceptada  
**Área:** Calidad  
**Bloqueante:** Sí  
**Recomendación:** Calidad por capas conectada a Doctor y evidencias.

## Contexto

Esta decisión forma parte del cierre fundacional de VipWeb previo al Sprint 0. Debe considerarse vigente salvo que una ADR posterior la reemplace explícitamente.

## Decisión

VipWeb usará tests unitarios, integración, contratos, permisos, eventos, gamificación, IA guardrails, documentación y UX básica. Lo crítico tendrá cobertura fuerte.

## Motivo

Evita regresiones y falsos avances.

## Consecuencias

- Definition of Ready y Definition of Done obligatorias.
- Permisos con test de permitido y denegado.
- Doctor agrega la salud del proyecto.

## Dependencias

- ADR-004
- ADR-006
- ADR-009

## Documentos afectados

- `docs/13-quality/01-definition-of-ready.md`
- `docs/13-quality/02-definition-of-done.md`

## Riesgos mitigados o residuales

- Deuda invisible si se programa sin tests.

## Revisión futura

Solo debe revisarse si cambia el entorno real del proyecto, si se incorpora Git/despliegue externo, si el MVP cambia de alcance o si un módulo futuro introduce requisitos incompatibles.
