-- MIG-006 UserRole -> user_roles
-- Generado desde machine/column_contracts.json y machine/physical_constraints_matrix.json.
-- Sprint 0: ejecutar solo tras backup local, verificación WAMP y registro en evidence/sprint-0-local-execution.md.
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;
CREATE TABLE IF NOT EXISTS `user_roles` (
  `user_id` CHAR(36) NOT NULL,
  `role_id` CHAR(36) NOT NULL,
  `created_at` DATETIME(3) NOT NULL,
  PRIMARY KEY (`user_id`, `role_id`),
  UNIQUE KEY `uq_user_roles_user_id_role_id` (`user_id`, `role_id`),
  KEY `idx_user_roles_role_id` (`role_id`),
  KEY `idx_user_roles_user_id` (`user_id`),
  CONSTRAINT `fk_user_roles_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_user_roles_role_id` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET FOREIGN_KEY_CHECKS = 1;
