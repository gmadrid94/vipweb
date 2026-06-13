# ADR-024 — Backlog ejecutable y Sprint 0

**Estado:** Aceptada  
**Área:** Roadmap/Backlog  
**Bloqueante:** Sí  
**Recomendación:** Sprint 0 antes de funcionalidades visibles.

## Contexto

Esta decisión forma parte del cierre fundacional de VipWeb previo al Sprint 0. Debe considerarse vigente salvo que una ADR posterior la reemplace explícitamente.

## Decisión

VipWeb ejecutará Sprint 0 para estructura, documentación mínima, ADRs, catálogos JSON, scripts, configuración WAMP, migraciones, seeds, Doctor, evidencias, registro operativo local y backups.

## Motivo

Convierte la base fundacional en una base real de trabajo.

## Consecuencias

- No se empieza por Dashboard ni UI.
- update_script.py mantiene nombre estable.
- Sprint 0 cierra cuando no quedan decisiones bloqueantes abiertas.

## Dependencias

- ADR-007
- ADR-008
- ADR-019
- ADR-020
- ADR-021
- ADR-023

## Documentos afectados

- `docs/11-backlog/00-backlog-overview.md`
- `CURRENT_STATUS.md`

## Riesgos mitigados o residuales

- Documentación no ejecutable si no se baja a Sprint 0.

## Revisión futura

Solo debe revisarse si cambia el entorno real del proyecto, si se incorpora Git/despliegue externo, si el MVP cambia de alcance o si un módulo futuro introduce requisitos incompatibles.
