-- MIG-008 ModuleManifest -> module_manifests
-- Generado desde machine/column_contracts.json y machine/physical_constraints_matrix.json.
-- Sprint 0: ejecutar solo tras backup local, verificación WAMP y registro en evidence/sprint-0-local-execution.md.
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;
CREATE TABLE IF NOT EXISTS `module_manifests` (
  `id` CHAR(36) NOT NULL,
  `module_id` CHAR(36) NOT NULL,
  `manifest_version` VARCHAR(80) NOT NULL,
  `manifest_json` JSON NOT NULL,
  `checksum` CHAR(64) NOT NULL,
  `status` VARCHAR(40) NOT NULL,
  `created_at` DATETIME(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_module_manifests_module_id_manifest_version` (`module_id`, `manifest_version`),
  KEY `idx_module_manifests_module_id` (`module_id`),
  CONSTRAINT `fk_module_manifests_module_id` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET FOREIGN_KEY_CHECKS = 1;
