-- MIG-015 DecisionRecord -> decision_records
-- Generado desde machine/column_contracts.json y machine/physical_constraints_matrix.json.
-- Sprint 0: ejecutar solo tras backup local, verificación WAMP y registro en evidence/sprint-0-local-execution.md.
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;
CREATE TABLE IF NOT EXISTS `decision_records` (
  `id` CHAR(36) NOT NULL,
  `adr` VARCHAR(80) NOT NULL,
  `decision_id` CHAR(36) NOT NULL,
  `status` VARCHAR(40) NOT NULL,
  `payload_json` JSON NOT NULL,
  `created_at` DATETIME(3) NOT NULL,
  `updated_at` DATETIME(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_decision_records_decision_id` (`decision_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET FOREIGN_KEY_CHECKS = 1;
