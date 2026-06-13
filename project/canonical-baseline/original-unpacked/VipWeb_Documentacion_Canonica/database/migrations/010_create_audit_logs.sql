-- MIG-010 AuditLog -> audit_logs
-- Generado desde machine/column_contracts.json y machine/physical_constraints_matrix.json.
-- Sprint 0: ejecutar solo tras backup local, verificación WAMP y registro en evidence/sprint-0-local-execution.md.
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;
CREATE TABLE IF NOT EXISTS `audit_logs` (
  `id` CHAR(36) NOT NULL,
  `actor_type` VARCHAR(40) NOT NULL,
  `actor_id` CHAR(36) NOT NULL,
  `action` VARCHAR(40) NOT NULL,
  `target_type` VARCHAR(40) NOT NULL,
  `target_id` CHAR(36) NOT NULL,
  `risk_level` VARCHAR(40) NOT NULL,
  `created_at` DATETIME(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_audit_logs_actor_id` (`actor_id`),
  KEY `idx_audit_logs_actor_type` (`actor_type`),
  KEY `idx_audit_logs_created_at` (`created_at`),
  KEY `idx_audit_logs_target_id` (`target_id`),
  KEY `idx_audit_logs_target_type` (`target_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
-- Nota: REL-010 usa relación polimórfica sobre audit_logs.target_id; validar en aplicación/audit policy, no como FK física única.
-- Nota: REL-012 usa relación polimórfica sobre audit_logs.target_id; validar en aplicación/audit policy, no como FK física única.
SET FOREIGN_KEY_CHECKS = 1;
