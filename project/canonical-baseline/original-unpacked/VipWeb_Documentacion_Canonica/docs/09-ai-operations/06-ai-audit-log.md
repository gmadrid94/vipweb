# 06 AI Audit Log

**Estado recomendado:** `READY_FOR_IMPLEMENTATION`
**Gate operativo aplicable:** `READY_FOR_IMPLEMENTATION` indica madurez documental, no permiso operativo por sí solo. Prevalecen `CURRENT_STATUS.md` y `machine/roadmap_gates.json`. Con el estado global actual `READY_FOR_SPRINT_0`, este documento solo puede guiar tareas permitidas por Sprint 0. No autoriza UI visible, Dashboard, Onboarding ni módulos funcionales hasta alcanzar `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT`.


## Campos mínimos de AIActionLog

- `id`
- `actor_type`
- `actor_id`
- `ai_level`
- `action_type`
- `permission_used`
- `target_type`
- `target_id`
- `scope`
- `files_read`
- `files_changed`
- `approval_id`
- `evidence_ref`
- `risk_level`
- `status`
- `result`
- `error_summary`
- `created_at`

## Entidad de aprobación asociada

`approval_id` referencia físicamente `approval_records.id` cuando la acción requiere aprobación humana. La FK es nullable para AI-0/AI-1, obligatoria para AI-2+ con escritura y única cuando exista para impedir reutilización de aprobaciones.

## Reglas

- AI-0/AI-1 deben tener `files_changed=[]`.
- AI-2 con escritura requiere `approval_id`.
- `ApprovalRecord` se migra antes de `AIActionLog`.
- `approval_id` debe existir, estar aprobado, no estar expirado y coincidir con `action_type` y `scope`.
- `evidence.write` requiere `evidence_ref`.
- `doctor.status.validate` no puede ser ejecutado por IA.
- Las acciones con `files_changed` deben registrar rollback o descarte seguro.
