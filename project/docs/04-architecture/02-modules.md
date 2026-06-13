
# Catálogo de módulos

**Estado recomendado:** `READY_FOR_IMPLEMENTATION`
**Gate operativo aplicable:** `READY_FOR_IMPLEMENTATION` indica madurez documental, no permiso operativo por sí solo. Prevalecen `CURRENT_STATUS.md` y `machine/roadmap_gates.json`. Con el estado global actual `READY_FOR_SPRINT_0`, este documento solo puede guiar tareas permitidas por Sprint 0. No autoriza UI visible, Dashboard, Onboarding ni módulos funcionales hasta alcanzar `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT`.


Fuente canónica: `machine/modules.json`.

| ID | Nombre | Tipo | Fase | Estado | Dependencias duras | Entidades propias |
|---|---|---|---|---|---|---|
| core.identity | Core Identity | `core` | `foundation` | `planned` | - | `User`, `AuthAttempt` |
| core.permissions | Core Permissions | `core` | `foundation` | `planned` | `core.identity` | `Role`, `Permission`, `RolePermission`, `UserRole` |
| core.modules | Core Modules | `core` | `foundation` | `planned` | - | `Module`, `ModuleManifest` |
| core.events | Core Events | `core` | `foundation` | `planned` | `core.identity` | `DomainEvent`, `DecisionRecord` |
| core.audit | Core Audit | `core` | `foundation` | `planned` | `core.identity`, `core.permissions` | `AuditLog` |
| core.config | Core Config | `core` | `foundation` | `planned` | - | `SystemSetting`, `BackupRecord` |
| core.doctor | Core Doctor | `core` | `foundation` | `planned` | `core.config` | `EvidenceReport` |
| dashboard | Dashboard | `feature` | `mvp` | `planned` | `core.identity`, `core.permissions`, `core.modules`, `core.events`, `core.doctor` | - |
| onboarding | Onboarding | `feature` | `mvp` | `planned` | `core.identity`, `core.permissions`, `core.events`, `profile` | `OnboardingSession` |
| profile | Profile | `feature` | `mvp` | `planned` | `core.identity`, `core.permissions`, `core.events` | `UserContext` |
| notifications | Notifications | `feature` | `mvp` | `planned` | `core.identity`, `core.permissions`, `core.events` | `Notification` |
| admin | Admin | `admin` | `mvp` | `planned` | `core.identity`, `core.permissions`, `core.modules`, `core.audit`, `core.doctor` | - |
| gamification | Gamification | `feature` | `mvp` | `planned` | `core.events`, `core.identity`, `core.permissions` | `ProgressRecord`, `Achievement`, `UserAchievement`, `GamificationRuleState` |
| ai_assistant | Ai Assistant | `ai` | `mvp` | `planned` | `core.audit`, `core.doctor`, `core.permissions` | `AIActionLog` |
| integrations | Integrations | `adapter` | `mvp` | `stub` | `core.modules`, `core.permissions`, `core.events` | `Integration` |

## Reglas

- `depends_on` declara solo dependencias duras de arranque.
- `dependency_contracts` declara dependencias opcionales, visuales, de evento, de datos o de stub con fallback obligatorio.
- `module_type` define el tipo arquitectónico.
- `phase` define cuándo entra en producto.
- `lifecycle_status` define estado operativo.
- `module_classification` conserva la clasificación heredada solo como compatibilidad.
- Ningún módulo puede acceder a tablas ajenas ni emitir eventos no registrados.

## Rutas públicas de identidad

- `GET /` usa `public.view` y sirve la pantalla `public_entry`.
- `GET /login` y `POST /login` usan `auth.login` y no sustituyen la entrada pública.
- No existe `/register` ni `/signup` en MVP.

## Contrato obligatorio con core.events

Todo módulo distinto de `core.events` que declare `events_emitted` o `events_consumed` debe quedar conectado al bus de eventos de una de estas dos formas:

1. `depends_on` contiene `core.events` cuando el módulo no puede arrancar sin el bus.
2. `dependency_contracts` contiene un contrato con `module = core.events` y `kind = event_bus` cuando la relación debe ser explícita pero no conviene convertirla en dependencia dura.

El contrato `event_bus` debe declarar dirección (`emit`, `consume` o `emit_consume`), eventos permitidos, semántica de entrega, política de fallo, política de auditoría e idempotencia. Esta regla evita imports directos, callbacks internos o servicios globales no declarados entre productores y consumidores.

Doctor valida esta regla mediante `EVENT_PRODUCERS_AND_CONSUMERS_DECLARE_EVENT_BUS_CONTRACT`.
