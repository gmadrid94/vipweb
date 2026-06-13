
# 06 Approval Records

**Estado recomendado:** `READY_FOR_IMPLEMENTATION`
**Gate operativo aplicable:** `READY_FOR_IMPLEMENTATION` indica madurez documental, no permiso operativo por sí solo. Prevalecen `CURRENT_STATUS.md` y `machine/roadmap_gates.json`. Con el estado global actual `READY_FOR_SPRINT_0`, este documento solo puede guiar tareas permitidas por Sprint 0. No autoriza UI visible, Dashboard, Onboarding ni módulos funcionales hasta alcanzar `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT`.


## Propósito

`ApprovalRecord` registra aprobaciones humanas para acciones sensibles, especialmente acciones AI-2, cambios de evidencia, módulos, integraciones, migraciones y validación de estado Doctor.

## Decisión

`ApprovalRecord` pertenece a `core.audit`, no a `ai_assistant`. La aprobación es una capacidad transversal de auditoría y puede aplicar también a acciones humanas críticas.

## Campos mínimos

- `id`
- `requested_by`
- `approved_by`
- `action_type`
- `permission_requested`
- `scope`
- `risk_level`
- `files_affected`
- `rollback_plan`
- `status`
- `expires_at`
- `evidence_ref`
- `created_at`
- `approved_at`
- `consumed_at`
- `scope_hash`
- `idempotency_key`
- `consumed_by_action_id`

## Reglas

- Es append-only para la intención de aprobación. Los campos de transición solo pueden cambiar mediante `core.audit.ApprovalService`.
- `expires_at` es obligatorio.
- `approved_by` debe ser humano en acciones críticas.
- Acciones de escritura requieren `rollback_plan`.
- Un `approval_id` solo puede consumirse si está aprobado, no expirado y coincide con `action_type`, `permission_requested`, `scope_hash`, `risk_level` e `idempotency_key`.
- El consumo debe ser atómico con la acción protegida.
- `approved_by` debe resolver a un actor humano para acciones críticas o AI-2.

## Criterios de validación

Doctor debe pasar:

- `AI_APPROVAL_RECORD_ENTITY_DEFINED`
- `AI_APPROVAL_RECORD_REFERENCED_BY_AI_ACTION_LOG`
- `APPROVAL_RECORD_APPROVED_BY_LIFECYCLE_NULLABILITY`
- `APPROVAL_RECORD_EXPIRES_AT_REQUIRED`
- `APPROVAL_RECORD_STATUS_CONDITIONAL_FIELDS_DEFINED`
- `APPROVAL_RECORD_CONSUMPTION_FIELDS_CONDITIONAL`
- `AI2_ACTIONS_REQUIRE_APPROVAL_RECORD`


## Lifecycle runtime

`ApprovalRecord` es una entidad de lifecycle por estados. La nullability física debe permitir crear una solicitud pendiente, pero no debe permitir aprobaciones sin expiración.

| Estado | `approved_by` | `approved_at` | `expires_at` | `consumed_at` | `consumed_by_action_id` | Transiciones permitidas |
|---|---|---|---|---|---|---|
| `requested` | `null` | `null` | `not null` | `null` | `null` | `approved`, `rejected`, `expired` |
| `approved` | `not null` | `not null` | `not null` | `null` | `null` | `consumed`, `expired` |
| `consumed` | `not null` | `not null` | `not null` | `not null` | `not null` | ninguna |
| `rejected` | `null` o actor humano que rechaza si se modela así | `null` | `not null` | `null` | `null` | ninguna |
| `expired` | `null` si expiró desde `requested`; `not null` si expiró desde `approved` | nullable según estado previo | `not null` | `null` | `null` | ninguna |

## Nullability física obligatoria

| Campo | Nullability física | Regla semántica |
|---|---|---|
| `approved_by` | nullable | Obligatorio solo cuando `status in approved|consumed`. Debe ser `null` en `requested`. |
| `approved_at` | nullable | Obligatorio solo cuando `status in approved|consumed`. |
| `expires_at` | not null | Obligatorio desde `requestApproval()` para todos los estados. |
| `consumed_at` | nullable | Obligatorio solo cuando `status = consumed`. |
| `consumed_by_action_id` | nullable | Obligatorio solo cuando `status = consumed`. |

Supuesto razonable: `rejected` no necesita `approved_at`; puede registrar el actor de rechazo en `approved_by` solo si la implementación decide reutilizar ese campo para actor humano de decisión. Si se separa en el futuro, deberá hacerse con una ADR o cambio de contrato explícito.


### Operaciones de `ApprovalService`

`ApprovalService` expone las operaciones mínimas:

- `requestApproval()`
- `approve()`
- `reject()`
- `expire()`
- `validateForAction()`
- `consumeForAction()`
- `linkEvidence()`

## Inmutabilidad por grupos

Campos de intención inmutables:

- `requested_by`
- `action_type`
- `permission_requested`
- `scope`
- `scope_hash`
- `risk_level`
- `files_affected`
- `rollback_plan`
- `idempotency_key`
- `created_at`

Campos de transición controlados por `ApprovalService`:

- `status`
- `approved_by`
- `approved_at`
- `consumed_at`
- `consumed_by_action_id`
- `evidence_ref`

Toda transición debe registrar `AuditLog`. Ninguna acción sensible puede modificar `ApprovalRecord` directamente.

## Criterios runtime adicionales

Doctor debe pasar también:

- `APPROVAL_SERVICE_RUNTIME_DECLARED`
- `APPROVAL_REQUIRED_ACTIONS_USE_APPROVAL_SERVICE`
- `APPROVAL_SCOPE_HASH_REQUIRED`
- `APPROVAL_CONSUMPTION_IS_ATOMIC`
- `APPROVAL_CONSUMED_BY_ACTION_ID_REQUIRED`
