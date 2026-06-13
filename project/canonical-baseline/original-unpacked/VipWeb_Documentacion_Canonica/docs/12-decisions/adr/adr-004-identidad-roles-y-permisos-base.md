# ADR-004 — Identidad, roles y permisos base

**Estado:** Aceptada  
**Área:** Seguridad  
**Bloqueante:** Sí  
**Recomendación:** RBAC inicial con permisos explícitos, guards por módulo y auditoría.

## Contexto

Esta decisión forma parte del cierre fundacional de VipWeb previo al Sprint 0. Debe considerarse vigente salvo que una ADR posterior la reemplace explícitamente.

## Decisión

VipWeb tendrá autenticación básica, roles, permisos explícitos, guards y auditoría desde el primer desarrollo funcional.

## Motivo

Permite proteger admin, módulos, IA e integraciones desde el inicio.

## Consecuencias

- Deny by default.
- Los módulos declaran permisos.
- La IA no es superusuario.

## Dependencias

- ADR-001
- ADR-002

## Documentos afectados

- `docs/06-technical/05-security.md`
- `docs/09-ai-operations/02-ai-permissions.md`

## Riesgos mitigados o residuales

- Accesos indebidos si se aplaza.

## Revisión futura

Solo debe revisarse si cambia el entorno real del proyecto, si se incorpora Git/despliegue externo, si el MVP cambia de alcance o si un módulo futuro introduce requisitos incompatibles.
