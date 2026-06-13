-- MIG-024 Integration -> integrations
-- Generado desde machine/column_contracts.json y machine/physical_constraints_matrix.json.
-- Sprint 0: ejecutar solo tras backup local, verificación WAMP y registro en evidence/sprint-0-local-execution.md.
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;
CREATE TABLE IF NOT EXISTS `integrations` (
  `id` CHAR(36) NOT NULL,
  `module_id` CHAR(36) NOT NULL,
  `code` VARCHAR(80) NOT NULL,
  `provider` VARCHAR(40) NOT NULL,
  `status` VARCHAR(40) NOT NULL,
  `config_json` JSON NOT NULL,
  `created_at` DATETIME(3) NOT NULL,
  `updated_at` DATETIME(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_integrations_code` (`code`),
  KEY `idx_integrations_module_id` (`module_id`),
  KEY `idx_integrations_status` (`status`),
  CONSTRAINT `fk_integrations_module_id` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET FOREIGN_KEY_CHECKS = 1;
