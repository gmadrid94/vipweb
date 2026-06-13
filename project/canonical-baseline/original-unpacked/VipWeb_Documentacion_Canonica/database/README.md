# Database Sprint 0

Artefactos SQL físicos base generados desde contratos machine-readable y todavía no ejecutados localmente.

Estado canónico de artefactos: `generated_not_executed`.

- `migrations/*.sql`: creación de tablas iniciales.
- `rollbacks/*.sql`: reversión de cada migración antes de datos reales.
- `seeds/*.sql`: datos mínimos de roles, permisos, módulos, configuración y owner local protegido.
- `manifest.json`: integridad SHA-256 de migraciones, rollbacks y seeds.

Reglas:

1. Ejecutar solo tras `S0-000`, `S0-001`, `S0-003` y `S0-000A` si aplica.
2. Validar antes de ejecutar con `scripts/update_script.py`.
3. Registrar ejecución en `evidence/sprint-0-local-execution.md` y evidencia fechada.
4. No modificar manualmente una migración aplicada; crear nueva migración o restaurar backup.
5. No recrear ni sobrescribir SQL existente salvo regeneración aprobada y trazada.
6. No usar seeds para activar módulos post-MVP ni permisos IA críticos no aprobados.
7. Si cambia cualquier `.sql`, actualizar `database/manifest.json` y regenerar evidencia.


## Ledger de migraciones

`database/migrations/000_create_schema_migrations.sql` crea el ledger local `schema_migrations` y debe ejecutarse antes de cualquier migración funcional. `database/manifest.json` valida integridad de archivos; `schema_migrations` registra estado aplicado en la base WAMP local.
