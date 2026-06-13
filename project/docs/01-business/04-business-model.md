# Modelo de negocio

**Estado recomendado:** `READY_FOR_IMPLEMENTATION`
**Gate operativo aplicable:** `READY_FOR_IMPLEMENTATION` indica madurez documental, no permiso operativo por sí solo. Prevalecen `CURRENT_STATUS.md` y `machine/roadmap_gates.json`. Con el estado global actual `READY_FOR_SPRINT_0`, este documento solo puede guiar tareas permitidas por Sprint 0. No autoriza UI visible, Dashboard, Onboarding ni módulos funcionales hasta alcanzar `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT`.


## Decisión vigente

Modelo **freemium modular progresivo**. Los pagos reales no se implementan en MVP.

## Capas del modelo

| Capa | Estado MVP | Descripción |
|---|---|---|
| Free | Preparada | Acceso básico a dashboard, onboarding, perfil, progreso ligero y módulos iniciales. |
| Modular premium | Futuro | Módulos avanzados, automatizaciones, integraciones reales o capacidades extra. |
| Servicios conectados | Futuro/stub | Integraciones externas mediante adaptadores y scopes. |
| IA avanzada | Futuro | AI-2/AI-3 controlados, nunca AI-4. |

## Reglas

- No bloquear el MVP por monetización.
- Medir uso de módulos desde el inicio.
- No introducir pagos sin ADR específica.
- Toda monetización futura debe respetar permisos, contratos y auditabilidad.

## Clasificación comercial no operativa

La monetización no se implementa en MVP, pero módulos y features declaran una clasificación futura para evitar rediseño:

| Valor | Uso |
|---|---|
| `core_included` | Capacidades obligatorias del núcleo común. |
| `free_mvp` | Experiencia base visible para usuario. |
| `future_premium_candidate` | Superficies candidatas a monetización futura, especialmente integraciones reales o automatizaciones avanzadas. |
| `internal_only` | Administración, Doctor, evidencia e IA operativa interna. |
| `not_monetizable` | Elementos no aptos para plan comercial. |

Regla: la clasificación no habilita pagos, límites de plan ni paywalls. Solo informa arquitectura, permisos y roadmap futuro.
