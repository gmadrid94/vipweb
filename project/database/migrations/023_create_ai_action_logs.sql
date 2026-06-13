-- MIG-023 AIActionLog -> ai_action_logs
-- Generado desde machine/column_contracts.json y machine/physical_constraints_matrix.json.
-- Sprint 0: ejecutar solo tras backup local, verificación WAMP y registro en evidence/sprint-0-local-execution.md.
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;
CREATE TABLE IF NOT EXISTS `ai_action_logs` (
  `id` CHAR(36) NOT NULL,
  `actor_type` VARCHAR(40) NOT NULL,
  `actor_id` CHAR(36) NOT NULL,
  `ai_level` VARCHAR(40) NOT NULL,
  `action_type` VARCHAR(40) NOT NULL,
  `permission_used` VARCHAR(40) NOT NULL,
  `target_type` VARCHAR(40) NOT NULL,
  `target_id` CHAR(36) NULL,
  `scope` JSON NOT NULL,
  `files_read` JSON NOT NULL,
  `files_changed` JSON NOT NULL,
  `approval_id` CHAR(36) NULL,
  `evidence_ref` VARCHAR(500) NULL,
  `risk_level` VARCHAR(40) NOT NULL,
  `status` VARCHAR(40) NOT NULL,
  `result` VARCHAR(40) NOT NULL,
  `error_summary` TEXT NULL,
  `created_at` DATETIME(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_ai_action_logs_action_type` (`action_type`),
  KEY `idx_ai_action_logs_actor_id` (`actor_id`),
  KEY `idx_ai_action_logs_actor_type` (`actor_type`),
  KEY `idx_ai_action_logs_ai_level` (`ai_level`),
  KEY `idx_ai_action_logs_approval_id` (`approval_id`),
  KEY `idx_ai_action_logs_created_at` (`created_at`),
  KEY `idx_ai_action_logs_permission_used` (`permission_used`),
  KEY `idx_ai_action_logs_result` (`result`),
  KEY `idx_ai_action_logs_status` (`status`),
  KEY `idx_ai_action_logs_target_id` (`target_id`),
  CONSTRAINT `fk_ai_action_logs_approval_id` FOREIGN KEY (`approval_id`) REFERENCES `approval_records` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET FOREIGN_KEY_CHECKS = 1;
