-- MIG-002 AuthAttempt -> auth_attempts
-- Generado desde machine/column_contracts.json y machine/physical_constraints_matrix.json.
-- Sprint 0: ejecutar solo tras backup local, verificación WAMP y registro en evidence/sprint-0-local-execution.md.
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;
CREATE TABLE IF NOT EXISTS `auth_attempts` (
  `id` CHAR(36) NOT NULL,
  `email_hash` CHAR(64) NOT NULL,
  `ip_hash` CHAR(64) NOT NULL,
  `user_id` CHAR(36) NULL,
  `result` VARCHAR(40) NOT NULL,
  `reason` VARCHAR(80) NOT NULL,
  `created_at` DATETIME(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_auth_attempts_created_at` (`created_at`),
  KEY `idx_auth_attempts_email_hash` (`email_hash`),
  KEY `idx_auth_attempts_ip_hash` (`ip_hash`),
  KEY `idx_auth_attempts_reason` (`reason`),
  KEY `idx_auth_attempts_result` (`result`),
  KEY `idx_auth_attempts_user_id` (`user_id`),
  CONSTRAINT `fk_auth_attempts_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET FOREIGN_KEY_CHECKS = 1;
