# ADR-022 — Sistema visual y componentes MVP

**Estado:** Aceptada  
**Área:** UX/Frontend  
**Bloqueante:** Sí  
**Recomendación:** Mini design system propio con CSS modular.

## Contexto

Esta decisión forma parte del cierre fundacional de VipWeb previo al Sprint 0. Debe considerarse vigente salvo que una ADR posterior la reemplace explícitamente.

## Decisión

VipWeb usará un sistema visual propio, ligero y modular con HTML semántico, CSS organizado, tokens, componentes reutilizables y JavaScript vanilla.

## Motivo

Mantiene coherencia visual sin sobrecargar el MVP ni depender de frameworks.

## Consecuencias

- No Tailwind, Bootstrap, React, Vue ni UI kits en MVP.
- Componentes obligatorios: layout, module card, botones, alertas, estados vacíos, progreso, badges, ayuda IA, logro suave, tabla admin.
- Responsive básico y accesibilidad mínima.

## Dependencias

- ADR-003
- ADR-011

## Documentos afectados

- `docs/07-design-ux/04-components.md`
- `docs/06-technical/01-stack.md`

## Riesgos mitigados o residuales

- Deuda visual si se diseñan pantallas aisladas.

## Revisión futura

Solo debe revisarse si cambia el entorno real del proyecto, si se incorpora Git/despliegue externo, si el MVP cambia de alcance o si un módulo futuro introduce requisitos incompatibles.
