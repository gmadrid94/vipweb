# 03 Domain Events

**Estado recomendado:** `READY_FOR_IMPLEMENTATION`
**Gate operativo aplicable:** `READY_FOR_IMPLEMENTATION` indica madurez documental, no permiso operativo por sí solo. Prevalecen `CURRENT_STATUS.md` y `machine/roadmap_gates.json`. Con el estado global actual `READY_FOR_SPRINT_0`, este documento solo puede guiar tareas permitidas por Sprint 0. No autoriza UI visible, Dashboard, Onboarding ni módulos funcionales hasta alcanzar `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT`.
  
**Fuente canónica:** `machine/events.json`.

## Canon de eventos

| Evento | Productor | Consumidores | Payload mínimo | Auditoría |
|---|---|---|---|---|
| `user.registered` | `core.identity` | `core.audit, core.permissions, dashboard, gamification, onboarding, profile` | `user_id, source, timestamp` | Sí |
| `user.logged_in` | `core.identity` | `core.audit, dashboard` | `user_id, ip_hash, request_id, timestamp` | No |
| `onboarding.started` | `onboarding` | `dashboard, gamification` | `user_id, session_id, timestamp` | No |
| `onboarding.completed` | `onboarding` | `dashboard, gamification, notifications` | `user_id, session_id, completed_steps, timestamp` | Sí |
| `profile.updated` | `profile` | `core.audit, dashboard, gamification` | `user_id, fields_changed, timestamp` | No |
| `module.activated` | `core.modules` | `admin, core.audit, dashboard, gamification, integrations` | `module_id, actor_type, actor_id, user_id, timestamp` | Sí |
| `module.configured` | `core.modules` | `core.audit, dashboard` | `module_id, config_keys, actor_id, timestamp` | Sí |
| `permission.changed` | `core.permissions` | `admin, core.audit` | `permission_id, role_id, actor_id, change_type, timestamp` | Sí |
| `domain.event.recorded` | `core.events` | `core.audit, core.doctor` | `event_id, event_type, producer, timestamp` | Sí |
| `audit.recorded` | `core.audit` | `admin, core.doctor` | `audit_id, actor_id, action, risk_level, timestamp` | Sí |
| `system.configured` | `core.config` | `core.audit, core.doctor` | `config_key, actor_id, timestamp` | Sí |
| `backup.created` | `core.config` | `admin, core.doctor` | `backup_id, scope, path, timestamp` | Sí |
| `system.doctor.executed` | `core.doctor` | `admin, ai_assistant, core.audit, gamification` | `run_id, status, checks_total, actor_type, actor_id, triggered_by_user_id, timestamp` | Sí |
| `evidence.recorded` | `core.doctor` | `admin, ai_assistant, core.audit` | `evidence_id, result, scope, timestamp, evidence_path, checksum, checksum_algorithm, integrity_manifest_ref` | Sí |
| `doctor.check.failed` | `core.doctor` | `admin, ai_assistant, notifications` | `check_id, severity, observed, timestamp` | Sí |
| `decision.recorded` | `core.events` | `ai_assistant, core.doctor` | `decision_id, adr, status, timestamp` | Sí |
| `dashboard.viewed` | `dashboard` | `core.audit` | `user_id, context, timestamp` | No |
| `dashboard.first_viewed` | `dashboard` | `gamification, onboarding` | `user_id, timestamp` | No |
| `task.completed` | `dashboard` | `gamification, notifications` | `task_key, module_id, user_id, timestamp` | No |
| `progress.updated` | `gamification` | `dashboard` | `user_id, source_event, delta, timestamp` | No |
| `achievement.unlocked` | `gamification` | `dashboard, notifications` | `achievement_key, user_id, source_event, timestamp` | No |
| `notification.created` | `notifications` | `dashboard` | `notification_id, user_id, type, timestamp` | No |
| `ai.suggestion.created` | `ai_assistant` | `admin, core.audit, gamification` | `suggestion_id, ai_level, docs_read, risk_level, requested_by_user_id, target_user_id, timestamp` | Sí |
| `ai.action.approved` | `ai_assistant` | `admin, core.audit` | `action_id, approval_ref, approver_id, timestamp` | Sí |
| `ai.action.executed` | `ai_assistant` | `core.audit, core.doctor` | `action_id, approval_ref, files_changed, timestamp` | Sí |
| `admin.panel.viewed` | `admin` | `core.audit` | `admin_id, section, timestamp` | No |
| `integration.configured` | `integrations` | `core.audit, dashboard` | `integration_id, mode, actor_id, timestamp` | No |
| `user.logged_out` | `core.identity` | `core.audit` | `user_id, session_id, timestamp` | Sí |
| `notification.read` | `notifications` | `core.audit, dashboard, gamification` | `notification_id, user_id, timestamp` | Sí |
| `module.used` | `core.modules` | `dashboard, gamification` | `user_id, module_id, used_at, source_route` | No |

## Reglas específicas de gamificación

- Todo evento usado por `machine/gamification_rules.json` debe existir.
- Todo evento usado por gamificación debe declarar `gamification` como consumidor.
- Solo se concede progreso si la regla tiene contexto de usuario humano suficiente.
- `system.doctor.executed` solo puede generar progreso cuando `triggered_by_user_id` no es null y `actor_type = human`.
- `ai.suggestion.created` solo puede generar progreso cuando `requested_by_user_id` o `target_user_id` existe.
- `module.activated` debe distinguir `actor_type`, `actor_id` y `user_id`.
- `module.used` mide uso real por usuario y no sustituye eventos administrativos de activación/configuración.
- `module.used` solo puede emitirse desde `MODULE_USE_TRACK` o desde un contrato explícito equivalente aprobado en `machine/action_contracts.json`.
- No se puede inferir uso real desde `module.activated`, `module.configured` ni desde visualizaciones pasivas repetidas.



## Política de `user.registered`

En MVP, `user.registered` representa una cuenta provisionada o activada dentro del ecosistema. No implica auto-registro público.

Valores de `source` activos en MVP:

- `seed`
- `owner_provisioned`
- `admin_provisioned`

Valores reservados para fases futuras:

- `invitation_accepted`
- `self_signup_future`

## Alias deprecados

| Alias anterior | Evento canónico |
|---|---|
| `module.enabled` | `module.activated` |
| `ai.proposal.created` | `ai.suggestion.created` |
| `service.connected` | `integration.configured` durante MVP |
| `user.onboarded` | `onboarding.completed` |

## Reglas

- Todo evento tiene versión.
- Todo evento tiene productor único.
- Todo consumidor debe estar declarado.
- Los eventos auditables se registran también en `AuditLog` o evidencias asociadas.
- Los cambios de payload requieren nueva versión o alias de compatibilidad.

## Payloads versionados canónicos

`payload_summary` mantiene el resumen humano del payload, pero la validación runtime debe usar `payload_schema_ref`.

Cada evento apunta a un JSON Schema versionado en `machine/event_payload_schemas/`. El envelope común de evento vive en `machine/schemas/domain-event-envelope.schema.json`.

Reglas de versionado:

- añadir campo opcional mantiene versión;
- añadir campo requerido exige nueva versión;
- cambiar tipo exige nueva versión;
- eliminar campo exige nueva versión;
- cambiar consumidores no exige nueva versión de payload;
- cambiar semántica exige nuevo evento o nueva versión.

## Fuente canónica de productores y consumidores

`machine/events.json` es la fuente canónica de la topología de eventos.

Reglas:

- `producer_module` define el único productor canónico del evento.
- `consumers` define los módulos que pueden reaccionar al evento.
- `machine/modules.json.provides.events_emitted` y `events_consumed` son vistas sincronizadas desde `machine/events.json`.
- El bus `core.events` registra y emite eventos, pero no consume eventos de negocio como subscriber funcional salvo que aparezca explícitamente como consumer canónico.
- `decision.recorded` pertenece a `core.events`; `core.doctor` lo solicita/delega y lo consume como señal auditada.

Doctor valida `MODULE_EVENTS_EMITTED_MATCH_EVENT_PRODUCERS`, `MODULE_EVENTS_CONSUMED_MATCH_EVENT_CONSUMERS`, `EVENT_CONSUMERS_MATCH_MODULE_DECLARATIONS`, `EVENT_PRODUCERS_REFERENCE_EXISTING_MODULES` y `EVENT_CONSUMERS_REFERENCE_EXISTING_MODULES`.

## Eventos de vista persistentes

Los eventos de vista que tengan impacto en métricas, auditoría o gamificación son eventos de dominio, pero su emisión no debe producirse como efecto implícito de una ruta `GET`.

- `dashboard.viewed`: registrado por `DASHBOARD_VIEW_TRACK` para métricas de retorno.
- `dashboard.first_viewed`: registrado por `DASHBOARD_VIEW_TRACK` con idempotencia; fuente válida para activación y gamificación.
- `admin.panel.viewed`: registrado por `ADMIN_PANEL_VIEW_TRACK` para auditoría interna.

Las referencias de pantalla no persistentes permanecen en `machine/analytics_events.json` y no forman parte del bus de eventos de dominio.
