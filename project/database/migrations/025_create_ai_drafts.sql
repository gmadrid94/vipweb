-- MIG-025 AIDraft -> ai_drafts
-- Generado desde machine/column_contracts.json y machine/physical_constraints_matrix.json.
-- Sprint 0: ejecutar solo tras backup local, verificación WAMP y registro en evidence/sprint-0-local-execution.md.
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;
CREATE TABLE IF NOT EXISTS `ai_drafts` (
  `id` CHAR(36) NOT NULL,
  `approval_id` CHAR(36) NOT NULL,
  `ai_action_log_id` CHAR(36) NOT NULL,
  `target_doc` VARCHAR(500) NOT NULL,
  `draft_type` VARCHAR(60) NOT NULL,
  `instructions_summary` TEXT NOT NULL,
  `content_markdown` MEDIUMTEXT NOT NULL,
  `files_read_json` JSON NOT NULL,
  `proposed_files_changed_json` JSON NOT NULL,
  `risk_level` VARCHAR(40) NOT NULL,
  `status` VARCHAR(60) NOT NULL,
  `created_at` DATETIME(3) NOT NULL,
  `reviewed_at` DATETIME(3) NULL,
  `discarded_at` DATETIME(3) NULL,
  `approved_for_manual_apply_at` DATETIME(3) NULL,
  `applied_at` DATETIME(3) NULL,
  `applied_by` VARCHAR(255) NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_ai_drafts_approval_id` (`approval_id`),
  UNIQUE KEY `uq_ai_drafts_ai_action_log_id` (`ai_action_log_id`),
  KEY `idx_ai_drafts_ai_action_log_id` (`ai_action_log_id`),
  KEY `idx_ai_drafts_applied_by` (`applied_by`),
  KEY `idx_ai_drafts_approval_id` (`approval_id`),
  KEY `idx_ai_drafts_created_at` (`created_at`),
  KEY `idx_ai_drafts_draft_type` (`draft_type`),
  KEY `idx_ai_drafts_risk_level` (`risk_level`),
  KEY `idx_ai_drafts_status` (`status`),
  CONSTRAINT `fk_ai_drafts_approval_id` FOREIGN KEY (`approval_id`) REFERENCES `approval_records` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_ai_drafts_ai_action_log_id` FOREIGN KEY (`ai_action_log_id`) REFERENCES `ai_action_logs` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET FOREIGN_KEY_CHECKS = 1;
