
# Contratos de módulo

**Estado recomendado:** `READY_FOR_IMPLEMENTATION`
**Gate operativo aplicable:** `READY_FOR_IMPLEMENTATION` indica madurez documental, no permiso operativo por sí solo. Prevalecen `CURRENT_STATUS.md` y `machine/roadmap_gates.json`. Con el estado global actual `READY_FOR_SPRINT_0`, este documento solo puede guiar tareas permitidas por Sprint 0. No autoriza UI visible, Dashboard, Onboarding ni módulos funcionales hasta alcanzar `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT`.


## Decisión
Todo módulo de VipWeb se declara mediante un `module.manifest` validable. El contrato prevalece sobre implementaciones parciales y debe poder ser leído por Doctor y por IA antes de modificar código.

## Campos obligatorios

| Campo | Función |
|---|---|
| `id` | ID estable del módulo. |
| `name` | Nombre humano. |
| `module_type` | `core`, `feature`, `adapter`, `ai`, `admin` o `system`. |
| `phase` | `foundation`, `mvp`, `post_mvp` o `future`. |
| `lifecycle_status` | `planned`, `active`, `disabled`, `stub` o `deprecated`. |
| `owner` | Responsable operativo. |
| `depends_on` | Dependencias duras de arranque. |
| `dependency_contracts` | Dependencias no duras o tipadas con fallback. |
| `provides` | Rutas, permisos, eventos, slots UI y config keys. |
| `data` | Entidades propias, leídas y prohibidas. |
| `forbidden` | Restricciones de imports, DB y core mutation. |
| `validation` | Tests, Doctor checks y evidencias. |
| `rollback` | Estrategia de desactivación o reversión. |

## Semántica de dependencias

| Campo/tipo | Significado |
|---|---|
| `depends_on` | Bloqueo real: el módulo no puede arrancar sin esos módulos. |
| `runtime_blocking` | Dependencia de runtime crítica. |
| `permission_guard` | Necesaria para proteger rutas o acciones. |
| `event_bus` | Necesaria para emitir/consumir eventos. |
| `event_consumer` | Consumidor diferible de eventos. |
| `ui_enhancement` | Mejora visual no bloqueante. |
| `data_read` | Lectura controlada de entidad. |
| `data_write` | Escritura delegada o controlada. |
| `stub_allowed` | Puede funcionar con stub/fallback. |
| `future_optional` | Preparado para futuro, no bloquea MVP. |


## Contratos de lectura cross-module

Toda entidad declarada en `data.read_entities` cuya propiedad pertenezca a otro módulo exige un contrato explícito `dependency_contracts.kind = data_read`.

Regla: leer datos ajenos también es una dependencia arquitectónica. No se permite resolverla mediante consultas directas a tablas, imports internos, conocimiento implícito del schema o permisos genéricos.

Campos obligatorios del contrato `data_read`:

| Campo | Función |
|---|---|
| `module` | Módulo propietario de la entidad leída. |
| `entity` | Entidad leída. |
| `owner_module` | Owner canónico de la entidad, igual a `machine/entities.json`. |
| `purpose` | Finalidad concreta de la lectura. |
| `allowed_fields` | Campos permitidos; debe excluir secretos, hashes y payload bruto sensible. |
| `read_model` | Modelo de lectura autorizado para evitar acceso a internals. |
| `permission_context` | Permiso, rol o contexto que habilita la lectura. |
| `redaction_policy` | Política de redacción aplicable al consumidor humano o IA. |
| `failure_policy` | Comportamiento ante ausencia de owner, permiso o contrato. |
| `evidence_ref` | Evidencia esperada para validar el contrato. |
| `doctor_check_ref` | Debe ser `MODULE_READ_ENTITIES_HAVE_DATA_READ_CONTRACT`. |
| `ai_access_policy` | Límite específico para lectura por IA. |

Criterio: si `dashboard`, `profile`, `notifications`, `gamification`, `integrations`, `admin` o `ai_assistant` leen `User`, `Module`, `DomainEvent` o `ApprovalRecord`, la lectura debe aparecer en `machine/modules.json` como `data_read` y Doctor debe fallar si falta.

La escritura delegada continúa resolviéndose con `data_write`; no debe mezclarse con `data_read`.

## Prohibiciones

- Acceso directo a tablas ajenas.
- Eventos no declarados en `machine/events.json`.
- Permisos no declarados en `machine/permissions.json`.
- Mutación de core desde un módulo no core.
- Credenciales reales en integraciones MVP.
- Dependencias opcionales sin fallback.

## Validación

El contrato queda validado por:

- `machine/schemas/module.schema.json`
- `templates/module-manifest.json`
- `scripts/update_script.py`
- `MODULE_SCHEMA_DEEP_CONTRACT`
- `MODULE_DEPENDENCIES_ARE_TYPED_AND_PHASE_VALID`
- `MODULE_TEMPLATE_VALIDATES_AGAINST_SCHEMA`

## Contrato de acciones mutables

Las rutas expuestas por un módulo se declaran en `provides.routes`, pero toda ruta mutable debe estar respaldada por `machine/action_contracts.json`.

Reglas:

- `provides.routes` declara superficie HTTP interna.
- `route_permission_matrix.json` declara protección ruta-permiso-rol.
- `action_contracts.json` declara comportamiento operativo, eventos, entidades escritas, auditoría, aprobación y rollback.
- Una ruta mutable sin action contract se considera inválida.

## Semántica de permisos

`provides.permissions` indica que el módulo expone o necesita esos permisos en su superficie, pero la propiedad canónica del permiso vive en `machine/permissions.json` mediante:

- `owner_module`: módulo que define el permiso.
- `consumed_by_modules`: módulos que lo usan.
- `aggregated_by_modules`: módulos que lo muestran o agrupan visualmente.

`admin` puede agregar permisos sin convertirse en propietario de ellos.

## Semántica explícita de imports prohibidos

`forbidden.direct_imports_from` ya no usa wildcard ambiguo.

Contrato vigente:

```json
{
  "direct_imports_from": {
    "mode": "deny_all_module_internals",
    "allowed_access": [
      "public_contracts",
      "events",
      "permissions",
      "module_manifest"
    ]
  }
}
```

Regla: los módulos no pueden importar internals de otros módulos. La comunicación entre módulos solo puede ocurrir mediante contratos públicos, eventos, permisos, manifiestos o adaptadores declarados.

Doctor valida:

- `MODULE_FORBIDDEN_IMPORTS_USE_EXPLICIT_MODE`
- `MODULES_DECLARE_ALLOWED_CROSS_MODULE_ACCESS`
- `NO_WILDCARD_FORBIDDEN_IMPORTS`


## Contrato de escritura de datos

La propiedad de escritura se decide por `owner_module` de cada entidad en `machine/entities.json`.

Reglas:

- `writes_entities` de `machine/action_contracts.json` solo puede contener entidades owned por el módulo de la acción.
- Si una acción necesita provocar una escritura en otro módulo, debe usar `delegated_write_entities`.
- Toda escritura delegada debe tener un contrato `dependency_contracts.kind=data_write` en el módulo productor.
- El rollback de una escritura delegada pertenece al owner de la entidad escrita.
- Los productores de eventos no escriben directamente entidades que pertenecen a consumidores de esos eventos.

Ejemplos cerrados:

- `ONBOARDING_COMPLETE` escribe `OnboardingSession` y emite `onboarding.completed`; `gamification` consume el evento y escribe `ProgressRecord`.
- `DOCTOR_STATUS_VALIDATE` delega `DecisionRecord` a `core.events` mediante `core.events.record_decision`.

Doctor valida `ACTION_DIRECT_WRITES_ONLY_OWNED_ENTITIES`, `ACTION_DELEGATED_WRITES_HAVE_CONTRACT` y `NO_EVENT_PRODUCER_WRITES_CONSUMER_ENTITY`.
## Corrección semántica de ownership

La fuente canónica de ownership es `machine/entities.json -> owner_module`. `machine/modules.json -> data.owned_entities` debe ser una proyección coherente de esa fuente. Doctor valida esta regla mediante `MODULE_OWNED_ENTITIES_MATCH_ENTITY_OWNERS`.

Entidades owned relevantes tras la corrección:

- `core.identity`: `User`, `AuthAttempt`.
- `ai_assistant`: `AIActionLog`, `AIDraft`.
- `gamification`: `ProgressRecord`, `Achievement`, `UserAchievement`, `GamificationRuleState`.

## Contrato `event_bus` con `core.events`

Emitir o consumir eventos constituye una dependencia contractual aunque no siempre sea una dependencia dura de arranque.

Reglas:

- Todo módulo distinto de `core.events` con `provides.events_emitted` o `provides.events_consumed` debe declarar `core.events` en `depends_on` o en `dependency_contracts.kind = event_bus`.
- El contrato `event_bus` debe indicar `direction`, `allowed_events`, `delivery_semantics`, `failure_policy`, `audit_policy` e `idempotency_policy`.
- Un productor de eventos no puede llamar directamente a handlers de consumidores.
- Un consumidor no puede asumir persistencia en entidades del productor salvo contrato de datos separado.
- Si `core.events` no está disponible, las acciones mutables que emiten eventos deben fallar de forma cerrada o quedar bloqueadas por gate.

Ejemplo mínimo:

```json
{
  "module": "core.events",
  "kind": "event_bus",
  "required": true,
  "required_for": ["emit:user.logged_in", "consume:user.registered"],
  "fallback": "Bloquear emisión o consumo de eventos hasta que core.events exponga el bus contractual.",
  "min_lifecycle_status": "planned",
  "allowed_events": ["user.logged_in", "user.registered"],
  "direction": "emit_consume",
  "delivery_semantics": "domain_event_envelope_v1_append_only",
  "failure_policy": "fail_closed_for_mutating_actions_and_no_direct_module_callback",
  "audit_policy": "registrar DomainEvent o AuditLog según catálogo de eventos",
  "idempotency_policy": "event_id_unique_per_envelope_and_action_idempotency_when_action_contract_requires_it"
}
```

Doctor valida `EVENT_PRODUCERS_AND_CONSUMERS_DECLARE_EVENT_BUS_CONTRACT`.
