# ADR-018 — Administración mínima del MVP

**Estado:** Aceptada  
**Área:** Admin/Seguridad  
**Bloqueante:** Sí  
**Recomendación:** Admin mínimo, no backoffice avanzado.

## Contexto

Esta decisión forma parte del cierre fundacional de VipWeb previo al Sprint 0. Debe considerarse vigente salvo que una ADR posterior la reemplace explícitamente.

## Decisión

VipWeb incluirá un panel Admin mínimo para usuarios, módulos, permisos, auditoría, evidencias, Doctor y estado del ecosistema.

## Motivo

Un ecosistema con IA, permisos, módulos y evidencias necesita control operativo.

## Consecuencias

- No incluye pagos, marketplace ni multiempresa.
- Acceso protegido por admin.access.
- Muestra evidencias aunque Doctor pueda ejecutarse por CLI.

## Dependencias

- ADR-004
- ADR-009
- ADR-023

## Documentos afectados

- `docs/03-functional/01-core-features.md`
- `docs/06-technical/05-security.md`

## Riesgos mitigados o residuales

- Ecosistema sin control si se aplaza.

## Revisión futura

Solo debe revisarse si cambia el entorno real del proyecto, si se incorpora Git/despliegue externo, si el MVP cambia de alcance o si un módulo futuro introduce requisitos incompatibles.
