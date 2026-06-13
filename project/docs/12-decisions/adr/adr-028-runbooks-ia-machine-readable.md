
# ADR-028 — Runbooks IA machine-readable

## Estado

Aceptada.

## Contexto

Los runbooks IA existían como documentación humana en Markdown. Para operar con menor interpretación libre, Doctor e IA necesitan un catálogo estructurado, validable y trazado a permisos, acciones, evidencias y tests.

## Decisión

Todo runbook IA operativo debe existir en `machine/ai_runbooks.json`, validado por `machine/schemas/ai-runbook.schema.json` y enlazado con `machine/action_contracts.json`, `machine/ai_approval_policy.json` y `machine/runtime_test_matrix.json`.

## Consecuencias

- El Markdown conserva explicación humana.
- El JSON prevalece como fuente validable para ejecución, selección y auditoría.
- Acciones sensibles deben declarar aprobación, prohibiciones y fallback.
- Doctor falla ante runbooks huérfanos, sin tests o con acciones sensibles sin ApprovalRecord.

## Documentos afectados

- `machine/ai_runbooks.json`
- `machine/schemas/ai-runbook.schema.json`
- `docs/09-ai-operations/04-ai-runbooks.md`
- `docs/09-ai-operations/07-machine-readable-docs.md`
- `machine/doctor_checks.json`
