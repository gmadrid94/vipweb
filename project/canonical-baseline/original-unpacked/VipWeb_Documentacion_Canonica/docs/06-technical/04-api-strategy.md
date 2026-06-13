# 04 API Strategy

**Estado recomendado:** `READY_FOR_IMPLEMENTATION`
**Gate operativo aplicable:** `READY_FOR_IMPLEMENTATION` indica madurez documental, no permiso operativo por sí solo. Prevalecen `CURRENT_STATUS.md` y `machine/roadmap_gates.json`. Con el estado global actual `READY_FOR_SPRINT_0`, este documento solo puede guiar tareas permitidas por Sprint 0. No autoriza UI visible, Dashboard, Onboarding ni módulos funcionales hasta alcanzar `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT`.


## Estrategia MVP
VipWeb no expone API pública estable en MVP. Usará rutas internas y contratos de módulo para preparar una API futura sin comprometer seguridad ni compatibilidad.

## Reglas
- Las rutas internas se validan por matriz ruta-permiso-rol.
- Las rutas mutables no pueden usar permisos de solo lectura.
- Toda respuesta sensible debe pasar por guard y audit log si aplica.
- Los adaptadores externos permanecen stub hasta post-MVP.

## Criterios de validación
Antes de abrir API pública debe existir versionado, auth de clientes, rate limits, auditoría y contrato de errores.

## Contrato de acciones mutables internas

VipWeb no abre API pública en MVP, pero sus rutas internas mutables quedan cerradas por `machine/action_contracts.json`.

Reglas adicionales:

- Toda ruta `POST`, `PATCH` o acción de sesión debe declarar contrato.
- `GET` no debe usarse para acciones que cambian estado. `logout` queda como `POST /logout`.
- Toda acción mutable declara rollback y auditoría.
- Acciones AI-2 o críticas requieren `ApprovalRecord`.

## Envelope estándar canónico

Las rutas internas deben usar un envelope homogéneo:

- éxito: `ok=true`, `data`, `error=null`, `meta.request_id`, `meta.action_id`, `meta.emitted_events`;
- error: `ok=false`, `data=null`, `error.code`, `error.message`, `error.user_message`, `error.field_errors`, `error.retryable`, `error.correlation_id`.

Los contratos canónicos viven en `machine/action_contracts.json`, `machine/schemas/api-response.schema.json` y `machine/schemas/api-error.schema.json`.

## Reglas de seguridad del envelope interno

- El cliente nunca envía `actor_id`; el servidor lo deriva de sesión o del contexto de aprobación.
- Todo request mutable browser-origin debe incluir `request_id`, `csrf_token` y `payload` tipado.
- Toda acción que requiere aprobación debe incluir `approval_id` e `idempotency_key`.
- Los schemas de `machine/action_payloads/*.request.schema.json` y `*.response.schema.json` son contratos cerrados con `additionalProperties=false` en el nivel de `payload` y `data`.
- Los errores de seguridad usan códigos específicos: `CSRF_INVALID`, `AUTH_INVALID_CREDENTIALS`, `AUTH_RATE_LIMITED`, `SESSION_EXPIRED`, `PAYLOAD_SCHEMA_INVALID`, `APPROVAL_EXPIRED`, `APPROVAL_ALREADY_CONSUMED`, `IDEMPOTENCY_CONFLICT`.


## Ruta interna de provisionamiento MVP

## Seguridad de implementación de rutas internas

Antes de programar rutas internas reales:

- todo acceso SQL debe pasar por PDO prepared statements;
- ninguna ruta debe concatenar input en SQL;
- toda salida HTML debe pasar por helper de escaping;
- todo path recibido o derivado de input debe canonicalizarse contra allowlist de directorios;
- las respuestas deben emitir cabeceras mínimas de seguridad;
- los errores del envelope no deben incluir trazas internas ni secretos.

Fuente: `docs/06-technical/05-security.md::Seguridad de implementación PHP/WAMP`.


`POST /admin/users/provision` es una ruta interna, no una API pública. Implementa `USER_PROVISION_CONTROLLED` y solo puede ejecutarla `owner` con `admin.manage_users`, `ApprovalRecord`, `csrf_token`, `idempotency_key` y auditoría.

La ruta solo crea usuarios `registered_user`. No crea `owner`, `admin`, `ai_admin`, `external_service` ni roles técnicos. La asignación de rol se delega a `core.permissions` mediante contrato público; `core.identity` no escribe directamente `UserRole`.
