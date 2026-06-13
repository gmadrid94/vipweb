# Estados de interfaz

**Estado recomendado:** `READY_FOR_IMPLEMENTATION`
**Gate operativo aplicable:** `READY_FOR_IMPLEMENTATION` indica madurez documental, no permiso operativo por sí solo. Prevalecen `CURRENT_STATUS.md` y `machine/roadmap_gates.json`. Con el estado global actual `READY_FOR_SPRINT_0`, este documento solo puede guiar tareas permitidas por Sprint 0. No autoriza UI visible, Dashboard, Onboarding ni módulos funcionales hasta alcanzar `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT`.


## Estados técnicos mínimos

Toda pantalla MVP basada en ruta debe declarar `loading`, `error` y al menos uno de `empty`, `blocked` o `no_permission`.

| Estado | Uso | Mensaje base |
|---|---|---|
| `loading` | Datos o permisos en carga | Preparando tu espacio. |
| `empty` | Sin datos iniciales | Todavía no hay actividad. Empieza por el siguiente paso. |
| `error` | Fallo recuperable | No se ha podido cargar esta parte. Reintenta o revisa Doctor. |
| `blocked` | Falta permiso, sesión o gate previo | Esta acción requiere permisos o una fase previa. |
| `no_permission` | Rol sin autorización | No tienes permisos para acceder a esta sección. |
| `success` | Acción completada | Cambio guardado correctamente. |
| `warning` | Evidencia incompleta | Hay puntos pendientes antes de avanzar. |
| `unread` | Aviso no leído | Tienes avisos pendientes. |
| `read` | Aviso leído | Aviso revisado. |

## Estados por pantalla

| Pantalla | Estados |
|---|---|
| public_entry | loading, empty, ready, error |
| login | empty, loading, error, success |
| onboarding | loading, empty, in_progress, paused, completed, error |
| dashboard | loading, empty, ready, blocked, error |
| profile | loading, view, edit, saving, saved, blocked, error |
| notifications | loading, empty, unread, read, blocked, error |
| admin | loading, read_only, blocked, no_permission, error |
| doctor_evidence | loading, empty, passed, warning, failed, error |
| modules_catalog | loading, empty, ready, blocked, error |
| progress | loading, empty, ready, blocked, error |
| ai_workspace | loading, read_only, draft_available, blocked, no_permission, error |

## Regla

Los estados no deben ocultar errores críticos de Doctor ni permisos insuficientes. Las zonas de progreso, notificaciones e IA deben mostrar fallback si el módulo todavía está `planned` o `stub`.

Los estados de dominio pueden coexistir con los estados técnicos mínimos, pero no los reemplazan.

## Copy específico por pantalla

Los mensajes base de este documento no son suficientes por sí solos para implementar el MVP. El copy específico por pantalla y estado vive en `machine/ui_state_copy.json` y se documenta en `docs/07-design-ux/09-screen-state-copy.md`.

Doctor valida `UX_INTERFACE_STATES_INCLUDE_ALL_UI_SCREENS` para que toda pantalla declarada en `machine/ui_screens.json` aparezca también en esta tabla humana.
