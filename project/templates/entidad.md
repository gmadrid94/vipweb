# Plantilla: Entidad

**Fuente canónica:** `machine/entities.json` y `machine/column_contracts.json`  
**Schema asociado:** `machine/schemas/entity.schema.json` y `machine/schemas/column-contract.schema.json`  
**Regla de prevalencia:** si esta plantilla y el schema divergen, prevalece el contrato machine-readable.

## 1. Identificación

- ID:
- Tabla:
- Owner module:
- Fase:
- Sensibilidad:
- Retención:
- Política de borrado:
- Documento fuente:
- Migración canónica:

## 2. Propósito y límites

- Definición:
- Qué representa:
- Qué no representa:
- Módulos que pueden escribir:
- Módulos que pueden leer:

## 3. Campos mínimos

| Campo | Tipo lógico | Tipo SQL WAMP | Nullable | Sensible | Exportable | IA readable | Evidencia allowed | Regla |
|---|---|---|---|---|---|---|---|---|
| `id` | `id` | `CHAR(36)` | No | No | No | No | No | PK |

## 4. Campos condicionales

| Campo | Condición | Nullability física | Regla runtime | Servicio responsable |
|---|---|---|---|---|
|  |  |  |  |  |

## 5. Relaciones y constraints

- Relaciones físicas:
- Índices mínimos:
- Constraints mínimos:
- Orden de migración:
- Política de FK:
- Política append-only/eventual:

## 6. IA, privacidad y evidencia

- Puede aparecer en contexto IA:
- Requiere redacción:
- Estrategia de redacción:
- Puede escribirse en evidencia:
- Restricciones de exportación:

## 7. Validación

- Checks Doctor esperados:
- Criterios de aceptación:
- Fixtures válidos/invalidos:
- Riesgos:
- Mitigación:
- Rollback:
