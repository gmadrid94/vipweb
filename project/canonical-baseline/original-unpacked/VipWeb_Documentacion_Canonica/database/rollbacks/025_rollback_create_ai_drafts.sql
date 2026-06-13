-- Rollback MIG-025 AIDraft -> ai_drafts
-- Ejecutar solo en Sprint 0 antes de datos reales de usuario o restaurando backup local.
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `ai_drafts`;
SET FOREIGN_KEY_CHECKS = 1;
