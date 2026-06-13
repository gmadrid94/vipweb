# Definición del MVP

**Estado recomendado:** `READY_FOR_IMPLEMENTATION`
**Gate operativo aplicable:** `READY_FOR_IMPLEMENTATION` indica madurez documental, no permiso operativo por sí solo. Prevalecen `CURRENT_STATUS.md` y `machine/roadmap_gates.json`. Con el estado global actual `READY_FOR_SPRINT_0`, este documento solo puede guiar tareas permitidas por Sprint 0. No autoriza UI visible, Dashboard, Onboarding ni módulos funcionales hasta alcanzar `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT`.


## Definición canónica

VipWeb MVP = centro modular de acompañamiento para que un usuario pueda entrar, entender el ecosistema, activar módulos iniciales, ver continuidad/progreso, recibir orientación básica de IA y operar servicios conectados sin sentirse ante un panel técnico aislado.

## Segmento de validación MVP

El MVP se valida contra el perfil owner-operador de ecosistema web modular: usuario provisionado que necesita ver estado, continuidad, módulos, progreso, evidencias e IA asistida desde un punto común.

## Incluido

- Core mínimo: identidad, permisos, módulos, eventos, auditoría, configuración y Doctor.
- UX inicial: login, onboarding progresivo, dashboard, perfil y estados comunes.
- Gamificación: progreso ligero y logros derivados de eventos.
- IA: AI-0/AI-1, AI-2 solo como borrador/staging aprobado.
- Admin: vista read-only de módulos, auditoría, evidencias y Doctor.
- Integraciones: stub sin credenciales reales.

## Excluido

- Pagos reales.
- Integraciones externas reales.
- Marketplace de módulos.
- Multi-tenant avanzado.
- AI-3 operativo.
- AI-4.
- SQL destructivo o producción.

## Gate de MVP

El MVP no está listo si no existen eventos, permisos, entidades, roles, manifiestos, backlog y Doctor consistentes.
