# ADR-009 — Sistema Doctor, evidencias y validación real

**Estado:** Aceptada  
**Área:** Calidad  
**Bloqueante:** Sí  
**Recomendación:** Doctor + evidencias + estados verificables desde el inicio.

## Contexto

Esta decisión forma parte del cierre fundacional de VipWeb previo al Sprint 0. Debe considerarse vigente salvo que una ADR posterior la reemplace explícitamente.

## Decisión

VipWeb tendrá Doctor, evidencias y estados estrictos. Ningún bloque se marcará como validated sin pruebas, reporte o evidencia.

## Motivo

Evita documentación falsa, avances no comprobados y acciones IA sin base real.

## Consecuencias

- `scripts/update_script.py` valida la documentación canónica actual en modo readonly.
- La evidencia local se completa manualmente en `evidence/sprint-0-local-execution.md`.
- Doctor runtime se implementará posteriormente a partir de `machine/doctor_checks.json`.
- La IA no puede falsear validaciones.

## Dependencias

- ADR-007

## Documentos afectados

- `docs/13-quality/00-quality-model.md`
- `docs/13-quality/04-documentation-quality.md`

## Riesgos mitigados o residuales

- Falsa sensación de avance.

## Revisión futura

Solo debe revisarse si cambia el entorno real del proyecto, si se incorpora Git/despliegue externo, si el MVP cambia de alcance o si un módulo futuro introduce requisitos incompatibles.
