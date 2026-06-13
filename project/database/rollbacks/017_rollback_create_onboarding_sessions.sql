-- Rollback MIG-017 OnboardingSession -> onboarding_sessions
-- Ejecutar solo en Sprint 0 antes de datos reales de usuario o restaurando backup local.
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `onboarding_sessions`;
SET FOREIGN_KEY_CHECKS = 1;
