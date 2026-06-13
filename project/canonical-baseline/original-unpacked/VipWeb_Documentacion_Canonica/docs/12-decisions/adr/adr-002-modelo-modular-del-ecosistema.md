# ADR-002 — Modelo modular del ecosistema

**Estado:** Aceptada  
**Área:** Arquitectura  
**Bloqueante:** Sí  
**Recomendación:** Módulos autónomos por dominios con manifiesto, contratos, permisos y eventos.

## Contexto

Esta decisión forma parte del cierre fundacional de VipWeb previo al Sprint 0. Debe considerarse vigente salvo que una ADR posterior la reemplace explícitamente.

## Decisión

VipWeb crecerá por módulos independientes conectados al núcleo mediante manifiestos, contratos, eventos y permisos. Ningún módulo dependerá de la implementación interna de otro.

## Motivo

Evita crecimiento caótico y permite mantenimiento por IA.

## Consecuencias

- Cada módulo debe tener module.manifest.json.
- No hay dependencias circulares.
- La comunicación entre módulos será por interfaces declaradas.

## Dependencias

- ADR-001

## Documentos afectados

- `docs/04-architecture/02-modules.md`
- `docs/04-architecture/03-module-contracts.md`

## Riesgos mitigados o residuales

- Acoplamiento si un módulo accede directamente a tablas o funciones internas de otro.

## Revisión futura

Solo debe revisarse si cambia el entorno real del proyecto, si se incorpora Git/despliegue externo, si el MVP cambia de alcance o si un módulo futuro introduce requisitos incompatibles.
