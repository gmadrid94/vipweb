# 03 Conventions

**Estado recomendado:** `READY_FOR_IMPLEMENTATION`
**Gate operativo aplicable:** `READY_FOR_IMPLEMENTATION` indica madurez documental, no permiso operativo por sí solo. Prevalecen `CURRENT_STATUS.md` y `machine/roadmap_gates.json`. Con el estado global actual `READY_FOR_SPRINT_0`, este documento solo puede guiar tareas permitidas por Sprint 0. No autoriza UI visible, Dashboard, Onboarding ni módulos funcionales hasta alcanzar `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT`.


## Convenciones
- IDs de módulos: `core.identity`, `dashboard`, `ai_assistant`.
- Permisos: `resource.action`, por ejemplo `auth.logout`.
- Eventos: `domain.action`, por ejemplo `user.logged_in`.
- Entidades: PascalCase en catálogos, snake_case en tablas.
- Rutas: comienzan con `/` y siempre declaran método y permiso.
- Scripts de cambio: `update_script.py`.

## Contrato canónico de migraciones ejecutables

- Formato único: SQL plano reversible.
- Ruta única: `database/migrations/*.sql`.
- No se usan migraciones PHP (`*.php`) en Sprint 0.
- La numeración de migraciones sigue `machine/relationships.json::migration_order`.
- Las FKs se declaran dentro de la migración de la tabla que contiene la FK.
- No se crean ficheros `*_relation.sql` salvo alteraciones posteriores documentadas por ADR.
- Acrónimos en nombres de fichero: snake_case continuo, por ejemplo `AIActionLog` → `ai_action_logs` → `023_create_ai_action_logs.sql`.

## Reglas
- No usar permisos legacy en rutas nuevas.
- No crear evento sin catálogo.
- No crear entidad sin fields, constraints, indexes y migration_ref.
- No aceptar manifest con objetos vacíos.

## Criterios de validación
Doctor debe detectar nombres fuera de catálogo y referencias rotas.

## Contrato de migraciones reversibles

Las migraciones WAMP se declaran en `machine/migration_contracts.json`. Cada entrada debe tener `up_ref`, `rollback_ref` separado bajo `database/rollbacks/`, checksum obligatorio y ledger local mediante `schema_migrations`. En Sprint 0 sin datos reales se permite rollback SQL directo; con datos reales futuros se usará migración compensatoria o restauración aprobada.

## Convención de hashes técnicos

Los hashes técnicos canónicos del proyecto usan siempre `SHA-256`.

Formato obligatorio: `^[a-f0-9]{64}$`.

No se aceptan hashes técnicos en mayúsculas en nuevos artifacts. Si un schema antiguo acepta `[a-fA-F0-9]`, debe endurecerse a lowercase antes de implementar validación runtime.

Contrato operativo:

- algoritmo: `sha256`;
- entrada: bytes exactos del artifact final persistido;
- archivos de texto nuevos: UTF-8 sin BOM;
- JSON generado por scripts: claves ordenadas, `ensure_ascii=false`, indentación de 2 espacios y salto final de línea;
- SQL: archivo `.sql` final tal como queda guardado en disco.

## Manifest de integridad SQL


### Ledger físico local de migraciones

`schema_migrations` es obligatorio desde Sprint 0. Se crea mediante `database/migrations/000_create_schema_migrations.sql` antes de cualquier migración funcional y se revierte, solo antes de datos reales, mediante `database/rollbacks/000_rollback_create_schema_migrations.sql`.

Campos mínimos del ledger: `migration_id`, `up_ref`, `rollback_ref`, `checksum`, `checksum_algorithm`, `applied_at`, `applied_by`, `status` y `evidence_ref`.

Regla operativa: validar migraciones no equivale a ejecutarlas. Sprint 0 separa validación (`S0-009`/`S0-009A`), ejecución con ledger (`S0-009B`) y evidencia (`migration-sql-apply-report`).

`database/manifest.json` aplica el contrato `sha256_lowercase_bytes` sobre migraciones, rollbacks y seeds ya persistidos. No es un contrato lógico de dominio: solo registra integridad física de los `.sql` existentes.

Campos mínimos por artefacto: `artifact_path`, `artifact_type`, `order`, `checksum_algorithm`, `checksum`, `artifact_state` y `source_contract`.

Si cambia cualquier `.sql`, debe actualizarse el manifest y Doctor debe volver a pasar antes de ejecutar Sprint 0.

## Manifest de evidencias

`evidence/sprint-0-local-execution.md` aplica el contrato `sha256_lowercase_bytes` sobre artifacts ya persistidos. El hash se calcula con SHA-256 sobre bytes exactos UTF-8 sin BOM y se representa en hexadecimal lowercase de 64 caracteres.
