-- MIG-019 Achievement -> achievements
-- Generado desde machine/column_contracts.json y machine/physical_constraints_matrix.json.
-- Sprint 0: ejecutar solo tras backup local, verificación WAMP y registro en evidence/sprint-0-local-execution.md.
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;
CREATE TABLE IF NOT EXISTS `achievements` (
  `id` CHAR(36) NOT NULL,
  `code` VARCHAR(80) NOT NULL,
  `label` VARCHAR(160) NOT NULL,
  `description` TEXT NOT NULL,
  `condition_json` JSON NOT NULL,
  `achievement_type` VARCHAR(40) NOT NULL,
  `active` TINYINT(1) NOT NULL,
  `created_at` DATETIME(3) NOT NULL,
  `updated_at` DATETIME(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_achievements_code` (`code`),
  KEY `idx_achievements_achievement_type` (`achievement_type`),
  KEY `idx_achievements_active` (`active`),
  KEY `idx_achievements_code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET FOREIGN_KEY_CHECKS = 1;
