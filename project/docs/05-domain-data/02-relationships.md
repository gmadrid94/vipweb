# 02 Relationships

**Estado recomendado:** `READY_FOR_IMPLEMENTATION`
**Gate operativo aplicable:** `READY_FOR_IMPLEMENTATION` indica madurez documental, no permiso operativo por sí solo. Prevalecen `CURRENT_STATUS.md` y `machine/roadmap_gates.json`. Con el estado global actual `READY_FOR_SPRINT_0`, este documento solo puede guiar tareas permitidas por Sprint 0. No autoriza UI visible, Dashboard, Onboarding ni módulos funcionales hasta alcanzar `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT`.


## Fuente canónica

- `machine/relationships.json`
- `machine/physical_constraints_matrix.json`
- `machine/entities.json`

## Orden de migración documental

`User → AuthAttempt → Role → Permission → RolePermission → UserRole → Module → ModuleManifest → DomainEvent → AuditLog → ApprovalRecord → SystemSetting → EvidenceReport → BackupRecord → DecisionRecord → UserContext → OnboardingSession → Notification → Achievement → UserAchievement → GamificationRuleState → ProgressRecord → AIActionLog → Integration → AIDraft`

## Regla canónica de migraciones y constraints

- No existen migraciones separadas `*_relation.sql` en Sprint 0.
- Cada FK se declara dentro de la migración de la tabla que contiene esa FK.
- La columna `Migración` en la matriz física apunta siempre a la migración de tabla correspondiente.

## Relaciones conceptuales

| ID | Desde | Hacia | Tipo | FK | Requerida |
|---|---|---|---|---|---|
| REL-001 | User | UserRole | one_to_many | `user_roles.user_id` | True |
| REL-002 | Role | UserRole | one_to_many | `user_roles.role_id` | True |
| REL-003 | Role | RolePermission | one_to_many | `role_permissions.role_id` | True |
| REL-004 | Permission | RolePermission | one_to_many | `role_permissions.permission_id` | True |
| REL-005 | Module | ModuleManifest | one_to_many_versioned | `module_manifests.module_id` | True |
| REL-006 | User | UserContext | one_to_one | `user_contexts.user_id` | False |
| REL-007 | User | OnboardingSession | one_to_many | `onboarding_sessions.user_id` | False |
| REL-008 | User | Notification | one_to_many | `notifications.user_id` | False |
| REL-009 | User | ProgressRecord | one_to_many | `progress_records.user_id` | True |
| REL-010 | DomainEvent | AuditLog | one_to_many | `audit_logs.target_id` | True |
| REL-011 | DomainEvent | ProgressRecord | one_to_many | `progress_records.source_event_id` | True |
| REL-012 | AIActionLog | AuditLog | one_to_many | `audit_logs.target_id` | True |
| REL-013 | Module | Integration | one_to_many | `integrations.module_id` | True |
| REL-014 | ApprovalRecord | AIActionLog | one_to_many_optional | `ai_action_logs.approval_id` | False |
| REL-015 | User | UserAchievement | one_to_many | `user_achievements.user_id` | True |
| REL-016 | Achievement | UserAchievement | one_to_many | `user_achievements.achievement_id` | True |
| REL-017 | DomainEvent | UserAchievement | one_to_many | `user_achievements.source_event_id` | False |
| REL-018 | User | GamificationRuleState | one_to_many | `gamification_rule_states.user_id` | True |
| REL-019 | DomainEvent | GamificationRuleState | one_to_many | `gamification_rule_states.last_source_event_id` | False |
| REL-020 | User | AuthAttempt | one_to_many_optional | `auth_attempts.user_id` | False |
| REL-021 | ApprovalRecord | AIDraft | one_to_many_unique | `ai_drafts.approval_id` | True |
| REL-022 | AIActionLog | AIDraft | one_to_one | `ai_drafts.ai_action_log_id` | True |

## Constraints físicas mínimas

La matriz distingue comportamiento físico de base de datos y política lógica de aplicación. `db_on_delete` debe coincidir con el DDL real. `application_delete_policy` describe la actuación de servicios de dominio ante borrado lógico, archivado o referencias append-only.

| Relación | Referencia | Única | Índice | Null | DB ON DELETE | Política lógica aplicación | Migración |
|---|---|---|---|---|---|---|---|
| REL-001 | `user_roles.user_id` → `users.id` | False | True | False | RESTRICT | logical_cascade | database/migrations/006_create_user_roles.sql |
| REL-002 | `user_roles.role_id` → `roles.id` | False | True | False | RESTRICT | logical_cascade | database/migrations/006_create_user_roles.sql |
| REL-003 | `role_permissions.role_id` → `roles.id` | False | True | False | RESTRICT | logical_cascade | database/migrations/005_create_role_permissions.sql |
| REL-004 | `role_permissions.permission_id` → `permissions.id` | False | True | False | RESTRICT | logical_cascade | database/migrations/005_create_role_permissions.sql |
| REL-005 | `module_manifests.module_id` → `modules.id` | False | True | False | RESTRICT | logical_cascade | database/migrations/008_create_module_manifests.sql |
| REL-006 | `user_contexts.user_id` → `users.id` | True | True | False | RESTRICT | logical_cascade | database/migrations/016_create_user_contexts.sql |
| REL-007 | `onboarding_sessions.user_id` → `users.id` | False | True | False | RESTRICT | logical_cascade | database/migrations/017_create_onboarding_sessions.sql |
| REL-008 | `notifications.user_id` → `users.id` | False | True | True | RESTRICT | logical_cascade | database/migrations/018_create_notifications.sql |
| REL-009 | `progress_records.user_id` → `users.id` | False | True | True | RESTRICT | logical_cascade | database/migrations/022_create_progress_records.sql |
| REL-010 | `audit_logs.target_id` → polimórfica | False | True | False | NO_PHYSICAL_FK | polymorphic_append_only | database/migrations/010_create_audit_logs.sql |
| REL-011 | `progress_records.source_event_id` → `domain_events.id` | True | True | False | RESTRICT | logical_cascade | database/migrations/022_create_progress_records.sql |
| REL-012 | `audit_logs.target_id` → polimórfica | False | True | False | NO_PHYSICAL_FK | polymorphic_append_only | database/migrations/010_create_audit_logs.sql |
| REL-013 | `integrations.module_id` → `modules.id` | False | True | False | RESTRICT | logical_cascade | database/migrations/024_create_integrations.sql |
| REL-014 | `ai_action_logs.approval_id` → `approval_records.id` | True | True | True | RESTRICT | restrict_append_only | database/migrations/023_create_ai_action_logs.sql |
| REL-015 | `user_achievements.user_id` → `users.id` | False | True | True | RESTRICT | logical_cascade | database/migrations/020_create_user_achievements.sql |
| REL-016 | `user_achievements.achievement_id` → `achievements.id` | False | True | False | RESTRICT | restrict_versioned | database/migrations/020_create_user_achievements.sql |
| REL-017 | `user_achievements.source_event_id` → `domain_events.id` | False | True | True | RESTRICT | logical_cascade | database/migrations/020_create_user_achievements.sql |
| REL-018 | `gamification_rule_states.user_id` → `users.id` | False | True | True | RESTRICT | logical_cascade | database/migrations/021_create_gamification_rule_states.sql |
| REL-019 | `gamification_rule_states.last_source_event_id` → `domain_events.id` | False | True | True | RESTRICT | logical_cascade | database/migrations/021_create_gamification_rule_states.sql |
| REL-020 | `auth_attempts.user_id` → `users.id` | False | True | True | SET NULL | set_null_on_user_delete | database/migrations/002_create_auth_attempts.sql |
| REL-021 | `ai_drafts.approval_id` → `approval_records.id` | True | True | False | RESTRICT | append_only_reference | database/migrations/025_create_ai_drafts.sql |
| REL-022 | `ai_drafts.ai_action_log_id` → `ai_action_logs.id` | True | True | False | RESTRICT | append_only_reference | database/migrations/025_create_ai_drafts.sql |

## Criterios de validación

Doctor valida `RELATIONSHIPS_REFERENCE_EXISTING_ENTITIES`, `RELATIONSHIPS_HAVE_PHYSICAL_CONSTRAINTS`, `DELETE_POLICY_FIELDS_ARE_SEPARATED`, `DB_ON_DELETE_MATCHES_DDL`, `RELATIONSHIP_MIGRATION_REFS_POINT_TO_TABLE_MIGRATIONS`, `MIGRATION_ORDER_MATCHES_CANONICAL_SEQUENCE`, `APPROVAL_RECORD_PRECEDES_AI_ACTION_LOG` y `AI_DRAFTS_REQUIRE_APPROVAL_RECORD`.

## Nota sobre auditoría polimórfica

`AuditLog` usa referencia polimórfica mediante `target_type + target_id`. `target_id` es obligatorio, aunque `references` sea `null` en la matriz física porque el destino puede ser `DomainEvent`, `AIActionLog` u otra entidad auditada.

## Política de usuario obligatorio en gamificación persistente MVP

Las relaciones `User → ProgressRecord`, `User → UserAchievement` y `User → GamificationRuleState` son requeridas en runtime MVP. La gamificación persistente representa progreso, logros y cooldowns por usuario identificable; por tanto `user_id` debe ser `NOT NULL` en las tres tablas.

Los eventos sin usuario resoluble pueden permanecer en `DomainEvent` o en auditoría, pero no deben crear `ProgressRecord`, `UserAchievement` ni `GamificationRuleState`. Esta regla protege la idempotencia `unique(user_id, source_event_id, rule_id)`, `unique(user_id, achievement_id)` y `unique(user_id, rule_id, cooldown_scope_key, window_start)`.

## Regla semántica usuario-contexto-onboarding

Las relaciones `REL-006` y `REL-007` distinguen dos conceptos:

- `parent_requires_child = false`: un usuario puede existir sin `UserContext` o sin `OnboardingSession` creada todavía.
- `child_requires_parent = true`: si existe `UserContext` u `OnboardingSession`, debe pertenecer a un usuario autenticado/provisionado.

En el MVP, `user_contexts.user_id` y `onboarding_sessions.user_id` son `user_id NOT NULL`. El onboarding persistente anónimo y el contexto persistente anónimo quedan fuera de alcance hasta ADR propia, contrato de conversión, expiración y reglas explícitas de no gamificación persistente antes de vinculación.


## Nota REL-011 MVP

REL-011 queda obligado por la política MVP event-driven: todo `ProgressRecord` debe enlazar con un `DomainEvent` fuente y `progress_records.source_event_id` es `NOT NULL`.
