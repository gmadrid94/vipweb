-- MIG-011 ApprovalRecord -> approval_records
-- Generado desde machine/column_contracts.json y machine/physical_constraints_matrix.json.
-- Sprint 0: ejecutar solo tras backup local, verificación WAMP y registro en evidence/sprint-0-local-execution.md.
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;
CREATE TABLE IF NOT EXISTS `approval_records` (
  `id` CHAR(36) NOT NULL,
  `requested_by` VARCHAR(255) NOT NULL,
  `approved_by` VARCHAR(255) NULL,
  `action_type` VARCHAR(40) NOT NULL,
  `permission_requested` VARCHAR(255) NOT NULL,
  `scope` JSON NOT NULL,
  `risk_level` VARCHAR(40) NOT NULL,
  `files_affected` JSON NOT NULL,
  `rollback_plan` TEXT NOT NULL,
  `status` VARCHAR(40) NOT NULL,
  `expires_at` DATETIME(3) NOT NULL,
  `evidence_ref` VARCHAR(500) NULL,
  `created_at` DATETIME(3) NOT NULL,
  `approved_at` DATETIME(3) NULL,
  `consumed_at` DATETIME(3) NULL,
  `scope_hash` CHAR(64) NOT NULL,
  `idempotency_key` VARCHAR(160) NULL,
  `consumed_by_action_id` VARCHAR(160) NULL,
  PRIMARY KEY (`id`),
  KEY `idx_approval_records_action_type` (`action_type`),
  KEY `idx_approval_records_approved_by` (`approved_by`),
  KEY `idx_approval_records_consumed_by_action_id` (`consumed_by_action_id`),
  KEY `idx_approval_records_created_at` (`created_at`),
  KEY `idx_approval_records_expires_at` (`expires_at`),
  KEY `idx_approval_records_idempotency_key` (`idempotency_key`),
  KEY `idx_approval_records_permission_requested` (`permission_requested`),
  KEY `idx_approval_records_scope_hash` (`scope_hash`),
  KEY `idx_approval_records_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET FOREIGN_KEY_CHECKS = 1;
