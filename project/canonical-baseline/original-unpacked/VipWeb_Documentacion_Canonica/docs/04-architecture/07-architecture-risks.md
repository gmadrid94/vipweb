
# 07 Architecture Risks

**Estado recomendado:** `READY_FOR_IMPLEMENTATION`
**Gate operativo aplicable:** `READY_FOR_IMPLEMENTATION` indica madurez documental, no permiso operativo por sí solo. Prevalecen `CURRENT_STATUS.md` y `machine/roadmap_gates.json`. Con el estado global actual `READY_FOR_SPRINT_0`, este documento solo puede guiar tareas permitidas por Sprint 0. No autoriza UI visible, Dashboard, Onboarding ni módulos funcionales hasta alcanzar `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT`.
  
**Fuente canónica:** `machine/risk_register.json`, `machine/risks.json`, `machine/doctor_checks.json`, ADR-009.

## Propósito
Registrar riesgos arquitectónicos residuales y su mitigación antes de Core Runtime.

| Riesgo | Causa | Mitigación | Check asociado |
|---|---|---|---|
| Contratos incompletos | Schema superficial o manifest vacío | Schema profundo y tests negativos | `MODULE_SCHEMA_DEEP_CONTRACT` |
| Dependencias de módulo ambiguas | `depends_on` mezcla bloqueos con mejoras visuales | `depends_on` duro + `dependency_contracts` tipados | `MODULE_DEPENDENCIES_ARE_TYPED_AND_PHASE_VALID` |
| Permisos ambiguos | Ruta usa permiso incorrecto | Matriz ruta-permiso-rol | `ROUTE_PERMISSION_ROLE_MATRIX_VALID` |
| IA con escritura no aprobada | Mezcla de Doctor y evidencia | Separación readonly/write/validate | `AI_PERMISSION_LEVELS_ARE_COHERENT` |
| Ruta IA sin nivel explícito | `ai_allowed=true` sin `ai_level_max` | Nivel y auditoría obligatorios | `AI_ALLOWED_ROUTES_DECLARE_LEVEL_AND_AUDIT` |
| Migraciones débiles | Relaciones sin constraints | Matriz física | `RELATIONSHIPS_HAVE_PHYSICAL_CONSTRAINTS` |
| Drift entre SQL físico y contratos | Migraciones, rollbacks o seeds modificados sin actualizar manifest, machine-readable o evidencia | Ejecución local con DDL no trazado y riesgo de rediseño de datos | `database/manifest.json`, `machine/migration_contracts.json`, Doctor y evidencia previa a ejecución | `SQL_MANIFEST_HASHES_MATCH_FILES` / `SQL_ARTIFACTS_STATE_MATCHES_FILESYSTEM` |
| Roadmap confuso | Legacy activo como canon | Estados `CANONICAL`/`LEGACY_REFERENCE` | `ROADMAP_HUMAN_DOCS_MATCH_MACHINE_GATES` |
| Divergencia roadmap/backlog/cobertura | Varias fuentes editadas sin sincronizar | Matriz MVP y checks de cobertura | `MVP_MODULES_HAVE_FULL_COVERAGE` |
| Escritura cross-module no declarada | Acción mutable escribe entidad de otro owner | `writes_entities` owned + `delegated_write_entities` con contrato `data_write` | `ACTION_DIRECT_WRITES_ONLY_OWNED_ENTITIES` |
| AI-2 activo sin lifecycle restringido | `ai_admin` interpretado como rol activo por defecto | `restricted_mvp`, `disabled_by_default`, ApprovalRecord y owner confirmation | `AI2_RESTRICTED_ROUTES_REQUIRE_APPROVAL_AND_DISABLED_STATUS` |
| Subweb futura sin contrato validable | Primera subweb creada ad hoc | Schema y contrato vacío hasta activación explícita | `SUBWEB_CONTRACTS_MATCH_SCHEMA` |
| GET operacional | Ruta GET declarada como ejecución o acción con side effects | Separar vista GET y ejecución POST; prohibir action_type operacional en GET | `GET_ROUTES_DO_NOT_DECLARE_OPERATIONAL_ACTION_TYPES` |
| Registro ambiguo | `user.registered` usado sin contrato de auto-registro | Provisionamiento controlado explícito en MVP | `REGISTRATION_POLICY_IS_EXPLICIT` |
| Riesgos sin fase normalizada | Fase expresada solo como texto libre | `primary_phase_id` y `phase_ids` contra roadmap gates | `RISK_PHASES_REFERENCE_ROADMAP_GATES` |
| Tarea P0 omitida por falta de trazabilidad | Backlog, matriz MVP, trazabilidad o Markdown humano editados de forma desalineada | Checks P0 de trazabilidad, cobertura/gate y sincronización humano-machine | `P0_BACKLOG_ITEMS_ARE_TRACEABLE` |

## Criterios de validación
Ningún riesgo P0/P1 debe quedar sin documento, catálogo, mitigación y check.

## Riesgo añadido: event bus implícito

| Riesgo | Causa | Impacto | Mitigación | Validación |
|---|---|---|---|---|
| Event bus usado como dependencia implícita | Productores o consumidores de eventos sin `depends_on core.events` ni `dependency_contracts.kind=event_bus` | Acoplamiento oculto, callbacks directos, imports entre módulos y posible rediseño del Core Runtime | Declarar contrato `event_bus` con eventos permitidos, dirección, fallback y política de fallo | `EVENT_PRODUCERS_AND_CONSUMERS_DECLARE_EVENT_BUS_CONTRACT` |
