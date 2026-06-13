# 11 Core Runtime Skeleton

**Estado recomendado:** `READY_FOR_IMPLEMENTATION`
**Gate operativo aplicable:** `READY_FOR_IMPLEMENTATION` indica madurez documental, no permiso operativo por sí solo. Prevalecen `CURRENT_STATUS.md` y `machine/roadmap_gates.json`. Con el estado global actual `READY_FOR_SPRINT_0`, este documento solo puede guiar tareas permitidas por Sprint 0. No autoriza UI visible, Dashboard, Onboarding ni módulos funcionales hasta alcanzar `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT`.

## Propósito

Reducir la reinterpretación al empezar a programar el Core Runtime en PHP/WAMP, manteniendo arquitectura modular, contratos machine-readable, auditoría, permisos, eventos y aprobación runtime desde el primer vertical slice.

## Skeleton mínimo

```txt
/public
  index.php

/app
  /Core
    /Bootstrap
      AppKernel.php
      ConfigLoader.php

    /Http
      Request.php
      Response.php
      Router.php
      ControllerInvoker.php
      MiddlewarePipeline.php

    /Database
      PdoConnection.php
      TransactionManager.php

    /Identity
      AuthService.php
      SessionManager.php
      PasswordHasher.php
      UserRepository.php

    /Permissions
      RbacService.php
      PermissionGuard.php
      RoleRepository.php

    /Actions
      ActionExecutor.php
      ActionContractRegistry.php
      IdempotencyGuard.php

    /Audit
      AuditLogger.php
      ApprovalService.php

    /Events
      EventDispatcher.php
      EventRegistry.php
      DomainEventRepository.php

    /Modules
      ModuleLoader.php
      ModuleRegistry.php
      ModuleManifestValidator.php

    /Config
      SystemConfigRegistry.php

    /Doctor
      DoctorRuntime.php

  /Modules
    /Dashboard
    /Onboarding
    /Profile
    /Notifications
    /Gamification
    /Admin
    /AI
    /Integrations

  /Shared
    /Contracts
    /Exceptions
    /Validation

/config
  app.php
  database.php
  routes.php
  modules.php

/database
  /migrations
  /rollbacks
  /seeds
```

## Regla arquitectónica principal

El runtime no ejecuta acciones directamente desde controladores. Toda mutación pasa por:

```txt
Controller
  → ActionExecutor
    → ActionContractRegistry
    → PermissionGuard
    → ApprovalService si aplica
    → Servicio de dominio
    → AuditLogger
    → EventDispatcher
```

## Vertical slices de Core Runtime

## Baseline obligatoria de implementación segura

El primer vertical slice de Core Runtime debe cumplir la baseline de `docs/06-technical/05-security.md::Seguridad de implementación PHP/WAMP`:

- `PdoConnection` solo expone consultas preparadas para input externo;
- `Response` centraliza cabeceras de seguridad y `Content-Type`;
- las vistas usan helper único de escaping HTML;
- cualquier acceso a `evidence/`, `backups/`, `logs/` o futuros `uploads/` valida canonical path contra directorios permitidos;
- los errores técnicos se registran sin exponerse en el envelope público.


### VS-CORE-001 — Login/logout + RBAC + Audit + Event

Incluye solo:

- `public/index.php`
- `Router`
- `Request` / `Response`
- `PdoConnection`
- `SessionManager`
- `AuthService`
- `PermissionGuard`
- `ActionExecutor`
- `AuditLogger`
- `EventDispatcher`
- `AUTH_LOGIN_SUBMIT`
- `AUTH_LOGOUT`

No incluye dashboard, onboarding visual, gamificación, IA visible, integraciones reales ni administración avanzada.

### VS-CORE-002 — ApprovalService + acción crítica de prueba

Debe validar:

- `ApprovalRecord`
- `scope_hash`
- `idempotency_key`
- consumo atómico
- `consumed_by_action_id`
- `AuditLog`
- error codes
- rollback

### VS-CORE-003 — ModuleLoader + Doctor runtime readonly

Debe validar:

- manifests
- módulos stub
- contrato machine-readable
- ejecución Doctor readonly
- evidencia no escrita automáticamente

### VS-CORE-004 — Provisionamiento controlado MVP

Debe validar:

- `USER_PROVISION_CONTROLLED`
- `POST /admin/users/provision`
- owner-only
- `admin.manage_users`
- `ApprovalRecord` consumido
- usuario `registered_user` creado
- rol asignado vía `core.permissions`
- `user.registered` emitido
- contraseña inicial nunca registrada en logs, eventos, evidencias ni auditoría

## Orden recomendado

1. `C1-008` — Crear `AppKernel`, `Request`, `Response` y `Router` mínimos.
2. `C1-009` — Crear `PdoConnection` y configuración local segura.
3. `C1-010` — Crear `ActionContractRegistry`.
4. `C1-011` — Crear `ActionExecutor` mínimo para acción no IA.
5. `C1-012` — Añadir autorización IA estructural sin activar acciones sensibles.
6. `C1-013` — Emitir `user.logged_in` con envelope v1.
7. `C1-014` — Persistir auditoría básica de acción/evento.
8. `C1-004A` — Implementar `ApprovalService` runtime.
9. `C1-006A` — Implementar `DoctorRuntime` readonly.
10. `C1-000A` — Implementar provisionamiento controlado MVP.

## Criterios de validación

Doctor debe pasar:

- `CORE_RUNTIME_SKELETON_DECLARED`
- `APPROVAL_SERVICE_RUNTIME_DECLARED`
- `CONTROLLED_PROVISIONING_ACTION_DEFINED`
