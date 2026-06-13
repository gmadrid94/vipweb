-- MIG-020 UserAchievement -> user_achievements
-- Generado desde machine/column_contracts.json y machine/physical_constraints_matrix.json.
-- Sprint 0: ejecutar solo tras backup local, verificación WAMP y registro en evidence/sprint-0-local-execution.md.
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;
CREATE TABLE IF NOT EXISTS `user_achievements` (
  `id` CHAR(36) NOT NULL,
  `user_id` CHAR(36) NOT NULL,
  `achievement_id` CHAR(36) NOT NULL,
  `source_event_id` CHAR(36) NULL,
  `source_rule_id` CHAR(36) NULL,
  `unlocked_at` DATETIME(3) NOT NULL,
  `created_at` DATETIME(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_user_achievements_user_id_achievement_id` (`user_id`, `achievement_id`),
  KEY `idx_user_achievements_achievement_id` (`achievement_id`),
  KEY `idx_user_achievements_source_event_id` (`source_event_id`),
  KEY `idx_user_achievements_source_rule_id` (`source_rule_id`),
  KEY `idx_user_achievements_unlocked_at` (`unlocked_at`),
  KEY `idx_user_achievements_user_id` (`user_id`),
  CONSTRAINT `fk_user_achievements_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_user_achievements_achievement_id` FOREIGN KEY (`achievement_id`) REFERENCES `achievements` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_user_achievements_source_event_id` FOREIGN KEY (`source_event_id`) REFERENCES `domain_events` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET FOREIGN_KEY_CHECKS = 1;
