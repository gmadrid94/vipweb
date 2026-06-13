# ADR-005 — Modelo de autonomía IA operativa

**Estado:** Aceptada  
**Área:** IA  
**Bloqueante:** Sí  
**Recomendación:** Autonomía progresiva IA-0 a IA-3; IA-4 descartada al inicio.

## Contexto

Esta decisión forma parte del cierre fundacional de VipWeb previo al Sprint 0. Debe considerarse vigente salvo que una ADR posterior la reemplace explícitamente.

## Decisión

VipWeb arrancará con IA-0, preparará IA-1 y permitirá IA-2 solo con permisos, auditoría, tests, rollback local y aprobación. IA-3 queda para escalado futuro e IA-4 no se aprueba para el inicio.

## Motivo

La IA debe ayudar y proponer sin perder control ni trazabilidad.

## Consecuencias

- Toda acción IA debe registrarse.
- Cambios críticos requieren validación humana.
- La IA no marca validated sin evidencia.

## Dependencias

- ADR-004
- ADR-007
- ADR-009

## Documentos afectados

- `docs/09-ai-operations/00-ai-operating-model.md`
- `docs/09-ai-operations/03-ai-guardrails.md`

## Riesgos mitigados o residuales

- Cambios automáticos inseguros.

## Revisión futura

Solo debe revisarse si cambia el entorno real del proyecto, si se incorpora Git/despliegue externo, si el MVP cambia de alcance o si un módulo futuro introduce requisitos incompatibles.
