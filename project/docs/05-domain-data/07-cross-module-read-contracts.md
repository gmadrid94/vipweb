
# 07 Cross-module read contracts

**Estado recomendado:** `READY_FOR_IMPLEMENTATION`  
**Gate operativo aplicable:** `READY_FOR_IMPLEMENTATION` indica madurez documental, no permiso operativo por sí solo. Prevalecen `CURRENT_STATUS.md` y `machine/roadmap_gates.json`. Con el estado global actual `READY_FOR_SPRINT_0`, este documento solo puede guiar tareas permitidas por Sprint 0. No autoriza UI visible, Dashboard, Onboarding ni módulos funcionales hasta alcanzar `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT`.

## Propósito

Definir cómo un módulo puede leer entidades propiedad de otro módulo sin crear acoplamiento silencioso ni exponer datos a IA fuera de contexto.

## Fuente canónica

- `machine/modules.json`
- `machine/schemas/module.schema.json`
- `machine/entities.json`
- `machine/doctor_checks.json`

## Regla principal

Toda lectura de una entidad cuyo `owner_module` sea distinto al módulo lector requiere un contrato `dependency_contracts.kind = data_read`.

## Contrato mínimo

| Campo | Obligatorio | Descripción |
|---|---|---|
| `module` | Sí | Módulo owner de la entidad. |
| `entity` | Sí | Entidad leída. |
| `owner_module` | Sí | Owner canónico según `machine/entities.json`. |
| `purpose` | Sí | Finalidad concreta de la lectura. |
| `allowed_fields` | Sí | Lista cerrada de campos autorizados. |
| `read_model` | Sí | Modelo de lectura autorizado. |
| `permission_context` | Sí | Permiso, rol o contexto que habilita la lectura. |
| `redaction_policy` | Sí | Redacción aplicable antes de exponer datos. |
| `failure_policy` | Sí | Fallback ante falta de contrato, owner o permiso. |
| `evidence_ref` | Sí | Evidencia esperada. |
| `doctor_check_ref` | Sí | `MODULE_READ_ENTITIES_HAVE_DATA_READ_CONTRACT`. |
| `ai_access_policy` | Sí | Condición específica para IA. |

## Lecturas prohibidas

- Consultas directas a tablas de otro módulo.
- Imports internos entre módulos para consultar repositorios privados.
- Lecturas de campos sensibles no incluidos en `allowed_fields`.
- Exposición de payload bruto de eventos o evidencias a IA.
- Usar permisos de escritura como autorización implícita de lectura.

## Validación

La solución queda bien planteada cuando Doctor falla si una entidad en `data.read_entities` pertenece a otro módulo y no existe contrato `data_read` completo.
