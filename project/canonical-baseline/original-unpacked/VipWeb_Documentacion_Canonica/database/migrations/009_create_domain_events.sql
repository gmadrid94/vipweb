-- MIG-009 DomainEvent -> domain_events
-- Generado desde machine/column_contracts.json y machine/physical_constraints_matrix.json.
-- Sprint 0: ejecutar solo tras backup local, verificación WAMP y registro en evidence/sprint-0-local-execution.md.
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;
CREATE TABLE IF NOT EXISTS `domain_events` (
  `id` CHAR(36) NOT NULL,
  `event_id` CHAR(36) NOT NULL,
  `event_version` INT NOT NULL,
  `producer_module` VARCHAR(255) NOT NULL,
  `payload_json` JSON NOT NULL,
  `privacy_level` VARCHAR(40) NOT NULL,
  `created_at` DATETIME(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_domain_events_event_id` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET FOREIGN_KEY_CHECKS = 1;
