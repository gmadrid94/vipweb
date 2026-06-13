# 08 Subweb Contracts

**Estado recomendado:** `FUTURE_GATE_READY`  
**Fuente canónica:** `machine/subweb_contracts.json`, `machine/schemas/subweb-contract.schema.json`, `templates/subweb-contract.json`, `templates/subweb-contract-stub-example.json`, ADR-001, ADR-002.

## Propósito

Definir cómo se añadirá una futura web o subweb conectada sin rediseñar el core.

## Regla principal

Una subweb no es una carpeta ni una ruta suelta. Es un conjunto de módulos, rutas, permisos, datos, eventos y rollback declarado por contrato.

## Estado actual

`machine/subweb_contracts.json` existe como lista vacía. Eso significa que no hay subwebs activas ni planificadas como implementación inmediata, pero el formato ya es validable antes de crear la primera.

## Contrato mínimo

- `id` y `name`.
- `owner_module`.
- `phase` y `lifecycle_status`.
- `entry_route`.
- `uses_app_shell`.
- `required_permissions`.
- `owned_modules` y `shared_modules`.
- `data_access` con entidades propias, leídas y prohibidas.
- `events` emitidos/consumidos.
- `integration_type`.
- `rollback`.


## Regla de activación semántica

La plantilla `templates/subweb-contract.json` representa un placeholder `planned`, no un contrato activable.

Una subweb con `lifecycle_status = stub` o `lifecycle_status = active` no puede mantener vacíos simultáneamente permisos, módulos, acceso a datos y eventos. Debe pasar el check `SUBWEB_ACTIVE_OR_STUB_CONTRACTS_ARE_OPERATIONAL`.

### Requisitos mínimos por estado

| Estado | Requisito |
|---|---|
| `planned` | Puede mantener arrays vacíos como placeholder documental. |
| `disabled` | Puede conservar contrato parcial mientras esté inactiva. |
| `deprecated` | Puede conservar contrato consolidado parcial. |
| `stub` | Debe declarar permisos, módulo propio o compartido, rollback completo, `entry_route` y `uses_app_shell`. |
| `active` | Debe declarar permisos, módulo propio o compartido, datos o eventos, ruta en matriz de permisos, rollback completo y referencias válidas contra catálogos machine-readable. |

## Regla para la primera subweb real

No debe añadirse una subweb real directamente como `active`.

La primera subweb debe entrar primero como `planned` si solo existe intención documental, o como `stub` si ya tiene:

- `entry_route`
- permisos mínimos
- módulo propio o compartido
- rollback
- owner
- matriz de permisos actualizada

Solo podrá pasar a `active` cuando existan datos o eventos reales, ruta validada, permisos sincronizados y Doctor sin errores.

## Ejemplo operativo de subweb en estado `stub`

`templates/subweb-contract-stub-example.json` define un ejemplo mínimo de subweb conectada al ecosistema sin funcionalidad activa.

Este archivo:

- no representa una subweb real;
- no debe añadirse a `machine/subweb_contracts.json` salvo que se vaya a instanciar una subweb concreta;
- sirve como base copiable para validar ruta, permiso mínimo, módulo compartido, AppShell y rollback;
- mantiene `events.emitted`, `events.consumed` y `data_access` vacíos porque el estado sigue siendo `stub`;
- debe completarse con datos o eventos reales antes de pasar a `active`.

Diferencia operativa:

| Estado | Uso correcto |
|---|---|
| `planned` | Intención documental sin contrato operativo. |
| `stub` | Contrato mínimo validable sin funcionalidad activa. |
| `active` | Subweb con rutas, permisos, módulos, datos/eventos y rollback completos. |

Para convertir el ejemplo en una subweb real deben actualizarse, como mínimo:

- `id` y `name`;
- `entry_route`;
- `required_permissions` y matriz de permisos;
- `owner_module`;
- módulos propios o compartidos;
- rollback;
- eventos o datos si se pretende pasar a `active`.

## Criterios de validación

No activar subwebs antes de que el contrato tenga schema propio, matriz de permisos, owner, datos y rollback.

Doctor valida:

- `SUBWEB_CONTRACT_SCHEMA_EXISTS`
- `SUBWEB_CONTRACTS_MATCH_SCHEMA`
- `SUBWEB_TEMPLATE_VALIDATES_AGAINST_SCHEMA`
- `MACHINE_MANIFEST_INCLUDES_SUBWEB_CONTRACT_SCHEMA`
- `SUBWEB_ACTIVE_OR_STUB_CONTRACTS_ARE_OPERATIONAL`
- `SUBWEB_SCHEMA_ENFORCES_STUB_MINIMUMS`
- `SUBWEB_SCHEMA_ENFORCES_ACTIVE_MINIMUMS`
- `SUBWEB_SCHEMA_AND_DOCTOR_RULES_ARE_ALIGNED`

## Riesgos si se incumple

Subwebs acopladas al core, duplicación de permisos, navegación incoherente o datos compartidos sin contrato.


## Alineación schema/Doctor

El JSON Schema debe rechazar por sí solo contratos `stub` sin permisos y módulo, y contratos `active` sin permisos, módulo y datos/eventos. Doctor mantiene una segunda validación semántica contra catálogos reales, rutas y referencias existentes.

## Gate obligatorio antes de implementar la primera subweb real

Antes de crear rutas, carpetas, permisos, pantallas o lógica runtime de una subweb real debe existir una entrada en `machine/subweb_contracts.json` con `lifecycle_status = planned` o `lifecycle_status = stub`.

El contrato mínimo debe declarar:

- `id`, `name` y `owner_module`;
- `entry_route` prevista;
- `required_permissions` o justificación de placeholder `planned`;
- módulos propios o compartidos;
- rollback;
- matriz de permisos afectada cuando exista ruta;
- eventos/datos si se pretende pasar a `active`.

Doctor debe bloquear cualquier subweb real que aparezca como ruta o implementación sin contrato previo. El catálogo puede seguir vacío durante Sprint 0 porque no hay subweb real decidida.
