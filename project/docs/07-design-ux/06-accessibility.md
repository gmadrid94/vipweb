# 06 Accessibility


## Propósito
Garantizar que la experiencia acompañada sea usable por teclado, lectores de pantalla y usuarios con necesidades diversas desde el MVP.
**Estado recomendado:** `READY_FOR_IMPLEMENTATION`
**Gate operativo aplicable:** `READY_FOR_IMPLEMENTATION` indica madurez documental, no permiso operativo por sí solo. Prevalecen `CURRENT_STATUS.md` y `machine/roadmap_gates.json`. Con el estado global actual `READY_FOR_SPRINT_0`, este documento solo puede guiar tareas permitidas por Sprint 0. No autoriza UI visible, Dashboard, Onboarding ni módulos funcionales hasta alcanzar `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT`.


## Criterios mínimos
- Navegación completa por teclado.
- Contraste suficiente en texto, botones y estados.
- Estados no dependientes solo de color.
- Labels explícitos en formularios.
- Mensajes de error asociados al campo o región afectada.
- Estructura semántica de encabezados.
- Foco visible en navegación y acciones críticas.

## Reglas
No se cierra una pantalla MVP si no define comportamiento accesible para loading, empty, error, blocked y success.

## Criterios de validación
Las pantallas en `machine/ui_screens.json` deben listar estados y permiso primario; la implementación debe mapearlos a componentes accesibles.

## Contrato machine-readable por pantalla/componente

La accesibilidad deja de ser solo un criterio global y pasa a ser contrato verificable en `machine/screen_component_contracts.json::accessibility_contract`.

Cada pantalla MVP visible debe declarar:

- navegación completa por teclado;
- foco inicial;
- foco tras error;
- foco tras éxito;
- regiones `aria-live` para loading, error y success cuando aplique;
- landmarks mínimos;
- relación label-control en formularios y controles interactivos;
- asociación explícita de mensajes de error;
- comportamiento con `prefers-reduced-motion`;
- nivel mínimo de contraste `WCAG_AA`;
- anuncio de estados empty/loading cuando sean dinámicos;
- semántica de tabla o lista cuando aplique.

## Separación de reglas globales y contrato por pantalla

| Nivel | Fuente | Uso |
|---|---|---|
| Regla global | Este documento | Define principios mínimos de accesibilidad para todo el producto. |
| Contrato por pantalla | `machine/screen_component_contracts.json` | Define foco, live regions, landmarks y comportamiento accesible concreto. |
| Validación automática | `scripts/update_script.py` / `machine/doctor_checks.json` | Detecta ausencia de contrato accesible antes de UI visible. |
| Revisión manual | `ACCESSIBILITY_MANUAL_REVIEW_REQUIRED_BEFORE_VISIBLE_UI` | Revisión final de teclado, lector de pantalla y foco real. |

## Criterio adicional de cierre UI

Ninguna tarea de UI visible puede cerrarse si la pantalla o componente interactivo carece de `accessibility_contract`. Si la validación automática pasa pero la revisión manual detecta fallo de foco, etiqueta, error o estado dinámico, la tarea permanece abierta.
