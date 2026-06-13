# ADR-008 — Roadmap operativo y orden de construcción

**Estado:** Aceptada  
**Área:** Roadmap  
**Bloqueante:** Sí  
**Recomendación:** Construcción por capas: fundación, core, permisos, MVP, estabilidad, expansión.

## Contexto

Esta decisión forma parte del cierre fundacional de VipWeb previo al Sprint 0. Debe considerarse vigente salvo que una ADR posterior la reemplace explícitamente.

## Decisión

VipWeb se construirá de dentro hacia fuera: documentación, estructura, core, datos, permisos, evidencias, después experiencia y módulos visibles.

## Motivo

Evita empezar por pantallas sin base y protege escalabilidad.

## Consecuencias

- El backlog debe respetar fases.
- Tareas fuera de fase se aparcan.
- El MVP no incluye pagos ni integraciones reales complejas.

## Dependencias

- ADR-001
- ADR-002
- ADR-006
- ADR-007

## Documentos afectados

- `docs/10-roadmap/00-roadmap-overview.md`
- `docs/11-backlog/00-backlog-overview.md`

## Riesgos mitigados o residuales

- MVP vistoso pero frágil si se ignora.

## Revisión futura

Solo debe revisarse si cambia el entorno real del proyecto, si se incorpora Git/despliegue externo, si el MVP cambia de alcance o si un módulo futuro introduce requisitos incompatibles.
