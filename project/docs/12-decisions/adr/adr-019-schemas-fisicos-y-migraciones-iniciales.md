# ADR-019 — Schemas físicos y migraciones iniciales

**Estado:** Aceptada  
**Área:** Datos/Técnica  
**Bloqueante:** Sí  
**Recomendación:** Migraciones versionadas, mínimas y derivadas del dominio.

## Contexto

Esta decisión forma parte del cierre fundacional de VipWeb previo al Sprint 0. Debe considerarse vigente salvo que una ADR posterior la reemplace explícitamente.

## Decisión

VipWeb tendrá schemas físicos mínimos mediante migraciones SQL planas y reversibles en `database/migrations/*.sql`: identidad, permisos, módulos, eventos, auditoría, IA, evidencias, contexto, gamificación básica e integraciones preparadas.

## Motivo

Evita tablas improvisadas y soporta core/MVP.

## Contrato ejecutable cerrado

- Formato canónico: `.sql`.
- Carpeta canónica: `database/migrations/`.
- Orden canónico: `machine/relationships.json::migration_order`.
- Las constraints FK se incluyen en la migración de la tabla que contiene la FK.
- No se aceptan referencias `database/migrations/*.php`, `migrations/*.sql` ni `*_relation.sql` en catálogos vigentes.

## Consecuencias

- Migraciones no se editan una vez aplicadas.
- Seeds iniciales para roles, permisos, módulos y owner.
- No tablas de pagos, marketplace ni analítica avanzada al inicio.

## Dependencias

- ADR-006
- ADR-004
- ADR-023

## Documentos afectados

- `docs/05-domain-data/01-entities.md`
- `docs/06-technical/02-project-structure.md`

## Riesgos mitigados o residuales

- Base de datos caótica y difícil de revertir.

## Revisión futura

Solo debe revisarse si cambia el entorno real del proyecto, si se incorpora Git/despliegue externo, si el MVP cambia de alcance o si un módulo futuro introduce requisitos incompatibles.

## Endurecimiento post-auditoría

La reversibilidad queda formalizada mediante `machine/migration_contracts.json`, con `up_ref`, `rollback_ref`, checksum obligatorio y ledger local `schema_migrations`. Los rollbacks viven separados de los SQL de subida para reducir riesgo operativo en WAMP/phpMyAdmin.


## Decisión complementaria post-auditoría

El ledger `schema_migrations` deja de ser una convención implícita y pasa a ser artefacto físico obligatorio mediante `database/migrations/000_create_schema_migrations.sql`, con rollback separado en `database/rollbacks/000_rollback_create_schema_migrations.sql`.

`database/manifest.json` registra integridad de archivos SQL; `schema_migrations` registra aplicación real en la base local. Sprint 0 distingue validación de SQL, ejecución de migraciones y evidencia de aplicación.
