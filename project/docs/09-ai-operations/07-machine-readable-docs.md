# Machine-readable docs

**Estado recomendado:** `READY_FOR_IMPLEMENTATION`
**Gate operativo aplicable:** `READY_FOR_IMPLEMENTATION` indica madurez documental, no permiso operativo por sí solo. Prevalecen `CURRENT_STATUS.md` y `machine/roadmap_gates.json`. Con el estado global actual `READY_FOR_SPRINT_0`, este documento solo puede guiar tareas permitidas por Sprint 0. No autoriza UI visible, Dashboard, Onboarding ni módulos funcionales hasta alcanzar `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT`.


Fuente canónica de inventario principal: `machine/machine_manifest.json`.

Fuente canónica de schemas auxiliares runtime: `machine/schema_registry.json`.

## Reglas

- Todo archivo canónico `machine/*.json` debe aparecer en `machine/machine_manifest.json`.
- Todo archivo canónico debe declarar schema cuando sea validable.
- Los schemas viven en `machine/schemas/`.
- Los payload schemas de acciones viven en `machine/action_payloads/` y son contratos runtime cerrados.
- Los payload schemas de eventos viven en `machine/event_payload_schemas/`.
- `machine/schema_registry.json` centraliza el índice de `machine/schemas/*`, `machine/action_payloads/*` y `machine/event_payload_schemas/*` para que IA y Doctor no dependan de crawling implícito.
- `machine/column_contracts.json` cierra el contrato físico de columnas para migraciones WAMP.
- `machine/domain_constraints_enforcement_matrix.json` declara si cada constraint de dominio se aplica en DB, aplicación, Doctor o combinación de capas.
- `machine/migration_contracts.json` cierra el contrato operativo de migraciones reversibles: `up_ref`, `rollback_ref`, checksum y ledger.
- `machine/screen_responsive_behavior.json` cierra el contrato responsive por pantalla y breakpoint.
- `machine/subweb_contracts.json` cierra el contrato de subwebs futuras; actualmente es una lista vacía, por tanto no activa subwebs.
- `machine/integration_contracts.json` cierra el contrato de integraciones reales futuras; actualmente es una lista vacía, por tanto no activa proveedores externos.
- Las tablas antiguas de inventario manual no prevalecen sobre el manifest.


## Regla de ownership semántico

El owner principal de cada catálogo machine-readable debe representar la responsabilidad de decisión, no solo el módulo consumidor. Los catálogos de datos, producto, negocio y UX deben usar `owner_type = area` y un `owner_ref` semántico (`core.data`, `producto`, `negocio` o `design.ux`). Los módulos técnicos pueden figurar como dependencias o consumidores, pero no como owner principal si no son responsables semánticos del documento.

Doctor valida esta regla con `MACHINE_MANIFEST_AREA_FILES_USE_AREA_OWNER_TYPE`.

## Regla de backlinks humanos

Todo archivo `machine/*.json` con `status = canonical` o `status = derived_matrix` debe declarar al menos un documento humano en `markdown_docs`.

Los archivos `derived_alias` deben heredar al menos un documento humano de su fuente canónica o declarar el documento humano equivalente que explica el alias.

Doctor valida:

- `MACHINE_MANIFEST_CANONICAL_FILES_HAVE_MARKDOWN_DOCS`
- `MACHINE_MANIFEST_MARKDOWN_DOCS_EXIST`
- `MACHINE_MANIFEST_DERIVED_ALIAS_INHERITS_CANONICAL_DOCS`
- `MACHINE_MANIFEST_INCLUDES_SUBWEB_CONTRACT_SCHEMA`

## Inventario vigente derivado del manifest

| Archivo | Schema | Estado | Owner | Tipo owner | Propósito |
|---|---|---|---|---|---|
| `machine/action_contracts.json` | `machine/schemas/action-contract.schema.json` | canonical | core.modules | module | Fuente machine-readable para action_contracts. |
| `machine/ai_approval_policy.json` | `machine/schemas/ai-approval-policy.schema.json` | canonical | ai_assistant | module | Fuente machine-readable para ai_approval_policy. |
| `machine/ai_behavior_fixtures.json` | `machine/schemas/ai-behavior-fixture.schema.json` | canonical | ai_assistant | module | Fixtures adversariales de comportamiento IA para validar contexto no confiable, falsa aprobación, evidencia, secretos y gates. |
| `machine/ai_context_trust_policy.json` | `machine/schemas/ai-context-trust-policy.schema.json` | canonical | ai_assistant | module | Política machine-readable de jerarquía de autoridad y defensa anti prompt-injection para contexto IA. |
| `machine/backlog_items.json` | `machine/schemas/backlog-item.schema.json` | canonical | core.doctor | module | Fuente machine-readable para backlog_items. |
| `machine/catalog_entities.json` | `machine/schemas/entity.schema.json` | derived_alias | core.data | area | Alias derivado del catálogo canónico de entidades. |
| `machine/catalog_events.json` | `machine/schemas/event.schema.json` | derived_alias | core.events | module | Alias derivado del catálogo canónico de eventos. |
| `machine/catalog_modules.json` | `machine/schemas/module.schema.json` | derived_alias | core.modules | module | Alias derivado del catálogo canónico de módulos. |
| `machine/column_contracts.json` | `machine/schemas/column-contract.schema.json` | canonical | core.data | area | Contrato físico de columnas para migraciones WAMP/MySQL/MariaDB derivables sin interpretación. |
| `machine/critical_decisions.json` | `machine/schemas/critical-decision.schema.json` | canonical | core.doctor | module | Fuente machine-readable para critical_decisions. |
| `machine/decision_dependency_matrix.json` | `machine/schemas/decision-dependency-matrix.schema.json` | derived_matrix | core.events | module | Fuente machine-readable para decision_dependency_matrix. |
| `machine/decision_id_map.json` | `machine/schemas/decision-id-map.schema.json` | canonical | core.events | module | Fuente machine-readable para decision_id_map. |
| `machine/decisions.json` | `machine/schemas/decision.schema.json` | canonical | core.events | module | Fuente machine-readable para decisions. |
| `machine/design_tokens.json` | `machine/schemas/design-token.schema.json` | canonical | design.ux | area | Fuente machine-readable de tokens visuales mínimos y variantes base. |
| `machine/domain_constraints_enforcement_matrix.json` | `machine/schemas/domain-constraints-enforcement-matrix.schema.json` | canonical | core.data | area | Matriz canónica que clasifica constraints de dominio por enforcement en DB, aplicación y Doctor. |
| `machine/doctor_checks.json` | `machine/schemas/doctor-check.schema.json` | canonical | core.doctor | module | Fuente machine-readable para doctor_checks. |
| `machine/entities.json` | `machine/schemas/entity.schema.json` | canonical | core.data | area | Fuente machine-readable para entities. |
| `machine/events.json` | `machine/schemas/event.schema.json` | canonical | core.events | module | Fuente machine-readable para events. |
| `machine/features.json` | `machine/schemas/feature.schema.json` | canonical | producto | area | Fuente machine-readable para features. |
| `machine/gamification_rules.json` | `machine/schemas/gamification-rules.schema.json` | canonical | gamification | module | Fuente machine-readable para gamification_rules. |
| `machine/integration_contracts.json` | `machine/schemas/integration-contract.schema.json` | canonical | integrations | module | Contratos machine-readable para integraciones reales futuras sin activar proveedores externos en el MVP. |
| `machine/journeys.json` | `machine/schemas/journey.schema.json` | canonical | producto | area | Fuente machine-readable para journeys. |
| `machine/machine_manifest.json` | `machine/schemas/machine-manifest.schema.json` | canonical | core.doctor | module | Fuente machine-readable para machine_manifest. |
| `machine/metrics.json` | `machine/schemas/metric.schema.json` | canonical | negocio | area | Fuente machine-readable para metrics. |
| `machine/migration_contracts.json` | `machine/schemas/migration-contract.schema.json` | canonical | core.data | area | Contrato machine-readable de migraciones SQL reversibles: up_ref, rollback_ref, checksum y ledger para WAMP local. |
| `machine/modules.json` | `machine/schemas/module.schema.json` | canonical | core.modules | module | Fuente machine-readable para modules. |
| `machine/mvp_coverage_matrix.json` | `machine/schemas/mvp-coverage-matrix.schema.json` | canonical | core.doctor | module | Fuente machine-readable para mvp_coverage_matrix. |
| `machine/mvp_qualitative_validation.json` | `machine/schemas/mvp-qualitative-validation.schema.json` | canonical | producto | area | Protocolo cualitativo MVP para validar comprensión, acompañamiento y continuidad con muestra inicial pequeña. |
| `machine/permissions.json` | `machine/schemas/permission.schema.json` | canonical | core.permissions | module | Fuente machine-readable para permissions. |
| `machine/physical_constraints_matrix.json` | `machine/schemas/physical-constraints-matrix.schema.json` | canonical | core.data | area | Fuente machine-readable para physical_constraints_matrix. |
| `machine/product_mvp.json` | `machine/schemas/product-mvp.schema.json` | canonical | producto | area | Fuente machine-readable para product_mvp. |
| `machine/proposed_decisions.json` | `machine/schemas/proposed-decision.schema.json` | canonical | core.doctor | module | Catálogo machine-readable de ADRs propuestas, condicionales o futuras que no cuentan como ADRs aceptadas. |
| `machine/relationships.json` | `machine/schemas/relationship.schema.json` | canonical | core.data | area | Fuente machine-readable para relationships. |
| `machine/risk_register.json` | `machine/schemas/risk-register.schema.json` | canonical | core.doctor | module | Registro estratégico canónico de riesgos: categoría, probabilidad, impacto, señales tempranas, mitigación, decisión asociada y fases referenciadas a roadmap_gates. |
| `machine/risks.json` | `machine/schemas/risk.schema.json` | canonical | core.doctor | module | Catálogo operativo canónico de controles de riesgo validables por Doctor: bloqueo, evidencia, WAMP, validated_by, lectura IA y vínculo opcional a risk_register. |
| `machine/schema_registry.json` | `machine/schemas/schema-registry.schema.json` | canonical | core.doctor | module | Registry machine-readable de schemas auxiliares runtime para IA, Doctor y auditoría automática. |
| `machine/roadmap_gates.json` | `machine/schemas/roadmap-gate.schema.json` | canonical | core.doctor | module | Fuente machine-readable para roadmap_gates. |
| `machine/roles.json` | `machine/schemas/role.schema.json` | canonical | core.permissions | module | Fuente machine-readable para roles. |
| `machine/roles_permissions_matrix.json` | `machine/schemas/roles-permissions-matrix.schema.json` | derived_matrix | core.permissions | module | Fuente machine-readable para roles_permissions_matrix. |
| `machine/route_permission_matrix.json` | `machine/schemas/route-permission-matrix.schema.json` | canonical | core.permissions | module | Fuente machine-readable para route_permission_matrix. |
| `machine/runtime_test_matrix.json` | `machine/schemas/runtime-test-matrix.schema.json` | canonical | core.doctor | module | Matriz machine-readable que vincula cada action contract con grupos de tests runtime obligatorios, pruebas positivas, negativas, guardrails IA, ApprovalRecord, auditoría, eventos y rollback. |
| `machine/screen_component_contracts.json` | `machine/schemas/screen-component-contract.schema.json` | canonical | design.ux | area | Contratos de composición pantalla-componentes-datos-acciones-eventos para pantallas MVP visibles. |
| `machine/screen_responsive_behavior.json` | `machine/schemas/screen-responsive-behavior.schema.json` | canonical | design.ux | area | Contrato responsive por pantalla y breakpoint para MVP. |
| `machine/sprint0_tasks.json` | `machine/schemas/sprint0-task.schema.json` | canonical | core.doctor | module | Fuente machine-readable para sprint0_tasks. |
| `machine/subweb_contracts.json` | `machine/schemas/subweb-contract.schema.json` | canonical | core.modules | module | Contratos machine-readable para subwebs futuras conectadas al core sin activar ninguna subweb por defecto. |
| `machine/traceability_matrix.json` | `machine/schemas/traceability.schema.json` | canonical | core.doctor | module | Fuente machine-readable para traceability_matrix. |
| `machine/ui_screens.json` | `machine/schemas/ui-screen.schema.json` | canonical | design.ux | area | Fuente machine-readable para ui_screens. |
| `machine/ui_state_copy.json` | `machine/schemas/ui-state-copy.schema.json` | canonical | design.ux | area | Fuente machine-readable para ui_state_copy. |


## Registry auxiliar de schemas runtime

`machine/schema_registry.json` no sustituye a los contratos canónicos. Su función es indexarlos para mejorar descubribilidad, trazabilidad y validación automática.

| Sección | Cubre | Fuente | Validación Doctor |
|---|---|---|---|
| `schema_registry` | Schemas de catálogos machine-readable. | `machine/schemas/*.json` | `SCHEMA_REGISTRY_COVERS_MACHINE_SCHEMAS` |
| `action_payload_schema_registry` | Schemas request, response y path de acciones runtime. | `machine/action_payloads/*.json` | `SCHEMA_REGISTRY_COVERS_ACTION_PAYLOAD_SCHEMAS` |
| `event_payload_schema_registry` | Schemas de payload de eventos de dominio. | `machine/event_payload_schemas/*.json` | `SCHEMA_REGISTRY_COVERS_EVENT_PAYLOAD_SCHEMAS` |

Reglas:

- Cada entrada debe apuntar a un archivo existente.
- Cada entrada debe declarar owner, contrato padre, documento humano y check Doctor.
- Ninguna IA debe inferir schemas runtime por nombre de archivo si existe entrada en `machine/schema_registry.json`.
- Si se añade un schema, debe actualizarse el registry en el mismo cambio.

## Catálogo machine-readable de runbooks IA

`machine/ai_runbooks.json` es la fuente validable para procedimientos operativos IA. Declara ID de runbook, niveles IA permitidos, precondiciones, acciones permitidas y prohibidas, permisos, necesidad de `ApprovalRecord`, evidencias esperadas, tests y fallback.

| Archivo | Schema | Estado | Owner | Tipo owner | Propósito |
|---|---|---|---|---|---|
| `machine/ai_runbooks.json` | `machine/schemas/ai-runbook.schema.json` | canonical | ai_assistant | module | Catálogo machine-readable de runbooks IA, precondiciones, permisos, acciones prohibidas, evidencias y tests. |

## Catálogo de analítica UI

`machine/analytics_events.json` es fuente canónica para las señales declaradas en `analytics_refs` de pantallas.

La IA no debe inventar eventos a partir de una referencia de pantalla. Debe consultar este catálogo para distinguir entre `ui_analytics`, `domain_view_event`, `domain_action_event` y `system_observation` antes de proponer métricas, gamificación, persistencia o cambios de seguridad.


## External roadmap tool contracts

`machine/external_tool_contracts.json` declara raíces, logging, trust boundary y tools externas mínimas para ejecutar el roadmap AI-first local. Su documentación humana vive en `docs/06-technical/12-external-roadmap-tools.md`, `docs/09-ai-operations/11-ai-first-execution-model.md` y `docs/10-roadmap/09-ai-first-roadmap-execution.md`.
