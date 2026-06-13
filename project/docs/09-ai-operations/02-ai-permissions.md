# 02 AI Permissions

| Permiso | Nivel | Runtime | Aprobación | Uso |
|---|---:|---|---:|---|
| `ai.read_context` | AI-0 | MVP activo | No | Leer documentación y catálogos. |
| `ai.suggest_changes` | AI-1 | MVP activo | No | Proponer cambios sin escribir. |
| `system.run_doctor.readonly` | AI-1 | foundation activo | No | Ejecutar Doctor sin modificar archivos. |
| `ai.write_draft` | AI-2 | MVP restringido, desactivado por defecto | Sí | Preparar borradores/staging. |
| `evidence.write` | AI-2 | MVP restringido, desactivado por defecto | Sí | Escribir evidencia versionada append-only. |
| `doctor.status.validate` | humano | humano-only | Sí | Validar estado; solo owner. |

## Regla

`system.run_doctor` queda como alias legacy deprecado y no debe aparecer en rutas ni roles IA.

Los permisos AI-2 deben declarar `ai_runtime_status=restricted_mvp`, `grant_requires_approval=true` y `grant_requires_disabled_by_default_role=true`.


## Semántica owner

`owner` no es un rol IA y no usa `permissions: ["*"]` en runtime. Sus permisos se expanden desde `machine/permissions.json`; las aprobaciones runtime siguen siendo obligatorias cuando correspondan.

`system.run_doctor` es un alias legacy deprecado y no se asigna a roles runtime. La ejecución permitida es `system.run_doctor.readonly` mediante la ruta declarada.

## Resolución de permisos IA

`machine/route_permission_matrix.json` controla acceso a superficies/rutas. `machine/action_contracts.json` controla ejecución de acciones. Toda acción con `ai_allowed=true` debe declarar `ai_roles`; la ejecución solo es válida si la ruta y la acción permiten el mismo rol IA, el nivel no supera `ai_level_max` y se cumplen los requisitos de `ApprovalRecord` cuando apliquen.
