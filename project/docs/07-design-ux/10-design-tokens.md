# 10 Design Tokens

**Estado recomendado:** `READY_FOR_IMPLEMENTATION`
**Gate operativo aplicable:** `READY_FOR_IMPLEMENTATION` indica madurez documental, no permiso operativo por sí solo. Prevalecen `CURRENT_STATUS.md` y `machine/roadmap_gates.json`. Con el estado global actual `READY_FOR_SPRINT_0`, este documento solo puede guiar tareas permitidas por Sprint 0. No autoriza UI visible, Dashboard, Onboarding ni módulos funcionales hasta alcanzar `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT`.
  
**Fuente canónica:** `machine/design_tokens.json`.

## Propósito

Este documento fija el contrato visual mínimo para iniciar la UI sin deuda visual temprana. No define una marca completa; define tokens semánticos suficientes para AppShell, módulos, dashboard, gamificación, panel IA, evidencias y estados de permiso.

## Tokens mínimos

Los tokens canónicos viven en `machine/design_tokens.json` y cubren:

- color: fondo, superficies, texto, primario, acento, éxito, aviso, peligro, información, borde y foco;
- tipografía: familia base, escala xs-2xl y alturas de línea;
- espacio: escala 1, 2, 3, 4, 6, 8, 12;
- radios: sm, md, lg, xl;
- sombras: sm, md y foco;
- motion: fast, base, slow y easing estándar;
- breakpoints: sm, md, lg, xl.

## Variantes base de componentes

| Componente | Variantes mínimas |
|---|---|
| `Button` | primary, secondary, ghost, danger |
| `ModuleCard` | available, disabled, stub, locked |
| `NextStepCard` | empty, active, completed, blocked |
| `ProgressSummary` | empty, updating, ready, capped |
| `AIHelperPanel` | idle, suggestion, blocked, approval-required |
| `EvidenceStatus` | passed, warning, failed, unknown |
| `PermissionGate` | allowed, denied, approval-required |

## Reglas de accesibilidad

- Contraste mínimo WCAG AA.
- Foco visible obligatorio.
- Ningún estado se comunica solo por color.
- Animaciones compatibles con `prefers-reduced-motion`.
- Target táctil mínimo de 44px.
- Todo estado interactivo debe tener texto visible o `aria-label`.

## Criterios de validación

Doctor debe pasar:

- `DESIGN_TOKENS_DECLARED`
- `DESIGN_TOKENS_SCHEMA_VALID`
- `UX_COMPONENT_VARIANTS_REFERENCE_VALID_TOKENS`
- `FOCUS_TOKEN_DECLARED`
- `ACCESSIBILITY_MINIMUM_TOKENS_DECLARED`
