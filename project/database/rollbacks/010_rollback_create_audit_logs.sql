-- Rollback MIG-010 AuditLog -> audit_logs
-- Ejecutar solo en Sprint 0 antes de datos reales de usuario o restaurando backup local.
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `audit_logs`;
SET FOREIGN_KEY_CHECKS = 1;
