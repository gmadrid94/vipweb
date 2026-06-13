-- Seed protegido de owner local.
-- Antes de ejecutar, sustituir REPLACE_WITH_LOCAL_OWNER_EMAIL y REPLACE_WITH_BCRYPT_HASH por valores locales.
-- No usar credenciales reales en documentación ni commits.
-- Este archivo debe fallar de forma cerrada si conserva placeholders.
SET @owner_email := 'REPLACE_WITH_LOCAL_OWNER_EMAIL';
SET @owner_password_hash := 'REPLACE_WITH_BCRYPT_HASH';
SET @owner_ready := (
  @owner_email <> 'REPLACE_WITH_LOCAL_OWNER_EMAIL'
  AND @owner_password_hash <> 'REPLACE_WITH_BCRYPT_HASH'
  AND @owner_email NOT LIKE '%REPLACE_WITH%'
  AND @owner_password_hash NOT LIKE '%REPLACE_WITH%'
  AND CHAR_LENGTH(@owner_password_hash) > 30
);
SET @owner_guard_message := 'Debe reemplazarse email/hash local antes de ejecutar 003_seed_local_owner_template.sql';

DELIMITER //
CREATE PROCEDURE assert_owner_seed_ready()
BEGIN
  IF @owner_ready = 0 THEN
    SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Owner seed aborted: replace owner email and password hash before execution.';
  END IF;
END//
DELIMITER ;

CALL assert_owner_seed_ready();
DROP PROCEDURE assert_owner_seed_ready;

START TRANSACTION;
INSERT INTO `users` (`id`,`email`,`password_hash`,`display_name`,`status`,`created_at`,`updated_at`,`deleted_at`)
SELECT '6253bebd-f30e-59a8-85a0-02d13a4b9c23', @owner_email, @owner_password_hash, 'Owner local', 'active', CURRENT_TIMESTAMP(3), CURRENT_TIMESTAMP(3), NULL
WHERE @owner_ready = 1;
INSERT IGNORE INTO `user_roles` (`user_id`,`role_id`,`created_at`)
SELECT '6253bebd-f30e-59a8-85a0-02d13a4b9c23', '08795572-261b-5f32-b2eb-cfa0d790be15', CURRENT_TIMESTAMP(3)
WHERE @owner_ready = 1;
COMMIT;
