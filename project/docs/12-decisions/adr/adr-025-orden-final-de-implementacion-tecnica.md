# ADR-025 — Orden final de implementación técnica

**Estado:** Aceptada  
**Área:** Implementación  
**Bloqueante:** Sí  
**Recomendación:** Implementar en local por capas.

## Contexto

Esta decisión forma parte del cierre fundacional de VipWeb previo al Sprint 0. Debe considerarse vigente salvo que una ADR posterior la reemplace explícitamente.

## Decisión

VipWeb se implementará en local WAMP siguiendo este orden: backup, estructura, documentación, catálogos, scripts, configuración, migraciones, seeds, core, identidad/permisos, admin, dashboard, onboarding, perfil/notificaciones, gamificación, IA, integraciones, validación.

## Motivo

Reduce riesgo, protege el trabajo mediante backups/Git según el gate vigente y evita empezar por pantallas sin base.

## Consecuencias

- El orden técnico queda cerrado.
- La primera acción real es backup local.
- Se excluyen Git, despliegue, pagos, IA autónoma y APIs externas al inicio.

## Dependencias

- ADR-024

## Documentos afectados

- `docs/10-roadmap/00-roadmap-overview.md`
- `docs/11-backlog/03-technical-tasks.md`

## Riesgos mitigados o residuales

- Pérdida de trabajo o deuda temprana si se altera el orden sin motivo.

## Revisión futura

Solo debe revisarse si cambia el entorno real del proyecto, si se incorpora Git/despliegue externo, si el MVP cambia de alcance o si un módulo futuro introduce requisitos incompatibles.
