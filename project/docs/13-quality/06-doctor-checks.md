# 06 Doctor Checks

**Estado recomendado:** `READY_FOR_IMPLEMENTATION`
**Gate operativo aplicable:** `READY_FOR_IMPLEMENTATION` indica madurez documental, no permiso operativo por sí solo. Prevalecen `CURRENT_STATUS.md` y `machine/roadmap_gates.json`. Con el estado global actual `READY_FOR_SPRINT_0`, este documento solo guía tareas permitidas por Sprint 0. No autoriza UI visible, Dashboard, Onboarding ni módulos funcionales hasta que Sprint 0 local quede completado y se apruebe el gate operativo correspondiente.

**Fuente canónica:** `machine/doctor_checks.json` y `scripts/update_script.py`.

## Decisión canónica sobre Doctor

El único validador documental ejecutable de esta baseline es `scripts/update_script.py`. Doctor queda definido como contrato runtime futuro mediante `machine/doctor_checks.json`.

Doctor se mantiene como módulo, catálogo y contrato runtime futuro. `machine/doctor_checks.json` contiene tanto checks emitidos actualmente por `scripts/update_script.py` como checks declarativos que deberán implementarse en Doctor runtime o validadores posteriores.

`scripts/update_script.py` no modifica archivos, no ejecuta migraciones, no ejecuta seeds y no genera evidencia. La evidencia local se completa manualmente en `evidence/sprint-0-local-execution.md`.

## Checks emitidos actualmente por `scripts/update_script.py`

| Check | Tipo | Severidad | Descripción |
|---|---|---|---|
| `REQUIRED_PATHS_EXIST` | structure | critical | El validador documental confirma que las rutas obligatorias del paquete canónico existen. |
| `JSON_PARSE` | structure | critical | Todos los JSON conservados parsean correctamente. |
| `MACHINE_MANIFEST_SCHEMA_VALID` | semantic | critical | machine/machine_manifest.json valida contra machine/schemas/machine-manifest.schema.json. |
| `MACHINE_MANIFEST_REFERENCES_EXIST` | structure | critical | machine/machine_manifest.json no referencia archivos, schemas ni documentos inexistentes. |
| `MACHINE_MANIFEST_LISTED_JSON_VALIDATE` | semantic | critical | Todos los JSON listados en machine/machine_manifest.json validan contra su schema declarado. |
| `SPRINT0_TASKS_SCHEMA_VALID` | semantic | critical | machine/sprint0_tasks.json valida contra machine/schemas/sprint0-task.schema.json. |
| `DOCTOR_CHECK_CATALOG_COVERS_EMITTED_CHECKS` | consistency | high | Los checks que emite scripts/update_script.py están catalogados en machine/doctor_checks.json. |
| `DATABASE_MANIFEST_CHECKSUMS_VALID` | semantic | critical | database/manifest.json conserva checksums SHA-256 válidos para los artefactos SQL referenciados. |
| `NO_RETIRED_PACKAGE_REFERENCES` | documentation | critical | El corpus canónico no contiene nomenclatura retirada ni referencias a entregas no canónicas. |
| `PROJECT_IDENTITY_VIPWEB` | documentation | critical | La identidad canónica del proyecto es VipWeb y no aparecen identidades no canónicas. |
| `INTERNAL_REFERENCES_EXIST` | structure | critical | Las referencias internas a archivos conservados resuelven dentro del paquete canónico, incluidas referencias relativas en Markdown y rutas entre backticks. |
| `READINESS_READY_FOR_SPRINT_0` | documentation | critical | El estado operativo declarado es READY_FOR_SPRINT_0 y el desarrollo visible permanece bloqueado. |

## Regla de cobertura

Todos los checks emitidos por `scripts/update_script.py` deben existir en `machine/doctor_checks.json`. El catálogo también puede contener checks declarativos que forman parte del contrato Doctor futuro y que no son ejecutados por el script actual.

## Catálogo Doctor completo

| Check | Tipo | Severidad | Descripción |
|---|---|---|---|
| `ACCESSIBILITY_CONTRACTS_DECLARE_REQUIRED_FOCUS_AND_LIVE_REGIONS` | semantic | high | Los contratos accesibles declaran teclado, foco y regiones aria-live. |
| `ACCESSIBILITY_MINIMUM_TOKENS_DECLARED` | semantic | medium | Tokens mínimos de accesibilidad declarados. |
| `ACHIEVEMENTS_HAVE_USER_UNLOCK_ENTITY` | semantic | high | Los logros de usuario usan entidad UserAchievement. |
| `ACTION_AI_ROLES_DECLARED_AND_VALID` | semantic | critical | Toda acción con ai_allowed=true declara ai_roles válidos, con permiso y nivel IA compatible. |
| `ACTION_AI_ROLES_MATCH_ROUTE_AI_ROLES` | consistency | critical | Action contracts y route matrix coinciden en ai_roles para la misma ruta/método/módulo. |
| `ACTION_ALLOWED_ROLES_MATCH_ROUTE_ALLOWED_ROLES` | consistency | high | Action contracts y route matrix coinciden en allowed_roles. |
| `ACTION_CONTRACTS_DECLARE_ERROR_CODES` | semantic | high | Contratos de acción declaran códigos de error. |
| `ACTION_CONTRACTS_DECLARE_PRE_POSTCONDITIONS` | semantic | high | Contratos de acción declaran pre/postcondiciones. |
| `ACTION_CONTRACTS_DECLARE_REQUEST_RESPONSE` | semantic | critical | Contratos de acción declaran request y response. |
| `ACTION_CONTRACTS_HAVE_RUNTIME_TESTS` | semantic | critical | Todo action contract tiene fila equivalente en machine/runtime_test_matrix.json. |
| `ACTION_CONTRACTS_MATCH_SCHEMA` | semantic | high | Contratos de acciones cumplen schema mínimo. |
| `ACTION_CONTRACTS_REFERENCE_EXISTING_EVENTS` | semantic | high | Contratos de acción referencian eventos existentes. |
| `ACTION_CONTRACTS_REFERENCE_EXISTING_PERMISSIONS` | semantic | critical | Contratos de acción referencian rutas, permisos y roles existentes. |
| `ACTION_CONTRACT_REQUEST_SCHEMA_EXISTS` | structure | high | Schemas de request de acciones existen. |
| `ACTION_CONTRACT_RESPONSE_SCHEMA_EXISTS` | structure | high | Schemas de respuesta de acciones existen. |
| `ACTION_CONTRACT_UX_STATES_ARE_VALID` | semantic | medium | Estados UX de acciones son válidos. |
| `ACTION_DELEGATED_WRITES_HAVE_CONTRACT` | semantic | critical | Toda escritura delegada apunta a owner real y a contrato data_write declarado. |
| `ACTION_DIRECT_WRITES_ONLY_OWNED_ENTITIES` | semantic | critical | Toda entidad en writes_entities pertenece al módulo de la acción. |
| `ACTION_EMITTED_EVENTS_MATCH_PRODUCER_OR_DELEGATED_OWNER` | semantic | critical | Acciones solo emiten eventos propios o eventos delegados al productor canónico. |
| `ACTION_ERROR_CODES_COVER_SECURITY_FAILURES` | semantic | high | Los contratos cubren fallos de seguridad, sesión, payload y aprobación. |
| `ACTION_PAYLOAD_SCHEMAS_ARE_STRICT` | semantic | critical | Los payload schemas mutables son cerrados y no aceptan campos arbitrarios. |
| `ACTION_RESPONSE_DATA_SCHEMAS_ARE_STRICT` | semantic | high | Las respuestas de acciones tipan data sin objeto abierto. |
| `ACTIVATION_RATE_DENOMINATOR_IS_UNAMBIGUOUS` | semantic | medium | activation_rate define denominador no ambiguo. |
| `ACTIVE_INTEGRATIONS_REQUIRE_SANDBOX_EVIDENCE` | semantic | critical | No hay integraciones active sin evidencia de sandbox y fallback. |
| `ADMIN_MODULE_ROUTES_REQUIRE_ADMIN_PERMISSION` | semantic | high | Las rutas /admin/modules requieren permisos administrativos. |
| `ADMIN_ROUTES_DO_NOT_ALLOW_REGISTERED_USER` | semantic | high | Ninguna ruta /admin/* permite registered_user. |
| `ADMIN_TABLES_DEGRADE_ON_MOBILE` | semantic | medium | Tablas admin degradan a cards/listas en mobile. |
| `ADR026_GIT_CONDITIONAL_LANGUAGE_DECLARED` | documentation | high | La auditoría ADR matiza WAMP local con Git/ADR-026 para cambios protegidos preparados por IA. |
| `ADR_026_NOT_COUNTED_AS_ACCEPTED` | semantic | high | ADR-026 no cuenta como aceptada y no altera el conjunto vigente de 28 ADRs aceptadas. |
| `ADR_026_REGISTERED_AS_PROPOSED_CONDITIONAL` | semantic | high | ADR-026 existe como propuesta condicional machine-readable. |
| `ADR_ACCEPTED_COUNT_AND_PROPOSED_ADR026_ALIGNED` | consistency | high | Las 28 ADRs aceptadas están sincronizadas entre carpeta ADR, decision log y machine/decisions.json; ADR-026 permanece propuesta condicional. |
| `AI2_ACTIONS_REQUIRE_APPROVAL_RECORD` | semantic | critical | Toda acción AI-2/AI-3 mutable requiere ApprovalRecord runtime y aprobación humana. |
| `AI2_MVP_RESTRICTED_TERMINOLOGY_USED` | documentation | medium | El backlog IA usa AI-2 MVP restringido en lugar de AI-2 futuro. |
| `AI2_RESTRICTED_ROUTES_REQUIRE_APPROVAL_AND_DISABLED_STATUS` | semantic | critical | Toda ruta AI-2 mutable exige ApprovalRecord y está desactivada por defecto. |
| `AI2_WRITES_REQUIRE_APPROVAL_RECORD` | semantic | critical | Rutas AI-2/AI-3 permitidas requieren aprobación. |
| `AI_ACRONYM_FILENAMES_ARE_NORMALIZED` | semantic | high | Los acrónimos de entidades IA se normalizan en nombres físicos. |
| `AI_ACTIONS_HAVE_GUARDRAIL_TESTS` | semantic | critical | Toda acción permitida para IA declara pruebas negativas de guardrails y contexto no confiable. |
| `AI_ACTIONS_REQUIRE_APPROVAL_WHEN_NEEDED` | semantic | critical | Acciones IA con escritura declaran aprobación. |
| `AI_ACTION_LOG_APPROVAL_FK_PHYSICAL` | semantic | critical | AIActionLog.approval_id tiene FK física a ApprovalRecord. |
| `AI_ACTION_LOG_FIELDS_MATCH_POLICY` | semantic | critical | AIActionLog contiene campos mínimos exigidos por política IA. |
| `AI_ALLOWED_ROUTES_DECLARE_LEVEL_AND_AUDIT` | semantic | high | Rutas IA declaran nivel, roles y auditoría. |
| `AI_APPROVAL_POLICY_DEFINED` | semantic | high | Política de aprobación IA definida. |
| `AI_APPROVAL_POLICY_HAS_VERSION_CONTROL_GATE` | semantic | critical | La política IA declara gate de control de versiones para cambios protegidos. |
| `AI_APPROVAL_POLICY_MATCH_SCHEMA` | semantic | medium | Approval policy cumple schema mínimo. |
| `AI_APPROVAL_POLICY_REFERENCES_CONTEXT_TRUST` | semantic | high | La política de aprobación IA referencia AI_CONTEXT_TRUST_POLICY antes de acciones sensibles. |
| `AI_APPROVAL_POLICY_RUNTIME_READY` | semantic | high | Política runtime de aprobación IA está lista. |
| `AI_APPROVAL_RECORD_ENTITY_DEFINED` | semantic | critical | ApprovalRecord existe y está referenciado por approval policy. |
| `AI_APPROVAL_RECORD_REFERENCED_BY_AI_ACTION_LOG` | semantic | high | AIActionLog referencia ApprovalRecord mediante approval_id. |
| `AI_BACKLOG_TASKS_ARE_SYNCHRONIZED_IN_HUMAN_DOCS` | consistency | high | Tareas AI3-* canónicas aparecen en tablas humanas. |
| `AI_BEHAVIOR_FIXTURES_DECLARED` | documentation | medium | Fixtures de comportamiento IA declaran casos mínimos de rechazo, aprobación, evidencia, gates y secretos. |
| `AI_BEHAVIOR_FIXTURES_INCLUDE_PROMPT_INJECTION` | semantic | high | Fixtures IA cubren prompt injection, falsa aprobación y manipulación de evidencia. |
| `AI_CONTEXT_TRUST_POLICY_DECLARED` | semantic | critical | La política de confianza de contexto IA existe en documentación humana y machine-readable. |
| `AI_CONTEXT_TRUST_POLICY_GUARDRAIL_LINKED` | documentation | high | Los guardrails IA enlazan AI_CONTEXT_TRUST_POLICY y regla de contenido no confiable. |
| `AI_CONTEXT_TRUST_POLICY_MACHINE_READABLE` | semantic | high | La política de confianza de contexto IA tiene JSON canónico y schema declarado. |
| `AI_DEVELOPMENT_MODE_GATE_DECLARED` | semantic | high | development_mode y gate ADR-026 para cambios IA protegidos quedan declarados. |
| `AI_DOCTOR_ASSISTED_MODE_IS_READONLY` | semantic | high | Doctor asistido por IA es readonly. |
| `AI_DRAFTS_DO_NOT_MUTATE_TARGET_FILES` | semantic | critical | AI_WRITE_DRAFT no modifica archivos reales. |
| `AI_DRAFTS_REQUIRE_APPROVAL_RECORD` | semantic | critical | AIDraft exige ApprovalRecord y AIActionLog físico. |
| `AI_DRAFT_EXEMPTION_IS_MACHINE_READABLE` | semantic | high | La exención de AIDraft no aplicado es machine-readable. |
| `AI_DRAFT_STATUS_APPLIED_IS_HUMAN_ONLY` | semantic | critical | El estado aplicado de AIDraft es humano-only. |
| `AI_GUARDRAILS_DECLARED` | semantic | critical | Guardrails IA declarados. |
| `AI_LEVELS_CANONICAL` | semantic | medium | Texto canónico AI-0/AI-4 presente. |
| `AI_MUTABLE_ACTIONS_REQUIRE_HUMAN_APPROVAL` | semantic | critical | Acciones IA mutables requieren aprobación humana. |
| `AI_MUTABLE_AI_ACTIONS_HAVE_RUNBOOK` | documentation | high | Acciones IA permitidas tienen runbook operativo. |
| `AI_PERMISSION_LEVELS_ARE_COHERENT` | semantic | critical | Roles IA, permisos y aprobación coherentes. |
| `AI_PROTECTED_CHANGE_RISK_IS_NOT_BASE_MITIGATED_ONLY` | semantic | high | Cambios IA protegidos no quedan cubiertos solo por backup/registro operativo. |
| `AI_PROTECTED_FILE_APPLICATION_REQUIRES_ADR_026` | semantic | critical | Aplicar cambios IA sobre archivos protegidos exige ADR-026/Git local mínimo. |
| `AI_PROTECTED_WRITE_GATE_IS_EXPLICITLY_MACHINE_READABLE` | semantic | critical | El gate de escritura IA protegida está explícito en ai_approval_policy. |
| `AI_ROLE_PHASE_MATCHES_ROUTE_IMPLEMENTATION_STATUS` | semantic | critical | Ninguna ruta activa usa roles future salvo rutas future_prepared no asignables. |
| `AI_RUNBOOKS_FORBID_SENSITIVE_ACTIONS_WITHOUT_APPROVAL` | semantic | critical | Runbooks IA mutables o sensibles exigen ApprovalRecord o son humano-only y declaran acciones prohibidas. |
| `AI_RUNBOOKS_HAVE_RUNTIME_TESTS` | semantic | high | Cada runbook IA referencia cobertura de runtime tests compatible con sus acciones. |
| `AI_RUNBOOKS_REFERENCE_EXISTING_ACTIONS` | semantic | high | Cada runbook IA referencia action_contract_ids y permisos existentes. |
| `AI_RUNBOOKS_SCHEMA_VALID` | semantic | high | machine/ai_runbooks.json valida contra machine/schemas/ai-runbook.schema.json. |
| `AI_WRITE_DRAFT_WRITES_AIDRAFT` | semantic | critical | AI_WRITE_DRAFT escribe AIDraft y AIActionLog. |
| `ALL_CANONICAL_MACHINE_FILES_HAVE_SCHEMA` | semantic | high | Archivos canónicos machine tienen schema. |
| `ALL_DERIVED_MATRICES_HAVE_SCHEMA` | semantic | medium | Matrices derivadas tienen schema. |
| `ANALYTICS_RELATED_DOMAIN_EVENTS_EXIST` | semantic | high | Toda señal analítica relacionada con evento de dominio referencia un evento canónico existente. |
| `APPEND_ONLY_TABLES_DO_NOT_DECLARE_DESTRUCTIVE_DELETE` | semantic | high | Tablas append-only no declaran borrado destructivo. |
| `APPROVAL_ACTIONS_HAVE_NEGATIVE_TESTS` | semantic | critical | Toda acción que requiere ApprovalRecord declara pruebas negativas para aprobación ausente, caducada, consumida, actor incorrecto y scope_hash inválido. |
| `APPROVAL_ACTIONS_REQUIRE_IDEMPOTENCY_KEY` | semantic | high | Las acciones con aprobación exigen idempotency_key. |
| `APPROVAL_ID_UNIQUE_IF_PRESENT` | semantic | high | approval_id no puede reutilizarse entre acciones IA. |
| `APPROVAL_RECORD_APPROVED_BY_LIFECYCLE_NULLABILITY` | semantic | critical | approval_records.approved_by es nullable físicamente y obligatorio solo por lifecycle aprobado/consumido. |
| `APPROVAL_RECORD_CONSUMPTION_FIELDS_CONDITIONAL` | semantic | high | consumed_at y consumed_by_action_id son nullable físicamente y obligatorios solo cuando status=consumed. |
| `APPROVAL_RECORD_EXPIRES_AT_REQUIRED` | semantic | critical | approval_records.expires_at es obligatorio físicamente para impedir aprobaciones sin caducidad. |
| `APPROVAL_RECORD_PRECEDES_AI_ACTION_LOG` | semantic | critical | ApprovalRecord se migra antes que AIActionLog. |
| `APPROVAL_RECORD_STATUS_CONDITIONAL_FIELDS_DEFINED` | semantic | critical | ApprovalRecord declara matriz de campos condicionales por estado. |
| `APPROVAL_SEMANTICS_ARE_CONTEXT_SPECIFIC` | semantic | high | La semántica de aprobación está separada por contexto. |
| `APPROVAL_SERVICE_RUNTIME_DECLARED` | semantic | critical | ApprovalService está declarado como servicio runtime transversal de core.audit. |
| `NON_CANONICAL_DOCS_ARE_NOT_AI_INGESTION_SOURCES` | documentation | high | La documentación histórica, archivada o no canónica no aparece como fuente machine-readable/IA vigente. |
| `AUTHENTICATED_USER_CONTEXT_ONBOARDING_CONTRACTS_MATCH_DDL` | semantic | critical | UserContext y OnboardingSession requieren usuario autenticado/provisionado: user_id NOT NULL en contratos, matriz física, DDL y DCE. |
| `AUTHORITATIVE_DOCS_HAVE_CANONICAL_SECTIONS` | semantic | high | Documentos canónicos con secciones mínimas. |
| `AUTH_ATTEMPT_THROTTLING_DECLARED` | semantic | high | AuthAttempt y throttling de login están declarados. |
| `BACKLOG_AFTER_SPRINT0_ACTIONABLE` | semantic | high | Backlog posterior a Sprint 0 accionable. |
| `BACKLOG_AI_TASKS_DECLARE_AI_LIMITS` | semantic | medium | Tareas IA declaran límites operativos. |
| `BACKLOG_DEPENDENCIES_USE_HARDENED_TASKS` | consistency | high | Las dependencias posteriores usan la tarea endurecida cuando existe. |
| `BACKLOG_DERIVED_TASKS_DECLARE_RELATIONSHIPS` | semantic | high | Las tareas base/endurecidas declaran parent_task_id, supersedes y superseded_by. |
| `BACKLOG_ITEMS_HAVE_EXECUTION_CONTRACT` | semantic | medium | Backlog posterior a Sprint 0 accionable con contrato operativo. |
| `BACKLOG_ITEMS_MATCH_SCHEMA` | semantic | medium | Backlog cumple schema mínimo. |
| `BACKLOG_MARKDOWN_IDS_EXIST_IN_MACHINE` | consistency | high | IDs del backlog Markdown existen en backlog machine. |
| `BASELINE_METRICS_DECLARE_DECISION_POLICY` | semantic | medium | Métricas baseline declaran política de decisión. |
| `CHECKSUM_CANONICAL_CONTRACT_DECLARED` | documentation | medium | Contrato SHA-256 lowercase para evidencias, migraciones y artifacts técnicos está declarado en docs humanas. |
| `CLIENT_REQUESTS_DO_NOT_ACCEPT_ACTOR_ID` | semantic | critical | Los requests de cliente no aceptan actor_id. |
| `COLUMN_CONTRACTS_EXIST` | structure | critical | Existe machine/column_contracts.json. |
| `COLUMN_CONTRACTS_HAVE_NO_DUPLICATE_INDEX_NAMES` | semantic | critical | No existen índices duplicados por tabla en column_contracts. |
| `COLUMN_CONTRACTS_HAVE_NO_DUPLICATE_TABLE_CONSTRAINTS` | semantic | high | No existen constraints duplicadas por tabla en column_contracts. |
| `COLUMN_EXPOSURE_FLAGS_ARE_DECLARED` | semantic | high | Todas las columnas declaran flags de exposición granular. |
| `COLUMN_INDEXES_REFERENCE_EXISTING_COLUMNS` | semantic | critical | Ningún índice de column_contracts referencia columnas inexistentes. |
| `COLUMN_TYPES_ARE_DECLARED` | semantic | critical | Toda columna tiene tipo lógico y tipo SQL WAMP. |
| `CONTROLLED_PROVISIONING_ACTION_DEFINED` | semantic | critical | USER_PROVISION_CONTROLLED existe como acción owner-only con ApprovalRecord, ruta, schemas y evento user.registered. |
| `CORE_FEATURES_DO_NOT_INCLUDE_NON_CORE_MODULES` | semantic | medium | Core features no mezcla módulos UX/P1 no core. |
| `CORE_MODULES_ARE_NOT_PREMIUM_CANDIDATES` | semantic | high | Los módulos core no son candidatos premium. |
| `CORE_RUNTIME_SKELETON_DECLARED` | documentation | high | El skeleton PHP/WAMP mínimo de Core Runtime está documentado con flujo ActionExecutor y vertical slices. |
| `CORE_VALIDATION_METRICS_DECLARE_DECISION_POLICY` | semantic | high | Métricas centrales declaran ventana, muestra, éxito, alerta, fallo, decisión, owner y cadencia. |
| `CRITICAL_ACTIONS_HAVE_AUDIT_AND_PERMISSION_TESTS` | semantic | high | Toda acción crítica tiene cobertura runtime de permisos, roles y audit log cuando el contrato lo requiere. |
| `CRITICAL_DECISIONS_DO_NOT_REFERENCE_PROJECT_STATE_AS_CURRENT` | documentation | medium | critical_decisions usa CURRENT_STATUS.md y no PROJECT_STATE como fuente vigente. |
| `CRITICAL_MACHINE_FILES_HAVE_SCHEMAS` | structure | high | Schemas críticos presentes. |
| `CRITICAL_TEMPLATES_HAVE_OPERATIONAL_CONTRACT_SECTIONS` | documentation | medium | Plantillas críticas tienen secciones operativas homogéneas. |
| `CURRENT_STATUS_DECLARES_CANONICAL_BASELINE_AND_READINESS` | documentation | medium | CURRENT_STATUS.md declara baseline documental canónica y estado operativo READY_FOR_SPRINT_0. |
| `DATABASE_MANIFEST_CHECKSUMS_VALID` | semantic | critical | database/manifest.json conserva checksums SHA-256 válidos para los artefactos SQL referenciados. |
| `DB_ON_DELETE_MATCHES_DDL` | semantic | high | db_on_delete coincide con ON DELETE declarado en las migraciones SQL físicas. |
| `DECISION_ADR_COVERAGE_COMPLETE` | consistency | high | Decisiones fundacionales tienen cobertura ADR/decision_id. |
| `DELETE_POLICY_FIELDS_ARE_SEPARATED` | semantic | high | db_on_delete y application_delete_policy están separados y delete_behavior no se usa como campo ambiguo. |
| `DERIVED_ALIAS_MATCHES_CANONICAL_SOURCE` | semantic | medium | Los aliases catalog_* coinciden con su fuente canónica. |
| `DESIGN_TOKENS_DECLARED` | structure | medium | Design tokens declarados. |
| `DESIGN_TOKENS_SCHEMA_VALID` | semantic | medium | Design tokens cumplen schema. |
| `DOCTOR_CATALOG_COVERS_ALL_EMITTED_CHECKS` | consistency | high | machine/doctor_checks.json cubre todos los checks emitidos por el validador documental actual scripts/update_script.py. |
| `DOCTOR_CHECK_CATALOG_COVERS_EMITTED_CHECKS` | consistency | high | Los checks que emite scripts/update_script.py están catalogados en machine/doctor_checks.json. |
| `DOCTOR_CHECK_DESCRIPTIONS_USE_CANONICAL_BASELINE_LANGUAGE` | documentation | low | Las descripciones de checks usan lenguaje de baseline canónica y evitan terminología retirada. |
| `UPDATE_SCRIPT_EMITTED_CHECKS_ARE_CATALOGED` | consistency | high | Los checks emitidos por scripts/update_script.py existen en el catálogo machine/doctor_checks.json. |
| `DOCTOR_EVIDENCE_PERMISSION_SEPARATED` | semantic | critical | Doctor readonly, evidence.write y validate separados. |
| `DOCTOR_PANEL_ROUTE_IS_VIEW_ONLY` | semantic | high | GET /admin/doctor es vista de panel, no ejecución Doctor. |
| `DOCTOR_READONLY_DOES_NOT_WRITE_EVIDENCE` | semantic | critical | Doctor readonly no escribe ficheros ni evidencia. |
| `DOCTOR_READONLY_TASK_DOES_NOT_WRITE_EVIDENCE` | semantic | critical | S0-011 no escribe evidencia. |
| `DOCTOR_RUN_ONLY_ALLOWED_ON_POST_ROUTE` | semantic | critical | La ejecución Doctor readonly solo puede declararse en POST /admin/doctor/run-readonly. |
| `UPDATE_SCRIPT_BASELINE_IS_CANONICAL` | documentation | low | El validador documental actual declara documentation_baseline 1.2 como baseline canónica. |
| `DOCTOR_STATUS_VALIDATE_HUMAN_ONLY` | semantic | critical | doctor.status.validate no está permitido para IA. |
| `DOCTOR_STATUS_VALIDATE_REMAINS_HUMAN_ONLY` | semantic | critical | La validación de estado Doctor sigue siendo solo humana. |
| `DOCUMENT_MATURITY_MODEL_DEFINES_AUTHORITY_STATUSES` | documentation | medium | Modelo de madurez define estados de autoridad documental canónica, futura y no canónica. |
| `DOMAIN_CONSTRAINTS_CRITICAL_RULES_HAVE_ENFORCEMENT` | semantic | high | Toda constraint crítica tiene enforcement fuerte en DB o aplicación además de Doctor. |
| `DOMAIN_CONSTRAINTS_ENFORCEMENT_MATRIX_EXISTS` | semantic | high | Existe matriz de enforcement DB/aplicación/Doctor para constraints de dominio. |
| `ENTITIES_HAVE_RELATIONSHIPS` | semantic | critical | Entidades críticas tienen relaciones. |
| `ENTITIES_MARKDOWN_FULLY_MATCH_MACHINE` | consistency | medium | Todas las entidades machine-readable están reflejadas en Markdown. |
| `ENTITIES_MARKDOWN_MATCH_MACHINE` | consistency | high | Entidades bloqueantes están reflejadas en Markdown. |
| `ENTITY_FIELDS_HAVE_COLUMN_CONTRACTS` | semantic | critical | Todo fields_minimum de entidades está cubierto por column contracts. |
| `ENUM_CONSTRAINED_COLUMNS_ARE_NOT_JSON` | semantic | medium | Columnas con dominio enum no están tipadas como JSON. |
| `EVENTS_DECLARE_PAYLOAD_SCHEMA_REF` | semantic | critical | Eventos declaran payload_schema_ref. |
| `EVENTS_MARKDOWN_MATCH_MACHINE` | consistency | high | Eventos bloqueantes están reflejados en Markdown. |
| `EVENTS_USED_BY_ACTIONS_EXIST_AND_HAVE_SCHEMAS` | semantic | high | Eventos emitidos por acciones existen y tienen schema. |
| `EVENT_ALIASES_NOT_USED_AS_CANON` | consistency | high | Sin alias deprecados usados como canónicos. |
| `EVENT_CONSUMERS_MATCH_MODULE_DECLARATIONS` | consistency | high | Todo consumer canónico aparece en events_consumed del módulo. |
| `EVENT_CONSUMERS_REFERENCE_EXISTING_MODULES` | consistency | high | Todo consumidor de evento referencia un módulo existente. |
| `EVENT_PAYLOAD_SCHEMAS_ARE_VALID_JSON_SCHEMA` | semantic | critical | Schemas de payload de eventos son JSON Schema válidos. |
| `EVENT_PAYLOAD_SCHEMAS_MATCH_EVENT_VERSION` | semantic | medium | Schemas de payload coinciden con versión del evento. |
| `EVENT_PAYLOAD_SCHEMA_FILES_EXIST` | structure | critical | Schemas de payload de eventos existen. |
| `EVENT_PRODUCERS_AND_CONSUMERS_DECLARE_EVENT_BUS_CONTRACT` | semantic | high | Todo módulo productor o consumidor de eventos declara core.events como dependencia dura o contrato dependency_contracts.kind=event_bus. |
| `EVENT_PRODUCERS_REFERENCE_EXISTING_MODULES` | consistency | critical | Todo productor de evento referencia un módulo existente. |
| `EVIDENCE_DATED_HASH_MATCHES_MANIFEST` | semantic | high | El hash del reporte fechado coincide con el manifest. |
| `EVIDENCE_EXCLUDES_OR_REDACTS_SENSITIVE_COLUMNS` | semantic | high | Evidencias excluyen o redactan columnas sensibles. |
| `EVIDENCE_FILENAME_IS_CANONICAL_LOCAL_EXECUTION` | documentation | medium | La evidencia local usa la ruta canónica evidence/sprint-0-local-execution.md, independiente de identificadores históricos. |
| `EVIDENCE_LOCAL_EXECUTION_FILE_INTEGRITY_DECLARED` | semantic | high | El registro evidence/sprint-0-local-execution.md declara integridad SHA-256 verificable para la evidencia local real de Sprint 0. |
| `EVIDENCE_MANIFEST_EXISTS` | structure | high | Existe evidence/sprint-0-local-execution.md. |
| `EVIDENCE_MANIFEST_SCHEMA_VALID` | semantic | high | El manifest de evidencias cumple schema. |
| `EVIDENCE_MANIFEST_USES_CANONICAL_SHA256` | semantic | high | El manifest usa SHA-256 lowercase canónico. |
| `EVIDENCE_RECORDED_EVENT_INCLUDES_CHECKSUM` | semantic | medium | El evento evidence.recorded incluye checksum e integrity_manifest_ref. |
| `EVIDENCE_SCHEMA_REFERENCES_INTEGRITY_MANIFEST` | semantic | medium | El schema de evidencia y sprint-0-local-execution.md referencian evidence/sprint-0-local-execution.md. |
| `EVIDENCE_WRITE_CHECKSUM_IS_CANONICAL` | semantic | high | EVIDENCE_WRITE exige checksum SHA-256 lowercase y checksum_algorithm=sha256. |
| `EVIDENCE_WRITE_ONLY_USES_CANONICAL_PATHS` | semantic | critical | La escritura de evidencia usa solo sprint-0-local-execution.md y doctor-validation-canonica.json. |
| `EVIDENCE_WRITE_RESPONSE_INCLUDES_CHECKSUM` | semantic | medium | La respuesta de EVIDENCE_WRITE devuelve checksum e integrity_manifest_ref. |
| `EVIDENCE_WRITE_TASK_IS_SEPARATE_FROM_DOCTOR_RUN` | semantic | critical | S0-012 concentra escritura de evidencia. |
| `EXISTS_README.md` | structure | critical | README.md |
| `EXISTS_docs` | structure | critical | docs |
| `EXISTS_evidence` | structure | critical | evidence |
| `EXISTS_evidence_manifest.json` | structure | critical | Existe evidence/sprint-0-local-execution.md. |
| `EXISTS_machine` | structure | critical | machine |
| `EXISTS_machine_action_contracts.json` | structure | critical | machine/action_contracts.json |
| `EXISTS_machine_ai_approval_policy.json` | structure | critical | machine/ai_approval_policy.json |
| `EXISTS_machine_ai_behavior_fixtures.json` | structure | critical | Existe machine/ai_behavior_fixtures.json. |
| `EXISTS_machine_ai_context_trust_policy.json` | structure | critical | Existe machine/ai_context_trust_policy.json. |
| `EXISTS_machine_ai_runbooks.json` | structure | critical | machine/ai_runbooks.json existe como catálogo machine-readable de runbooks IA. |
| `EXISTS_machine_analytics_events.json` | structure | critical | machine/analytics_events.json existe. |
| `EXISTS_machine_backlog_items.json` | structure | critical | machine/backlog_items.json |
| `EXISTS_machine_column_contracts.json` | structure | critical | Existe archivo o carpeta requerida: machine/column_contracts.json. |
| `EXISTS_machine_design_tokens.json` | structure | critical | Existe archivo o carpeta requerida: machine/design_tokens.json. |
| `EXISTS_machine_domain_constraints_enforcement_matrix.json` | structure | critical | Existe archivo requerido: machine/domain_constraints_enforcement_matrix.json. |
| `EXISTS_machine_features.json` | structure | critical | machine/features.json |
| `EXISTS_machine_gamification_rules.json` | structure | critical | machine/gamification_rules.json |
| `EXISTS_machine_journeys.json` | structure | critical | machine/journeys.json |
| `EXISTS_machine_machine_manifest.json` | structure | critical | Existe archivo o carpeta requerida: machine/machine_manifest.json. |
| `EXISTS_machine_metrics.json` | structure | critical | machine/metrics.json |
| `EXISTS_machine_migration_contracts.json` | structure | critical | Existe archivo requerido: machine/migration_contracts.json. |
| `EXISTS_machine_mvp_coverage_matrix.json` | structure | critical | machine/mvp_coverage_matrix.json |
| `EXISTS_machine_mvp_qualitative_validation.json` | structure | critical | Existe machine/mvp_qualitative_validation.json. |
| `EXISTS_machine_physical_constraints_matrix.json` | structure | critical | machine/physical_constraints_matrix.json |
| `EXISTS_machine_product_mvp.json` | structure | critical | machine/product_mvp.json |
| `EXISTS_machine_proposed_decisions.json` | structure | critical | Existe machine/proposed_decisions.json. |
| `EXISTS_machine_relationships.json` | structure | critical | machine/relationships.json |
| `EXISTS_machine_roadmap_gates.json` | structure | critical | machine/roadmap_gates.json |
| `EXISTS_machine_roles.json` | structure | critical | machine/roles.json |
| `EXISTS_machine_route_permission_matrix.json` | structure | critical | machine/route_permission_matrix.json |
| `EXISTS_machine_runtime_test_matrix.json` | structure | critical | Existe machine/runtime_test_matrix.json. |
| `EXISTS_machine_schema_registry.json` | structure | critical | Existe machine/schema_registry.json. |
| `EXISTS_machine_schemas_action-contract.schema.json` | structure | critical | machine/schemas/action-contract.schema.json |
| `EXISTS_machine_schemas_ai-approval-policy.schema.json` | structure | critical | machine/schemas/ai-approval-policy.schema.json |
| `EXISTS_machine_schemas_ai-behavior-fixture.schema.json` | structure | critical | Existe schema de fixtures IA. |
| `EXISTS_machine_schemas_ai-context-trust-policy.schema.json` | structure | critical | Existe schema de AI context trust policy. |
| `EXISTS_machine_schemas_ai-runbook.schema.json` | structure | critical | machine/schemas/ai-runbook.schema.json existe para validar runbooks IA. |
| `EXISTS_machine_schemas_analytics-event.schema.json` | structure | critical | machine/schemas/analytics-event.schema.json existe. |
| `EXISTS_machine_schemas_api-error.schema.json` | structure | critical | Existe archivo o carpeta requerida: machine/schemas/api-error.schema.json. |
| `EXISTS_machine_schemas_api-response.schema.json` | structure | critical | Existe archivo o carpeta requerida: machine/schemas/api-response.schema.json. |
| `EXISTS_machine_schemas_approval-record.schema.json` | structure | critical | machine/schemas/approval-record.schema.json |
| `EXISTS_machine_schemas_backlog-item.schema.json` | structure | critical | machine/schemas/backlog-item.schema.json |
| `EXISTS_machine_schemas_column-contract.schema.json` | structure | critical | Existe archivo o carpeta requerida: machine/schemas/column-contract.schema.json. |
| `EXISTS_machine_schemas_design-token.schema.json` | structure | critical | Existe archivo o carpeta requerida: machine/schemas/design-token.schema.json. |
| `EXISTS_machine_schemas_domain-constraints-enforcement-matrix.schema.json` | structure | critical | Existe schema requerido: machine/schemas/domain-constraints-enforcement-matrix.schema.json. |
| `EXISTS_machine_schemas_domain-event-envelope.schema.json` | structure | critical | Existe archivo o carpeta requerida: machine/schemas/domain-event-envelope.schema.json. |
| `EXISTS_machine_schemas_evidence-manifest.schema.json` | structure | critical | Existe schema de manifest de evidencias. |
| `EXISTS_machine_schemas_gamification-rules.schema.json` | structure | critical | Existe archivo o carpeta requerida: machine/schemas/gamification-rules.schema.json. |
| `EXISTS_machine_schemas_machine-manifest.schema.json` | structure | critical | Existe archivo o carpeta requerida: machine/schemas/machine-manifest.schema.json. |
| `EXISTS_machine_schemas_migration-contract.schema.json` | structure | critical | Existe schema requerido: machine/schemas/migration-contract.schema.json. |
| `EXISTS_machine_schemas_module.schema.json` | structure | critical | machine/schemas/module.schema.json |
| `EXISTS_machine_schemas_mvp-coverage-matrix.schema.json` | structure | critical | machine/schemas/mvp-coverage-matrix.schema.json |
| `EXISTS_machine_schemas_mvp-qualitative-validation.schema.json` | structure | critical | Existe schema de validación cualitativa MVP. |
| `EXISTS_machine_schemas_proposed-decision.schema.json` | structure | critical | Existe schema de proposed_decisions. |
| `EXISTS_machine_schemas_risk-register.schema.json` | structure | critical | machine/schemas/risk-register.schema.json |
| `EXISTS_machine_schemas_risk.schema.json` | structure | critical | machine/schemas/risk.schema.json |
| `EXISTS_machine_schemas_roadmap-gate.schema.json` | structure | critical | machine/schemas/roadmap-gate.schema.json |
| `EXISTS_machine_schemas_role.schema.json` | structure | critical | machine/schemas/role.schema.json |
| `EXISTS_machine_schemas_runtime-test-matrix.schema.json` | structure | critical | Existe machine/schemas/runtime-test-matrix.schema.json. |
| `EXISTS_machine_schemas_schema-registry.schema.json` | structure | critical | Existe machine/schemas/schema-registry.schema.json. |
| `EXISTS_machine_schemas_screen-component-contract.schema.json` | structure | critical | Existe schema de contratos de pantalla. |
| `EXISTS_machine_schemas_screen-responsive-behavior.schema.json` | structure | critical | Existe archivo o carpeta requerida: machine/schemas/screen-responsive-behavior.schema.json. |
| `EXISTS_machine_schemas_sprint0-task.schema.json` | structure | critical | machine/schemas/sprint0-task.schema.json |
| `EXISTS_machine_schemas_subweb-contract.schema.json` | structure | critical | Existe archivo o carpeta requerida: machine/schemas/subweb-contract.schema.json. |
| `EXISTS_machine_schemas_traceability.schema.json` | structure | critical | machine/schemas/traceability.schema.json |
| `EXISTS_machine_schemas_ui-state-copy.schema.json` | structure | critical | machine/schemas/ui-state-copy.schema.json |
| `EXISTS_machine_screen_component_contracts.json` | structure | critical | Existe machine/screen_component_contracts.json. |
| `EXISTS_machine_screen_responsive_behavior.json` | structure | critical | Existe archivo o carpeta requerida: machine/screen_responsive_behavior.json. |
| `EXISTS_machine_subweb_contracts.json` | structure | critical | Existe archivo o carpeta requerida: machine/subweb_contracts.json. |
| `EXISTS_machine_ui_state_copy.json` | structure | critical | machine/ui_state_copy.json |
| `EXISTS_templates` | structure | critical | templates |
| `EXISTS_templates_subweb-contract.json` | structure | critical | templates/subweb-contract.json |
| `FEATURES_DECLARE_COMMERCIAL_CLASSIFICATION` | semantic | medium | Features declaran clasificación comercial futura no operativa. |
| `FEATURES_MARKDOWN_MATCH_MACHINE` | consistency | high | La clasificación Markdown cubre todas las features machine-readable. |
| `FEATURES_REFERENCE_EXISTING_MODULES` | semantic | medium | Features referencian módulos existentes. |
| `FEATURE_CLASSIFICATION_COVERS_ALL_MACHINE_FEATURES` | consistency | high | docs/02-product/05-feature-classification.md cubre todas las features. |
| `FILE_PATH_CANONICALIZATION_DECLARED` | semantic | high | Paths derivados de input se canonicalizan y validan contra directorios permitidos. |
| `FIRST_EXTENSION_REQUIRES_PLANNED_OR_STUB_CONTRACT` | semantic | high | Primera subweb o integración real exige contrato planned/stub previo. |
| `FIRST_SUBWEB_CANNOT_START_AS_ACTIVE` | semantic | medium | La primera subweb real no puede incorporarse directamente como active; debe pasar por planned o stub. |
| `FIRST_VIEW_EVENTS_DECLARE_IDEMPOTENCY` | semantic | high | Los eventos first_view persistentes declaran idempotencia en catálogo y action contract. |
| `FK_COLUMNS_MATCH_PHYSICAL_CONSTRAINTS` | semantic | critical | Las FK físicas están cubiertas por contratos de columnas. |
| `FK_NULLABILITY_MATCHES_PHYSICAL_CONSTRAINTS` | semantic | critical | La nullability de FKs coincide entre column_contracts y physical_constraints_matrix. |
| `FOCUS_TOKEN_DECLARED` | semantic | medium | Token de foco declarado. |
| `GAMIFICATION_COOLDOWNS_HAVE_PERSISTENT_STATE` | semantic | high | Los cooldowns tienen entidad persistente GamificationRuleState. |
| `GAMIFICATION_EVENTS_DOC_MATCHES_PROCESSING_CONTRACT` | consistency | medium | Documento humano de eventos de gamificación refleja processing_contract y UserAchievement. |
| `GAMIFICATION_EVENT_SOURCES_CONSUMED_BY_GAMIFICATION` | semantic | high | Todo evento usado por gamificación declara consumidor gamification. |
| `GAMIFICATION_EVENT_SOURCES_EXIST` | semantic | high | Todo evento usado por gamificación existe. |
| `GAMIFICATION_EVENT_USER_CONTEXT_MATCHES_PAYLOAD_SCHEMA` | semantic | high | Las fuentes de user context de gamificación existen en los payload schemas de eventos. |
| `GAMIFICATION_FIRST_MODULE_CHALLENGE_USES_MODULE_USED` | consistency | medium | El reto de primer módulo usa module.used y no task.completed. |
| `GAMIFICATION_FIRST_MODULE_REQUIRES_MODULE_USED` | semantic | high | El logro first_module_used depende de module.used y no de activación administrativa. |
| `GAMIFICATION_MARKDOWN_LISTS_MODULE_USED` | documentation | medium | Documentos humanos de progresión y eventos listan module.used. |
| `GAMIFICATION_NO_STRING_LOGIC_CONDITIONS` | semantic | medium | Las condiciones de logros son estructuras machine-readable, no strings con lógica. |
| `GAMIFICATION_PERSISTENT_USER_ID_NOT_NULL` | semantic | critical | Gamificación persistente MVP exige user_id NOT NULL en contratos, DDL y documentación. |
| `GAMIFICATION_PROCESSING_CONSUMES_ACHIEVEMENT_EVENTS` | semantic | medium | El handler de gamificación consume todos los eventos usados por logros. |
| `GAMIFICATION_RULES_DECLARE_ELIGIBILITY_PREDICATES` | semantic | high | Las reglas de gamificación declaran predicados de elegibilidad machine-readable. |
| `GAMIFICATION_RULES_HAVE_EVENT_SOURCES` | semantic | medium | Gamificación deriva de eventos reales. |
| `GAMIFICATION_RULES_MATCH_SCHEMA` | semantic | high | Reglas de gamificación cumplen schema estructurado. |
| `GAMIFICATION_RULES_WRITE_ONLY_GAMIFICATION_ENTITIES` | semantic | high | El contrato de procesamiento de gamificación solo escribe entidades owned por gamification. |
| `GAMIFICATION_RULE_EVENTS_ARE_DOMAIN_EVENTS` | semantic | high | La gamificación consume eventos de dominio canónicos, no señales UI no persistentes. |
| `GAMIFICATION_RUNTIME_WRITES_REQUIRED_ENTITIES` | semantic | high | El runtime de gamificación escribe ProgressRecord, UserAchievement y GamificationRuleState, no el catálogo Achievement. |
| `GAMIFICATION_USER_CONTEXT_REQUIRED_FOR_POINTS` | semantic | high | Toda regla con puntos exige contexto de usuario. |
| `EVIDENCE_COMPLETION_IS_MANUAL_AND_READONLY_VALIDATOR_DECLARED` | documentation | low | La evidencia local real de Sprint 0 se completa manualmente; scripts/update_script.py es readonly y no genera evidencia. |
| `GENERATE_EVIDENCE_OUTPUT_MATCHES_EVIDENCE_README` | documentation | high | La ruta canónica de evidencia local es evidence/sprint-0-local-execution.md y se actualiza manualmente con datos reales. |
| `GENERATE_EVIDENCE_VALIDATES_DOCTOR_CATALOG_IDS` | semantic | high | La validación de catálogo Doctor queda separada de la escritura de evidencia; scripts/update_script.py solo valida. |
| `EVIDENCE_LOCAL_EXECUTION_UPDATE_IS_MANUAL_TASK` | semantic | high | La actualización de evidence/sprint-0-local-execution.md pertenece a tareas manuales de Sprint 0 y no a scripts de generación automática. |
| `GET_ROUTES_DECLARE_UI_CONTRACT` | semantic | high | Toda ruta GET activa declara route_kind y contrato UI o exención. |
| `GET_ROUTES_DO_NOT_DECLARE_OPERATIONAL_ACTION_TYPES` | semantic | high | Ninguna ruta GET declara action_type operacional. |
| `GET_ROUTES_DO_NOT_DECLARE_STATEFUL_TRACKING` | semantic | critical | Las rutas GET no son el contrato de mutación para tracking persistente. |
| `HIGH_RISK_PERMISSION_GRANTS_REQUIRE_APPROVAL` | semantic | medium | Permisos de alto riesgo declaran aprobación de concesión. |
| `HTML_OUTPUT_ESCAPING_DECLARED` | semantic | critical | La salida HTML usa helper de escaping por defecto y HTML raw queda restringido. |
| `HUMAN_BACKLOG_MATCHES_MACHINE_BACKLOG_FOR_P0` | consistency | high | El backlog humano contiene todas las tareas P0 declaradas en machine/backlog_items.json. |
| `HUMAN_FEATURE_DEPENDENCIES_MATCH_MACHINE_BACKLOG` | consistency | high | Dependencias funcionales humanas sincronizadas con machine/backlog_items.json. |
| `INITIAL_VALIDATION_SEGMENT_DECLARED` | semantic | medium | Producto y negocio declaran ICP inicial, anti-ICP, política de usuario provisionado y señal de éxito MVP. |
| `INTEGRATION_CONTRACTS_FORBID_REAL_SECRET_VALUES` | security | critical | Los contratos de integración prohíben valores reales de secretos. |
| `INTEGRATION_CONTRACTS_MATCH_SCHEMA` | semantic | high | integration_contracts.json valida contra integration-contract.schema.json. |
| `INTEGRATION_CONTRACT_SCHEMA_EXISTS` | structure | high | Existe schema, catálogo y plantilla para contratos de integración real. |
| `INTEGRATION_SCHEMA_REJECTS_ACTIVE_WITHOUT_SANDBOX_EVIDENCE` | semantic | high | Schema rechaza integración active sin scopes, permisos o evidencia sandbox. |
| `INTEGRATION_TEMPLATE_VALIDATES_AGAINST_SCHEMA` | semantic | medium | La plantilla de integración valida contra el schema canónico. |
| `INTERNAL_MODULES_ARE_NOT_USER_PLAN_FEATURES` | semantic | medium | Módulos internos no se exponen como plan de usuario. |
| `INTERNAL_REFERENCES_EXIST` | structure | critical | Las referencias internas a archivos conservados resuelven dentro del paquete canónico. |
| `JOURNEYS_REFERENCE_EXISTING_MODULES` | semantic | medium | Journeys referencian módulos existentes. |
| `JSON_COLUMNS_DECLARE_VALIDATION` | semantic | high | Las columnas JSON declaran validación de aplicación. |
| `JSON_PARSE` | structure | critical | Todos los JSON conservados parsean correctamente. |
| `JSON_SCHEMA_LIBRARY_AVAILABLE` | structure | critical | La dependencia jsonschema está disponible para validación estricta. |
| `SPRINT0_EVIDENCE_REFERENCES_LOCAL_EXECUTION_RECORD` | documentation | high | La evidencia local real de Sprint 0 se referencia mediante evidence/sprint-0-local-execution.md y reportes derivados explícitos cuando existan. |
| `SPRINT0_EVIDENCE_USES_CANONICAL_PATH` | documentation | low | La evidencia local real de Sprint 0 usa exclusivamente evidence/sprint-0-local-execution.md como ruta canónica. |
| `LEGACY_EXPORTABLE_MATCHES_USER_EXPORTABLE` | semantic | medium | Flag legacy exportable coincide con user_exportable. |
| `LOCAL_BACKUP_DECLARED` | documentation | medium | Backup local declarado. |
| `LOCAL_EXECUTION_RECORD_EXISTS` | structure | high | registro de ejecución local y plantilla de entrada local existen para operar con backups, Git local AI-first y evidencias. |
| `LOCAL_EXECUTION_RECORD_HAS_NO_DUPLICATE_HEADINGS` | documentation | low | registro de ejecución local no tiene encabezados duplicados. |
| `LOGIN_ACTION_REQUIRES_CSRF` | semantic | critical | AUTH_LOGIN_SUBMIT exige csrf_token. |
| `LOGIN_ERRORS_ARE_NON_ENUMERATIVE` | semantic | high | Los errores visibles de login no enumeran existencia de email o contraseña. |
| `LOGIN_SCREEN_REMAINS_AUTH_ONLY` | semantic | medium | Login queda como pantalla funcional de autenticación. |
| `MACHINE_FILES_MATCH_DECLARED_SCHEMAS` | semantic | critical | Archivos machine cumplen sus schemas declarados. |
| `MACHINE_JSON_VALID` | structure | critical | Todos los JSON de machine son válidos. |
| `MACHINE_MANIFEST_AREA_FILES_USE_AREA_OWNER_TYPE` | semantic | high | Catálogos machine-readable de datos, producto, negocio y UX usan owner_type=area y owner_ref semántico. |
| `MACHINE_MANIFEST_CANONICAL_FILES_HAVE_MARKDOWN_DOCS` | documentation | high | Archivos canónicos y matrices derivadas declaran documentos humanos. |
| `MACHINE_MANIFEST_COVERS_MACHINE_JSON` | semantic | high | El manifiesto cubre todos los machine/*.json. |
| `MACHINE_MANIFEST_DERIVED_ALIAS_INHERITS_CANONICAL_DOCS` | documentation | medium | Aliases derivados heredan o declaran docs humanos del canónico. |
| `MACHINE_MANIFEST_EXISTS` | structure | high | Existe machine/machine_manifest.json. |
| `MACHINE_MANIFEST_INCLUDES_SUBWEB_CONTRACT_SCHEMA` | semantic | medium | El manifest referencia subweb_contracts.json y su schema. |
| `MACHINE_MANIFEST_LISTED_JSON_VALIDATE` | semantic | critical | Todos los JSON listados en machine/machine_manifest.json validan contra su schema declarado. |
| `MACHINE_MANIFEST_MARKDOWN_DOCS_EXIST` | documentation | high | Backlinks markdown del manifest existen. |
| `MACHINE_MANIFEST_MATCH_SCHEMA` | semantic | high | El manifiesto machine-readable cumple schema. |
| `MACHINE_MANIFEST_OWNER_METADATA_TYPED` | semantic | medium | machine_manifest declara owner_type y owner_ref tipados para reducir ambigüedad de routing IA. |
| `MACHINE_MANIFEST_REFERENCES_EXIST` | structure | critical | machine/machine_manifest.json no referencia archivos, schemas ni documentos inexistentes. |
| `MACHINE_MANIFEST_REFERENCES_EXISTING_SCHEMAS` | semantic | high | El manifiesto solo referencia schemas existentes. |
| `MACHINE_MANIFEST_SCHEMA_REFS_EXIST` | structure | high | Referencias de schema del manifest existen. |
| `MACHINE_MANIFEST_SCHEMA_VALID` | semantic | critical | machine/machine_manifest.json valida contra machine/schemas/machine-manifest.schema.json. |
| `MACHINE_READABLE_DOCS_DECLARE_REQUIRED_CANONICAL_FILES` | consistency | medium | La documentación machine-readable declara archivos canónicos requeridos. |
| `MACHINE_READABLE_DOCS_MATCH_MANIFEST` | documentation | medium | La documentación machine-readable refleja el manifiesto. |
| `MARKDOWN_NUMERIC_HEADINGS_MATCH_FILENAMES` | documentation | medium | Los headings H1 numerados de documentos activos coinciden con la numeración del archivo. |
| `MEDIUM_RISK_ADMIN_READS_ARE_AUDITED` | semantic | medium | Lecturas admin con permisos de riesgo medio o superior son auditadas. |
| `METRICS_DECLARE_MEASUREMENT_SOURCE` | semantic | medium | Métricas declaran fuentes de medición. |
| `METRICS_WITH_TARGET_MVP_HAVE_REVIEW_CADENCE` | semantic | medium | Toda métrica con objetivo MVP declara owner y cadencia de revisión. |
| `MIGRATION_CONTRACTS_COVER_COLUMN_CONTRACTS` | semantic | critical | Todo migration_ref de column_contracts está cubierto por migration_contracts con rollback. |
| `MIGRATION_CONTRACTS_DECLARE_SHA256` | semantic | high | Todos los contratos de migración declaran checksum_algorithm=sha256 junto con checksum obligatorio. |
| `MIGRATION_CONTRACT_STATUS_DECLARED` | documentation | medium | Docs humanas declaran SQL físicos base presentes, estado generated_not_executed, validación Sprint 0 y manifest SQL. |
| `MIGRATION_ORDER_DECLARED` | semantic | critical | Entidades foundation/mvp tienen orden y campos mínimos. |
| `MIGRATION_ORDER_MATCHES_CANONICAL_SEQUENCE` | semantic | critical | El orden canónico de migración coincide entre relationships y entities. |
| `MIGRATION_ORDER_PHASE_COHERENT` | semantic | high | El orden de migraciones respeta dependencias fundacionales y MVP. |
| `MIGRATION_ORDER_UNIQUE` | semantic | critical | El orden de migraciones de entidades es único. |
| `MIGRATION_REFS_USE_CANONICAL_DATABASE_PATH` | semantic | critical | Todas las referencias de migración usan database/migrations/. |
| `MIGRATION_REFS_USE_SQL_EXTENSION` | semantic | critical | Todas las referencias de migración usan extensión .sql y no .php. |
| `MIGRATION_ROLLBACK_REFS_ARE_SEPARATE_FROM_UP_REFS` | semantic | high | Los rollback_ref de migraciones están separados de los up_ref. |
| `MIGRATION_SQL_FILES_EXIST_FOR_CONTRACTS` | structure | critical | Migraciones y rollbacks SQL existen para todos los contratos de migración. |
| `MODULES_COUNT_IS_15` | consistency | critical | Módulos detectados: 15 |
| `MODULES_DECLARE_ALLOWED_CROSS_MODULE_ACCESS` | semantic | medium | Los módulos declaran accesos cruzados permitidos. |
| `MODULES_DECLARE_COMMERCIAL_CLASSIFICATION` | semantic | medium | Módulos declaran clasificación comercial futura no operativa. |
| `MODULE_DEPENDENCIES_ARE_TYPED_AND_PHASE_VALID` | semantic | high | Dependencias duras y opcionales tipadas y válidas. |
| `MODULE_DEPENDENCY_CONTRACT_SCHEMA_DEFINED` | semantic | high | Schema de módulo exige dependency_contracts tipados. |
| `MODULE_EVENTS_AND_PERMISSIONS_EXIST` | consistency | critical | Permisos/eventos de módulos existen. |
| `MODULE_EVENTS_CONSUMED_MATCH_EVENT_CONSUMERS` | consistency | high | Eventos consumidos por módulos coinciden con consumers. |
| `MODULE_EVENTS_EMITTED_MATCH_EVENT_PRODUCERS` | consistency | critical | Eventos emitidos por módulos coinciden con producer_module. |
| `MODULE_FORBIDDEN_IMPORTS_USE_EXPLICIT_MODE` | semantic | medium | forbidden.direct_imports_from usa modo explícito. |
| `MODULE_MANIFEST_FIELDS_CANONICAL` | semantic | critical | Módulos usan module_type/phase/lifecycle_status y no status ambiguo. |
| `MODULE_OWNED_ENTITIES_MATCH_ENTITY_OWNERS` | semantic | critical | Las entidades owned declaradas por módulo coinciden con owner_module de entities.json. |
| `MODULE_READ_ENTITIES_HAVE_DATA_READ_CONTRACT` | semantic | high | Toda lectura cross-module declarada en data.read_entities tiene contrato dependency_contracts.kind=data_read con owner, campos, permiso, redacción, fallback y evidencia. |
| `MODULE_ROUTES_USE_CANONICAL_PERMISSIONS` | consistency | critical | Rutas usan permisos canónicos y declarados. |
| `MODULE_SCHEMA_DEEP_CONTRACT` | semantic | critical | Schema de módulo valida contrato profundo. |
| `MODULE_SCHEMA_ENFORCES_CONTRACT` | semantic | critical | Schema de módulo exige contrato completo. |
| `MODULE_TEMPLATE_VALIDATES_AGAINST_SCHEMA` | semantic | high | La plantilla de módulo valida contra machine/schemas/module.schema.json. |
| `MODULE_USAGE_METRIC_HAS_USAGE_EVENT` | semantic | medium | La métrica de módulos diferencia uso real mediante module.used. |
| `MODULE_USED_HAS_OPERATIONAL_EMISSION_CONTRACT` | semantic | high | module.used tiene contrato productor operativo en action_contracts. |
| `MUTABLE_ACTIONS_DECLARE_IDEMPOTENCY_POLICY` | semantic | medium | Acciones mutables declaran política de idempotencia. |
| `MUTABLE_ACTIONS_DECLARE_ROLLBACK` | semantic | high | Acciones mutables declaran rollback. |
| `MUTABLE_ADMIN_ROUTES_REQUIRE_OWNER_OR_EXPLICIT_EXCEPTION` | semantic | high | Rutas mutables de riesgo alto/crítico no quedan bajo admin sin owner. |
| `MUTABLE_BROWSER_ACTIONS_REQUIRE_CSRF` | semantic | critical | Toda acción mutable originada en navegador exige csrf_token. |
| `MUTABLE_HIGH_RISK_ACTIONS_REQUIRE_RUNTIME_APPROVAL` | semantic | high | Acciones mutables sensibles requieren aprobación runtime. |
| `MUTABLE_ROUTES_HAVE_ACTION_CONTRACT` | semantic | critical | Toda ruta mutable tiene action contract. |
| `MVP_COVERAGE_CANNOT_BE_COVERED_WITH_EMPTY_SCREEN_IDS` | semantic | high | La cobertura MVP no puede marcarse como covered sin pantalla o exención interna. |
| `MVP_MODULES_HAVE_FULL_COVERAGE` | consistency | high | Módulos MVP con cobertura feature/backlog/pantalla. |
| `MVP_QUALITATIVE_VALIDATION_LINKS_METRICS_AND_JOURNEYS` | semantic | medium | El protocolo cualitativo enlaza métricas y journeys canónicos. |
| `MVP_QUALITATIVE_VALIDATION_PROTOCOL_DECLARED` | documentation | medium | Existe protocolo cualitativo MVP para owner/equipo pequeño. |
| `NEGATIVE_SCHEMA_FIXTURES_FAIL` | semantic | critical | Los fixtures inválidos fallan contra sus schemas. |
| `CURRENT_DOCS_REFERENCE_CANONICAL_VALIDATION_OUTPUTS` | documentation | high | La documentación canónica referencia las salidas autorizadas de validación documental. |
| `NO_EVENT_PRODUCER_WRITES_CONSUMER_ENTITY` | semantic | high | Un productor de evento no escribe directamente entidades que corresponden al consumidor del evento. |
| `NO_NON_CANONICAL_EVIDENCE_PATH_EXAMPLES` | documentation | medium | La documentación vigente no recomienda ejemplos de evidencia sin ruta fechada canónica. |
| `NO_RETIRED_PACKAGE_REFERENCES` | documentation | critical | El corpus canónico no contiene nomenclatura retirada ni referencias a entregas no canónicas. |
| `NO_TEMPLATE_CONTENT_IN_REQUIRED_DOCS` | semantic | high | Documentos requeridos no son plantilla vacía. |
| `NO_WILDCARD_FORBIDDEN_IMPORTS` | semantic | low | No se usa wildcard ambiguo en forbidden imports. |
| `CANONICAL_SOURCES_ONLY_USED` | structure | medium | La documentación operativa referencia únicamente fuentes canónicas autorizadas. |
| `OPERATIONAL_SCHEMAS_ARE_STRICT` | semantic | high | Schemas operativos canónicos son cerrados y tipados. |
| `OWNER_PERMISSIONS_MATCH_PERMISSION_CATALOG` | consistency | high | Los permisos owner coinciden con los permisos cuyo catálogo incluye el rol owner. |
| `OWNER_ROLE_HAS_NO_RUNTIME_WILDCARD` | semantic | critical | El rol owner no usa wildcard runtime en permissions. |
| `OWNER_SEED_FAILS_CLOSED_ON_PLACEHOLDERS` | semantic | critical | El seed owner local aborta con placeholders y condiciona inserts por owner_ready. |
| `P0_BACKLOG_ITEMS_ARE_TRACEABLE` | consistency | critical | Toda tarea P0 del backlog post-Sprint 0 aparece en la matriz de trazabilidad. |
| `P0_BACKLOG_ITEMS_HAVE_MVP_OR_GATE_COVERAGE` | consistency | high | Toda tarea P0 tiene cobertura MVP o gate/fase explícita en trazabilidad. |
| `CANONICAL_ROOT_IDENTITY_MATCHES_FOLDER` | documentation | high | La carpeta raíz, README y CURRENT_STATUS declaran identidad VipWeb y documentation_baseline 1.2. |
| `PASSWORD_HASH_IS_NEVER_EXPORTABLE` | semantic | critical | password_hash nunca exportable ni legible por IA/evidencia. |
| `PASSWORD_HASH_POLICY_DECLARED` | semantic | critical | La política de hash de contraseña está declarada. |
| `CANONICAL_BASELINE_NOT_OVERRIDDEN_BY_AUXILIARY_NOTES` | documentation | medium | Las notas auxiliares no prevalecen sobre documentation_baseline 1.2 ni sobre CURRENT_STATUS.md como estado canónico. |
| `ROOT_DOCUMENTS_DECLARE_CANONICAL_AUTHORITY` | documentation | low | Los documentos de raíz autorizados remiten al estado canónico y a la baseline documental. |
| `PERMISSIONS_REFERENCE_CANONICAL_ROLES` | consistency | critical | Permisos referencian roles canónicos. |
| `PERMISSIONS_SEEDS_DECLARED` | semantic | high | Permisos tienen datos suficientes para seeds RBAC. |
| `PERMISSION_CONSUMERS_INCLUDE_ROUTE_MODULES` | consistency | high | Los módulos de ruta están declarados como owner, consumidores o agregadores del permiso. |
| `PERMISSION_ROLES_MATCH_ROLE_CATALOG` | consistency | critical | permissions.json y roles.json son recíprocos. |
| `PERSISTENT_VIEW_EVENTS_HAVE_ACTION_CONTRACT` | semantic | critical | Todo evento de vista persistente tiene action contract POST explícito. |
| `PERSONAL_COLUMNS_DECLARE_USER_EXPORTABILITY` | semantic | medium | Columnas personales declaran exportabilidad al usuario. |
| `PHASE2_BACKLOG_DEPENDS_ON_SPRINT0_GATE` | semantic | critical | Las tareas C1 de fase 2 dependen explícitamente de S0-013. |
| `PHP_84_FEATURES_BLOCKED_UNTIL_VERIFIED` | documentation | medium | No se usan features PHP 8.4 hasta verificar WAMP local. |
| `PHP_IMPLEMENTATION_SECURITY_BASELINE_DECLARED` | semantic | critical | La baseline PHP/WAMP de implementación segura está documentada antes del primer vertical slice. |
| `PHP_RUNTIME_MINIMUM_DECLARED` | documentation | medium | Se declara mínimo operativo PHP verificado en Sprint 0. |
| `PHP_RUNTIME_TARGET_DECLARED` | documentation | medium | Se declara target PHP 8.4+. |
| `PHP_RUNTIME_VERIFICATION_TASK_EXISTS` | semantic | high | Sprint 0 incluye tarea de php -v. |
| `PHP_SQL_PREPARED_STATEMENTS_REQUIRED` | semantic | critical | PDO prepared statements son obligatorios y se prohíbe concatenar input en SQL. |
| `POLYMORPHIC_RELATIONS_DO_NOT_DECLARE_CONFLICTING_NULLABILITY` | semantic | high | Las relaciones polimórficas sobre una misma FK no declaran nullability contradictoria. |
| `POSITIVE_SCHEMA_FIXTURES_PASS` | semantic | high | Las fixtures positivas mínimas validan contra sus schemas críticos. |
| `PRODUCT_MVP_DEFINED` | semantic | high | MVP tiene features, journeys y métricas. |
| `PROGRESS_RECORD_REQUIRES_SOURCE_EVENT_IN_MVP` | semantic | high | ProgressRecord MVP exige source_event_id NOT NULL y no permite ajustes manuales/admin sin contrato post_mvp. |
| `PROJECT_IDENTITY_VIPWEB` | documentation | critical | La identidad canónica del proyecto es VipWeb y no aparecen identidades no canónicas. |
| `PROJECT_STRUCTURE_EXISTS` | structure | critical | Carpetas y archivos base existen. |
| `PROPOSED_ADRS_NOT_IN_ACCEPTED_ADR_FOLDER` | documentation | high | Las ADRs propuestas o condicionales no viven dentro de docs/12-decisions/adr/. |
| `PROPOSED_DECISIONS_SCHEMA_VALID` | semantic | high | proposed_decisions cumple schema. |
| `PUBLIC_ENTRY_DOES_NOT_ENABLE_PUBLIC_SIGNUP` | semantic | high | La entrada pública no habilita auto-registro. |
| `PUBLIC_ENTRY_HAS_LOGIN_CTA` | semantic | medium | La entrada pública tiene CTA hacia login. |
| `PUBLIC_VIEW_PERMISSION_HAS_PUBLIC_ROUTE` | semantic | high | public.view está trazado a una ruta pública GET /. |
| `READINESS_READY_FOR_SPRINT_0` | documentation | critical | El estado operativo declarado es READY_FOR_SPRINT_0 y el desarrollo visible permanece bloqueado hasta Sprint 0 local real. |
| `README_STATUS_MATCHES_CURRENT_STATUS` | documentation | high | README.md y CURRENT_STATUS.md declaran documentation_baseline 1.2, estado READY_FOR_SPRINT_0 y bloqueo del desarrollo visible hasta Sprint 0 local real. |
| `README_BASELINE_MATCHES_CURRENT_STATUS` | documentation | low | README.md y CURRENT_STATUS.md declaran documentation_baseline 1.2 y estado READY_FOR_SPRINT_0 con lenguaje canónico. |
| `READONLY_ACTION_SIDE_EFFECTS_DECLARED` | semantic | high | Las acciones readonly con auditoría/eventos declaran side effects operacionales delegados. |
| `READONLY_ROUTES_DO_NOT_REQUIRE_RUNTIME_APPROVAL` | semantic | high | Rutas read-only no exigen aprobación runtime. |
| `READY_FOR_IMPLEMENTATION_FILES_DECLARE_OPERATIONAL_GATE` | semantic | high | Todo documento READY_FOR_IMPLEMENTATION declara que el estado es madurez documental y queda subordinado al gate operativo vigente. |
| `READY_FOR_SPRINT0_BLOCKS_VISIBLE_DEVELOPMENT` | documentation | high | READY_FOR_SPRINT_0 bloquea UI visible, Dashboard, Onboarding, módulos funcionales, integraciones reales e IA operativa avanzada hasta completar Sprint 0 local real. |
| `REGISTER_EVENT_SOURCE_ENUM_DECLARED` | semantic | medium | El evento user.registered declara enum cerrado de source. |
| `REGISTRATION_POLICY_IS_EXPLICIT` | semantic | high | La política de creación de usuarios MVP está explicitada como provisionamiento controlado o auto-registro completo. |
| `RELATIONSHIPS_HAVE_PHYSICAL_CONSTRAINTS` | semantic | high | Relaciones con constraints físicas mínimas. |
| `RELATIONSHIPS_REFERENCE_EXISTING_ENTITIES` | semantic | high | Relaciones referencian entidades existentes. |
| `RELATIONSHIP_MIGRATION_REFS_POINT_TO_TABLE_MIGRATIONS` | semantic | critical | Las relaciones apuntan a la migración de tabla que contiene la FK. |
| `REQUIRED_DOCS_ARE_SUBSTANTIVE` | semantic | high | Documentos canónicos sustantivos. |
| `REQUIRED_PATHS_EXIST` | structure | critical | El validador documental confirma que las rutas obligatorias del paquete canónico existen. |
| `RESPONSIVE_BEHAVIOR_EXISTS_FOR_ALL_MVP_SCREENS` | semantic | high | Todas las pantallas MVP tienen contrato responsive. |
| `RESPONSIVE_BREAKPOINTS_ARE_COMPLETE` | semantic | high | Contratos responsive declaran mobile, tablet y desktop. |
| `RESPONSIVE_CRITICAL_ACTIONS_ARE_VISIBLE` | semantic | high | Acciones críticas no desaparecen por breakpoint. |
| `RESPONSIVE_SCHEMA_VALID` | semantic | medium | Contrato responsive cumple schema. |
| `RISKS_MATCH_SCHEMA` | semantic | medium | Riesgos cumplen schemas mínimos. |
| `RISK_CONTROL_PARENT_IDS_EXIST` | semantic | medium | Los riesgos operativos enlazan a riesgo estratégico existente o declaran parent null justificable. |
| `RISK_FILES_DECLARE_DISTINCT_CANONICAL_PURPOSES` | semantic | medium | risk_register.json y risks.json declaran propósitos canónicos distintos. |
| `RISK_PHASES_REFERENCE_ROADMAP_GATES` | semantic | high | Los riesgos referencian roadmap_gates mediante phase_ids normalizados. |
| `RISK_PHASE_TEXT_HAS_NORMALIZED_PHASE_ID` | semantic | medium | Ningún riesgo conserva únicamente fase en texto libre sin phase_ids. |
| `ROADMAP_ACTIVE_DOCS_ARE_CANONICAL` | consistency | medium | Los documentos activos de roadmap mantienen autoridad canónica. |
| `ROADMAP_EXCLUDES_NON_CANONICAL_DOCUMENTATION` | documentation | medium | El roadmap operativo no depende de documentación histórica, archivada o no canónica. |
| `ROADMAP_CANONICAL_COMPLEMENTS_DECLARED` | documentation | medium | Complementos canónicos de roadmap declaran estado explícito. |
| `ROADMAP_CANONICAL_SOURCES_ARE_UNAMBIGUOUS` | consistency | medium | Las fuentes canónicas del roadmap no presentan duplicidad activa. |
| `ROADMAP_GATES_MATCH_SCHEMA` | semantic | medium | Roadmap gates cumple schema mínimo. |
| `ROADMAP_HUMAN_DOCS_MATCH_MACHINE_GATES` | consistency | high | Overview de roadmap coincide con machine/roadmap_gates.json. |
| `ROADMAP_REFERENCES_USE_CANONICAL_SOURCES` | consistency | medium | Las referencias del roadmap apuntan a fuentes canónicas autorizadas. |
| `ROADMAP_PHASES_HAVE_FULL_GATES` | semantic | high | Roadmap gates completos. |
| `ROLES_CANONICALIZED` | consistency | critical | roles_permissions_matrix deriva de roles.json. |
| `ROLES_MATCH_SCHEMA` | semantic | medium | Roles cumplen schema mínimo. |
| `ROLE_PERMISSIONS_MATCH_PERMISSION_CATALOG` | consistency | critical | roles.json declara exactamente los permisos concedidos por permissions.json. |
| `ROOT_MARKDOWN_FILES_ARE_CANONICAL` | documentation | high | Los Markdown de raíz son fuentes canónicas autorizadas o índices operativos. |
| `ROUTE_ALLOWED_ROLES_HAVE_PERMISSION` | consistency | critical | Toda ruta solo permite roles que poseen el permiso requerido. |
| `ROUTE_APPROVAL_FLAGS_MATCH_ACTION_CONTRACTS` | semantic | critical | Las rutas y action contracts exigen ApprovalRecord de forma coherente. |
| `ROUTE_PERMISSION_ROLE_MATRIX_VALID` | consistency | critical | Matriz ruta-permiso-rol válida. |
| `SCHEMA_MIGRATIONS_LEDGER_EXISTS_AND_MATCHES_CONTRACT` | semantic | critical | schema_migrations existe como ledger físico, cubierto por MIG-000 y database/manifest.json. |
| `SCHEMA_REGISTRY_COVERS_ACTION_PAYLOAD_SCHEMAS` | semantic | high | El registry de schemas cubre machine/action_payloads/*.json. |
| `SCHEMA_REGISTRY_COVERS_EVENT_PAYLOAD_SCHEMAS` | semantic | high | El registry de schemas cubre machine/event_payload_schemas/*.json. |
| `SCHEMA_REGISTRY_COVERS_MACHINE_SCHEMAS` | semantic | high | El registry de schemas cubre machine/schemas/*.json. |
| `SCHEMA_REGISTRY_REFERENCES_EXISTING_FILES` | structure | high | Todas las entradas del schema_registry apuntan a archivos existentes. |
| `SCREEN_ANALYTICS_REFS_EXIST_IN_ANALYTICS_CATALOG` | semantic | high | Todos los analytics_refs de pantallas existen en machine/analytics_events.json. |
| `SCREEN_COMPONENT_CONTRACTS_COVER_MVP_SCREENS` | semantic | high | Todas las pantallas MVP tienen contrato de composición. |
| `SCREEN_COMPONENT_CONTRACTS_EXIST` | structure | high | Existe contrato machine-readable de pantalla-componentes-datos-acciones. |
| `SCREEN_COMPONENT_CONTRACTS_INCLUDE_ACCESSIBILITY_CONTRACT` | semantic | high | Cada contrato de pantalla incluye accessibility_contract completo. |
| `SCREEN_COMPONENT_CONTRACTS_REFERENCE_VALID_SCREENS` | semantic | high | Los contratos de pantalla referencian pantallas, módulos, acciones, eventos y componentes válidos. |
| `SCRIPTS_BASE_EXIST` | structure | high | Scripts base existen y conservan update_script.py como nombre estable para este flujo. |
| `SECONDARY_FEATURES_INCLUDE_MVP_UX_FEATURES` | semantic | medium | Secondary features incluye profile y notifications MVP UX. |
| `SECURITY_BASELINE_SESSION_DECLARED` | semantic | critical | La baseline de sesión MVP está documentada. |
| `SECURITY_HEADERS_BASELINE_DECLARED` | semantic | high | Cabeceras mínimas de seguridad documentadas para respuestas HTML/JSON. |
| `SEED_SQL_FILES_EXIST_FOR_CORE_RUNTIME` | structure | high | Seeds SQL mínimos existen para roles, permisos, módulos, configuración y owner local protegido. |
| `SENSITIVE_COLUMNS_ARE_MARKED` | semantic | high | Columnas sensibles están marcadas. |
| `SENSITIVE_COLUMNS_NOT_AI_READABLE_RAW` | semantic | critical | Columnas sensibles no son IA-readable en bruto. |
| `SENSITIVE_COLUMNS_REQUIRE_REDACTION` | semantic | critical | Columnas sensibles requieren redacción. |
| `SESSION_COOKIE_POLICY_DECLARED` | semantic | high | La política de cookies de sesión está declarada. |
| `SPRINT0_ADR026_PREFLIGHT_TASK_EXISTS` | semantic | critical | Sprint 0 incluye preflight S0-000A para ADR-026 antes de cambios protegidos preparados por IA. |
| `SPRINT0_DOCTOR_CHECK_REFERENCES_EXIST` | consistency | high | Cada doctor_check declarado en machine/sprint0_tasks.json referencia un check Doctor catalogado. |
| `SPRINT0_ENVIRONMENT_CHECK_COVERS_WAMP_STACK` | semantic | high | S0-000 verifica PHP, Apache/WAMP y MySQL/MariaDB antes de código runtime. |
| `SPRINT0_MARKDOWN_GATE_MATCHES_MACHINE_TASK` | consistency | high | S0-013 Markdown coincide con sprint0_tasks.json y gate C1. |
| `SPRINT0_MARKDOWN_MATCHES_MACHINE_TASKS` | consistency | high | Sprint 0 humano coincide con machine/sprint0_tasks.json en S0-000, S0-009 y S0-010. |
| `SPRINT0_MIGRATION_PATH_MATCHES_DOMAIN_CONTRACT` | semantic | critical | Sprint 0 usa database/migrations/*.sql y no PHP. |
| `SPRINT0_SQL_EXECUTION_TASKS_DECLARED` | semantic | high | Sprint 0 separa validación, ejecución y evidencia para migraciones y seeds SQL. |
| `SPRINT0_TASKS_MATCH_SCHEMA` | semantic | medium | Sprint 0 cumple schema mínimo. |
| `SPRINT0_TASKS_SCHEMA_VALID` | semantic | critical | machine/sprint0_tasks.json valida contra machine/schemas/sprint0-task.schema.json. |
| `SPRINT0_TRACEABILITY_GATE_IS_BLOCKING` | semantic | high | S0-013 es gate bloqueante para cerrar Sprint 0 antes de C1. |
| `SQL_ARTIFACTS_STATE_MATCHES_FILESYSTEM` | consistency | critical | El estado documental de SQL coincide con la existencia real de migraciones, rollbacks y seeds. |
| `SQL_BACKUP_DECLARED_IF_DB_EXISTS` | documentation | high | Sprint 0 declara exportación SQL o justificación sin base previa antes de ejecución local. |
| `SQL_MANIFEST_HASHES_MATCH_FILES` | semantic | high | database/manifest.json cubre todos los SQL y los hashes técnicos coinciden. |
| `STRICT_MACHINE_JSON_SCHEMA_VALIDATION` | semantic | critical | Todos los catálogos con schema cumplen JSON Schema Draft 2020-12. |
| `SUBWEB_ACTIVE_OR_STUB_CONTRACTS_ARE_OPERATIONAL` | semantic | high | Subwebs stub/active tienen contrato operativo mínimo y referencias válidas. |
| `SUBWEB_CONTRACTS_MATCH_SCHEMA` | semantic | medium | machine/subweb_contracts.json valida contra el schema de subweb. |
| `SUBWEB_CONTRACT_SCHEMA_EXISTS` | structure | medium | Existe schema propio para contratos de subweb. |
| `SUBWEB_SCHEMA_AND_DOCTOR_RULES_ARE_ALIGNED` | semantic | medium | Las reglas de subweb en schema y Doctor están alineadas. |
| `SUBWEB_SCHEMA_ENFORCES_ACTIVE_MINIMUMS` | semantic | high | El schema no permite subweb active sin permisos, módulo y datos/eventos. |
| `SUBWEB_SCHEMA_ENFORCES_STUB_MINIMUMS` | semantic | high | El schema no permite subweb stub sin permisos y módulo. |
| `SUBWEB_TEMPLATE_VALIDATES_AGAINST_SCHEMA` | semantic | medium | templates/subweb-contract.json valida como instancia del schema de subweb. |
| `SYSTEM_EVENT_READS_REQUIRE_AUDIT` | semantic | high | Las lecturas de eventos de sistema quedan auditadas. |
| `SYSTEM_EVENT_UI_ROUTE_IS_ADMIN_SCOPED` | semantic | medium | La ruta UI de eventos de sistema queda bajo /admin. |
| `TABLE_CONSTRAINTS_REFERENCE_EXISTING_COLUMNS` | semantic | critical | Constraints e índices solo referencian columnas/tablas existentes. |
| `TRACEABILITY_MARKDOWN_INCLUDES_GATES_AND_BACKLOG` | documentation | medium | Markdown de trazabilidad incluye gates y backlog. |
| `TRACEABILITY_MARKDOWN_MATCH_MACHINE` | consistency | critical | Markdown contiene referencias de machine/traceability_matrix.json. |
| `TRACEABILITY_MATRIX_EXISTS` | structure | critical | Matriz de trazabilidad existe. |
| `TRACEABILITY_REFERENCES_BACKLOG_ITEMS` | consistency | high | Trazabilidad referencia backlog post-Sprint 0 existente. |
| `TRACEABILITY_REFERENCES_DOCTOR_CHECKS` | consistency | medium | Trazabilidad referencia checks Doctor declarados. |
| `TRACEABILITY_REFERENCES_EXIST` | consistency | critical | Trazabilidad referencia elementos existentes. |
| `TRACEABILITY_REFERENCES_ROADMAP_GATES` | consistency | high | Trazabilidad referencia gates de roadmap existentes. |
| `UC001_HAS_ROUTE_AND_SCREEN` | semantic | high | UC-001 tiene ruta y pantalla pública trazadas. |
| `UI_SCREENS_DECLARE_BASE_TECHNICAL_STATES` | semantic | high | Todas las pantallas MVP declaran loading, error y empty/blocked/no_permission. |
| `UI_SCREENS_REFERENCE_EXISTING_MODULES_AND_PERMISSIONS` | semantic | medium | Pantallas referencian módulos y permisos existentes. |
| `UI_SCREEN_PRIMARY_PERMISSION_MATCHES_SCREEN_ROUTE` | semantic | high | La primary_permission de cada pantalla coincide con su ruta GET principal. |
| `UI_STATE_COPY_COVERS_ALL_SCREEN_STATES` | semantic | medium | Copy específico cubre todos los estados declarados de pantallas. |
| `UI_STATE_COPY_MATCH_SCHEMA` | semantic | medium | Copy UX por pantalla/estado cumple schema mínimo. |
| `UI_SUBVIEWS_REFERENCE_EXISTING_PARENT_SCREEN` | semantic | medium | Toda subvista UI referencia una pantalla padre existente. |
| `USER_MODULE_CATALOG_ROUTE_EXISTS` | semantic | medium | module.view tiene ruta de catálogo no administrativa para usuarios registrados. |
| `UX_COMPONENT_MARKDOWN_MATCHES_DESIGN_TOKENS` | documentation | medium | La tabla humana de componentes cubre component_variants de design_tokens. |
| `UX_COMPONENT_VARIANTS_REFERENCE_VALID_TOKENS` | semantic | medium | Variantes UX referencian tokens válidos. |
| `UX_INTERFACE_STATES_INCLUDE_ALL_UI_SCREENS` | documentation | medium | Todas las pantallas machine-readable aparecen en la tabla humana de estados. |
| `UX_NAVIGATION_MARKDOWN_MATCHES_UI_SCREENS` | documentation | high | La navegación humana coincide con machine/ui_screens.json. |
| `UX_RESPONSIVE_MARKDOWN_COVERS_MACHINE_SCREENS` | documentation | medium | La matriz responsive humana cubre todas las pantallas machine-readable. |
| `UX_STATES_MAPPED_TO_SCREENS` | semantic | medium | Pantallas con estados y permisos. |
| `VALIDATED_BY_REFERENCES_EXECUTABLE_CHECK` | consistency | critical | validated_by solo referencia checks ejecutables. |
| `VALIDATION_REFS_HAVE_CORRECT_TYPE` | consistency | medium | validated_by/manual_review_ref/evidence_ref mantienen semántica separada. |
| `VERSION_CONTROL_TRANSITION_TRIGGER_DECLARED` | documentation | medium | Transición futura a control de versiones tiene triggers objetivos. |
| `VERSION_CONTROL_TRIGGERS_MATCH_RISK_REGISTER` | consistency | medium | Triggers de control de versiones están reflejados en riesgos. |
| `VERSION_CONTROL_TRIGGER_CONSISTENCY` | documentation | medium | Triggers Git/WAMP/IA están alineados entre deployment, workflow WAMP, ADR-021, approval policy y runbooks IA. |
| `VISIBLE_GET_ROUTES_HAVE_SCREEN_OR_PARENT` | semantic | high | Toda ruta GET visible tiene pantalla propia o pantalla padre. |
| `WAMP_CONFIG_EXISTS` | documentation | high | La configuración WAMP local está documentada sin secretos reales y alineada con el stack vigente. |
| `WAMP_RISK_HAS_REINFORCED_GIT_MITIGATION` | semantic | high | R-WAMP-001 incluye mitigación reforzada con Git local. |
| `WAMP_RISK_REFERENCES_ADR_026` | semantic | medium | R-WAMP-001 referencia ADR-026. |
