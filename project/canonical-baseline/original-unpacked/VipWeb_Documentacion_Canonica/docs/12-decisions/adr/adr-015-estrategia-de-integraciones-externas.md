# ADR-015 — Estrategia de integraciones externas

**Estado:** Aceptada  
**Área:** Integraciones  
**Bloqueante:** Sí  
**Recomendación:** Capa preparada, conectores internos/simulados en MVP.

## Contexto

Esta decisión forma parte del cierre fundacional de VipWeb previo al Sprint 0. Debe considerarse vigente salvo que una ADR posterior la reemplace explícitamente.

## Decisión

VipWeb tendrá arquitectura de integración desde el inicio, pero el MVP no dependerá de proveedores externos críticos.

## Motivo

Mantiene visión de ecosistema conectado sin bloquear el MVP.

## Consecuencias

- Integraciones detrás de adaptadores.
- No OAuth multiproveedor ni APIs críticas al inicio.
- Módulo integrations entra como catálogo/preparación.

## Dependencias

- ADR-001
- ADR-002
- ADR-006

## Documentos afectados

- `docs/04-architecture/04-integration-architecture.md`
- `docs/05-domain-data/01-entities.md`

## Riesgos mitigados o residuales

- Vendor lock-in y retrasos por APIs si se integran demasiado pronto.

## Revisión futura

Solo debe revisarse si cambia el entorno real del proyecto, si se incorpora Git/despliegue externo, si el MVP cambia de alcance o si un módulo futuro introduce requisitos incompatibles.
