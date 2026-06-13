# 05 Data Governance

**Estado recomendado:** `READY_FOR_IMPLEMENTATION`
**Gate operativo aplicable:** `READY_FOR_IMPLEMENTATION` indica madurez documental, no permiso operativo por sí solo. Prevalecen `CURRENT_STATUS.md` y `machine/roadmap_gates.json`. Con el estado global actual `READY_FOR_SPRINT_0`, este documento solo puede guiar tareas permitidas por Sprint 0. No autoriza UI visible, Dashboard, Onboarding ni módulos funcionales hasta alcanzar `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT`.
  
**Fuente canónica:** `machine/column_contracts.json`.

## Principios

- Los datos personales pertenecen al usuario y deben ser exportables salvo justificación explícita.
- Los datos operativos, secretos, hashes, auditorías y evidencias pueden requerir exclusión o redacción.
- IA, evidencia y exportación al usuario son contextos distintos y no deben resolverse con un único flag.

## Semántica de exposición de datos

`exportable` queda como alias legacy de `user_exportable`. A partir de baseline canónica 1.0, la exposición se decide con:

| Flag | Significado |
|---|---|
| `user_exportable` | Puede incluirse en una exportación solicitada por el usuario. |
| `ai_readable` | Puede entregarse a IA en crudo. |
| `evidence_allowed` | Puede aparecer en evidencias sin redacción. |
| `requires_redaction` | Debe transformarse antes de salir del runtime seguro. |
| `redaction_strategy` | Estrategia de redacción aplicable. |
| `non_export_reason` | Justificación si no es exportable para usuario. |

## Estrategias de redacción permitidas

- `none`
- `mask_email`
- `hash_only`
- `summary_only`
- `schema_filtered`
- `paths_only_or_summary`
- `aggregate_only`
- `exclude`

## Reglas

- Ninguna columna sensible puede tener `ai_readable=true` y `requires_redaction=false` salvo decisión explícita aprobada.
- `password_hash` nunca es exportable, legible por IA ni permitido en evidencia.
- `User.email` es exportable para el usuario, pero requiere `mask_email` para IA/evidencia.
- `UserContext.context_json` es exportable para el usuario, pero solo puede llegar a IA como resumen filtrado.
- `DomainEvent.payload_json` y `EvidenceReport.payload_json` requieren filtrado por schema antes de salir del runtime seguro.
- `AIActionLog.files_read`, `files_changed` y `scope` pueden aparecer en evidencia solo como rutas/resumen, nunca como contenido bruto.

## Criterios de validación

Doctor valida `COLUMN_EXPOSURE_FLAGS_ARE_DECLARED`, `SENSITIVE_COLUMNS_REQUIRE_REDACTION`, `SENSITIVE_COLUMNS_NOT_AI_READABLE_RAW`, `EVIDENCE_EXCLUDES_OR_REDACTS_SENSITIVE_COLUMNS`, `PERSONAL_COLUMNS_DECLARE_USER_EXPORTABILITY`, `PASSWORD_HASH_IS_NEVER_EXPORTABLE` y `LEGACY_EXPORTABLE_MATCHES_USER_EXPORTABLE`.


## Ownership de escritura

Cada entidad tiene un `owner_module` en `machine/entities.json`.

- Una acción solo puede escribir directamente entidades owned por su módulo.
- Las escrituras sobre entidades de otro owner deben pasar por `delegated_write_entities` y contrato `data_write`.
- Los productores de eventos no escriben entidades owned por consumidores; el consumidor procesa el evento y persiste sus propias entidades.
- El rollback de una entidad delegada pertenece al owner de esa entidad.

Doctor valida `ACTION_DIRECT_WRITES_ONLY_OWNED_ENTITIES` y `ACTION_DELEGATED_WRITES_HAVE_CONTRACT`.

## Ownership de lectura cross-module

Cada entidad tiene un `owner_module` y toda lectura por un módulo distinto al owner debe quedar declarada como contrato `data_read` en `machine/modules.json`.

Reglas:

- `data.read_entities` no autoriza por sí solo el acceso a tablas ajenas.
- El contrato `data_read` debe declarar entidad, owner, campos permitidos, read model, permiso/contexto, redacción, fallback, evidencia y check Doctor.
- El owner de la entidad mantiene autoridad sobre campos, sensibilidad y política de redacción.
- IA solo puede recibir datos de una entidad ajena si el contrato `data_read` permite su contexto y respeta `ai_access_policy`.
- `DomainEvent.payload_json`, `EvidenceReport.payload_json`, `User.email`, `ApprovalRecord.scope` y rutas de archivos se filtran según su contrato y la política de exposición de columnas.

Doctor valida esta regla con `MODULE_READ_ENTITIES_HAVE_DATA_READ_CONTRACT`.
