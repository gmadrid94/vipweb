# Changelog — baseline 1.2 AI-first

## Cambios

- Añadido modelo local AI-first para ejecución con GPT + Codex + tools externas.
- Declarada estructura hermana bajo `C:/wamp64/www`: `vipweb`, `vipweb_backups`, `vipweb_tools`.
- Diferenciadas tools internas `vipweb/tools` y externas `vipweb_tools`.
- Declarado `PUBLIC_DOCUMENT_ROOT = C:/wamp64/www/vipweb/public` como hecho operativo a verificar.
- Añadida ADR-030 aceptada.
- Añadido `machine/external_tool_contracts.json` y schema asociado.
- Actualizado Sprint 0 para exigir logs externos y revisión GPT donde aplique.
- Conservado bloqueo de desarrollo visible hasta evidencia local real.

## No cambia

- No se declara Sprint 0 ejecutado.
- No se declara `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT`.
- No se declaran migraciones/seeds ejecutados.
- No se inventa commit baseline.
- No se activa ADR-026 sin activation_record local real.
