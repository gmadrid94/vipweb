# 00 Glossary

**Estado recomendado:** `READY_FOR_IMPLEMENTATION`
**Gate operativo aplicable:** `READY_FOR_IMPLEMENTATION` indica madurez documental, no permiso operativo por sí solo. Prevalecen `CURRENT_STATUS.md` y `machine/roadmap_gates.json`. Con el estado global actual `READY_FOR_SPRINT_0`, este documento solo puede guiar tareas permitidas por Sprint 0. No autoriza UI visible, Dashboard, Onboarding ni módulos funcionales hasta alcanzar `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT`.


| Término | Definición | Contexto | Documento canónico | Ambigüedad evitada |
|---|---|---|---|---|
| Ecosistema | Conjunto de webs, servicios y módulos conectados por un núcleo común. | Producto/arquitectura | `00-project-overview` | No es una web aislada. |
| Core | Capa común de identidad, permisos, módulos, eventos, auditoría, configuración y Doctor. | Arquitectura | `03-core-definition` | No contiene lógica feature. |
| Módulo | Unidad funcional con contrato, owner, datos, eventos, permisos y rollback. | Arquitectura | `03-module-contracts` | No es solo una carpeta. |
| Manifest | Contrato declarativo machine-readable de un módulo. | Arquitectura | `module.schema.json` | Debe validarse profundamente. |
| Subweb | Web futura conectada por contrato al core y AppShell. | Escalabilidad | `08-subweb-contracts` | No se activa sin contrato. |
| AppShell | Estructura común de navegación, continuidad y estado. | UX | `02-navigation` | No sustituye módulos. |
| Doctor | Script local de validación readonly. | Calidad | `scripts/update_script.py` | No escribe evidencia por defecto. |
| Evidencia | Reporte versionado que demuestra un estado o validación. | Calidad | `EvidenceReport` | No equivale a intención. |
| AI-0 | Lectura y resumen sin modificar. | IA | `ai_approval_policy.json` | No escribe. |
| AI-1 | Auditoría/propuesta y Doctor readonly. | IA | `ai_approval_policy.json` | No escribe evidencia. |
| AI-2 | Borrador o escritura controlada con aprobación humana. | IA | `ai_approval_policy.json` | No valida estados. |
| AI-4 | Autonomía plena prohibida. | IA | `00-ai-operating-model` | No usar en MVP. |
| Guard | Control de acceso por ruta, método, rol y permiso. | Seguridad | `route_permission_matrix.json` | No reemplaza auditoría. |
| Constraint física | Regla mínima de integridad, índice o FK de una relación. | Datos | `physical_constraints_matrix.json` | No es solo descripción conceptual. |
| Roadmap gate | Criterio de entrada/salida de fase. | Roadmap | `roadmap_gates.json` | No equivale a documento legacy. |

## Términos de confianza de contexto IA

- `AI_CONTEXT_TRUST_POLICY`: política que define jerarquía de autoridad y tratamiento de contenido no confiable leído por IA.
- `trusted source`: fuente canónica vigente que puede orientar decisiones documentales u operativas.
- `untrusted content`: contenido leído como dato, sin autoridad para ordenar acciones.
- `prompt injection`: intento de inducir a la IA a saltar instrucciones, gates, permisos o evidencias mediante texto incrustado.
