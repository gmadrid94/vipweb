# 05 Security

**Estado recomendado:** `READY_FOR_IMPLEMENTATION`
**Gate operativo aplicable:** `READY_FOR_IMPLEMENTATION` indica madurez documental, no permiso operativo por sí solo. Prevalecen `CURRENT_STATUS.md` y `machine/roadmap_gates.json`. Con el estado global actual `READY_FOR_SPRINT_0`, este documento solo puede guiar tareas permitidas por Sprint 0. No autoriza UI visible, Dashboard, Onboarding ni módulos funcionales hasta alcanzar `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT`.


## Modelo de seguridad MVP
La seguridad se basa en RBAC explícito, matriz ruta-permiso-rol, auditoría y separación de acciones IA.

## Roles y permisos
| Rol | Label | Tipo | Permisos |
|---|---|---|---|
| `visitor` | Visitante | human | public.view, auth.login |
| `registered_user` | Usuario registrado | human | public.view, auth.logout, profile.view, profile.update, dashboard.view, dashboard.track_view, module.view, module.use, notification.view, gamification.view, notification.mark_read |
| `admin` | Administrador | human | public.view, auth.logout, profile.view, dashboard.view, module.view, integration.view, admin.access, admin.track_panel_view, admin.view_audit, admin.view_evidence, system.view_events, system.run_doctor.readonly, notification.view, gamification.view, notification.mark_read, doctor.view_panel |
| `owner` | Owner | human | public.view, auth.logout, profile.view, profile.update, dashboard.view, dashboard.track_view, module.view, module.use, notification.view, gamification.view, integration.view, integration.configure, admin.access, admin.manage_users, admin.manage_modules, admin.view_audit, admin.view_evidence, ai.read_context, ai.suggest_changes, ai.write_draft, system.configure, system.run_doctor.readonly, evidence.write, doctor.status.validate, system.view_events, notification.mark_read, doctor.view_panel |
| `ai_assistant` | IA asistente | ai | ai.read_context, ai.suggest_changes, system.run_doctor.readonly |
| `ai_admin` | IA administradora | ai | ai.read_context, ai.suggest_changes, ai.write_draft, evidence.write |
| `external_service` | Servicio externo | system | — |
| `connected_module` | Módulo conectado | system | — |

## Semántica explícita de `admin`

`admin` es operador humano MVP principalmente read-only. Puede ver paneles, evidencias, Doctor, eventos, integraciones, notificaciones y progreso. No debe ejecutar mutaciones sensibles ni acciones propias de usuario final salvo excepciones inocuas declaradas.

Reglas:

- `admin` no recibe `profile.update`, `module.use` ni `integration.configure`.
- `admin` puede recibir `notification.view`, `notification.mark_read` y `gamification.view` por ser operaciones de lectura o baja criticidad.
- `integration.configure` queda reservado a `owner`, con `ApprovalRecord` y confirmación owner.
- Cualquier ruta mutable de riesgo alto/crítico con `admin` debe fallar Doctor salvo excepción explícita.

## Semántica explícita del owner

`owner` no usa wildcard runtime. Sus permisos se expanden en seed desde `machine/permissions.json`, tomando todos los permisos cuyo campo `roles` contiene `owner`.

Reglas:

- `permissions: ["*"]` queda prohibido en runtime.
- `system.run_doctor` queda como alias legacy deprecado y no se asigna a roles runtime.
- `owner` no recibe `auth.login`; el login pertenece al rol preautenticado `visitor`.
- Tener un permiso no elimina `runtime_approval_required` ni sustituye `ApprovalRecord`.
- Las acciones sensibles siguen requiriendo aprobación humana cuando así lo declaran `route_permission_matrix.json` o `action_contracts.json`.



## Provisionamiento controlado MVP

El MVP mantiene la política `controlled_provisioning_mvp_no_public_signup`. No existen `/register`, `/signup` ni `AUTH_REGISTER_SUBMIT`.

La única alta de usuarios no seed en MVP es `USER_PROVISION_CONTROLLED`:

- ruta interna: `POST /admin/users/provision`;
- módulo owner: `core.identity`;
- permiso: `admin.manage_users`;
- rol ejecutor: `owner`;
- rol asignable: solo `registered_user`;
- aprobación: `ApprovalRecord` obligatorio;
- auditoría: obligatoria;
- evento: `user.registered`;
- delegación: `UserRole` se asigna mediante contrato público de `core.permissions`.

`admin.manage_users` puede existir como permiso crítico, pero en MVP su ejecución mutable queda restringida a `owner`. El rol `admin` sigue siendo principalmente read-only.

La contraseña inicial de un usuario provisionado se trata como secreto transitorio: nunca debe aparecer en `AuditLog`, `DomainEvent`, evidencias, Doctor, logs técnicos ni respuestas persistentes.

## Reglas
- Toda ruta debe declarar permiso.
- Toda ruta debe aparecer en `machine/route_permission_matrix.json`.
- `system.run_doctor` queda deprecado y no debe usarse en rutas.
- `system.run_doctor.readonly` no escribe evidencia.
- `evidence.write` requiere aprobación.
- Rutas mutables no pueden usar permisos de solo lectura.

## Criterios de validación
Doctor debe pasar `ROLE_PERMISSIONS_MATCH_PERMISSION_CATALOG`, `PERMISSION_ROLES_MATCH_ROLE_CATALOG`, `ROUTE_ALLOWED_ROLES_HAVE_PERMISSION`, `ACTION_ALLOWED_ROLES_MATCH_ROUTE_ALLOWED_ROLES`, `PERMISSION_CONSUMERS_INCLUDE_ROUTE_MODULES`, `ROUTE_PERMISSION_ROLE_MATRIX_VALID`, `AI_PERMISSION_LEVELS_ARE_COHERENT`, `OWNER_ROLE_HAS_NO_RUNTIME_WILDCARD`, `OWNER_PERMISSIONS_MATCH_PERMISSION_CATALOG` y `DOCTOR_EVIDENCE_PERMISSION_SEPARATED`. Para implementación PHP/WAMP debe pasar además `PHP_IMPLEMENTATION_SECURITY_BASELINE_DECLARED`, `PHP_SQL_PREPARED_STATEMENTS_REQUIRED`, `HTML_OUTPUT_ESCAPING_DECLARED`, `SECURITY_HEADERS_BASELINE_DECLARED` y `FILE_PATH_CANONICALIZATION_DECLARED`.


## Endurecimiento canónico

- Toda ruta con `ai_allowed=true` debe declarar `ai_level_max`.
- Toda ruta IA debe ser auditada salvo excepción documentada.
- `/ai` queda fijada en `AI-0` y `audit_required=true`.
- `depends_on` no debe usarse para dependencias visuales o futuras; esas dependencias van en `dependency_contracts` con fallback.

## Criterios adicionales de validación
Doctor debe pasar `AI_ALLOWED_ROUTES_DECLARE_LEVEL_AND_AUDIT` y `MODULE_DEPENDENCIES_ARE_TYPED_AND_PHASE_VALID`.

## Ownership de permisos

Cada permiso declara `owner_module`, `consumed_by_modules` y `aggregated_by_modules` en `machine/permissions.json`.

Reglas:

- Solo el `owner_module` define el permiso.
- Otros módulos pueden consumirlo o mostrarlo, pero no redefinirlo.
- `admin` agrega permisos de otros módulos, no los posee automáticamente.
- Las rutas mutables requieren permiso no-readonly, auditoría y contrato en `machine/action_contracts.json`.

## Aprobaciones IA y humanas

`ApprovalRecord` es la entidad canónica de aprobación. `AIActionLog` registra la acción; `ApprovalRecord` registra la autorización humana previa cuando aplica.

## Semántica de aprobación canónica

`grant_requires_approval` protege la concesión de permisos de riesgo. `runtime_approval_required` protege la ejecución de rutas o acciones mutables/sensibles. No deben mezclarse.

Reglas:

- permisos de riesgo alto/crítico suelen requerir aprobación para ser concedidos;
- rutas GET read-only no requieren aprobación runtime salvo excepción documentada;
- rutas mutables sensibles requieren `ApprovalRecord`;
- acciones AI-2/AI-3 permitidas requieren aprobación humana y auditoría.

## Security baseline MVP WAMP

## Seguridad de implementación PHP/WAMP

Esta baseline es obligatoria antes del primer vertical slice de Core Runtime que ejecute PHP real, consultas SQL, vistas HTML o escritura de evidencias.

Reglas obligatorias:

1. Toda consulta SQL con input externo debe usar `PDO::prepare()` y parámetros enlazados. Queda prohibido concatenar input de usuario, payloads, query params, path params, cookies o valores de sesión en SQL.
2. `PdoConnection` debe exponer ejecución preparada como camino estándar; cualquier SQL dinámico debe limitarse a identificadores internos allowlisted, nunca a input libre.
3. Toda salida HTML debe pasar por un helper único de escaping, por ejemplo `escape_html(string $value): string`, basado en `htmlspecialchars` con `ENT_QUOTES | ENT_SUBSTITUTE` y `UTF-8`.
4. HTML raw solo se permite mediante allowlist explícita de componentes internos; no se permite renderizar Markdown, payloads, evidencias o campos de usuario como HTML sin sanitización aprobada.
5. Toda ruta de archivo derivada de input debe canonicalizarse con `realpath` o equivalente y validarse contra directorios permitidos. Aplica especialmente a `evidence/`, `backups/`, `logs/` y futuros `uploads/`.
6. Las respuestas HTML deben emitir cabeceras mínimas: `X-Content-Type-Options: nosniff`, `Referrer-Policy: strict-origin-when-cross-origin` y una `Content-Security-Policy` base local con `default-src 'self'`. Para evitar framing usar `frame-ancestors 'none'` en CSP o `X-Frame-Options: DENY`.
7. Las respuestas JSON deben declarar `Content-Type: application/json; charset=utf-8`, usar el envelope estándar y no exponer trazas internas.
8. Los errores técnicos deben registrarse de forma segura y mostrarse al usuario mediante mensajes no enumerativos y no sensibles.

Esta sección complementa RBAC, CSRF, sesiones y auditoría. No los sustituye.


Esta baseline es obligatoria antes de implementar login, sesión o rutas mutables reales.

### Passwords

- Usar `password_hash()` con `PASSWORD_DEFAULT`.
- Verificar con `password_verify()`.
- Rehash con `password_needs_rehash()` cuando PHP lo recomiende.
- No registrar contraseñas ni fragmentos de contraseña en logs, eventos, evidencia ni `AuditLog`.

### Sesión

| Política | Valor MVP |
|---|---|
| Tipo | Sesión PHP server-side |
| `actor_id` / `user_id` desde cliente | Prohibido |
| Regeneración de `session_id` tras login | Obligatoria |
| Regeneración tras elevación de permisos | Obligatoria |
| Idle timeout | 30 minutos |
| Absolute timeout | 12 horas |
| Logout | Destruye sesión server-side |

### Cookies

| Entorno | `HttpOnly` | `SameSite` | `Secure` |
|---|---:|---|---:|
| Local WAMP HTTP | Sí | `Lax` | No |
| Cualquier entorno no local | Sí | `Lax` | Sí |

### CSRF

- Toda ruta `POST`, `PATCH`, `PUT` o `DELETE` originada desde navegador requiere `csrf_token`.
- El token vive en sesión y se rota tras login/logout.
- `GET` nunca cambia estado.
- `AUTH_LOGIN_SUBMIT`, `AUTH_LOGOUT`, `PROFILE_UPDATE`, `NOTIFICATION_MARK_READ`, rutas admin, rutas Doctor runtime e IA draft declaran `csrf_token` en sus schemas.

### Login throttling

Entidad canónica: `AuthAttempt`.

| Regla | Resultado |
|---|---|
| 5 fallos por `email_hash` + `ip_hash` en 15 minutos | bloqueo temporal |
| 10 fallos por `email_hash` en 60 minutos | bloqueo temporal |
| Error visible de login | no enumerativo |

Mensaje visible único recomendado:

```txt
No hemos podido iniciar sesión con esos datos.
```

No deben exponerse mensajes como “el email no existe” o “la contraseña es incorrecta”.

### Auditoría segura

Registrar: login correcto, login fallido, logout, rate limit, sesión expirada, aprobación consumida y acción sensible denegada.

No registrar: password, `csrf_token`, cookies, payload sensible completo ni secretos.

### Criterios Doctor asociados

- `SECURITY_BASELINE_SESSION_DECLARED`
- `LOGIN_ACTION_REQUIRES_CSRF`
- `PASSWORD_HASH_POLICY_DECLARED`
- `AUTH_ATTEMPT_THROTTLING_DECLARED`
- `LOGIN_ERRORS_ARE_NON_ENUMERATIVE`
- `SESSION_COOKIE_POLICY_DECLARED`


## Datos sensibles y evidencias

La exposición de columnas se controla con los flags de `machine/column_contracts.json`: `user_exportable`, `ai_readable`, `evidence_allowed`, `requires_redaction`, `redaction_strategy` y `non_export_reason`.

Reglas mínimas:

- `password_hash` nunca sale del runtime.
- hashes de seguridad (`email_hash`, `ip_hash`) solo pueden tratarse como `hash_only`.
- payloads JSON mixtos requieren `schema_filtered` o `summary_only`.
- rutas y archivos de acciones IA solo pueden aparecer como `paths_only_or_summary`.

Los campos con dominio cerrado, como `AuthAttempt.result`, `AuthAttempt.reason` y `AIActionLog.result`, se tratan como enums físicos y no como JSON.


## Regla de rutas GET

Las rutas `GET` solo pueden representar lectura, vista de panel o carga de formulario. No pueden declarar `action_type` operacional ni ejecutar acciones que produzcan side effects auditados.

Casos relevantes:

- `GET /admin/doctor` = `view_doctor_panel`.
- `POST /admin/doctor/run-readonly` = `run_doctor_readonly`.
- `GET /admin/config` = `view_config_panel`; cualquier configuración real requiere ruta mutable con CSRF.
- `GET /onboarding` = `view_onboarding`; iniciar o completar onboarding requiere POST.

Doctor valida `GET_ROUTES_DO_NOT_DECLARE_OPERATIONAL_ACTION_TYPES`, `DOCTOR_RUN_ONLY_ALLOWED_ON_POST_ROUTE` y `DOCTOR_PANEL_ROUTE_IS_VIEW_ONLY`.


## Separación de catálogo de módulos y administración

- `module.view` permite ver el catálogo de módulos en `/modules` para `registered_user`, `admin` y `owner`.
- `/admin/modules` queda reservado a `admin.manage_modules` y no permite `registered_user`.
- Ninguna ruta `/admin/*` puede permitir `registered_user` salvo exención futura documentada y validada por Doctor.
- Las rutas de lectura admin con riesgo `medium`, `high` o `critical` deben ser auditadas.

Doctor valida `ADMIN_ROUTES_DO_NOT_ALLOW_REGISTERED_USER`, `USER_MODULE_CATALOG_ROUTE_EXISTS`, `ADMIN_MODULE_ROUTES_REQUIRE_ADMIN_PERMISSION` y `MEDIUM_RISK_ADMIN_READS_ARE_AUDITED`.


## Invariantes físicas de aprobación

`ApprovalRecord` debe respetar estos invariantes antes de generar migraciones:

- `approval_records.approved_by` es nullable físicamente y obligatorio solo cuando `status in approved|consumed`.
- `approval_records.expires_at` es `NOT NULL` para impedir aprobaciones permanentes.
- `approval_records.approved_at` es nullable físicamente y obligatorio solo tras aprobación.
- `approval_records.consumed_at` y `approval_records.consumed_by_action_id` son nullable físicamente y obligatorios solo cuando `status = consumed`.
- `ApprovalService` es la única frontera válida para transicionar, expirar, validar y consumir aprobaciones.

Doctor debe bloquear cualquier contrato físico que contradiga estos invariantes.

## Seguridad de analítica UI y eventos de vista

Las rutas `GET` no deben modificar estado, conceder logros, actualizar progreso ni crear eventos persistentes por sí mismas.

Los eventos de vista persistentes deben registrarse mediante action contracts explícitos `POST`, con CSRF cuando exista sesión de usuario, payload cerrado, permisos específicos y rollback declarado. En MVP:

| Action contract | Ruta | Permiso | Eventos emitidos | Regla |
|---|---|---|---|---|
| `DASHBOARD_VIEW_TRACK` | `/dashboard/view-track` | `dashboard.track_view` | `dashboard.viewed`, `dashboard.first_viewed` | `dashboard.first_viewed` es idempotente por usuario/evento/huella de vista. |
| `ADMIN_PANEL_VIEW_TRACK` | `/admin/panel-view-track` | `admin.track_panel_view` | `admin.panel.viewed` | Solo `admin` y `owner`; no se activa por renderizado `GET`. |

`analytics_refs` de tipo `ui_analytics` pueden agregarse para medición, pero no pueden alimentar reglas de gamificación ni métricas críticas si no existe relación con evento de dominio canónico.
