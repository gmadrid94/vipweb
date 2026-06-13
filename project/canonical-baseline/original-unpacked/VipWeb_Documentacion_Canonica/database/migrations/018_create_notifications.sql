-- MIG-018 Notification -> notifications
-- Generado desde machine/column_contracts.json y machine/physical_constraints_matrix.json.
-- Sprint 0: ejecutar solo tras backup local, verificación WAMP y registro en evidence/sprint-0-local-execution.md.
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;
CREATE TABLE IF NOT EXISTS `notifications` (
  `id` CHAR(36) NOT NULL,
  `user_id` CHAR(36) NULL,
  `type` VARCHAR(40) NOT NULL,
  `title` VARCHAR(160) NOT NULL,
  `body` TEXT NOT NULL,
  `read_at` DATETIME(3) NULL,
  `created_at` DATETIME(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_notifications_created_at` (`created_at`),
  KEY `idx_notifications_read_at` (`read_at`),
  KEY `idx_notifications_user_id` (`user_id`),
  CONSTRAINT `fk_notifications_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET FOREIGN_KEY_CHECKS = 1;
