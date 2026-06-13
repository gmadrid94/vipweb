-- Rollback MIG-009 DomainEvent -> domain_events
-- Ejecutar solo en Sprint 0 antes de datos reales de usuario o restaurando backup local.
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `domain_events`;
SET FOREIGN_KEY_CHECKS = 1;
