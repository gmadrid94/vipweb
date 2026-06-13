# User journeys

**Estado recomendado:** `READY_FOR_IMPLEMENTATION`
**Gate operativo aplicable:** `READY_FOR_IMPLEMENTATION` indica madurez documental, no permiso operativo por sí solo. Prevalecen `CURRENT_STATUS.md` y `machine/roadmap_gates.json`. Con el estado global actual `READY_FOR_SPRINT_0`, este documento solo puede guiar tareas permitidas por Sprint 0. No autoriza UI visible, Dashboard, Onboarding ni módulos funcionales hasta alcanzar `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT`.


Fuente canónica: `machine/journeys.json`.

| ID | Journey | Actor | Entrada | Pasos | Evento éxito | Métrica |
|---|---|---|---|---|---|---|
| J-001 | Activación inicial guiada | registered_user | Login completado con usuario provisionado | Ver bienvenida → Completar onboarding mínimo → Llegar al dashboard → Ver módulos iniciales → Recibir próximo paso | `onboarding.completed` | activation_rate |
| J-002 | Continuidad diaria | registered_user | Usuario vuelve al dashboard | Ver estado → Ver progreso → Abrir módulo → Recibir notificación contextual | `dashboard.viewed` | dashboard_return_rate |
| J-003 | Operación segura por admin | admin | Admin accede a panel | Ver módulos → Ver auditoría → Ver evidencias → Ejecutar Doctor no destructivo | `admin.panel.viewed` | doctor_pass_rate |
| J-004 | Asistencia IA no autónoma | ai_assistant | Tarea de auditoría o propuesta | Leer contexto → Detectar incoherencia → Proponer cambio → Registrar acción | `ai.suggestion.created` | ai_suggestion_acceptance_rate |

## Criterio de calidad

Un journey no está listo si no declara actor, entrada, pasos, evento de éxito, métrica y módulos afectados.


## Entrada pública previa al journey registrado

Antes de J-001, el visitante puede acceder a `/` como `public_entry`. Esta entrada no se modela como journey con evento de éxito porque no modifica estado de negocio ni abre registro público. Su función es orientar y derivar a `/login`.

## Validación cualitativa conectada

Los journeys `J-001`, `J-002` y `J-004` deben observarse durante el protocolo `MVP_QUALITATIVE_VALIDATION_PROTOCOL` antes de ampliar funcionalidad visible.

- `J-001` valida comprensión de activación y onboarding.
- `J-002` valida continuidad diaria y retorno al dashboard.
- `J-004` valida que la IA se percibe como asistencia no autónoma.

Si el usuario no puede explicar el siguiente paso, no entiende el dashboard o interpreta la gamificación como decoración, la expansión visible debe bloquearse o limitarse a ajustes de copy/composición.
