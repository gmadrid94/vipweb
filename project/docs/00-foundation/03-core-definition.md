# 03 Core Definition

**Estado recomendado:** `READY_FOR_IMPLEMENTATION`
**Gate operativo aplicable:** `READY_FOR_IMPLEMENTATION` indica madurez documental, no permiso operativo por sí solo. Prevalecen `CURRENT_STATUS.md` y `machine/roadmap_gates.json`. Con el estado global actual `READY_FOR_SPRINT_0`, este documento solo puede guiar tareas permitidas por Sprint 0. No autoriza UI visible, Dashboard, Onboarding ni módulos funcionales hasta alcanzar `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT`.
  
**Fuente canónica:** ADR-001, ADR-002, ADR-004, ADR-006, ADR-009, `machine/modules.json`.

## Propósito
Definir qué pertenece al núcleo común de VipWeb y qué debe mantenerse como módulo, integración o futuro.

## Pertenece al core
- `core.identity`: identidad y sesión.
- `core.permissions`: roles, permisos y guards.
- `core.modules`: loader, manifests y lifecycle.
- `core.events`: catálogo y dispatcher de eventos.
- `core.audit`: audit log append-only.
- `core.config`: configuración local sin secretos reales.
- `core.doctor`: checks, evidencias y validación documental.

## No pertenece al core
- Lógica específica de dashboard, onboarding, perfil, notificaciones o gamificación.
- Integraciones reales con proveedores.
- Subwebs futuras.
- Automatización IA autónoma.
- Decisiones de estilo visual que no condicionen contratos.

## Regla de decisión
Un elemento entra en core solo si cumple al menos una condición:
1. es requerido por varios módulos;
2. protege seguridad, permisos, auditoría o datos;
3. define contrato necesario para carga modular;
4. evita rediseño estructural futuro.

Si solo aporta valor a un flujo concreto, debe ser módulo. Si depende de proveedor, debe ser adapter/stub. Si no bloquea MVP, queda post-MVP.

## Criterios de validación
Doctor debe poder verificar que ningún módulo feature muta core, accede a entidades prohibidas o usa permisos/eventos no declarados.

## Riesgos si se incumple
Core inflado, módulos acoplados, dificultad para añadir webs o servicios, y migraciones de datos con efectos colaterales.
