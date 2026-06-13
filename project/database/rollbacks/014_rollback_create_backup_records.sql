-- Rollback MIG-014 BackupRecord -> backup_records
-- Ejecutar solo en Sprint 0 antes de datos reales de usuario o restaurando backup local.
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `backup_records`;
SET FOREIGN_KEY_CHECKS = 1;
