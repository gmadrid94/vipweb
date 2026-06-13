# 01 Entities

**Estado recomendado:** `READY_FOR_IMPLEMENTATION`
**Gate operativo aplicable:** `READY_FOR_IMPLEMENTATION` indica madurez documental, no permiso operativo por sí solo. Prevalecen `CURRENT_STATUS.md` y `machine/roadmap_gates.json`. Con el estado global actual `READY_FOR_SPRINT_0`, este documento solo puede guiar tareas permitidas por Sprint 0. No autoriza UI visible, Dashboard, Onboarding ni módulos funcionales hasta alcanzar `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT`.


Fuente canónica: `machine/entities.json` y `machine/column_contracts.json`.

## Contrato de migración

- Las migraciones ejecutables usan SQL plano reversible.
- Ruta canónica: `database/migrations/*.sql`.
- Nota de estado: las rutas `database/migrations/*.sql` son artefactos SQL físicos base presentes en el paquete, con estado `generated_not_executed`. Durante `S0-009` deben validarse contra `machine/entities.json`, `machine/column_contracts.json`, `machine/relationships.json`, `machine/physical_constraints_matrix.json` y `database/manifest.json`; no deben recrearse desde cero salvo regeneración aprobada.
- No se usan migraciones PHP en Sprint 0.
- Las FKs se declaran dentro de la migración de la tabla que contiene la FK.
- No se crean migraciones separadas `*_relation.sql` salvo alteraciones posteriores.
- Los acrónimos se normalizan en snake_case continuo: `AIActionLog` → `ai_action_logs` → `023_create_ai_action_logs.sql`.

## Catálogo de entidades

| Entidad | Tabla | Owner | Fase | Sensibilidad | Migración | Campos mínimos |
|---|---|---|---|---|---|---|
| User | users | `core.identity` | foundation | personal | database/migrations/001_create_users.sql | id, email, password_hash, display_name, status, created_at, updated_at, deleted_at |
| AuthAttempt | auth_attempts | `core.identity` | foundation | audit | database/migrations/002_create_auth_attempts.sql | id, email_hash, ip_hash, user_id, result, reason, created_at |
| Role | roles | `core.permissions` | foundation | system | database/migrations/003_create_roles.sql | id, code, label, role_type, risk_level, created_at, updated_at |
| Permission | permissions | `core.permissions` | foundation | system | database/migrations/004_create_permissions.sql | id, code, resource, action, risk_level, grant_requires_approval, created_at, updated_at |
| RolePermission | role_permissions | `core.permissions` | foundation | system | database/migrations/005_create_role_permissions.sql | role_id, permission_id, created_at |
| UserRole | user_roles | `core.permissions` | foundation | system | database/migrations/006_create_user_roles.sql | user_id, role_id, created_at |
| Module | modules | `core.modules` | foundation | system | database/migrations/007_create_modules.sql | id, code, name, module_type, phase, lifecycle_status, enabled, created_at, updated_at |
| ModuleManifest | module_manifests | `core.modules` | foundation | system | database/migrations/008_create_module_manifests.sql | id, module_id, manifest_version, manifest_json, checksum, status, created_at |
| DomainEvent | domain_events | `core.events` | foundation | audit | database/migrations/009_create_domain_events.sql | id, event_id, event_version, producer_module, payload_json, privacy_level, created_at |
| AuditLog | audit_logs | `core.audit` | foundation | audit | database/migrations/010_create_audit_logs.sql | id, actor_type, actor_id, action, target_type, target_id, risk_level, created_at |
| ApprovalRecord | approval_records | `core.audit` | foundation | audit | database/migrations/011_create_approval_records.sql | id, requested_by, approved_by, action_type, permission_requested, scope, risk_level, files_affected, rollback_plan, status, expires_at, evidence_ref, created_at, approved_at, consumed_at |
| SystemSetting | system_settings | `core.config` | foundation | system | database/migrations/012_create_system_settings.sql | id, key, value_json, scope, is_secret, created_at, updated_at |
| EvidenceReport | evidence_reports | `core.doctor` | foundation | audit | database/migrations/013_create_evidence_reports.sql | id, kind, status, payload_json, checksum, created_at |
| BackupRecord | backup_records | `core.config` | foundation | audit | database/migrations/014_create_backup_records.sql | id, path, reason, created_by, created_at |
| DecisionRecord | decision_records | `core.events` | foundation | system | database/migrations/015_create_decision_records.sql | id, adr, decision_id, status, payload_json, created_at, updated_at |
| UserContext | user_contexts | `profile` | mvp | personal | database/migrations/016_create_user_contexts.sql | id, user_id, context_json, onboarding_state, created_at, updated_at |
| OnboardingSession | onboarding_sessions | `onboarding` | mvp | personal | database/migrations/017_create_onboarding_sessions.sql | id, user_id, status, current_step, started_at, completed_at, updated_at |
| Notification | notifications | `notifications` | mvp | personal | database/migrations/018_create_notifications.sql | id, user_id, type, title, body, read_at, created_at |
| Achievement | achievements | `gamification` | mvp | system | database/migrations/019_create_achievements.sql | id, code, label, description, condition_json, achievement_type, active, created_at, updated_at |
| UserAchievement | user_achievements | `gamification` | mvp | personal | database/migrations/020_create_user_achievements.sql | id, user_id, achievement_id, source_event_id, source_rule_id, unlocked_at, created_at |
| GamificationRuleState | gamification_rule_states | `gamification` | mvp | personal | database/migrations/021_create_gamification_rule_states.sql | id, user_id, rule_id, cooldown_type, cooldown_scope_key, window_start, window_end, last_source_event_id, created_at, updated_at |
| ProgressRecord | progress_records | `gamification` | mvp | personal | database/migrations/022_create_progress_records.sql | id, user_id, source_event_id, rule_id, effect, points, cooldown_type, cooldown_scope_key, reason, created_at |
| AIActionLog | ai_action_logs | `ai_assistant` | mvp | audit | database/migrations/023_create_ai_action_logs.sql | id, actor_type, actor_id, ai_level, action_type, permission_used, target_type, target_id, scope, files_read, files_changed, approval_id, evidence_ref, risk_level, status, result, error_summary, created_at |
| Integration | integrations | `integrations` | mvp | system | database/migrations/024_create_integrations.sql | id, module_id, code, provider, status, config_json, created_at, updated_at |
| AIDraft | ai_drafts | `ai_assistant` | mvp | audit | database/migrations/025_create_ai_drafts.sql | id, approval_id, ai_action_log_id, target_doc, draft_type, instructions_summary, content_markdown, files_read_json, proposed_files_changed_json, risk_level, status, created_at, reviewed_at, discarded_at, approved_for_manual_apply_at, applied_at, applied_by |

## Criterios de validación

Doctor valida `MIGRATION_REFS_USE_CANONICAL_DATABASE_PATH`, `MIGRATION_REFS_USE_SQL_EXTENSION`, `MIGRATION_ORDER_MATCHES_CANONICAL_SEQUENCE`, `AI_ACRONYM_FILENAMES_ARE_NORMALIZED`, `COLUMN_CONTRACTS_EXIST`, `COLUMN_TYPES_ARE_DECLARED`, `RELATIONSHIPS_HAVE_PHYSICAL_CONSTRAINTS` y `AUTHENTICATED_USER_CONTEXT_ONBOARDING_CONTRACTS_MATCH_DDL`.

## Regla de entidades gamificadas persistentes

`ProgressRecord`, `UserAchievement` y `GamificationRuleState` requieren `user_id` no nulo en el MVP. La gamificación anónima o pre-login queda fuera del alcance actual y requeriría ADR propia antes de persistir progreso sin usuario.


## Regla de contexto y onboarding autenticados

El MVP no soporta contexto persistente anónimo ni onboarding persistente anónimo. `UserContext` y `OnboardingSession` pueden no existir todavía para un usuario recién provisionado, pero si existen deben pertenecer siempre a un usuario autenticado/provisionado.

Por tanto, `user_contexts.user_id` y `onboarding_sessions.user_id` son `user_id NOT NULL`, con FK a `users.id`. Cualquier flujo anónimo futuro requerirá ADR propia, contrato de conversión a usuario, limpieza/expiración y exclusión explícita de gamificación persistente hasta vinculación.


## Regla de ProgressRecord event-driven MVP

`ProgressRecord.source_event_id` es obligatorio en MVP. No se permiten ajustes manuales/admin de progreso hasta una capacidad post-MVP con acción, permiso, `ApprovalRecord`, `idempotency_key` y rollback/auditoría explícitos.
