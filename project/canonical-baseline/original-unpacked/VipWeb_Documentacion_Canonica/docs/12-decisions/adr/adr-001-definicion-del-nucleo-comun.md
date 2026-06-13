# ADR-001 — Definición del núcleo común

**Estado:** Aceptada  
**Área:** Arquitectura  
**Bloqueante:** Sí  
**Recomendación:** Core mínimo de ecosistema, no monolito.

## Contexto

Esta decisión forma parte del cierre fundacional de VipWeb previo al Sprint 0. Debe considerarse vigente salvo que una ADR posterior la reemplace explícitamente.

## Decisión

VipWeb usará un núcleo común mínimo, modular y agnóstico, encargado solo de identidad, sesión, permisos base, navegación global, configuración común, registro de módulos, contratos, eventos, auditoría, observabilidad y documentación operativa para IA.

## Motivo

El core debe conectar módulos, webs y servicios sin absorber lógica específica. Esto maximiza modularidad, escalabilidad y mantenibilidad.

## Consecuencias

- Toda funcionalidad deberá clasificarse como core, módulo, integración o experiencia transversal.
- La lógica específica no entra en el core.
- Los módulos se comunican mediante contratos, eventos y permisos.

## Dependencias

- Ninguna dependencia previa directa.

## Documentos afectados

- `docs/00-foundation/03-core-definition.md`
- `docs/04-architecture/01-ecosystem-core.md`

## Riesgos mitigados o residuales

- Monolito si se permite lógica de módulo dentro del core.

## Revisión futura

Solo debe revisarse si cambia el entorno real del proyecto, si se incorpora Git/despliegue externo, si el MVP cambia de alcance o si un módulo futuro introduce requisitos incompatibles.
