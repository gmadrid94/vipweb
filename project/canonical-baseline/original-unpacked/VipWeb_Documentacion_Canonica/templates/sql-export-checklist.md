# Checklist de exportación SQL

1. Abrir phpMyAdmin desde WAMP.
2. Seleccionar la base de datos de VipWeb.
3. Ir a **Exportar**.
4. Usar formato SQL.
5. Guardar el archivo en la carpeta del backup local.
6. Verificar que el archivo existe y no está vacío.
7. Registrar nombre y ruta en `evidence/sprint-0-local-execution.md`.
8. No continuar con cambios de base de datos si la exportación no se ha comprobado.

## Migraciones reversibles

- Confirmar que cada `database/migrations/*.sql` está declarado en `machine/migration_contracts.json`.
- Confirmar que existe `rollback_ref` separado bajo `database/rollbacks/`.
- Registrar checksum y estado en `schema_migrations`.
- No ejecutar rollback en datos reales sin aprobación humana y backup verificado.
