-- Rollback MIG-006 UserRole -> user_roles
-- Ejecutar solo en Sprint 0 antes de datos reales de usuario o restaurando backup local.
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `user_roles`;
SET FOREIGN_KEY_CHECKS = 1;
