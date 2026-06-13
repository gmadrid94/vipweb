# ADR-016 — Dashboard como primer módulo funcional real

**Estado:** Aceptada  
**Área:** Producto/UX  
**Bloqueante:** Sí  
**Recomendación:** Dashboard del ecosistema primero.

## Contexto

Esta decisión forma parte del cierre fundacional de VipWeb previo al Sprint 0. Debe considerarse vigente salvo que una ADR posterior la reemplace explícitamente.

## Decisión

El primer módulo visible será el Dashboard, centro de control del ecosistema, continuidad del usuario, módulos, progreso, estado e IA básica.

## Motivo

Hace visible la promesa de ecosistema.

## Consecuencias

- El Dashboard consume contratos, no datos internos.
- Muestra módulos, progreso, próximos pasos y ayuda IA.
- No sustituye al Admin.

## Dependencias

- ADR-014
- ADR-023

## Documentos afectados

- `docs/07-design-ux/03-screens.md`
- `docs/02-product/02-user-journeys.md`

## Riesgos mitigados o residuales

- VipWeb parecería una web aislada si se empieza por otra funcionalidad.

## Revisión futura

Solo debe revisarse si cambia el entorno real del proyecto, si se incorpora Git/despliegue externo, si el MVP cambia de alcance o si un módulo futuro introduce requisitos incompatibles.
