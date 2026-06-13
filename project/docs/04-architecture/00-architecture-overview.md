# 00 Architecture Overview

**Estado recomendado:** `READY_FOR_IMPLEMENTATION`
**Gate operativo aplicable:** `READY_FOR_IMPLEMENTATION` indica madurez documental, no permiso operativo por sí solo. Prevalecen `CURRENT_STATUS.md` y `machine/roadmap_gates.json`. Con el estado global actual `READY_FOR_SPRINT_0`, este documento solo puede guiar tareas permitidas por Sprint 0. No autoriza UI visible, Dashboard, Onboarding ni módulos funcionales hasta alcanzar `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT`.
  
**Fuente canónica:** ADR-001, ADR-002, ADR-006, ADR-023, `machine/modules.json`.

## Propósito
Describir la arquitectura ejecutable de VipWeb antes de programar: core runtime, módulos, contratos, eventos, datos, IA, UX y stubs.

## Capas arquitectónicas
1. **Core Runtime:** identidad, permisos, módulos, eventos, auditoría, configuración y Doctor.
2. **Feature Modules:** dashboard, onboarding, perfil, notificaciones y gamificación.
3. **Admin/System Modules:** administración, evidencias, audit log y Doctor UI/CLI.
4. **AI Operations:** lectura, auditoría, propuestas, runbooks y audit log IA.
5. **Integration Adapters:** stubs sin credenciales reales en MVP.
6. **AppShell UX:** navegación, continuidad, estados y experiencia acompañada.

## Reglas canónicas
- Cada módulo se carga por manifest y no por importación implícita.
- Cada ruta exige permiso declarado y matriz de acceso.
- Cada evento debe existir en `machine/events.json`.
- Cada entidad MVP tiene constraints e índices mínimos.
- Toda escritura de evidencia queda separada de ejecutar Doctor.

## Criterios de validación
La arquitectura está lista si Doctor pasa `MODULE_SCHEMA_DEEP_CONTRACT`, `ROUTE_PERMISSION_ROLE_MATRIX_VALID`, `RELATIONSHIPS_HAVE_PHYSICAL_CONSTRAINTS` y `AI_PERMISSION_LEVELS_ARE_COHERENT`.

## Riesgos si se incumple
El proyecto puede empezar rápido pero acumular deuda en permisos, datos, IA y carga modular.
