---
adr_id: ADR-026
status: proposed_conditional
counts_as_accepted_adr: false
activation_trigger: ADR-021_TRIGGER
activation_required_before:
  - applying_ai_prepared_changes_to_protected_files
  - modifying_machine_catalogs
  - modifying_schemas
  - modifying_migrations
  - modifying_runtime_contracts
source_catalog: machine/proposed_decisions.json
---

# ADR-026 — Introducción de Git local y control de versiones mínimo

**Estado:** Propuesta condicional / pendiente de activación por owner humano  
**Área:** Operación local / control de cambios  
**Bloqueante:** Condicional  
**Recomendación:** Mantener WAMP/no Git como flujo vigente para Sprint 0 manual, pero activar Git local mínimo cuando el trigger de cambios protegidos preparados por IA aplique.

## Contexto

VipWeb mantiene como flujo vigente Sprint 0/Core Runtime local en Windows/WAMP, sin Git, repositorio remoto, staging real ni despliegue externo.

ADR-021 permite este flujo mientras los cambios sean lineales, pequeños y recuperables mediante backup completo de carpeta, export SQL, Doctor, evidencia y `evidence/sprint-0-local-execution.md`.

La auditoría senior detectó que los cambios generados o preparados por IA sobre zonas protegidas necesitan una capa adicional de diff, trazabilidad y rollback parcial antes de aplicarse sobre archivos reales.

## Decisión propuesta

ADR-026 debe comportarse como **gate obligatorio condicionado**.

No bloquea:

- lectura documental;
- auditoría IA;
- propuestas de cambio;
- creación de `AIDraft` no aplicado;
- ejecución de Doctor readonly;
- escritura de evidencia append-only aprobada;
- Sprint 0 manual sin cambios protegidos preparados por IA.

Sí bloquea la aplicación real de cambios preparados o generados por IA cuando el cambio afecte a archivos protegidos.

Cuando el trigger aplique, el owner humano debe aceptar/activar esta ADR antes de aplicar el cambio real. La IA puede detectar el trigger y recomendar activación, pero no puede activar esta ADR por sí misma.

## Trigger obligatorio

ADR-026 debe activarse antes de aplicar un cambio real si se cumplen simultáneamente estas condiciones:

1. El origen del cambio es `ai_generated` o `ai_prepared`.
2. El cambio se aplicará sobre archivos reales, no solo sobre un borrador.
3. El cambio afecta a una categoría protegida.

Categorías protegidas:

- código;
- migraciones;
- rollbacks;
- schemas;
- catálogos machine-readable;
- contratos técnicos;
- permisos;
- rutas;
- módulos;
- eventos;
- trazabilidad;
- documentación de arquitectura, técnica, IA operativa, ADR, plantillas operativas o backlog ejecutable cuando gobierne cambios protegidos.

## Archivos protegidos orientativos

La clasificación final depende del alcance real de la tarea, pero por defecto se consideran protegidos:

- `machine/**`
- `machine/schemas/**`
- `docs/04-architecture/**`
- `docs/06-technical/**`
- `docs/09-ai-operations/**`
- `docs/11-backlog/06-sprint-0-ejecutable.md`
- `docs/12-decisions/**`
- `templates/prompt-ia.md`
- `templates/runbook-ia.md`
- `templates/*contract*.json`
- `scripts/**`
- `database/migrations/**`
- `database/rollbacks/**`

## Exenciones explícitas

ADR-026 no se activa por:

- `unapplied_ai_draft`;
- `doctor_readonly`;
- `approved_append_only_evidence_write`;
- lectura, auditoría o comparación documental sin modificación real;
- cambios humanos manuales menores fuera de categorías protegidas.

## Controles mínimos antes de aplicar cambios protegidos

Si el trigger aplica, deben cumplirse estos controles antes de aplicar el cambio real:

1. `S0-000A` cerrado con clasificación de origen, alcance y archivos afectados.
2. Aprobación humana owner de activación ADR-026.
3. Backup completo de carpeta.
4. Export SQL si existe base de datos.
5. Git local inicializado si no existe.
6. Commit baseline antes del cambio protegido.
7. Working tree limpio antes de aplicar.
8. Doctor antes del cambio, cuando el estado del paquete permita ejecutarlo.
9. Aplicación del cambio.
10. Revisión de `git diff`.
11. Doctor después del cambio.
12. Evidencia o registro operativo actualizado.
13. Commit posterior del bloque validado.

## Flujo mínimo recomendado

```bash
git init
git add .
git commit -m "baseline: estado previo a cambios protegidos"
git status
```

Después de cada bloque de cambio:

```bash
git status
git diff
git add .
git commit -m "change: descripción corta del cambio"
```

## Alcance mínimo

- Rama única `main`.
- Commits pequeños.
- Sin remoto obligatorio.
- Sin pull requests.
- Sin branching complejo.
- Sin CI/CD obligatorio.

## Relación con ApprovalRecord

Cuando el cambio protegido preparado por IA requiera aprobación humana, el `ApprovalRecord` debe incluir:

- `approval_id`;
- `scope_hash`;
- archivos afectados;
- rollback plan;
- evidencia esperada;
- referencia a baseline/commit si ADR-026 ya está activa.

## Estado

Esta ADR queda preparada, pero no aceptada. Solo debe aceptarse cuando se active un trigger de ADR-021/ADR-026.

La aceptación de esta ADR no cambia el producto, el MVP ni el core funcional. Solo añade una capa operativa de trazabilidad para cambios protegidos.

## Preflight operativo asociado

Sprint 0 incorpora la tarea `S0-000A` para evaluar esta ADR antes de aplicar cambios protegidos preparados por IA.

Criterio:

- si el cambio es `ai_generated` o `ai_prepared`;
- y afecta a código, migraciones, rollbacks, schemas, catálogos machine-readable, contratos técnicos, permisos, rutas, módulos, eventos o trazabilidad;
- entonces esta ADR debe activarse por owner humano antes de aplicar el cambio real.

La ausencia de `S0-000A` cerrado bloquea cambios protegidos preparados por IA. No bloquea lectura, auditoría, propuestas, AIDraft no aplicado, Doctor readonly ni evidencia append-only aprobada.

## Gate operativo machine-readable

El trigger de esta ADR queda reflejado en `machine/ai_approval_policy.json` mediante:

- `version_control_gate`: regla general de aplicación real sobre archivos protegidos.
- `protected_ai_write_gate`: checklist operativo cerrado para acciones IA protegidas.

Condición de bloqueo: si una acción IA preparada afecta a archivos protegidos y no existe `S0-000A` cerrado, ADR-026 activada por owner humano, Git local mínimo, commit baseline, working tree limpio, Doctor previo/posterior y `ApprovalRecord`, la aplicación real del cambio queda bloqueada.

Esta regla no convierte ADR-026 en aceptada automáticamente. Sigue siendo `proposed_conditional` hasta activación humana por trigger.

## Relación con development_mode

`S0-000A` debe registrar uno de estos modos antes de aplicar cambios reales sobre archivos protegidos:

- `human_manual_only`
- `ai_audit_only`
- `ai_prepared_changes_enabled`

Si el modo elegido es `ai_prepared_changes_enabled`, esta ADR deja de ser una recomendación opcional y pasa a ser gate obligatorio condicionado: debe activarse por owner humano antes de aplicar cualquier cambio protegido preparado por IA.

Si el modo es `human_manual_only` o `ai_audit_only`, ADR-026 puede permanecer `proposed_conditional` mientras no se active otro trigger.

## Contrato de activación machine-readable

ADR-026 no se considera activa por una nota textual, comentario, instrucción importada, registro operativo aislado ni contenido generado por IA. La única fuente canónica de activación es `machine/proposed_decisions.json::ADR-026`.

La activación requiere:

| Campo | Requisito |
|---|---|
| `activation_state` | Debe pasar de `inactive` a `active`. |
| `activated_by` | Owner humano responsable de la activación. |
| `activated_at` | Fecha/hora ISO-8601 de activación. |
| `approval_record_id` | Referencia a `ApprovalRecord` humano. |
| `baseline_commit` | Commit baseline previo al cambio protegido. |
| `scope` | Alcance del cambio protegido autorizado. |
| `evidence_ref` | Evidencia de activación, por ejemplo `adr026-activation-report`. |
| `doctor_check_ref` | Referencia al Doctor previo/posterior o razón documentada si no aplica. |

La IA puede detectar el trigger y preparar un borrador de activación, pero no puede modificar `activation_state`, crear aprobación humana, simular baseline ni completar `activation_record` por sí misma.

Mientras `activation_state=inactive`, ADR-026 sigue siendo propuesta condicional. Cuando `activation_state=active`, el contrato de activación debe estar completo antes de aplicar cualquier cambio protegido preparado por IA.
