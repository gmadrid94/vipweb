-- MIG-000 SchemaMigrationLedger -> schema_migrations
-- Bootstrap técnico del ledger local de migraciones.
-- Sprint 0: ejecutar antes de cualquier otra migración SQL.
SET NAMES utf8mb4;
CREATE TABLE IF NOT EXISTS `schema_migrations` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration_id` VARCHAR(120) NOT NULL,
  `up_ref` VARCHAR(255) NOT NULL,
  `rollback_ref` VARCHAR(255) NULL,
  `checksum` CHAR(64) NOT NULL,
  `checksum_algorithm` VARCHAR(20) NOT NULL DEFAULT 'sha256',
  `applied_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `applied_by` VARCHAR(120) NOT NULL,
  `status` ENUM('applied','rolled_back','failed') NOT NULL DEFAULT 'applied',
  `evidence_ref` VARCHAR(255) NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_schema_migrations_migration_id` (`migration_id`),
  KEY `idx_schema_migrations_status` (`status`),
  KEY `idx_schema_migrations_applied_at` (`applied_at`),
  CONSTRAINT `chk_schema_migrations_checksum_algorithm` CHECK (`checksum_algorithm` = 'sha256'),
  CONSTRAINT `chk_schema_migrations_checksum_format` CHECK (`checksum` REGEXP '^[a-f0-9]{64}$')
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
