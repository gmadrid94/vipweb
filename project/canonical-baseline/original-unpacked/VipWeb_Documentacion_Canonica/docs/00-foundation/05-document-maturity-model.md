# 05 Document Maturity Model

**Ruta:** `/docs/00-foundation/05-document-maturity-model.md`  
**Estado recomendado:** `READY_FOR_IMPLEMENTATION`
**Gate operativo aplicable:** `READY_FOR_IMPLEMENTATION` indica madurez documental, no permiso operativo por sí solo. Prevalecen `CURRENT_STATUS.md` y `machine/roadmap_gates.json`. Con el estado global actual `READY_FOR_SPRINT_0`, este documento solo puede guiar tareas permitidas por Sprint 0. No autoriza UI visible, Dashboard, Onboarding ni módulos funcionales hasta alcanzar `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT`.
  
**Fecha:** 2026-05-29

## Objetivo

Evitar que un documento existente sea interpretado como completo cuando solo define intención. Este modelo separa existencia, operatividad y validación real.

## Estados documentales

Los estados documentales se interpretan en dos ejes separados: madurez documental y autoridad documental. Esta separación evita que un documento maduro sea confundido con permiso operativo para saltar gates.

## Ejes separados de estado documental

VipWeb distingue entre madurez documental y autoridad documental.

### 1. Madurez documental

Indica si el documento está suficientemente definido para guiar trabajo.

| Estado | Significado | Puede guiar desarrollo | Puede ser usado por IA para modificar código |
|---|---|---:|---:|
| `DESIGNED` | Existe, tiene propósito, fuentes y dependencias. | No por sí solo. | No. |
| `OPERATIVE_DRAFT` | Incluye decisiones suficientes para trabajar, pendiente de validación. | Sí, con revisión humana. | Solo propuesta/borrador. |
| `READY_FOR_IMPLEMENTATION` | Tiene contratos, criterios y límites concretos. | Sí, solo si el gate operativo vigente lo permite. | Sí, hasta nivel AI-2 y dentro de permisos aprobados. |
| `VALIDATED` | Tiene evidencia reproducible asociada. | Sí, solo si el gate operativo vigente lo permite. | Sí, dentro de permisos aprobados. |

### 2. Autoridad documental

Indica si el documento prevalece o cómo debe interpretarse.

| Estado | Significado | Puede autorizar implementación por sí solo |
|---|---|---:|
| `CANONICAL` | Fuente humana principal para un bloque. | No; requiere gate operativo compatible. |
| `CANONICAL_COMPLEMENT` | Complementa una fuente canónica machine-readable o humana. | No por sí solo. |
| `FUTURE_GATE_READY` | Contrato preparado para una fase futura, no activado todavía. | No. |
| `LEGACY_REFERENCE` | Documento consolidado, archivado o mantenido como referencia. | No. |
| `derived_alias` | Alias machine-readable derivado de una fuente canónica. | No por sí solo. |
| `derived_matrix` | Matriz derivada validable. | No por sí sola. |

## Regla de prevalencia operativa

Ningún estado documental autoriza por sí solo saltar el gate operativo vigente.

Prevalecen, en este orden:

1. `CURRENT_STATUS.md`
2. `machine/roadmap_gates.json`
3. `evidence/sprint-0-local-execution.md`
4. `machine/machine_manifest.json`
5. ADRs aceptadas
6. Documentos Markdown canónicos

Los documentos `LEGACY_REFERENCE` nunca autorizan implementación.

## Regla obligatoria

Ningún documento crítico puede ser marcado como `VALIDATED` sin evidencia asociada en `/evidence` y sin pasar Doctor estructural, de consistencia y semántico.

## Documentos bloqueantes

| Documento | Estado objetivo mínimo antes de implementar |
|---|---|
| `docs/04-architecture/03-module-contracts.md` | `READY_FOR_IMPLEMENTATION` |
| `docs/06-technical/05-security.md` | `READY_FOR_IMPLEMENTATION` |
| `docs/05-domain-data/04-data-strategy.md` | `READY_FOR_IMPLEMENTATION` |
| `docs/05-domain-data/05-data-governance.md` | `READY_FOR_IMPLEMENTATION` |
| `docs/09-ai-operations/03-ai-guardrails.md` | `READY_FOR_IMPLEMENTATION` |
| `docs/13-quality/06-doctor-checks.md` | `READY_FOR_IMPLEMENTATION` |
| `docs/07-design-ux/05-interface-states.md` | `OPERATIVE_DRAFT` |
| `docs/08-gamification/06-balance-rules.md` | `OPERATIVE_DRAFT` |
