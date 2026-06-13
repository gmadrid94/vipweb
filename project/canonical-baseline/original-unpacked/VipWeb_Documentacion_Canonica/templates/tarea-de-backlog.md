# Plantilla: Tarea de backlog

**Fuente canónica:** `machine/backlog_items.json` o `machine/sprint0_tasks.json`  
**Schema asociado:** `machine/schemas/backlog-item.schema.json` o `machine/schemas/sprint0-task.schema.json`  
**Regla de prevalencia:** si esta plantilla y el schema divergen, prevalece el catálogo machine-readable.

## 1. Identificación

- ID:
- Título:
- Prioridad:
- Fase:
- Estado:
- Módulo:
- Documento fuente:
- Decisión/ADR asociada:

## 2. Objetivo

- Descripción:
- Resultado esperado:
- Qué incluye:
- Qué excluye:
- Supuesto razonable si aplica:

## 3. Dependencias

| Dependencia | Tipo | Bloqueante | Motivo |
|---|---|---|---|
|  | tarea / doc / machine / ADR / evidencia | Sí/No |  |

## 4. Acciones

1. Leer documentos fuente.
2. Preparar cambio mínimo y trazable.
3. Validar contratos afectados.
4. Ejecutar Doctor si aplica.
5. Registrar evidencia esperada sin marcar estado validado automáticamente.

## 5. Archivos afectados y alcance

- `docs/...`
- `machine/...`
- `scripts/...`
- `database/...`

### Alcance granular obligatorio para ejecución

- `scope_intent`:
- `allowed_paths`:
- `forbidden_paths`:
- `requires_subtask_split`: Sí/No
- `approval_scope_hash_required`: Sí/No
- `rollback_unit`:

Regla: `app/*`, `machine/*` o `scripts/*` no son alcance ejecutable directo para cambios protegidos. Si aparecen como alcance conceptual, la tarea debe dividirse antes de ejecución en subtareas con rutas concretas y scope hash verificable.

## 6. Criterios de aceptación

- [ ] Criterio verificable 1.
- [ ] Criterio verificable 2.
- [ ] Criterio verificable 3.

## 7. Validación y evidencia

- Doctor check:
- Evidencia esperada:
- Tests/fixtures:
- Riesgo:
- Rollback local:
- Requiere aprobación humana:
- Requiere gate ADR-026/Git local mínimo:
