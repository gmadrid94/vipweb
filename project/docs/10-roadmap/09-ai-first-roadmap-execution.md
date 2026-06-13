# 09 AI-first Roadmap Execution

**Estado recomendado:** `CANONICAL`  
**Fuente machine-readable:** `machine/roadmap_gates.json` y `machine/external_tool_contracts.json`.

## Propósito

Convertir el roadmap en una secuencia ejecutable por GPT + Codex + tools externas locales, sin perder gates humanos, trazabilidad ni reversibilidad.

## Regla por fase

Cada fase debe declarar:

1. objetivo funcional;
2. qué puede preparar Codex dentro del repo;
3. qué no puede hacer Codex directamente;
4. tool externa necesaria si aplica;
5. comando `.bat/.cmd` esperado;
6. log generado;
7. revisión GPT requerida;
8. criterio de avance;
9. rollback.

## Fase 0 — Foundation Hardening

- Codex puede preparar ajustes documentales permitidos.
- Tools externas no deberían modificar el proyecto salvo validaciones/logs.
- Git local debe estar preparado antes del primer cambio protegido preparado por IA.
- Criterio de avance: documentación validada, ADR-030 vigente y S0 preparado.

## Fase 1 — Technical Skeleton / Sprint 0

Fase principal para tools externas.

| Tarea | Codex | Tool externa | Log |
|---|---|---|---|
| S0-000 | Preparar contrato de verificación. | Verificar WAMP/PHP/MySQL/public-root. | `S0-000__check-wamp-env` |
| S0-001 | Preparar política de backup. | Crear backup externo. | `S0-001__create-backup` |
| S0-002 | Preparar checklist SQL. | Exportar SQL o bloquear con razón. | `S0-002__export-sql` |
| S0-009B | Revisar migraciones. | Ejecutar SQL local y registrar ledger. | `S0-009B__run-migrations` |
| S0-010B | Revisar seeds. | Ejecutar seeds locales. | `S0-010B__run-seeds` |
| S0-011 | No modificar. | Ejecutar validador readonly. | `S0-011__run-update-script` |

Criterio de avance: S0-013 cerrado, evidencia manual completa y logs relevantes revisados.

## Fase 2 — Core Runtime

- Codex puede implementar código dentro de `app/`, `config/`, `public/` y `tools/` internos según contratos.
- Tools externas pueden ejecutar tests, Doctor readonly, backups y checks de entorno.
- Cualquier cambio protegido preparado por IA requiere Git limpio, ADR-026 cuando aplique y evidencia.

## Fase 3 — MVP UX Skeleton

- Codex puede implementar AppShell, pantallas y componentes solo tras `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT`.
- Tools externas pueden tomar logs de validación local, no aprobar UX.
- Criterio de avance: estados UI, accesibilidad y permisos validados.

## Fase 4 — Admin Read-only

- Codex puede implementar vistas read-only tras core permissions/audit.
- Tools externas pueden validar logs, rutas y permisos locales.
- No introducir mutaciones admin sin action contract y ApprovalRecord cuando aplique.

## Fase 5 — AI-Assisted Operations

- Codex puede implementar AIActionLog, AIDraft y flujos AI-0/AI-1 dentro de límites.
- Tools externas no representan AI-2 runtime; son operación local ejecutada por owner.
- Criterio de avance: AIActionLog y guardrails activos.

## Fase 6 — Integrations Stub

- Codex puede implementar stubs sin secretos reales.
- Tools externas pueden validar configuración local sin proveedores reales.
- Integraciones reales externas siguen bloqueadas hasta fase/ADR posterior.

## Regla de rollback AI-first

Todo bloque de cambio debe tener:

- backup externo cuando aplique;
- commit previo o baseline;
- log externo si hubo tool;
- validación readonly posterior;
- rollback documentado en evidencia.

## Criterio de no avance

No avanzar si:

- falta log de una tool externa obligatoria;
- el log no fue revisado;
- hay secretos en logs sin tratamiento;
- Git no está limpio para cambios protegidos;
- ADR-026 aplica y no está activada con datos reales;
- la evidencia manual no refleja lo ejecutado.
