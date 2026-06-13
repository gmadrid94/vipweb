-- Rollback MIG-008 ModuleManifest -> module_manifests
-- Ejecutar solo en Sprint 0 antes de datos reales de usuario o restaurando backup local.
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `module_manifests`;
SET FOREIGN_KEY_CHECKS = 1;
