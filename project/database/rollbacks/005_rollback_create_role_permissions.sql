-- Rollback MIG-005 RolePermission -> role_permissions
-- Ejecutar solo en Sprint 0 antes de datos reales de usuario o restaurando backup local.
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `role_permissions`;
SET FOREIGN_KEY_CHECKS = 1;
