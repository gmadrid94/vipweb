# 03 Review Checklists

**Estado recomendado:** `READY_FOR_IMPLEMENTATION`
**Gate operativo aplicable:** `READY_FOR_IMPLEMENTATION` indica madurez documental, no permiso operativo por sí solo. Prevalecen `CURRENT_STATUS.md` y `machine/roadmap_gates.json`. Con el estado global actual `READY_FOR_SPRINT_0`, este documento solo puede guiar tareas permitidas por Sprint 0. No autoriza UI visible, Dashboard, Onboarding ni módulos funcionales hasta alcanzar `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT`.


## Checklist de módulo
- Manifest completo.
- Rutas con permisos.
- Eventos existentes.
- Entidades existentes.
- Prohibiciones claras.
- Rollback por config key o plan manual.

## Checklist de permisos
- Permiso existe.
- Roles correctos.
- Approval si es sensible.
- Ruta y pantalla alineadas.
- IA no recibe escritura indebida.

## Checklist de datos
- Campos mínimos.
- Constraints.
- Índices.
- Retención.
- Borrado.
- Migración.

## Checklist de IA
- Nivel AI definido.
- Aprobación si escribe.
- Audit log requerido.
- Acción prohibida si toca secretos, producción, SQL destructivo o validación de estado.


## Checklist canónico — Cobertura cruzada

- `machine/roadmap_gates.json` coincide con `docs/10-roadmap/00-roadmap-overview.md`.
- Todo módulo MVP aparece en `machine/mvp_coverage_matrix.json`.
- Todo módulo MVP visible tiene ruta, permiso, pantalla y tarea backlog.
- Toda dependencia no dura aparece en `dependency_contracts` con fallback.
- Toda ruta con `ai_allowed=true` tiene `ai_level_max`, `ai_roles` y `audit_required=true`.

## Checklist añadido — contratos event bus y matriz runtime

- Todo módulo con eventos declara `core.events` mediante `depends_on` o `dependency_contracts.kind=event_bus`.
- Todo contrato `event_bus` declara eventos permitidos, dirección, fallback, política de fallo, auditoría e idempotencia.
- Todo `ACTION_ID` tiene fila en `machine/runtime_test_matrix.json`.
- Toda acción con ApprovalRecord tiene pruebas negativas de aprobación ausente, caducada, consumida y `scope_hash` inválido.
- Toda acción IA tiene pruebas de guardrail y fixtures adversariales.
- Toda acción crítica tiene pruebas de permiso, rol y audit log si aplica.
