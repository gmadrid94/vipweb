-- Rollback MIG-013 EvidenceReport -> evidence_reports
-- Ejecutar solo en Sprint 0 antes de datos reales de usuario o restaurando backup local.
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `evidence_reports`;
SET FOREIGN_KEY_CHECKS = 1;
