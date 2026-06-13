# 06 Testing


## Propósito
Definir los tests mínimos que deben existir antes de cerrar Sprint 0, Core Runtime o una tarea MVP.
**Estado recomendado:** `READY_FOR_IMPLEMENTATION`
**Gate operativo aplicable:** `READY_FOR_IMPLEMENTATION` indica madurez documental, no permiso operativo por sí solo. Prevalecen `CURRENT_STATUS.md` y `machine/roadmap_gates.json`. Con el estado global actual `READY_FOR_SPRINT_0`, este documento solo puede guiar tareas permitidas por Sprint 0. No autoriza UI visible, Dashboard, Onboarding ni módulos funcionales hasta alcanzar `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT`.


## Capas de test mínimas
1. **Doctor tests:** validan estructura, referencias y checks negativos.
2. **Contract tests:** manifests, permisos, eventos, entidades y rollback.
3. **RBAC tests:** ruta, método, rol, permiso y mutabilidad.
4. **Data tests:** migraciones, constraints, índices y borrado lógico.
5. **UX state tests:** loading, empty, error, blocked, success.
6. **IA guardrail tests:** AI-1 sin escritura, AI-2 con aprobación, AI-4 bloqueado.

## Tests negativos obligatorios
- Ruta con permiso inexistente.
- `/logout` con `auth.login`.
- IA asistente con `evidence.write`.
- Relación sin constraint físico.
- Módulo sin rollback.
- Documento canónico con contenido de plantilla.

## Criterios de validación
Una tarea no está done si no indica test, evidencia y rollback.

## Matriz runtime obligatoria por acción

La cobertura mínima de runtime vive en `machine/runtime_test_matrix.json` y se valida contra `machine/schemas/runtime-test-matrix.schema.json`.

Reglas:

- Cada entrada de `machine/action_contracts.json` debe tener una fila con el mismo `action_id`.
- Toda acción mutable debe declarar pruebas de CSRF, payload, rollback, errores y permisos.
- Toda acción con `runtime_approval_required` o `approval_record_required` debe declarar pruebas negativas de ApprovalRecord: ausencia, expiración, reutilización, actor incorrecto y `scope_hash` inválido.
- Toda acción con `ai_allowed = true` debe declarar grupo `ai_guardrail`, fixtures adversariales y pruebas frente a contexto no confiable.
- Toda acción crítica debe tener pruebas de permisos, roles y auditoría cuando `audit_required = true`.

Doctor valida:

- `ACTION_CONTRACTS_HAVE_RUNTIME_TESTS`
- `APPROVAL_ACTIONS_HAVE_NEGATIVE_TESTS`
- `AI_ACTIONS_HAVE_GUARDRAIL_TESTS`
- `CRITICAL_ACTIONS_HAVE_AUDIT_AND_PERMISSION_TESTS`

Una acción crítica no puede considerarse lista si no tiene fila en la matriz y evidencia asociada.


## Fixtures de schema

Las fixtures de schema se dividen en dos grupos:

- `tests/fixtures/valid/`: casos positivos mínimos que prueban que cada schema crítico acepta su contrato mínimo.
- `tests/fixtures/invalid/`: casos negativos/adversariales que prueban que los schemas rechazan estructuras inseguras, incompletas o con propiedades no permitidas.

Regla de validación:

1. Las fixtures positivas deben validar contra su schema asociado.
2. Los catálogos reales de `machine/*.json` deben validar contra los schemas declarados en `machine/machine_manifest.json`.
3. Las fixtures negativas deben fallar contra su schema asociado.

Doctor valida esta separación con `POSITIVE_SCHEMA_FIXTURES_PASS` y `NEGATIVE_SCHEMA_FIXTURES_FAIL`.
