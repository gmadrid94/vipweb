# Índice documental vigente

Este directorio contiene documentación activa de VipWeb. El índice referencia únicamente documentos canónicos existentes dentro del paquete.

## Lectura inicial

1. `../README.md`
2. `../CURRENT_STATUS.md`
3. `00-foundation/99-ready-to-build-status.md`
4. `12-decisions/00-decision-log.md`
5. `06-technical/10-wamp-local-workflow.md`
6. `11-backlog/06-sprint-0-ejecutable.md`
7. `13-quality/05-traceability-matrix.md`
8. `13-quality/06-doctor-checks.md`
9. `13-quality/07-mvp-coverage-matrix.md`
10. `09-ai-operations/10-ai-context-trust-policy.md`
11. `07-design-ux/08-screen-component-contracts.md`
12. `01-business/07-mvp-qualitative-validation.md`

## Criterio de canon

La documentación histórica, archivada o no canónica no forma parte de la fuente operativa de implementación. Cualquier referencia documental activa debe resolver a un archivo existente dentro de este paquete canónico.

## Validación

`scripts/update_script.py` es el validador documental ejecutable actual. Comprueba estructura, JSON, schemas machine-readable, checksums SQL, identidad canónica, estado operativo, layout de raíz limpia y referencias internas. Las rutas de este índice son relativas a `PROJECT_CONTROL_ROOT`.
