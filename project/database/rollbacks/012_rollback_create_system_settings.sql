-- Rollback MIG-012 SystemSetting -> system_settings
-- Ejecutar solo en Sprint 0 antes de datos reales de usuario o restaurando backup local.
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `system_settings`;
SET FOREIGN_KEY_CHECKS = 1;
