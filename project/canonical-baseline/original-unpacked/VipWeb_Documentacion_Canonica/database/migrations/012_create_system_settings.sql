-- MIG-012 SystemSetting -> system_settings
-- Generado desde machine/column_contracts.json y machine/physical_constraints_matrix.json.
-- Sprint 0: ejecutar solo tras backup local, verificación WAMP y registro en evidence/sprint-0-local-execution.md.
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;
CREATE TABLE IF NOT EXISTS `system_settings` (
  `id` CHAR(36) NOT NULL,
  `key` VARCHAR(80) NOT NULL,
  `value_json` JSON NOT NULL,
  `scope` JSON NOT NULL,
  `is_secret` TINYINT(1) NOT NULL,
  `created_at` DATETIME(3) NOT NULL,
  `updated_at` DATETIME(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_system_settings_key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET FOREIGN_KEY_CHECKS = 1;
