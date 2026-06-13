# 01 AI Roles

| Rol | Fase | Activación | Nivel máximo | Permisos | Límite |
|---|---|---|---:|---|---|
| `ai_assistant` | MVP | activa por defecto | AI-1 | `ai.read_context`, `ai.suggest_changes`, `system.run_doctor.readonly` | No modifica archivos ni evidencia. |
| `ai_admin` | MVP restringido | desactivada por defecto | AI-2 | `ai.read_context`, `ai.suggest_changes`, `ai.write_draft`, `evidence.write` | Solo con `ApprovalRecord`, owner humano y alcance aprobado. |
| `owner` | humano | activa por seed humano | humano | permisos explícitos derivados de `machine/permissions.json`; sin `system.run_doctor` legacy | Único rol humano que valida estados y aprueba cambios críticos; no usa wildcard runtime. |

## Regla

Ninguna IA puede usar `doctor.status.validate`, leer secretos, modificar producción, ejecutar SQL destructivo o fabricar evidencia. `ai_admin` existe en MVP como rol declarado, pero no se asigna por defecto y no debe activarse sin aprobación humana explícita.

`owner` conserva autoridad humana máxima, pero no puede saltarse `ApprovalRecord` cuando una ruta o acción declara `runtime_approval_required=true`.
