# Plantilla: Test plan

**Fuente canónica:** documentación de calidad, `machine/doctor_checks.json` y schemas afectados  
**Schema asociado:** declarar aquí el schema si el test valida un catálogo concreto.  
**Regla de prevalencia:** los criterios de aceptación y checks Doctor prevalecen sobre esta plantilla.

## 1. Identificación

- ID:
- Nombre:
- Owner:
- Fase:
- Módulo:
- Alcance:
- Documentos fuente:
- Schemas afectados:

## 2. Objetivo

- Qué valida:
- Qué no valida:
- Riesgo que cubre:
- Decisión asociada:

## 3. Tipos de prueba

| Tipo | Obligatorio | Herramienta | Evidencia |
|---|---|---|---|
| Doctor | Sí si afecta documentación/catálogos | `python scripts/update_script.py` | Salida del validador documental |
| Schema | Sí si afecta JSON | JSON Schema Draft 2020-12 | Resultado validación |
| Fixture negativo | Sí si existe riesgo semántico | fixture inválido | Debe fallar |
| Manual | Solo si no es automatizable | checklist | referencia de revisión |

## 4. Casos de prueba

| Caso | Dato de entrada | Resultado esperado | Tipo | Criterio de aceptación |
|---|---|---|---|---|
|  |  |  |  |  |

## 5. Datos y entorno

- Entorno:
- Datos requeridos:
- Datos prohibidos:
- Redacción necesaria:
- Dependencias externas:

## 6. Evidencia y cierre

- Evidencia esperada:
- Ruta canónica de evidencia:
- Checks Doctor relacionados:
- Criterio de finalización:
- Riesgo residual:
- Rollback:
