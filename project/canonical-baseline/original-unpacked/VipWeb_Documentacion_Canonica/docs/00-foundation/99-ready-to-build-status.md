
# Estado final antes de programar

## Resumen

La base de decisiones queda cerrada. No quedan decisiones fundacionales pendientes. El proyecto está preparado para iniciar Sprint 0 en entorno local WAMP.

La documentación canónica distingue tres conceptos operativos:

1. **validación documental CLI:** `scripts/update_script.py`, ya implementado y ejecutable sobre el paquete documental.
2. **Doctor runtime:** integración futura dentro de la aplicación para ejecutar/mostrar Doctor desde UI o backend.
3. **Validación de estado Doctor:** acción humana sensible para certificar un estado, protegida por `doctor.status.validate`.


## Aclaración crítica de estado

`READY_FOR_SPRINT_0` significa que la documentación permite preparar el entorno, estructura, migraciones, seeds, Doctor y evidencia inicial.

No significa que el proyecto esté en estado `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT` ni listo para implementar UI visible, Dashboard, Onboarding, módulos funcionales, integraciones reales o IA operativa avanzada.

El desarrollo funcional visible requiere completar `evidence/sprint-0-local-execution.md` y cumplir la sección “Condición para empezar desarrollo funcional visible”.

## Estado por área

| Área | Estado | Bloquea programar | Evidencia |
|---|---|---:|---|
| ADRs | Cerradas: ADR-001 a ADR-025 | No | `docs/12-decisions/00-decision-log.md` |
| WAMP local | Definido | No | `docs/06-technical/10-wamp-local-workflow.md` |
| Git/despliegue | No aplica por defecto en Sprint 0 manual; obligatorio si S0-000A activa trigger ADR-026 para cambios protegidos preparados por IA | Condicional | ADR-021 / ADR-026 / `machine/ai_approval_policy.json` |
| Sprint 0 | Preparado y granular | No | `docs/11-backlog/06-sprint-0-ejecutable.md` |
| Machine-readable docs | Preparadas | No | `machine/*.json` |
| validación documental CLI | Implementado y ejecutable | No | `scripts/update_script.py`, `evidence/sprint-0-local-execution.md` |
| Doctor runtime en aplicación | Pendiente de implementar en Core Runtime | No bloquea Sprint 0; sí bloquea validación funcional desde UI | Roadmap Fase 2 |
| Escritura de evidencia | Diseñada; pendiente de implementación runtime | No bloquea Sprint 0 | `evidence.write`, `ApprovalRecord` |
| Validación de estado Doctor | Pendiente; solo owner humano | No bloquea Sprint 0; bloquea certificación runtime | `doctor.status.validate` |
| Trazabilidad | Preparada | No | `machine/traceability_matrix.json` |
| Contratos de acciones mutables | Preparados | No para Sprint 0; obligatorios antes de UI funcional | `machine/action_contracts.json` |
| Código | No iniciado | Sí, hasta ejecutar Sprint 0 | Pendiente |
| Migraciones | SQL físicos base generados y no ejecutados; validar, no recrear, durante S0-009/S0-010 | Sí, hasta validarlas y ejecutarlas con gate local | `database/migrations/*.sql`, `database/rollbacks/*.sql`, `database/seeds/*.sql`, `database/manifest.json` |
| Base de datos real | No creada por este paquete | Sí, para ejecución funcional | Pendiente |

## Condición para empezar Sprint 0

Se puede empezar Sprint 0 si se cumple:

1. Hay copia de seguridad de la carpeta actual si existe proyecto previo.
2. Hay exportación SQL si existe base de datos previa.
3. Se usa `docs/11-backlog/06-sprint-0-ejecutable.md` como guía.
4. Se registra todo cambio en `evidence/sprint-0-local-execution.md`.
5. Se ejecuta `python scripts/update_script.py` y su salida se registra manualmente si se usa como evidencia.
6. Si hay cambios protegidos preparados por IA, `S0-000A` debe cerrar si aplica ADR-026 antes de aplicarlos.
7. Antes de ejecutar migraciones, `UserContext.user_id` y `OnboardingSession.user_id` deben estar validados como `NOT NULL` en contratos, DDL y Doctor.

## Condición para empezar desarrollo funcional visible

No se debe empezar Dashboard, Onboarding, UI visible, módulos funcionales, integraciones reales ni IA operativa avanzada hasta completar `evidence/sprint-0-local-execution.md` con:

- estructura base y configuración WAMP;
- runtime PHP verificado;
- MySQL/MariaDB verificado;
- catálogos JSON y scripts base revisados;
- migraciones ejecutadas o validadas localmente;
- seeds ejecutados o validados;
- owner seed sin placeholders;
- módulos core declarados;
- validación post-preparación sin críticos;
- evidencia inicial registrada;
- contratos mutables implementables desde `machine/action_contracts.json`;
- confirmación humana del gate `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT`.
