# Scripts operativos

El único script ejecutable conservado en la baseline canónica documental es:

```bash
python scripts/update_script.py
```

## Decisión canónica

El único validador documental ejecutable de esta baseline es `scripts/update_script.py`. Doctor queda definido como módulo, contrato runtime futuro y catálogo machine-readable mediante `machine/doctor_checks.json`.

## Alcance de `update_script.py`

Valida:

- presencia de rutas obligatorias;
- parseo de JSON;
- validación de `machine/machine_manifest.json`;
- existencia de archivos, schemas y documentos referenciados por `machine/machine_manifest.json`;
- validación de todos los JSON listados en `machine/machine_manifest.json` contra sus schemas;
- validación de `machine/sprint0_tasks.json` contra `machine/schemas/sprint0-task.schema.json`;
- cobertura en `machine/doctor_checks.json` de los checks emitidos por el propio validador;
- checksums SHA-256 de `database/manifest.json`;
- ausencia de nomenclatura retirada;
- identidad canónica VipWeb;
- rutas internas a documentación conservada;
- estado operativo `READY_FOR_SPRINT_0`.

El script no modifica archivos, no ejecuta migraciones, no ejecuta seeds y no genera evidencia. La evidencia local se completa manualmente en `evidence/sprint-0-local-execution.md`.
