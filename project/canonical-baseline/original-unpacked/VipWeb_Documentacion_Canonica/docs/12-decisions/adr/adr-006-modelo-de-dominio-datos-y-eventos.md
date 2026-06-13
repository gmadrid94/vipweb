# ADR-006 — Modelo de dominio, datos y eventos

**Estado:** Aceptada  
**Área:** Datos  
**Bloqueante:** Sí  
**Recomendación:** Domain-first: entidades y eventos antes de tablas.

## Contexto

Esta decisión forma parte del cierre fundacional de VipWeb previo al Sprint 0. Debe considerarse vigente salvo que una ADR posterior la reemplace explícitamente.

## Decisión

VipWeb diseñará primero entidades, relaciones, eventos y reglas de dominio; después migraciones físicas.

## Motivo

Evita una base de datos improvisada y soporta módulos, IA, gamificación y auditoría.

## Consecuencias

- Los eventos existen desde la base.
- La auditoría se separa de eventos y logs técnicos.
- La gamificación consume eventos.

## Dependencias

- ADR-001
- ADR-002

## Documentos afectados

- `docs/05-domain-data/00-domain-model.md`
- `docs/05-domain-data/03-domain-events.md`

## Riesgos mitigados o residuales

- Datos acoplados y migraciones costosas si se improvisa.

## Revisión futura

Solo debe revisarse si cambia el entorno real del proyecto, si se incorpora Git/despliegue externo, si el MVP cambia de alcance o si un módulo futuro introduce requisitos incompatibles.
