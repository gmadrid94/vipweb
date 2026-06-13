-- MIG-005 RolePermission -> role_permissions
-- Generado desde machine/column_contracts.json y machine/physical_constraints_matrix.json.
-- Sprint 0: ejecutar solo tras backup local, verificación WAMP y registro en evidence/sprint-0-local-execution.md.
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;
CREATE TABLE IF NOT EXISTS `role_permissions` (
  `role_id` CHAR(36) NOT NULL,
  `permission_id` CHAR(36) NOT NULL,
  `created_at` DATETIME(3) NOT NULL,
  PRIMARY KEY (`role_id`, `permission_id`),
  UNIQUE KEY `uq_role_permissions_role_id_permission_id` (`role_id`, `permission_id`),
  KEY `idx_role_permissions_permission_id` (`permission_id`),
  KEY `idx_role_permissions_role_id` (`role_id`),
  CONSTRAINT `fk_role_permissions_role_id` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_role_permissions_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET FOREIGN_KEY_CHECKS = 1;
