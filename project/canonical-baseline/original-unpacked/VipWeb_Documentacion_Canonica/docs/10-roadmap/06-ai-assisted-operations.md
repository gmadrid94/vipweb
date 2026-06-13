
# Fase 5 — AI-Assisted Operations

**Estado recomendado:** `READY_FOR_IMPLEMENTATION`
**Gate operativo aplicable:** `READY_FOR_IMPLEMENTATION` indica madurez documental, no permiso operativo por sí solo. Prevalecen `CURRENT_STATUS.md` y `machine/roadmap_gates.json`. Con el estado global actual `READY_FOR_SPRINT_0`, este documento solo puede guiar tareas permitidas por Sprint 0. No autoriza UI visible, Dashboard, Onboarding ni módulos funcionales hasta alcanzar `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT`.
  
**Fuente canónica:** `machine/roadmap_gates.json`.

## Objetivo
Cerrar `AI-Assisted Operations` con evidencias verificables antes de avanzar.

## Entrada obligatoria
- permisos IA
- approval policy
- AI_CONTEXT_TRUST_POLICY aplicada antes de acciones IA sensibles

`AIActionLog` no es condición de entrada de la fase. Es el primer bloqueante interno y condición de salida para declarar la operación IA recurrente como preparada.

## Salida obligatoria
- AIActionLog implementado, append-only y auditado
- AI-0/AI-1 operativos
- AI-2 solo borrador/aprobación
- acciones auditadas
- AI3-001 cerrado como bloqueante interno antes de operación IA recurrente

## No se puede avanzar si falta
- AIActionLog
- ai_approval_policy

## Subestados operativos

| Subestado | Significado | Regla |
|---|---|---|
| `AI_ASSISTED_SETUP` | La fase puede arrancar con permisos, approval policy y política de confianza de contexto. | Permite preparar runtime y contratos, pero no declarar operación IA recurrente. |
| `AI_ASSISTED_OPERATIONAL` | `AIActionLog` existe, es append-only, está auditado y enlazado a ApprovalRecord cuando aplica. | Solo este subestado permite cerrar la fase y habilitar operación IA asistida recurrente. |

`AI3-001` debe ejecutarse antes de `AI3-002`, `AI3-003` y `AI3-004`. Cualquier tarea IA posterior que proponga, registre o consuma acciones debe depender de `AI3-001`.

## Módulos afectados
- `ai_assistant`

## Evidencia esperada
- `ai-action-log-report`

## Criterios de validación
Doctor debe pasar `ROADMAP_PHASES_HAVE_FULL_GATES` y la evidencia de la fase debe quedar registrada antes de ejecutar la siguiente.
