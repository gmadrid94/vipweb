-- MIG-021 GamificationRuleState -> gamification_rule_states
-- Generado desde machine/column_contracts.json y machine/physical_constraints_matrix.json.
-- Sprint 0: ejecutar solo tras backup local, verificación WAMP y registro en evidence/sprint-0-local-execution.md.
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;
CREATE TABLE IF NOT EXISTS `gamification_rule_states` (
  `id` CHAR(36) NOT NULL,
  `user_id` CHAR(36) NOT NULL,
  `rule_id` CHAR(36) NOT NULL,
  `cooldown_type` VARCHAR(40) NOT NULL,
  `cooldown_scope_key` VARCHAR(80) NOT NULL,
  `window_start` DATETIME(3) NOT NULL,
  `window_end` DATETIME(3) NOT NULL,
  `last_source_event_id` CHAR(36) NULL,
  `created_at` DATETIME(3) NOT NULL,
  `updated_at` DATETIME(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_gamification_rule_states_user_id_rule_id_cooldown_scope_k` (`user_id`, `rule_id`, `cooldown_scope_key`, `window_start`),
  KEY `idx_gamification_rule_states_cooldown_scope_key` (`cooldown_scope_key`),
  KEY `idx_gamification_rule_states_last_source_event_id` (`last_source_event_id`),
  KEY `idx_gamification_rule_states_rule_id` (`rule_id`),
  KEY `idx_gamification_rule_states_user_id` (`user_id`),
  KEY `idx_gamification_rule_states_window_end` (`window_end`),
  KEY `idx_gamification_rule_states_window_start` (`window_start`),
  CONSTRAINT `fk_gamification_rule_states_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_gamification_rule_states_last_source_event_id` FOREIGN KEY (`last_source_event_id`) REFERENCES `domain_events` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
SET FOREIGN_KEY_CHECKS = 1;
