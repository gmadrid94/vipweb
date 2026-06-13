-- MIG-007 Module -> modules
-- Generado desde machine/column_contracts.json y machine/physical_constraints_matrix.json.
-- Sprint 0: ejecutar solo tras backup local, verificación WAMP y registro en evidence/sprint-0-local-execution.md.
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;
CREATE TABLE IF NOT EXISTS `modules` (
  `id` CHAR(36) NOT NULL,
  `code` VARCHAR(80) NOT NULL,
  `name` VARCHAR(160) NOT NULL,
  `module_type` VARCHAR(40) NOT NULL,
  `phase` VARCHAR(40) NOT NULL,
  `lifecycle_status` VARCHAR(40) NOT NULL,
  `enabled` TINYINT(1) NOT NULL,
  `created_at` DATETIME(3) NOT NULL,
  `updated_at` DATETIME(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_modules_code` (`code`),
  KEY `idx_modules_code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET FOREIGN_KEY_CHECKS = 1;
