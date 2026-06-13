# Plantilla: API

**Fuente canónica:** `machine/action_contracts.json, machine/action_payloads/*.schema.json`  
**Schema asociado:** `machine/schemas/action-contract.schema.json`  
**Regla de prevalencia:** si esta plantilla y el schema divergen, prevalece el contrato machine-readable.

## 1. Identificación

- ID:
- Nombre:
- Estado:
- Owner:
- Módulo/área:
- Documento fuente:
- ADR/decisión asociada:
- Fase/roadmap:

## 2. Propósito y límites

- Objetivo:
- Usuario/actor afectado:
- Qué incluye:
- Qué excluye:
- Límites frente al core:
- Límites frente a otros módulos/documentos:
- Supuesto razonable si aplica:

## 3. Contrato operativo

| Elemento | Definición | Obligatorio | Fuente/validación |
|---|---|---|---|
| Entradas |  | Sí/No |  |
| Salidas |  | Sí/No |  |
| Estados | empty/loading/error/blocked/success | Sí |  |
| Errores |  | Sí si aplica |  |
| Permisos |  | Sí | `machine/permissions.json` / `machine/route_permission_matrix.json` |
| Eventos emitidos |  | Sí si aplica | `machine/events.json` |
| Eventos consumidos |  | Sí si aplica | `machine/events.json` |
| Dependencias |  | Sí | Roadmap/backlog/machine docs |

## 4. Datos y privacidad

- Entidades leídas:
- Entidades escritas:
- Campos mínimos:
- Datos sensibles:
- Reglas de redacción:
- Exportable a evidencia: Sí/No
- IA readable: Sí/No
- Retención o borrado si aplica:

## 5. IA operativa y guardrails

- Nivel IA permitido:
- Acciones IA permitidas:
- Acciones IA prohibidas:
- Requiere `ApprovalRecord`: Sí/No
- Requiere gate ADR-026/Git local mínimo: Sí/No/Condicional
- Evidencia requerida:
- Riesgo de automatización:
- Runbook asociado:

## 6. UX, accesibilidad y estados

- Pantallas/componentes relacionados:
- Copy refs:
- Responsive refs:
- Foco inicial:
- Foco tras error:
- Foco tras éxito:
- `aria-live` requerido:
- Landmarks:
- Relación label-control:
- `prefers-reduced-motion`:
- Contraste mínimo:

## 7. Gamificación y métricas

- Impacto en progreso:
- Eventos gamificados:
- Antifatiga/cooldown:
- Métricas de éxito:
- Riesgo de incentivo incorrecto:

## 8. Testing, validación y evidencia

- Criterios de aceptación:
  - [ ] Criterio verificable 1.
  - [ ] Criterio verificable 2.
  - [ ] Criterio verificable 3.
- Checks Doctor esperados:
- Fixtures/pruebas:
- Evidencia esperada:
- Validación manual requerida:

## 9. Riesgos y rollback

| Riesgo | Causa | Mitigación | Señal de alerta | Rollback |
|---|---|---|---|---|
|  |  |  |  |  |

## 10. Criterios de calidad

- Propósito claro.
- Límites explícitos.
- Dependencias documentadas.
- Contrato operativo verificable.
- Permisos, datos, IA, UX, accesibilidad, gamificación y métricas conectados cuando aplique.
- Relación con roadmap, backlog, Doctor y evidencia.
