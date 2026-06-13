# Mapa funcional

**Estado recomendado:** `READY_FOR_IMPLEMENTATION`
**Gate operativo aplicable:** `READY_FOR_IMPLEMENTATION` indica madurez documental, no permiso operativo por sí solo. Prevalecen `CURRENT_STATUS.md` y `machine/roadmap_gates.json`. Con el estado global actual `READY_FOR_SPRINT_0`, este documento solo puede guiar tareas permitidas por Sprint 0. No autoriza UI visible, Dashboard, Onboarding ni módulos funcionales hasta alcanzar `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT`.


| Área | Funciones MVP | Módulos |
|---|---|---|
| Identidad | login, logout, sesión | `core.identity` |
| Permisos | roles, guards, seeds | `core.permissions` |
| Módulos | registry, manifests, estado | `core.modules` |
| Eventos | dispatcher, persistencia, consumo | `core.events` |
| Auditoría | logs, acciones sensibles | `core.audit` |
| Configuración | flags, claves, WAMP local sin secretos | `core.config` |
| Calidad | Doctor, evidencias, gates | `core.doctor` |
| Experiencia | AppShell, dashboard, onboarding, perfil | `dashboard`, `onboarding`, `profile` |
| Comunicación | notificaciones internas | `notifications` |
| Gamificación | progreso, logros, antifatiga | `gamification` |
| IA | lectura, auditoría, propuestas | `ai_assistant` |
| Admin | read-only operativo | `admin` |
| Integraciones | stub/catálogo | `integrations` |
