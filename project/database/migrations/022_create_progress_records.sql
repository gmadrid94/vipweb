-- MIG-022 ProgressRecord -> progress_records
-- Generado desde machine/column_contracts.json y machine/physical_constraints_matrix.json.
-- Sprint 0: ejecutar solo tras backup local, verificación WAMP y registro en evidence/sprint-0-local-execution.md.
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;
CREATE TABLE IF NOT EXISTS `progress_records` (
  `id` CHAR(36) NOT NULL,
  `user_id` CHAR(36) NOT NULL,
  `source_event_id` CHAR(36) NOT NULL,
  `rule_id` CHAR(36) NOT NULL,
  `effect` VARCHAR(40) NOT NULL,
  `points` INT NOT NULL,
  `cooldown_type` VARCHAR(40) NOT NULL,
  `cooldown_scope_key` VARCHAR(80) NOT NULL,
  `reason` TEXT NOT NULL,
  `created_at` DATETIME(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_progress_records_user_id_source_event_id_rule_id` (`user_id`, `source_event_id`, `rule_id`),
  KEY `idx_progress_records_created_at` (`created_at`),
  KEY `idx_progress_records_effect` (`effect`),
  KEY `idx_progress_records_rule_id` (`rule_id`),
  KEY `idx_progress_records_source_event_id` (`source_event_id`),
  KEY `idx_progress_records_user_id` (`user_id`),
  CONSTRAINT `fk_progress_records_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_progress_records_source_event_id` FOREIGN KEY (`source_event_id`) REFERENCES `domain_events` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET FOREIGN_KEY_CHECKS = 1;
