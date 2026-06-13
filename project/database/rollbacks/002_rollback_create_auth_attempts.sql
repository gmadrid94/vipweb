-- Rollback MIG-002 AuthAttempt -> auth_attempts
-- Ejecutar solo en Sprint 0 antes de datos reales de usuario o restaurando backup local.
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `auth_attempts`;
SET FOREIGN_KEY_CHECKS = 1;
