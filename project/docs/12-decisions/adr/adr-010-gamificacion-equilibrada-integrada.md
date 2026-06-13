# ADR-010 — Gamificación equilibrada integrada

**Estado:** Aceptada  
**Área:** Gamificación  
**Bloqueante:** No  
**Recomendación:** Gamificación moderada basada en progreso, logros suaves y feedback útil.

## Contexto

Esta decisión forma parte del cierre fundacional de VipWeb previo al Sprint 0. Debe considerarse vigente salvo que una ADR posterior la reemplace explícitamente.

## Decisión

VipWeb integrará gamificación equilibrada desde la base, mediante eventos y reglas simples, sin rankings, rachas agresivas ni presión.

## Motivo

Refuerza acompañamiento y progreso sin infantilizar.

## Consecuencias

- El Dashboard muestra progreso.
- El onboarding emite eventos gamificables.
- La IA puede explicar progreso, no manipular reglas sin control.

## Dependencias

- ADR-006
- ADR-014

## Documentos afectados

- `docs/08-gamification/00-gamification-overview.md`
- `docs/08-gamification/06-balance-rules.md`

## Riesgos mitigados o residuales

- Gamificación invasiva si se exagera.

## Revisión futura

Solo debe revisarse si cambia el entorno real del proyecto, si se incorpora Git/despliegue externo, si el MVP cambia de alcance o si un módulo futuro introduce requisitos incompatibles.
