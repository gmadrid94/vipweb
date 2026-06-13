-- Rollback MIG-021 GamificationRuleState -> gamification_rule_states
-- Ejecutar solo en Sprint 0 antes de datos reales de usuario o restaurando backup local.
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `gamification_rule_states`;
SET FOREIGN_KEY_CHECKS = 1;
