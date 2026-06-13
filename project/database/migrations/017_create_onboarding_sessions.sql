-- MIG-017 OnboardingSession -> onboarding_sessions
-- Generado desde machine/column_contracts.json y machine/physical_constraints_matrix.json.
-- Sprint 0: ejecutar solo tras backup local, verificación WAMP y registro en evidence/sprint-0-local-execution.md.
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;
CREATE TABLE IF NOT EXISTS `onboarding_sessions` (
  `id` CHAR(36) NOT NULL,
  `user_id` CHAR(36) NOT NULL,
  `status` VARCHAR(40) NOT NULL,
  `current_step` VARCHAR(80) NOT NULL,
  `started_at` DATETIME(3) NOT NULL,
  `completed_at` DATETIME(3) NULL,
  `updated_at` DATETIME(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_onboarding_sessions_status` (`status`),
  KEY `idx_onboarding_sessions_user_id` (`user_id`),
  CONSTRAINT `fk_onboarding_sessions_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET FOREIGN_KEY_CHECKS = 1;
