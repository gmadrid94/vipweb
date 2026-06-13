-- Rollback MIG-000 SchemaMigrationLedger
-- Solo permitido en Sprint 0 antes de datos reales y con backup local.
DROP TABLE IF EXISTS `schema_migrations`;
