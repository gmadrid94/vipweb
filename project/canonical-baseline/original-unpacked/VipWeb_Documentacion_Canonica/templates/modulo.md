# Plantilla: Módulo

**Fuente canónica:** `machine/modules.json`  
**Schema asociado:** `machine/schemas/module.schema.json`  
**Regla de prevalencia:** si esta plantilla y el schema divergen, prevalece el schema machine-readable.

## 1. Identificación

- ID:
- Nombre:
- Owner:
- Tipo de módulo:
- Fase:
- Lifecycle status:
- Documento fuente:
- ADR/decisión asociada:

## 2. Propósito y límites

- Objetivo:
- Incluye:
- Excluye:
- Responsabilidades principales:
- Límites frente al core:
- Límites frente a otros módulos:

## 3. Contrato del módulo

| Campo | Obligatorio | Regla | Ejemplo |
|---|---|---|---|
| `provides.routes` | Sí | Rutas expuestas o lista vacía justificada. | `/admin/modules` |
| `provides.permissions` | Sí | Permisos existentes en `machine/permissions.json`. | `admin.manage_modules` |
| `provides.events_emitted` | Sí | Eventos producidos por el módulo. | `module.activated` |
| `provides.events_consumed` | Sí | Eventos consumidos por el módulo. | `user.registered` |
| `data.owned_entities` | Sí | Entidades propiedad del módulo. | `ModuleManifest` |
| `data.read_entities` | Sí | Entidades leídas por contrato. | `User` |
| `forbidden.direct_imports_from` | Sí | Acoplamientos prohibidos. | `ai_assistant` |
| `validation.contract_tests` | Sí | Tests o checks mínimos. | `MODULE_SCHEMA_DEEP_CONTRACT` |
| `rollback.strategy` | Sí | Estrategia de reversión. | desactivar config key |

## 4. Dependencias

| Módulo | Tipo de dependencia | Motivo | Bloqueante | Contrato asociado |
|---|---|---|---|---|
|  | `runtime_blocking` / `permission_guard` / `event_bus` / `data_read` / `data_write` / `future_optional` |  | Sí/No |  |

## 5. IA, seguridad y datos

- ¿Puede ser leído por IA?:
- ¿Puede ser modificado por IA?:
- Permisos requeridos:
- Guardrails aplicables:
- Datos sensibles:
- Reglas de redacción:
- Evidencia requerida:

## 6. UX, eventos y gamificación

- Pantallas afectadas:
- Estados UI requeridos:
- Eventos emitidos:
- Eventos consumidos:
- Impacto en gamificación:
- Riesgo de experiencia fragmentada:

## 7. Validación

- Checks Doctor esperados:
- Fixtures o pruebas mínimas:
- Criterios de aceptación:
- Evidencia esperada:
- Riesgos:
- Rollback:
