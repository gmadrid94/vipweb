-- Rollback MIG-001 User -> users
-- Ejecutar solo en Sprint 0 antes de datos reales de usuario o restaurando backup local.
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `users`;
SET FOREIGN_KEY_CHECKS = 1;
