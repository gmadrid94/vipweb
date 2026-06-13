-- Rollback MIG-004 Permission -> permissions
-- Ejecutar solo en Sprint 0 antes de datos reales de usuario o restaurando backup local.
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `permissions`;
SET FOREIGN_KEY_CHECKS = 1;
