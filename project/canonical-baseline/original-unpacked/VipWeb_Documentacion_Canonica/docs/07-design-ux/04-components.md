# Componentes MVP

**Estado recomendado:** `READY_FOR_IMPLEMENTATION`
**Gate operativo aplicable:** `READY_FOR_IMPLEMENTATION` indica madurez documental, no permiso operativo por sí solo. Prevalecen `CURRENT_STATUS.md` y `machine/roadmap_gates.json`. Con el estado global actual `READY_FOR_SPRINT_0`, este documento solo puede guiar tareas permitidas por Sprint 0. No autoriza UI visible, Dashboard, Onboarding ni módulos funcionales hasta alcanzar `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT`.
  
**Fuente canónica:** `machine/design_tokens.json`.

Las variantes de componentes deben coincidir con `component_variants`. Si hay divergencia, prevalece `machine/design_tokens.json`.

| Componente | Uso | Variantes / estados mínimos |
|---|---|---|
| `Button` | Acciones primarias, secundarias, neutras y destructivas | primary, secondary, ghost, danger |
| `ModuleCard` | Módulos del dashboard | available, disabled, stub, locked |
| `NextStepCard` | Próxima acción sugerida | empty, active, completed, blocked |
| `ProgressSummary` | Progreso ligero | empty, updating, ready, capped |
| `AIHelperPanel` | Ayuda IA no autónoma | idle, suggestion, blocked, approval-required |
| `EvidenceStatus` | Doctor/evidencias | passed, warning, failed, unknown |
| `PermissionGate` | Control visual de acceso | allowed, denied, approval-required |

## Regla

Todo componente conectado a datos debe declarar módulo owner, permiso y estado de error.

## Componentes añadidos para contratos de pantalla

Para que `machine/screen_component_contracts.json` sea implementable sin inferencias, el catálogo de componentes incluye además:

| Componente | Uso | Variantes / estados mínimos |
|---|---|---|
| `AppShell` | Marco común de navegación y contenido | public, authenticated, admin, blocked |
| `ScreenHeader` | Título, contexto y siguiente paso | default, compact, contextual |
| `StateFeedback` | Estados loading/empty/error/success | loading, empty, error, success, blocked, no_permission |
| `AuthForm` | Login con cuenta provisionada | login, loading, error, success |
| `UserMenu` | Menú de usuario y salida de sesión | collapsed, expanded |
| `NotificationList` | Listado de avisos internos | empty, unread, read, blocked |
| `ProfileForm` | Vista/edición mínima de perfil | view, edit, saving, saved, error |
| `AdminReadOnlyTable` | Tablas admin y evidencias en modo lectura | loading, empty, ready, warning, failed |
| `ModuleCatalogGrid` | Catálogo visible de módulos | empty, ready, blocked |
| `ProgressTimeline` | Progreso y logros suaves | empty, ready, capped |
| `ContextualHelpPanel` | Ayuda contextual no autónoma | idle, hint, blocked |
| `EmptyState` | Ausencia de datos orientada a siguiente paso | default, actionable, blocked |
| `LoadingState` | Carga visible y accesible | default, compact |
| `ErrorState` | Error recuperable o bloqueante | recoverable, blocking |
