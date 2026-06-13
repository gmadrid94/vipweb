-- Rollback MIG-007 Module -> modules
-- Ejecutar solo en Sprint 0 antes de datos reales de usuario o restaurando backup local.
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `modules`;
SET FOREIGN_KEY_CHECKS = 1;
