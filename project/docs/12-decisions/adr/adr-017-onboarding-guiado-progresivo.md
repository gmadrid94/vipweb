# ADR-017 — Onboarding guiado progresivo

**Estado:** Aceptada  
**Área:** UX/Producto  
**Bloqueante:** Sí  
**Recomendación:** Onboarding breve, accionable y conectado al Dashboard.

## Contexto

Esta decisión forma parte del cierre fundacional de VipWeb previo al Sprint 0. Debe considerarse vigente salvo que una ADR posterior la reemplace explícitamente.

## Decisión

VipWeb tendrá onboarding progresivo para explicar el ecosistema, captar contexto mínimo, activar módulos iniciales y llevar al Dashboard con progreso.

## Motivo

Activa al usuario y reduce abstracción.

## Consecuencias

- Debe emitir onboarding.completed y user.onboarded.
- Debe permitir retomar o saltar partes no críticas.
- IA puede explicar, no decidir por el usuario.

## Dependencias

- ADR-014
- ADR-016

## Documentos afectados

- `docs/02-product/02-user-journeys.md`
- `docs/07-design-ux/03-screens.md`

## Riesgos mitigados o residuales

- Usuario perdido si el onboarding es pasivo o largo.

## Revisión futura

Solo debe revisarse si cambia el entorno real del proyecto, si se incorpora Git/despliegue externo, si el MVP cambia de alcance o si un módulo futuro introduce requisitos incompatibles.
