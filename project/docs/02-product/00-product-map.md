# Mapa de producto

**Estado recomendado:** `READY_FOR_IMPLEMENTATION`
**Gate operativo aplicable:** `READY_FOR_IMPLEMENTATION` indica madurez documental, no permiso operativo por sí solo. Prevalecen `CURRENT_STATUS.md` y `machine/roadmap_gates.json`. Con el estado global actual `READY_FOR_SPRINT_0`, este documento solo puede guiar tareas permitidas por Sprint 0. No autoriza UI visible, Dashboard, Onboarding ni módulos funcionales hasta alcanzar `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT`.


## Definición

VipWeb es un ecosistema web modular. Su producto no es una pantalla concreta, sino una experiencia continua formada por core, módulos, datos, eventos, IA operativa, UX acompañada y gamificación sobria.

## Mapa MVP

| Capa | Módulos | Función |
|---|---|---|
| Core | `core.identity`, `core.permissions`, `core.modules`, `core.events`, `core.audit`, `core.config`, `core.doctor` | Base común, seguridad, eventos, auditoría y validación. |
| Experiencia | `dashboard`, `onboarding`, `profile`, `notifications` | Entrada, continuidad, perfil y comunicación. |
| Retención | `gamification` | Progreso, logros y refuerzo no invasivo. |
| Operación | `admin`, `ai_assistant` | Observación, evidencias, propuestas y control IA. |
| Expansión | `integrations` | Stub para futuros servicios conectados. |

## Fuente canónica

- `machine/product_mvp.json`
- `machine/features.json`
- `machine/modules.json`
