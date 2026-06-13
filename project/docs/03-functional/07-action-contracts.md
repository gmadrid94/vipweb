# 07 Action Contracts

**Estado recomendado:** `READY_FOR_IMPLEMENTATION`
**Gate operativo aplicable:** `READY_FOR_IMPLEMENTATION` indica madurez documental, no permiso operativo por sí solo. Prevalecen `CURRENT_STATUS.md` y `machine/roadmap_gates.json`. Con el estado global actual `READY_FOR_SPRINT_0`, este documento solo puede guiar tareas permitidas por Sprint 0. No autoriza UI visible, Dashboard, Onboarding ni módulos funcionales hasta alcanzar `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT`.


## Propósito

Este documento cierra el contrato de acciones internas que cambian estado. La matriz canónica vive en `machine/action_contracts.json`.

## Regla canónica

- Toda ruta mutable debe tener un contrato de acción.
- Toda acción debe declarar módulo, permiso, método, mutabilidad, alcance de mutación, eventos emitidos, entidades escritas, auditoría, aprobación y rollback.
- `route_permission_matrix.json` protege superficies/rutas; `action_contracts.json` es la fuente canónica para autorización y ejecución de acciones.
- `writes_entities` solo puede contener entidades owned por el módulo de la acción.
- Las escrituras excepcionales sobre entidades de otro módulo deben declararse en `delegated_write_entities` y tener contrato `data_write` en `machine/modules.json`.
- La IA no puede ejecutar acciones mutables salvo las marcadas como `ai_allowed=true`, con `ai_roles` explícitos y siempre dentro de `ai_level_max`.
- AI-2 con escritura requiere `ApprovalRecord`, `runtime_approval_required=true` y `activation_status=disabled_by_default`.
- Toda acción con `runtime_approval_required=true` debe consumir la aprobación mediante `core.audit.ApprovalService`; ningún módulo implementa aprobaciones ad hoc.

## Acciones cubiertas

## Resolución canónica de autorización

- La ruta autoriza acceso a la superficie mediante `machine/route_permission_matrix.json`.
- La acción autoriza ejecución mediante `machine/action_contracts.json`.
- Cuando una ruta dispara una acción, ambas autorizaciones deben cumplirse.
- `allowed_roles` representa roles humanos o de sistema no IA.
- `ai_roles` representa roles IA autorizados a ejecutar la acción.
- Si `ai_allowed=false`, `ai_roles` debe ser `[]`.
- Si `ai_allowed=true`, `ai_roles` debe tener al menos un rol IA existente y coincidir con los roles IA declarados para la ruta equivalente.
- `ActionExecutor` debe fallar cerrado ante divergencia entre ruta, acción, permiso, nivel IA o aprobación runtime.


| Acción | Ruta | Método | Permiso | Auditoría | Aprobación | Escritura directa | Escritura delegada |
|---|---|---|---|---:|---:|---|---|
| `AUTH_LOGIN_SUBMIT` | `/login` | POST | `auth.login` | Sí | No | `AuthAttempt` | — |
| `AUTH_LOGOUT` | `/logout` | POST | `auth.logout` | Sí | No | — | — |
| `USER_PROVISION_CONTROLLED` | `/admin/users/provision` | POST | `admin.manage_users` | Sí | Sí | `User` | `UserRole` vía `core.permissions.assign_role` |
| `ONBOARDING_START` | `/onboarding/start` | POST | `profile.update` | Sí | No | `OnboardingSession` | — |
| `ONBOARDING_COMPLETE` | `/onboarding/complete` | POST | `profile.update` | Sí | No | `OnboardingSession` | — |
| `PROFILE_UPDATE` | `/profile` | PATCH | `profile.update` | Sí | No | `UserContext` | — |
| `NOTIFICATION_MARK_READ` | `/notifications/{id}/read` | POST | `notification.mark_read` | Sí | No | `Notification` | — |
| `MODULE_ACTIVATE` | `/admin/modules/{id}/activate` | POST | `admin.manage_modules` | Sí | Sí | `Module` | — |
| `MODULE_CONFIGURE` | `/admin/modules/{id}/configure` | PATCH | `admin.manage_modules` | Sí | Sí | `ModuleManifest` | — |
| `MODULE_USE_TRACK` | `/modules/{id}/use` | POST | `module.use` | Sí | No | — | `module.used` |
| `INTEGRATION_CONFIGURE_STUB` | `/admin/integrations/{id}/configure-stub` | POST | `integration.configure` | Sí | Sí | `Integration` | — |
| `DOCTOR_RUN_READONLY` | `/admin/doctor/run-readonly` | POST | `system.run_doctor.readonly` | Sí | No | — | `AuditLog` vía `core.audit.record_action`; `DomainEvent` vía `core.events.emit_system_event` |
| `EVIDENCE_WRITE` | `/admin/doctor/evidence/write` | POST | `evidence.write` | Sí | Sí | `EvidenceReport` | — |
| `DOCTOR_STATUS_VALIDATE` | `/admin/doctor/status/validate` | POST | `doctor.status.validate` | Sí | Sí humana | — | `DecisionRecord` vía `core.events.record_decision` |
| `AI_WRITE_DRAFT` | `/ai/drafts` | POST | `ai.write_draft` | Sí | Sí | `AIDraft`, `AIActionLog` | — |

## Contrato de escritura modular

`ONBOARDING_COMPLETE` no escribe `ProgressRecord`. La acción solo completa `OnboardingSession` y emite `onboarding.completed`. El módulo `gamification` consume ese evento y persiste `ProgressRecord`, `UserAchievement` y `GamificationRuleState` según `machine/gamification_rules.json`; `Achievement` queda como catálogo global leído.

`DOCTOR_STATUS_VALIDATE` no escribe directamente `DecisionRecord`. La acción humana solicita a `core.events` el registro mediante contrato público `core.events.record_decision`; el rollback append-only también pertenece a `core.events`.

## Criterios de validación

Doctor debe pasar:

- `MUTABLE_ROUTES_HAVE_ACTION_CONTRACT`
- `ACTION_CONTRACTS_REFERENCE_EXISTING_PERMISSIONS`
- `ACTION_CONTRACTS_REFERENCE_EXISTING_EVENTS`
- `MUTABLE_ACTIONS_DECLARE_ROLLBACK`
- `AI_ACTIONS_REQUIRE_APPROVAL_WHEN_NEEDED`
- `ACTION_DIRECT_WRITES_ONLY_OWNED_ENTITIES`
- `ACTION_DELEGATED_WRITES_HAVE_CONTRACT`
- `NO_EVENT_PRODUCER_WRITES_CONSUMER_ENTITY`
- `CONTROLLED_PROVISIONING_ACTION_DEFINED`
- `APPROVAL_SERVICE_RUNTIME_DECLARED`

## Contrato runtime canónico

Cada acción de `machine/action_contracts.json` declara ahora:

- `runtime_approval_required`: aprobación necesaria para ejecutar la acción.
- `ai_roles`: roles IA autorizados a ejecutar la acción cuando `ai_allowed=true`; debe ser `[]` cuando `ai_allowed=false`.
- `approval_record_required`: mecanismo concreto basado en `ApprovalRecord`.
- `request_contract`: schemas de path, query y body.
- `response_contract`: schema de éxito y schema de error común.
- `error_codes`: códigos normalizados de fallo.
- `preconditions` y `postconditions`: condiciones verificables antes/después.
- `idempotency`: política explícita de idempotencia.
- `ux_states`: estado UI esperado en éxito, validación, permiso y conflicto.
- `implementation_status`: estado de implementación contractual.
- `activation_status`: si la acción está activa por defecto, desactivada o reservada.
- `delegated_write_entities`: escrituras delegadas a owners de datos externos.

Los schemas específicos viven en `machine/action_payloads/`. El envelope común de error vive en `machine/schemas/api-error.schema.json`.

## Payload contracts estrictos

Los contratos de acción no aceptan payloads abiertos.

| Acción | Payload mínimo cerrado | Response mínima cerrada |
|---|---|---|
| `AUTH_LOGIN_SUBMIT` | `email`, `password`, `remember_me?` | `user_id`, `display_name`, `roles`, `redirect_to`, `session_rotated` |
| `AUTH_LOGOUT` | `{}` | `logged_out`, `redirect_to` |
| `USER_PROVISION_CONTROLLED` | `email`, `display_name`, `initial_role=registered_user`, `initial_status=active`, `password_set_mode`, `initial_password`, `reason`, `rollback_plan` + `approval_id`, `idempotency_key` | `user_id`, `email`, `display_name`, `role_assigned`, `status`, `event_emitted=user.registered` |
| `ONBOARDING_START` | `entry_point`, `initial_step?` | `session_id`, `status`, `current_step` |
| `ONBOARDING_COMPLETE` | `session_id`, `completed_steps`, `final_step` | `session_id`, `status`, evento `onboarding.completed` en `meta.emitted_events` |
| `PROFILE_UPDATE` | `display_name?`, `preferences?`, `onboarding_state?` | `user_id`, `fields_changed`, `updated_at` |
| `NOTIFICATION_MARK_READ` | `{}` + path `id` | `notification_id`, `read_at`, `already_read` |
| `MODULE_ACTIVATE` | `target_status`, `reason`, `rollback_plan` | `module_id`, `previous_status`, `new_status` |
| `MODULE_CONFIGURE` | `config_patch`, `reason`, `rollback_plan` | `module_id`, `manifest_version`, `config_keys_changed` |
| `INTEGRATION_CONFIGURE_STUB` | `provider`, `mode=stub`, `config_patch`, `reason` | `integration_id`, `mode`, `status` |
| `DOCTOR_RUN_READONLY` | `scope?`, `include_warnings?` | `run_id`, `status`, `checks_total`, `failed_count`, `warning_count` |
| `EVIDENCE_WRITE` | `source_run_id`, `status`, `scope`, `checksum`, `checksum_algorithm`, `evidence_path`, `integrity_manifest_ref` | `evidence_id`, `latest_updated`, `path`, `checksum`, `checksum_algorithm`, `integrity_manifest_ref` |
| `DOCTOR_STATUS_VALIDATE` | `evidence_id`, `decision_id`, `status`, `human_review_notes` | `decision_record_id`, `validated_status` |
| `AI_WRITE_DRAFT` | `target_doc`, `draft_type`, `instructions`, `files_read`, `risk_level` | `draft_id`, `status`, `files_changed=[]` |

## Regla específica de `AI_WRITE_DRAFT`

`AI_WRITE_DRAFT` no modifica `target_doc`, código ni archivos protegidos del producto. La acción crea un registro `AIDraft` append-only y un `AIActionLog`; `files_changed` debe permanecer como `[]` hasta que un owner humano aplique manualmente el borrador fuera de la acción IA. El rollback operativo es descartar el borrador antes de su aplicación humana.

Doctor debe pasar también:

- `AI_WRITE_DRAFT_WRITES_AIDRAFT`
- `AI_DRAFTS_REQUIRE_APPROVAL_RECORD`
- `AI_DRAFTS_DO_NOT_MUTATE_TARGET_FILES`
- `AI_DRAFT_STATUS_APPLIED_IS_HUMAN_ONLY`
- `AI2_RESTRICTED_ROUTES_REQUIRE_APPROVAL_AND_DISABLED_STATUS`
- `ACTION_AI_ROLES_DECLARED_AND_VALID`
- `ACTION_AI_ROLES_MATCH_ROUTE_AI_ROLES`


## Semántica de readonly operacional

En VipWeb, `mutable=false` significa que la acción no modifica estado de negocio ni archivos objetivo. Puede producir auditoría y eventos operacionales si están declarados en `delegated_write_entities`.

`DOCTOR_RUN_READONLY` usa `mutation_scope=business_readonly_operational_audit`: no cambia estado de negocio ni escribe evidencia, pero sí registra `AuditLog` y emite `system.doctor.executed` mediante `DomainEvent`. Su postcondición correcta es `no_business_state_changed`, no `no_domain_state_changed`.

Doctor valida esta separación con `READONLY_ACTION_SIDE_EFFECTS_DECLARED`.


## Semántica runtime de `ApprovalService`

Las acciones con aprobación siguen un flujo único:

1. `ActionExecutor` carga el contrato desde `machine/action_contracts.json`.
2. `PermissionGuard` valida sesión, rol y permiso.
3. `ApprovalService` valida que el `ApprovalRecord` existe, está aprobado, no expiró, no fue consumido y coincide con `action_type`, `permission_requested`, `scope_hash`, `risk_level` e `idempotency_key`.
4. La acción se ejecuta en transacción.
5. `ApprovalService` consume el `ApprovalRecord` dentro de la misma transacción y rellena `consumed_by_action_id`.
6. `AuditLogger` registra el resultado.
7. `EventDispatcher` emite eventos canónicos si aplica.

`USER_PROVISION_CONTROLLED` usa este flujo para crear usuarios MVP sin auto-registro público. Solo puede crear `registered_user`; no puede crear `owner`, `admin`, `ai_admin` ni roles técnicos. La contraseña inicial nunca puede registrarse en logs, eventos, evidencias ni auditoría.


## Semántica Doctor GET/POST

`GET /admin/doctor` no ejecuta Doctor. Solo muestra el panel Doctor, último estado disponible, enlaces de evidencia y acciones disponibles para el rol humano.

La única ruta HTTP autorizada para ejecutar Doctor readonly es:

- `POST /admin/doctor/run-readonly`

Toda ejecución Doctor debe pasar por contrato `DOCTOR_RUN_READONLY`. Aunque sea readonly para estado de negocio, puede registrar `AuditLog` y `DomainEvent` como side effects operacionales delegados, por eso no debe representarse como GET.

## Regla de eventos delegados

Si una acción declara en `emits_events` un evento cuyo `producer_module` no coincide con el módulo de la acción, debe existir una delegación explícita al productor canónico mediante `delegated_write_entities` o contrato público equivalente.

Caso canónico: `DOCTOR_STATUS_VALIDATE` puede producir la salida funcional `decision.recorded`, pero el productor real y owner de `DecisionRecord` es `core.events` mediante `core.events.record_decision`.

Doctor valida `ACTION_EMITTED_EVENTS_MATCH_PRODUCER_OR_DELEGATED_OWNER`.

## Contrato de uso real de módulo

`MODULE_USE_TRACK` es el único productor MVP aprobado de `module.used`. No escribe entidades de dominio; emite evento append-only y usa idempotencia `user_id:module_id:source_route:usage_window`. `module.activated` y `module.configured` no representan uso real por usuario.

## Contratos de tracking de eventos de vista persistentes

Para evitar side effects en rutas `GET`, los eventos de vista persistentes se registran mediante acciones explícitas:

| Acción | Método | Ruta | Permiso | Eventos | Idempotencia |
|---|---|---|---|---|---|
| `DASHBOARD_VIEW_TRACK` | `POST` | `/dashboard/view-track` | `dashboard.track_view` | `dashboard.viewed`, `dashboard.first_viewed` | Obligatoria para `dashboard.first_viewed`. |
| `ADMIN_PANEL_VIEW_TRACK` | `POST` | `/admin/panel-view-track` | `admin.track_panel_view` | `admin.panel.viewed` | No obligatoria, pero el payload sigue siendo cerrado. |

Estas acciones no sustituyen el renderizado de pantalla. Solo registran señales persistentes autorizadas por `machine/analytics_events.json`.
