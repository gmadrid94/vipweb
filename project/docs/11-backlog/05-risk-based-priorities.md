
# Prioridades basadas en riesgo

**Estado recomendado:** `READY_FOR_IMPLEMENTATION`
**Gate operativo aplicable:** `READY_FOR_IMPLEMENTATION` indica madurez documental, no permiso operativo por sí solo. Prevalecen `CURRENT_STATUS.md` y `machine/roadmap_gates.json`. Con el estado global actual `READY_FOR_SPRINT_0`, este documento solo puede guiar tareas permitidas por Sprint 0. No autoriza UI visible, Dashboard, Onboarding ni módulos funcionales hasta alcanzar `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT`.


| Prioridad | Riesgo que reduce | Tareas/checks |
|---|---|---|
| P0 | Divergencia documental/machine | `ROADMAP_HUMAN_DOCS_MATCH_MACHINE_GATES`, trazabilidad, schemas, Doctor |
| P0 | Módulos incompatibles | `MODULE_DEPENDENCIES_ARE_TYPED_AND_PHASE_VALID`, loader, manifests |
| P0 | MVP incompleto | `MVP_MODULES_HAVE_FULL_COVERAGE`, profile, notifications |
| P0 | Rediseño de datos | relationships, migration order, fields mínimo |
| P0 | RBAC ambiguo | roles.json, permissions, seeds |
| P1 | Core runtime incompleto | `C1-000`, identity/session runtime |
| P1 | Parón tras Sprint 0 | backlog_items, roadmap gates |
| P1 | UX técnica/fría | AppShell, dashboard, onboarding, states |
| P1 | IA insegura | approval policy, AIActionLog, `AI_ALLOWED_ROUTES_DECLARE_LEVEL_AND_AUDIT` |
| P2 | Gamificación superficial | gamification_rules, event sources |
| P2 | Integraciones acopladas | integrations stub |
