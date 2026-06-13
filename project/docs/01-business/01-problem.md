# Problema

**Estado recomendado:** `READY_FOR_IMPLEMENTATION`
**Gate operativo aplicable:** `READY_FOR_IMPLEMENTATION` indica madurez documental, no permiso operativo por sí solo. Prevalecen `CURRENT_STATUS.md` y `machine/roadmap_gates.json`. Con el estado global actual `READY_FOR_SPRINT_0`, este documento solo puede guiar tareas permitidas por Sprint 0. No autoriza UI visible, Dashboard, Onboarding ni módulos funcionales hasta alcanzar `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT`.


## Problema principal

Los usuarios que trabajan con servicios, webs, módulos y herramientas conectadas terminan operando en sistemas fragmentados: cada pieza tiene su entrada, lógica, estado, permisos, notificaciones y datos. Esto produce pérdida de continuidad, baja sensación de acompañamiento y dependencia de configuraciones manuales difíciles de mantener.

## Problemas secundarios

| Problema | Consecuencia | Bloque afectado |
|---|---|---|
| Herramientas aisladas | El usuario no sabe dónde continuar | UX / Producto |
| Módulos sin contratos | Escalar exige rediseño | Arquitectura |
| Datos sin gobierno | IA y auditoría quedan inseguras | Datos / IA |
| IA como capa añadida | Riesgo de automatización sin control | IA operativa |
| Gamificación superficial | No mejora continuidad | Gamificación |
| Roadmap sin gates | Se implementa antes de cerrar riesgos | Roadmap |

## Problema que debe resolver el MVP

El MVP debe demostrar que VipWeb puede actuar como punto común del ecosistema: entrada, onboarding, dashboard, progreso, módulos iniciales, auditoría, Doctor e IA asistente no autónoma.

## No problema en MVP

- Pagos reales.
- Marketplace de módulos.
- Integraciones externas reales.
- Multi-tenant avanzado.
- Autonomía IA plena.
