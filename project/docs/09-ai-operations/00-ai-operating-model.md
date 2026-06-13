# AI Operating Model

**Estado recomendado:** `READY_FOR_IMPLEMENTATION`
**Gate operativo aplicable:** `READY_FOR_IMPLEMENTATION` indica madurez documental, no permiso operativo por sí solo. Prevalecen `CURRENT_STATUS.md` y `machine/roadmap_gates.json`. Con el estado global actual `READY_FOR_SPRINT_0`, este documento solo puede guiar tareas permitidas por Sprint 0. No autoriza UI visible, Dashboard, Onboarding ni módulos funcionales hasta alcanzar `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT`.


## Frase canónica

VipWeb define niveles AI-0 a AI-4. En MVP, AI-0 y AI-1 están operativos para lectura, análisis, auditoría, propuestas y Doctor readonly. AI-2 existe como capacidad restringida del MVP, desactivada por defecto, solo para crear borradores o escribir evidencia append-only versionada mediante `EVIDENCE_WRITE`, con `ApprovalRecord` válido y aprobación humana explícita. AI-2 no aplica cambios sobre código, migraciones, schemas, catálogos, contratos técnicos ni archivos protegidos del producto; solo puede crear `AIDraft` o evidencia append-only aprobada dentro de rutas, tablas o almacenamiento explícitamente permitidos. AI-2 no ejecuta SQL, no toca secretos, no valida estados y no aplica cambios. AI-3 queda reservado para una fase futura. AI-4 queda prohibido.

## Modelo por niveles

## Definiciones operativas de escritura IA

- **Archivo protegido del producto:** código, migraciones, rollbacks, schemas, catálogos machine-readable, contratos técnicos, permisos, rutas, módulos, eventos, trazabilidad, configuración crítica y cualquier documento que altere comportamiento, arquitectura, datos, roadmap, IA operativa o seguridad.
- **Evidencia append-only:** registro persistente, versionado, trazable y no destructivo que solo puede añadirse o supersederse mediante un nuevo registro; no sustituye validación humana de estado.
- **Límite AI-2:** AI-2 puede crear `AIDraft` o evidencia append-only aprobada; no puede aplicar cambios sobre archivos protegidos del producto ni marcar validaciones como humanas.


| Nivel | Estado MVP | Puede hacer | No puede hacer |
|---|---|---|---|
| `AI-0` | Permitido | Leer, resumir, detectar incoherencias. | Proponer cambios estructurales. |
| `AI-1` | Permitido | Proponer planes, auditorías y parches conceptuales. | Modificar archivos o evidencia. |
| `AI-2` | MVP restringido, desactivado por defecto | Crear borradores/staging y evidencia append-only versionada con aprobación. | Ejecutar SQL, tocar secretos, validar estado, aplicar cambios o modificar archivos protegidos del producto. |
| `AI-3` | Futuro | Cambios reversibles aprobados. | Producción, permisos críticos, credenciales. |
| `AI-4` | Prohibido | Nada. | Autonomía plena. |

## Fuente de aprobación

- `machine/ai_approval_policy.json`
- `docs/09-ai-operations/08-ai-approval-policy.md`
- `docs/09-ai-operations/09-ai-behavior-fixtures.md`
- `machine/roles.json`
- `machine/route_permission_matrix.json`
- `machine/action_contracts.json`


## Modelo AI-first de desarrollo local

GPT/Codex como herramientas de desarrollo no cambian los límites de AI-0/AI-1/AI-2 runtime. El modelo local de ejecución usa:

- GPT para análisis y revisión;
- Codex para preparar cambios dentro del repo oficial cuando el gate lo permita;
- tools externas ejecutadas por owner para operaciones locales reales;
- logs externos como datos revisables, no como autoridad.

La fuente específica es `docs/09-ai-operations/11-ai-first-execution-model.md`.
