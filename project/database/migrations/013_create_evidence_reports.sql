-- MIG-013 EvidenceReport -> evidence_reports
-- Generado desde machine/column_contracts.json y machine/physical_constraints_matrix.json.
-- Sprint 0: ejecutar solo tras backup local, verificación WAMP y registro en evidence/sprint-0-local-execution.md.
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;
CREATE TABLE IF NOT EXISTS `evidence_reports` (
  `id` CHAR(36) NOT NULL,
  `kind` VARCHAR(40) NOT NULL,
  `status` VARCHAR(40) NOT NULL,
  `payload_json` JSON NOT NULL,
  `checksum` CHAR(64) NOT NULL,
  `created_at` DATETIME(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_evidence_reports_created_at` (`created_at`),
  KEY `idx_evidence_reports_kind` (`kind`),
  KEY `idx_evidence_reports_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET FOREIGN_KEY_CHECKS = 1;
