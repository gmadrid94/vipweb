# Sprint 0 ejecutable

Sprint 0 prepara el entorno local, valida contratos documentales, ejecuta migraciones/seeds localmente cuando proceda y registra evidencia real antes de cualquier desarrollo visible.

## Decisión sobre scripts y Doctor

El único validador documental ejecutable de esta baseline es `scripts/update_script.py`. Doctor queda definido como contrato runtime futuro mediante `machine/doctor_checks.json`.

`machine/doctor_checks.json` conserva el catálogo Doctor como contrato para el runtime futuro. `scripts/update_script.py` solo valida y no modifica archivos ni genera evidencia.

La evidencia local de Sprint 0 debe completarse manualmente en `evidence/sprint-0-local-execution.md` con datos reales del entorno.

## S0-000 — Verificar entorno WAMP/PHP/MySQL local

- Prioridad: `P0`
- Fase: `Sprint 0`
- Estado: `pending`
- Doctor check: `SPRINT0_ENVIRONMENT_CHECK_COVERS_WAMP_STACK`
- Bloqueante: `true`
- Relevante WAMP: `true`
- Lectura IA requerida: `true`
- Fuente: `docs/06-technical/01-stack.md`

### Descripción

Registrar versiones reales de PHP, Apache/WAMP y MySQL/MariaDB antes de escribir código runtime.

### Dependencias

- Ninguna

### Acciones

- Ejecutar php -v
- Registrar versión Apache/WAMP local desde panel o CLI disponible
- Ejecutar mysql --version o consultar versión MySQL/MariaDB desde WAMP/phpMyAdmin
- Registrar versiones en evidencia fechada
- Actualizar runtime_verified_php_version y runtime_verified_database_version
- Confirmar si se permite sintaxis PHP 8.4; si no, bloquear sintaxis no compatible

### Archivos afectados

- `evidence/sprint-0-local-execution.md`

### Criterios de aceptación

- php -v registrado en evidencia
- Apache/WAMP registrado en evidencia
- MySQL/MariaDB registrado en evidencia
- runtime_verified_php_version definido
- runtime_verified_database_version definido
- Doctor valida que la versión mínima no contradice ADR-003
- No se usa sintaxis PHP 8.4 hasta verificar compatibilidad local

### Evidencia esperada

- wamp-runtime-version-report

### Rollback local

- Volver al mínimo verificado y ajustar sintaxis/dependencias

### Riesgo si se omite

- Código runtime o SQL incompatible con el WAMP/MySQL local real

## S0-000A — Evaluar activación de ADR-026 antes de cambios protegidos preparados por IA

- Prioridad: `P0`
- Fase: `Sprint 0`
- Estado: `pending`
- Doctor check: `SPRINT0_ADR026_PREFLIGHT_TASK_EXISTS`
- Bloqueante: `true`
- Relevante WAMP: `true`
- Lectura IA requerida: `true`
- Fuente: `docs/11-backlog/06-sprint-0-ejecutable.md`

### Descripción

Preflight condicional para convertir ADR-026 en gate operativo antes de aplicar cambios protegidos preparados por IA sobre archivos reales, clasificando origen, autoridad, alcance, ApprovalRecord, scope_hash y rollback.

### Dependencias

- `S0-000`
- `S0-001`
- `S0-003`

### Acciones

- Leer docs/12-decisions/proposed/adr-026-introduccion-de-git-local-y-control-de-versiones-minimo.md
- Leer machine/ai_approval_policy.json y version_control_gate
- Inventariar archivos protegidos afectados por el cambio previsto
- Determinar origen del cambio: humano, ai_generated o ai_prepared
- Determinar si requiere ApprovalRecord, approval_id, scope_hash, rollback y evidencia
- Si aplica trigger, activar ADR-026 mediante decisión humana owner y ejecutar git init + commit baseline + working tree limpio antes de cambios protegidos
- Registrar evidencia del preflight en evidence/sprint-0-local-execution.md y evidencia local
- Registrar development_mode en el preflight S0-000A antes de tocar archivos protegidos
- Si development_mode=ai_prepared_changes_enabled, exigir ADR-026 aceptada/activada, baseline Git y working tree limpio antes de aplicación real
- Verificar machine/proposed_decisions.json::ADR-026.activation_contract antes de declarar ADR-026 activa
- Si ADR-026 se activa, registrar activation_record con activated_by, activated_at, approval_record_id, baseline_commit, scope, evidence_ref y doctor_check_ref

### Archivos afectados

- `evidence/sprint-0-local-execution.md`
- `machine/ai_approval_policy.json`
- `machine/proposed_decisions.json`

### Criterios de aceptación

- Se identifican archivos afectados por el primer bloque de cambios
- Se clasifica si el cambio es protegido o no protegido
- Se identifica si el origen del cambio es humano, ai_generated o ai_prepared
- Se determina si requiere ApprovalRecord, approval_id, scope_hash, rollback y evidencia
- Si el trigger ADR-026 aplica, existe Git local mínimo, baseline commit y working tree limpio antes de aplicar cambios protegidos
- Si el trigger no aplica, queda registrada la razón de no activación
- Ningún cambio protegido preparado por IA se aplica antes de cerrar este preflight
- Se declara development_mode: human_manual_only, ai_audit_only o ai_prepared_changes_enabled
- Si development_mode=ai_prepared_changes_enabled, ADR-026 queda activada por owner humano antes de aplicar cambios protegidos preparados por IA
- Si ADR-026 se activa, machine/proposed_decisions.json contiene activation_contract válido y activation_record completo
- La activación ADR-026 referencia ApprovalRecord humano, baseline commit, scope, evidencia y Doctor check ref

### Evidencia esperada

- adr026-preflight-report + registro operativo-local-entry + baseline-reference-if-applicable

### Rollback local

- Si se activó Git por error, conservar backup previo; si aún no hubo cambios, eliminar .git solo tras registrar la reversión y conservar backup.

### Riesgo si se omite

- R-WAMP-001

## S0-001 — Crear backup local inicial

- Prioridad: `P0`
- Fase: `Sprint 0`
- Estado: `pending`
- Doctor check: `LOCAL_BACKUP_DECLARED`
- Bloqueante: `true`
- Relevante WAMP: `true`
- Lectura IA requerida: `true`
- Fuente: `docs/06-technical/10-wamp-local-workflow.md`

### Descripción

Crear copia completa de la carpeta actual antes de cualquier cambio.

### Dependencias

- Ninguna

### Acciones

- Crear C:/wamp64/www/vipweb_backups si no existe
- Copiar C:/wamp64/www/vipweb a una carpeta con fecha y motivo
- Registrar ruta del backup

### Archivos afectados

- `C:/wamp64/www/vipweb_backups`
- `evidence/sprint-0-local-execution.md`

### Criterios de aceptación

- Existe carpeta de backup
- La ruta queda registrada
- No se ha modificado el proyecto antes del backup

### Evidencia esperada

- Entrada en evidence/sprint-0-local-execution.md

### Rollback local

- Restaurar carpeta copiada como vipweb

### Riesgo si se omite

- Pérdida de trabajo si se omite

## S0-002 — Exportar SQL inicial si existe base de datos

- Prioridad: `P0`
- Fase: `Sprint 0`
- Estado: `pending`
- Doctor check: `SQL_BACKUP_DECLARED_IF_DB_EXISTS`
- Bloqueante: `true`
- Relevante WAMP: `true`
- Lectura IA requerida: `true`
- Fuente: `templates/sql-export-checklist.md`

### Descripción

Exportar la base de datos actual desde phpMyAdmin si el proyecto ya tiene una.

### Dependencias

- `S0-001`

### Acciones

- Abrir phpMyAdmin
- Seleccionar base de datos VipWeb si existe
- Exportar como SQL
- Guardar SQL en carpeta de backup
- Verificar que el archivo no está vacío

### Archivos afectados

- `C:/wamp64/www/vipweb_backups/*/database/*.sql`
- `evidence/sprint-0-local-execution.md`

### Criterios de aceptación

- SQL exportado o justificación de que no existe base previa
- Nombre registrado en registro operativo

### Evidencia esperada

- Archivo SQL o nota no-db

### Rollback local

- Importar SQL desde phpMyAdmin

### Riesgo si se omite

- Imposibilidad de restaurar datos

## S0-003 — Crear o actualizar evidence/sprint-0-local-execution.md

- Prioridad: `P0`
- Fase: `Sprint 0`
- Estado: `pending`
- Doctor check: `LOCAL_EXECUTION_RECORD_EXISTS`
- Bloqueante: `true`
- Relevante WAMP: `true`
- Lectura IA requerida: `true`
- Fuente: `docs/06-technical/10-wamp-local-workflow.md`

### Descripción

Asegurar registro manual de cambios mientras no haya Git.

### Dependencias

- `S0-001`

### Acciones

- Crear evidence/sprint-0-local-execution.md si no existe
- Añadir entrada de punto de partida
- Registrar backup y SQL inicial

### Archivos afectados

- `evidence/sprint-0-local-execution.md`

### Criterios de aceptación

- El registro operativo existe
- Contiene punto de partida
- Contiene regla de uso local

### Evidencia esperada

- evidence/sprint-0-local-execution.md

### Rollback local

- Usar backup y entrada previa

### Riesgo si se omite

- Cambios no auditables

## S0-004 — Crear estructura base de carpetas

- Prioridad: `P0`
- Fase: `Sprint 0`
- Estado: `pending`
- Doctor check: `PROJECT_STRUCTURE_EXISTS`
- Bloqueante: `true`
- Relevante WAMP: `true`
- Lectura IA requerida: `true`
- Fuente: `docs/11-backlog/06-sprint-0-ejecutable.md`

### Descripción

Crear esqueleto del proyecto alineado con arquitectura modular.

### Dependencias

- `S0-001`
- `S0-003`
- `S0-000A`

### Acciones

- Crear /app
- Crear /public
- Crear /config
- Crear /database
- Crear /scripts
- Crear /docs
- Crear /machine
- Crear /templates
- Crear /evidence

### Archivos afectados

- `/app`
- `/public`
- `/config`
- `/database`
- `/scripts`
- `/docs`
- `/machine`
- `/templates`
- `/evidence`

### Criterios de aceptación

- Todas las carpetas existen
- Doctor PROJECT_STRUCTURE_EXISTS pasa

### Evidencia esperada

- evidence/sprint-0-local-execution.md

### Rollback local

- Restaurar backup S0-001

### Riesgo si se omite

- Desarrollo desordenado

## S0-005 — Registrar ADRs aceptadas vigentes

- Prioridad: `P0`
- Fase: `Sprint 0`
- Estado: `pending`
- Doctor check: `ADR_ACCEPTED_COUNT_AND_PROPOSED_ADR026_ALIGNED`
- Bloqueante: `true`
- Relevante WAMP: `false`
- Lectura IA requerida: `true`
- Fuente: `docs/12-decisions/00-decision-log.md`

### Descripción

Asegurar que todas las decisiones aceptadas existen en Markdown y JSON.

### Dependencias

- `S0-004`

### Acciones

- Revisar docs/12-decisions/adr
- Revisar 00-decision-log.md
- Sincronizar machine/decisions.json

### Archivos afectados

- `docs/12-decisions/00-decision-log.md`
- `docs/12-decisions/adr/*.md`
- `machine/decisions.json`

### Criterios de aceptación

- Existen 27 ADRs aceptadas: ADR-001 a ADR-025, ADR-027 y ADR-028
- ADR-026 permanece como propuesta condicional fuera de docs/12-decisions/adr/
- Todas las ADRs aceptadas están sincronizadas entre Markdown y JSON
- No hay decisiones fundacionales pendientes

### Evidencia esperada

- `evidence/sprint-0-local-execution.md` con confirmación manual de revisión de ADRs y sincronización Markdown/JSON

### Rollback local

- Restaurar docs/12-decisions desde backup

### Riesgo si se omite

- Decisiones perdidas o contradictorias

## S0-006 — Crear catálogos JSON vigentes

- Prioridad: `P0`
- Fase: `Sprint 0`
- Estado: `pending`
- Doctor check: `MACHINE_JSON_VALID`
- Bloqueante: `true`
- Relevante WAMP: `false`
- Lectura IA requerida: `true`
- Fuente: `docs/09-ai-operations/07-machine-readable-docs.md`

### Descripción

Preparar catálogos machine-readable para IA y scripts.

### Dependencias

- `S0-005`

### Acciones

- Crear modules.json
- Crear entities.json
- Crear events.json
- Crear permissions.json
- Crear decisions.json
- Crear risks.json
- Validar JSON

### Archivos afectados

- `machine/modules.json`
- `machine/entities.json`
- `machine/events.json`
- `machine/permissions.json`
- `machine/decisions.json`
- `machine/risks.json`

### Criterios de aceptación

- Todos los JSON son válidos
- Contienen source_doc y evidence_required cuando aplica

### Evidencia esperada

- machine-json-report

### Rollback local

- Restaurar machine/*.json desde backup

### Riesgo si se omite

- IA o scripts sin contexto fiable

## S0-007 — Mantener script de validación documental canónico

- Prioridad: `P0`
- Fase: `Sprint 0`
- Estado: `pending`
- Doctor check: `SCRIPTS_BASE_EXIST`
- Bloqueante: `true`
- Relevante WAMP: `true`
- Lectura IA requerida: `true`
- Fuente: `docs/13-quality/06-doctor-checks.md`

### Descripción

Conservar `scripts/update_script.py` como único validador documental ejecutable de esta baseline. Doctor queda definido como contrato runtime futuro mediante `machine/doctor_checks.json`.

### Dependencias

- `S0-004`
- `S0-006`

### Acciones

- Conservar scripts/update_script.py como único script ejecutable de validación documental actual
- Verificar que scripts/update_script.py no modifica archivos ni genera evidencia
- Validar JSON, schemas machine-readable, referencias internas, identidad VipWeb, checksums SQL y readiness
- Documentar que Doctor runtime se implementará en fases posteriores a partir de machine/doctor_checks.json

### Archivos afectados

- `scripts/update_script.py`
- `scripts/README.md`
- `machine/doctor_checks.json`
- `docs/13-quality/06-doctor-checks.md`

### Criterios de aceptación

- Existe scripts/update_script.py y es ejecutable con python scripts/update_script.py
- El script no ejecuta cambios destructivos ni modifica archivos
- Los checks emitidos por scripts/update_script.py están catalogados en machine/doctor_checks.json
- La documentación distingue validador documental actual de Doctor runtime futuro

### Evidencia esperada

- stdout de python scripts/update_script.py y registro manual en evidence/sprint-0-local-execution.md

### Rollback local

- Restaurar scripts/update_script.py desde backup canónico si se modifica indebidamente

### Riesgo si se omite

- Confundir contratos Doctor futuros con scripts ejecutables actuales o asumir generación automática de evidencia inexistente

## S0-008 — Crear configuración WAMP sin secretos reales

- Prioridad: `P0`
- Fase: `Sprint 0`
- Estado: `pending`
- Doctor check: `WAMP_CONFIG_EXISTS`
- Bloqueante: `true`
- Relevante WAMP: `true`
- Lectura IA requerida: `true`
- Fuente: `docs/06-technical/10-wamp-local-workflow.md`

### Descripción

Preparar archivos de configuración para entorno local WAMP.

### Dependencias

- `S0-004`

### Acciones

- Crear .env.example
- Crear config/app.php
- Crear config/database.php
- Crear config/modules.php
- Crear config/permissions.php
- No incluir contraseñas reales

### Archivos afectados

- `.env.example`
- `config/app.php`
- `config/database.php`
- `config/modules.php`
- `config/permissions.php`

### Criterios de aceptación

- Configuración existe
- No contiene secretos reales
- Es compatible con WAMP

### Evidencia esperada

- config-check-report

### Rollback local

- Restaurar config desde backup

### Riesgo si se omite

- Errores de conexión o secretos expuestos

## S0-009 — Validar migraciones SQL base existentes

- Prioridad: `P1`
- Fase: `Sprint 0`
- Estado: `pending`
- Doctor check: `MIGRATION_SQL_FILES_EXIST_FOR_CONTRACTS`
- Bloqueante: `true`
- Relevante WAMP: `true`
- Lectura IA requerida: `true`
- Fuente: `docs/05-domain-data/00-domain-model.md`

### Descripción

Validar que las migraciones SQL físicas base ya presentes coinciden con los contratos machine-readable antes de ejecutarlas en WAMP local.

### Dependencias

- `S0-008`

### Acciones

- Comprobar que database/migrations/*.sql existe y cubre las tablas core y MVP base
- Comprobar que database/rollbacks/*.sql existe para cada migración
- Validar migraciones SQL de identidad contra machine/entities.json y machine/column_contracts.json
- Validar migraciones SQL de módulos, eventos, auditoría, IA, evidencias, UX, gamificación e integraciones contra contratos machine-readable
- Verificar que user_contexts.user_id y onboarding_sessions.user_id son NOT NULL y coinciden con DCE-009/DCE-010
- Validar que las FKs se declaran dentro de la migración de la tabla que contiene cada FK
- Verificar que no existen migraciones PHP ni ficheros *_relation.sql en Sprint 0
- Registrar hashes técnicos SHA-256 en database/manifest.json
- No recrear ni sobrescribir SQL existente salvo regeneración aprobada mediante ApprovalRecord si aplica

### Archivos afectados

- `database/migrations/*.sql`
- `database/rollbacks/*.sql`
- `database/manifest.json`
- `machine/migration_contracts.json`
- `docs/05-domain-data/06-approval-records.md`
- `machine/domain_constraints_enforcement_matrix.json`
- `machine/physical_constraints_matrix.json`
- `machine/column_contracts.json`

### Criterios de aceptación

- Migraciones SQL físicas existen en database/migrations/*.sql
- Rollbacks SQL físicos existen en database/rollbacks/*.sql
- Las migraciones siguen el orden canónico de machine/relationships.json::migration_order
- Coinciden con modelo de dominio, column_contracts y physical_constraints_matrix
- user_contexts.user_id y onboarding_sessions.user_id son NOT NULL en SQL, column_contracts y physical_constraints_matrix
- No existen migraciones PHP ni *_relation.sql en Sprint 0
- approval_records permite estado requested sin approved_by ni approved_at
- approval_records.expires_at es NOT NULL desde la solicitud
- Cada migración tiene rollback SQL separado
- database/manifest.json registra checksum SHA-256 para cada migración y rollback
- Las migraciones derivan de machine/entities.json, machine/column_contracts.json y machine/physical_constraints_matrix.json
- No existen tablas ni columnas no documentadas

### Evidencia esperada

- migration-sql-validation-report

### Rollback local

- Restaurar carpeta database y SQL backup

### Riesgo si se omite

- Ejecutar o regenerar una base de datos que no coincide con los contratos canónicos

## S0-009A — Validar ledger local de migraciones schema_migrations

- Prioridad: `P1`
- Fase: `Sprint 0`
- Estado: `pending`
- Doctor check: `SCHEMA_MIGRATIONS_LEDGER_EXISTS_AND_MATCHES_CONTRACT`
- Bloqueante: `true`
- Relevante WAMP: `true`
- Lectura IA requerida: `true`
- Fuente: `docs/11-backlog/06-sprint-0-ejecutable.md`

### Descripción

Cerrar el ledger físico local que registra migraciones aplicadas antes de ejecutar el resto de SQL en WAMP.

### Dependencias

- `S0-009`

### Acciones

- Revisar database/migrations/000_create_schema_migrations.sql
- Revisar database/rollbacks/000_rollback_create_schema_migrations.sql
- Confirmar que MIG-000 precede a MIG-001 en machine/migration_contracts.json
- Confirmar hashes técnicos en database/manifest.json
- Ejecutar Doctor readonly para validar el contrato del ledger

### Archivos afectados

- `database/migrations/000_create_schema_migrations.sql`
- `database/rollbacks/000_rollback_create_schema_migrations.sql`
- `machine/migration_contracts.json`
- `database/manifest.json`

### Criterios de aceptación

- Existe database/migrations/000_create_schema_migrations.sql
- Existe database/rollbacks/000_rollback_create_schema_migrations.sql
- machine/migration_contracts.json declara MIG-000 antes de MIG-001
- database/manifest.json registra checksum SHA-256 de migración y rollback del ledger
- schema_migrations incluye migration_id, up_ref, checksum, checksum_algorithm, applied_at, applied_by, status y evidence_ref
- Doctor valida SCHEMA_MIGRATIONS_LEDGER_EXISTS_AND_MATCHES_CONTRACT

### Evidencia esperada

- schema-migrations-ledger-validation-report

### Rollback local

- Restaurar database desde backup local antes de aplicar migraciones

### Riesgo si se omite

- Migraciones aplicadas sin trazabilidad ni estado reproducible

## S0-009B — Ejecutar migraciones SQL en WAMP local y registrar ledger

- Prioridad: `P1`
- Fase: `Sprint 0`
- Estado: `pending`
- Doctor check: `SPRINT0_SQL_EXECUTION_TASKS_DECLARED`
- Bloqueante: `true`
- Relevante WAMP: `true`
- Lectura IA requerida: `true`
- Fuente: `docs/11-backlog/06-sprint-0-ejecutable.md`

### Descripción

Ejecutar el SQL previamente validado y diferenciar aplicación real de validación documental.

### Dependencias

- `S0-009A`

### Acciones

- Crear backup/export SQL previo si existe base local
- Ejecutar 000_create_schema_migrations.sql
- Ejecutar migraciones 001-025 en orden canónico
- Registrar cada aplicación en schema_migrations con checksum y evidencia
- Guardar reporte de ejecución local

### Archivos afectados

- `database/migrations/*.sql`
- `database/manifest.json`
- `evidence/sprint-0-local-execution.md`

### Criterios de aceptación

- Las migraciones se ejecutan en orden desde 000 hasta 025
- schema_migrations registra cada migración aplicada con checksum sha256 y status applied
- No hay errores SQL pendientes tras la ejecución
- Existe evidencia migration-sql-apply-report
- No se editan migraciones aplicadas sin activar rollback o ADR posterior

### Evidencia esperada

- migration-sql-apply-report

### Rollback local

- Restaurar export SQL previo o ejecutar rollbacks antes de datos reales

### Riesgo si se omite

- Base local no coincide con los contratos aunque los archivos SQL sean válidos

## S0-010 — Validar seeds SQL iniciales

- Prioridad: `P1`
- Fase: `Sprint 0`
- Estado: `pending`
- Doctor check: `SEED_SQL_FILES_EXIST_FOR_CORE_RUNTIME`
- Bloqueante: `true`
- Relevante WAMP: `true`
- Lectura IA requerida: `true`
- Fuente: `machine/modules.json`

### Descripción

Validar que los seeds SQL físicos base ya presentes son mínimos, reproducibles y seguros antes de ejecutarlos localmente.

### Dependencias

- `S0-009B`

### Acciones

- Comprobar que database/seeds/*.sql existe
- Validar seeds SQL de roles, permisos y role_permissions contra machine/roles.json y machine/permissions.json
- Validar seeds SQL de módulos y module_manifests contra machine/modules.json
- Validar seeds SQL de configuración mínima sin secretos reales
- Validar seed template de owner local con guard de placeholder para hash de contraseña
- Validar que ai_admin queda disabled_by_default y no se asigna por defecto
- Registrar hashes técnicos SHA-256 de seeds en database/manifest.json
- No usar seeders PHP en Sprint 0

### Archivos afectados

- `database/seeds/*.sql`
- `database/manifest.json`

### Criterios de aceptación

- Seeds SQL existen en database/seeds/*.sql
- No existe dependencia de seeders PHP
- Roles canónicos existen en seed
- Permisos canónicos existen en seed
- RolePermission cubre mappings de permissions.json
- Módulos MVP/core existen en seed con lifecycle_status documentado
- El owner local no puede ejecutarse con hash placeholder
- ai_admin no se asigna por defecto
- database/manifest.json registra checksum SHA-256 para cada seed

### Evidencia esperada

- core-seed-sql-validation-report

### Rollback local

- Restaurar base de datos desde SQL

### Riesgo si se omite

- RBAC, módulos, permisos o owner local no verificables si los seeds no son reproducibles

## S0-010B — Ejecutar seeds SQL iniciales en WAMP local

- Prioridad: `P1`
- Fase: `Sprint 0`
- Estado: `pending`
- Doctor check: `OWNER_SEED_FAILS_CLOSED_ON_PLACEHOLDERS`
- Bloqueante: `true`
- Relevante WAMP: `true`
- Lectura IA requerida: `true`
- Fuente: `docs/11-backlog/06-sprint-0-ejecutable.md`

### Descripción

Ejecutar seeds después de validar migraciones aplicadas y protección fail-closed del owner local.

### Dependencias

- `S0-010`

### Acciones

- Ejecutar seeds 001 y 002 sobre base local migrada
- Verificar fallo esperado de 003_seed_local_owner_template.sql sin sustituir placeholders
- Crear copia local no versionada con email/hash owner reales si se necesita owner local
- Ejecutar seed owner local solo desde copia preparada
- Registrar reporte de aplicación de seeds

### Archivos afectados

- `database/seeds/*.sql`
- `evidence/sprint-0-local-execution.md`

### Criterios de aceptación

- Los seeds 001 y 002 se ejecutan sin secretos reales
- El seed owner falla si conserva placeholders
- El seed owner solo se ejecuta sobre copia local con email/hash sustituidos
- Existe evidencia core-seed-sql-apply-report
- ai_admin permanece disabled_by_default y no asignado por defecto

### Evidencia esperada

- core-seed-sql-apply-report

### Rollback local

- Restaurar export SQL previo o limpiar registros seed antes de datos reales

### Riesgo si se omite

- RBAC, módulos o owner local quedan sin aplicación real o con credenciales placeholder

## S0-011 — Ejecutar validación documental readonly

- Prioridad: `P1`
- Fase: `Sprint 0`
- Estado: `pending`
- Doctor check: `DOCTOR_READONLY_TASK_DOES_NOT_WRITE_EVIDENCE`
- Bloqueante: `true`
- Relevante WAMP: `true`
- Lectura IA requerida: `true`
- Fuente: `docs/13-quality/06-doctor-checks.md`

### Descripción

Ejecutar scripts/update_script.py como validador documental readonly. Esta ejecución no modifica archivos ni genera evidencia canónica automática.

### Dependencias

- `S0-007`
- `S0-008`
- `S0-010B`

### Acciones

- Ejecutar python scripts/update_script.py
- Revisar salida stdout o JSON impreso
- Registrar manualmente el resultado relevante en evidence/sprint-0-local-execution.md

### Archivos afectados

- `evidence/sprint-0-local-execution.md`

### Criterios de aceptación

- python scripts/update_script.py finaliza con status passed
- La ejecución no modifica archivos del paquete
- El resultado relevante queda registrado manualmente si se está cerrando Sprint 0
- No hay failed críticos en la salida

### Evidencia esperada

- stdout de update_script.py incorporado manualmente a evidence/sprint-0-local-execution.md

### Rollback local

- Corregir errores o restaurar backup

### Riesgo si se omite

- Confundir ejecución readonly con escritura de evidencia

## S0-012 — Completar evidencia inicial canónica manualmente

- Prioridad: `P1`
- Fase: `Sprint 0`
- Estado: `pending`
- Doctor check: `EVIDENCE_WRITE_TASK_IS_SEPARATE_FROM_DOCTOR_RUN`
- Bloqueante: `true`
- Relevante WAMP: `false`
- Lectura IA requerida: `true`
- Fuente: `docs/13-quality/06-doctor-checks.md`

### Descripción

Completar evidence/sprint-0-local-execution.md con evidencia local real de Sprint 0. scripts/update_script.py solo valida y no genera ni actualiza evidencia.

### Dependencias

- `S0-011`

### Acciones

- Ejecutar python scripts/update_script.py como validación readonly previa o posterior
- Registrar manualmente versiones, migraciones, seeds, owner seed, incidencias y salida relevante del validador
- Actualizar evidence/sprint-0-local-execution.md solo mediante edición humana controlada
- Confirmar que la evidencia describe estado real y no declara ejecución no realizada

### Archivos afectados

- `evidence/sprint-0-local-execution.md`

### Criterios de aceptación

- Existe evidence/sprint-0-local-execution.md con entrada local real o pendiente explícito
- La evidencia se completa manualmente y no por scripts/update_script.py
- La salida de scripts/update_script.py se cita o resume manualmente si forma parte del cierre
- La evidencia no declara migraciones, seeds ni owner seed como ejecutados sin verificación local

### Evidencia esperada

- evidence/sprint-0-local-execution.md completado manualmente con ejecución local real

### Rollback local

- Restaurar evidence/sprint-0-local-execution.md desde backup y rehacer la entrada manual con datos reales

### Riesgo si se omite

- Estados no demostrables o falsa creencia de que el validador genera evidencia

## S0-013 — Validar matriz de trazabilidad y cerrar Sprint 0

- Prioridad: `P1`
- Fase: `Sprint 0`
- Estado: `pending`
- Doctor check: `SPRINT0_TRACEABILITY_GATE_IS_BLOCKING`
- Bloqueante: `true`
- Relevante WAMP: `false`
- Lectura IA requerida: `true`
- Fuente: `docs/13-quality/05-traceability-matrix.md`

### Descripción

Asegurar que ADR, módulos, entidades, permisos, eventos, tareas y evidencias están conectados.

### Dependencias

- `S0-006`
- `S0-012`

### Acciones

- Revisar docs/13-quality/05-traceability-matrix.md
- Validar machine/traceability_matrix.json
- Completar huecos
- Verificar que todas las tareas C1 dependen explícitamente de S0-013.

### Archivos afectados

- `docs/13-quality/05-traceability-matrix.md`
- `machine/traceability_matrix.json`

### Criterios de aceptación

- Matriz existe
- Cada ADR bloqueante tiene trazabilidad mínima
- No hay tareas sin criterio de aceptación
- Sprint 0 queda cerrado como gate antes de iniciar tareas C1.

### Evidencia esperada

- traceability-check

### Rollback local

- Restaurar matriz desde backup

### Riesgo si se omite

- Cambios sin relación con decisiones

# Criterio de salida de Sprint 0

Sprint 0 se considera cerrado cuando:

- `python scripts/update_script.py` pasa sin fallos.
- `evidence/sprint-0-local-execution.md` contiene evidencia local real registrada manualmente.
- Las versiones reales de PHP, Apache/WAMP y MySQL/MariaDB están documentadas.
- Las migraciones SQL se han ejecutado localmente o existe bloqueo técnico concreto documentado.
- Los seeds se han ejecutado localmente o existe bloqueo técnico concreto documentado.
- El owner seed local ha sido sustituido de forma segura antes de ejecutarse o permanece bloqueado por placeholders.
- Los 15 módulos MVP están declarados.
- Las ADRs aceptadas están registradas y ADR-026 permanece como propuesta condicional salvo activación humana explícita.
- No quedan decisiones fundacionales pendientes.

## Gate de cierre Sprint 0

S0-013 es gate bloqueante antes de iniciar cualquier tarea C1. Debe validar trazabilidad, evidencia inicial y que todas las tareas C1 dependen explícitamente de `S0-013`.

## Criterio reforzado para S0-000A

`S0-000A` debe producir una clasificación explícita antes de cualquier escritura IA protegida:

| Campo | Regla |
|---|---|
| Origen | humano / IA sugerida / IA preparada / mixto |
| Categoría protegida | código, migraciones, schemas, machine-readable, contratos técnicos, ADR, permisos, rutas, módulos, eventos, trazabilidad |
| Trigger ADR-026 | aplica / no aplica |
| Baseline Git | requerido si aplica el trigger |
| Validación previa/posterior | requerida si aplica el trigger |
| ApprovalRecord | requerido para AI-2 o acción sensible |
| Resultado | permitido / bloqueado / no aplicable |

Si el resultado es `bloqueado`, ningún cambio protegido preparado por IA puede aplicarse sobre archivos reales hasta cerrar la causa.

## Gate de evidencia Sprint 0 antes de desarrollo visible

Sprint 0 no se considera cerrado hasta registrar evidencia local verificable. El estado `READY_FOR_SPRINT_0` permite ejecutar tareas de preparación, pero no autoriza UI visible ni módulos funcionales reales.

Evidencia mínima para pasar a desarrollo visible:

- versión PHP comprobada;
- versión MySQL/MariaDB comprobada;
- migraciones ejecutadas o validadas según tarea S0 correspondiente;
- seeds ejecutados o validados según tarea S0 correspondiente;
- owner seed validado sin placeholders;
- salida de `python scripts/update_script.py` revisada y registrada manualmente si se usa como evidencia;
- errores, decisiones y mitigaciones registradas;
- confirmación humana de cierre de gate.

Si falta cualquiera de estas evidencias, Dashboard, Onboarding, módulos funcionales, integraciones reales y operación IA avanzada siguen bloqueados.
