
# 08 Screen Component Contracts

**Estado recomendado:** `READY_FOR_IMPLEMENTATION`  
**Gate operativo aplicable:** `READY_FOR_IMPLEMENTATION` indica madurez documental, no permiso operativo por sí solo. Prevalecen `CURRENT_STATUS.md` y `machine/roadmap_gates.json`. Con el estado global actual `READY_FOR_SPRINT_0`, este documento solo puede guiar contratos de implementación futura y no autoriza UI visible hasta alcanzar `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT`.

**Fuente machine-readable:** `machine/screen_component_contracts.json`.

## Propósito

Cerrar la relación pantalla → componentes → datos → acciones → eventos para evitar reinterpretación visual o funcional durante la implementación por humanos o IA.

## Regla canónica

Ninguna pantalla MVP visible debe implementarse sin contrato de composición.

Cada contrato debe poder responder:

- qué pantalla se implementa;
- qué ruta y módulo la gobiernan;
- qué componentes mínimos aparecen;
- qué datos consume;
- qué acciones primarias/secundarias ofrece;
- qué eventos emite;
- qué fallback usa en loading, empty, error y permission denied;
- qué copy, responsive behavior, analítica, gamificación e IA helper aplica.

## Separación de responsabilidades

| Archivo | Responsabilidad |
|---|---|
| `machine/ui_screens.json` | Catálogo de pantallas, rutas, estados y permisos primarios. |
| `machine/screen_responsive_behavior.json` | Comportamiento responsive por breakpoint. |
| `machine/screen_component_contracts.json` | Composición operativa de pantalla. |
| `machine/ui_state_copy.json` | Copy por estado. |
| `machine/action_contracts.json` | Contratos de acciones mutables o auditadas. |

## Pantallas cubiertas

| Pantalla | Tipo de layout | Propósito de acompañamiento |
|---|---|---|
| `public_entry` | public_landing | Explicar VipWeb y derivar a login sin signup público. |
| `login` | auth_centered | Entrar con cuenta provisionada sin enumerar usuarios. |
| `onboarding` | guided_flow | Guiar activación inicial y mantener continuidad. |
| `dashboard` | continuity_hub | Ser punto común de módulos, progreso, próximo paso y ayuda. |
| `profile` | profile_panel | Permitir contexto mínimo editable sin exponer datos sensibles. |
| `notifications` | list_panel | Mostrar avisos internos sin proveedor externo real. |
| `admin` | admin_readonly | Operación segura read-only y evidencias. |
| `doctor_evidence` | evidence_readonly | Ver estado Doctor/evidencias sin validar automáticamente. |
| `modules_catalog` | catalog_grid | Descubrir módulos sin activar integraciones reales. |
| `progress` | progress_panel | Mostrar gamificación como orientación, no presión. |
| `ai_workspace` | ai_readonly_workspace | Mostrar asistencia IA limitada, auditada y no autónoma. |

## Criterios de validación

Doctor debe validar:

- `SCREEN_COMPONENT_CONTRACTS_EXIST`;
- `SCREEN_COMPONENT_CONTRACTS_COVER_MVP_SCREENS`;
- `SCREEN_COMPONENT_CONTRACTS_REFERENCE_VALID_SCREENS`;
- `SCREEN_COMPONENT_CONTRACTS_INCLUDE_ACCESSIBILITY_CONTRACT`;
- `ACCESSIBILITY_CONTRACTS_DECLARE_REQUIRED_FOCUS_AND_LIVE_REGIONS`.

## Criterio de aceptación para frontend

Una tarea de UI visible no está lista si:

- la pantalla no existe en `machine/screen_component_contracts.json`;
- algún componente referenciado no existe en catálogo;
- una acción primaria no existe en `machine/action_contracts.json` o no está marcada como navegación explícita;
- un evento emitido no existe en `machine/events.json`;
- falta fallback de permiso, loading o error;
- falta `accessibility_contract` o alguno de sus campos obligatorios.

## Contrato de accesibilidad por pantalla

Cada fila de `machine/screen_component_contracts.json` debe incluir `accessibility_contract`. Este bloque convierte la accesibilidad en una parte del contrato de pantalla, al mismo nivel que componentes, datos, acciones, estados, copy y responsive behavior.

Campos obligatorios:

| Campo | Regla |
|---|---|
| `keyboard_navigation` | Siempre `required`. |
| `initial_focus` | Punto de foco al entrar en la pantalla. |
| `focus_after_error` | Destino del foco tras error. |
| `focus_after_success` | Destino del foco tras éxito. |
| `aria_live_regions` | Regiones dinámicas anunciadas. |
| `landmarks` | Landmarks semánticos mínimos. |
| `label_control_mapping` | Relación label-control en formularios y controles. |
| `error_message_association` | Siempre `required`. |
| `reduced_motion_behavior` | Siempre respeta `prefers-reduced-motion`. |
| `color_contrast_level` | Mínimo `WCAG_AA`. |
| `empty_state_announcement` | Obligatorio cuando el estado empty sea dinámico. |
| `loading_state_announcement` | Obligatorio cuando exista carga async. |
| `table_or_list_semantics` | Obligatorio en tablas/listas; `not_applicable` si no aplica. |
| `manual_review_ref` | Referencia de revisión manual previa a UI visible. |

## Ejemplos mínimos por tipo de pantalla

| Tipo | Foco inicial | Error | Éxito | Particularidad accesible |
|---|---|---|---|---|
| Formulario | `first_form_field` | `first_invalid_field` | `success_message_or_next_primary_action` | Labels y errores asociados. |
| Dashboard | `main_heading` | `error_summary` | `success_message_or_next_primary_action` | Landmarks `main` y `nav`. |
| Lista/tabla | `main_heading` | `error_summary` | `success_message_or_next_primary_action` | Semántica de lista/tabla preservada. |
| Estado vacío | `main_heading` | `error_summary` | `success_message_or_next_primary_action` | Empty state anunciado si cambia dinámicamente. |

## Checks Doctor adicionales

Además de los checks existentes, Doctor debe validar:

- `SCREEN_COMPONENT_CONTRACTS_INCLUDE_ACCESSIBILITY_CONTRACT`;
- `ACCESSIBILITY_CONTRACTS_DECLARE_REQUIRED_FOCUS_AND_LIVE_REGIONS`.

## Contrato de analítica de pantalla y eventos de vista

Los campos `analytics_refs` de cada pantalla no son texto libre. Cada referencia debe existir en `machine/analytics_events.json` y pertenecer a uno de estos tipos:

| Tipo | Uso | Persistencia | Regla |
|---|---|---|---|
| `ui_analytics` | Medición de uso o fricción sin impacto funcional. | `none` o `aggregate`. | No puede alimentar gamificación ni modificar estado. |
| `domain_view_event` | Vista con impacto en métricas, activación, auditoría o gamificación. | `persistent`. | Requiere action contract `POST`; nunca se registra como mutación implícita de `GET`. |
| `domain_action_event` | Acción de usuario ya cubierta por un action contract existente. | `persistent`. | Debe enlazar con el evento de dominio canónico. |
| `system_observation` | Observabilidad de pantallas internas. | `aggregate` salvo decisión explícita. | No ejecuta acciones operativas por sí misma. |

Regla operativa: una pantalla puede renderizarse por `GET`, pero cualquier evento persistente de vista debe registrarse por una acción explícita posterior. Para MVP quedan definidos `DASHBOARD_VIEW_TRACK` y `ADMIN_PANEL_VIEW_TRACK`.
