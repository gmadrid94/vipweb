# 01 Ecosystem Core

**Estado recomendado:** `READY_FOR_IMPLEMENTATION`
**Gate operativo aplicable:** `READY_FOR_IMPLEMENTATION` indica madurez documental, no permiso operativo por sí solo. Prevalecen `CURRENT_STATUS.md` y `machine/roadmap_gates.json`. Con el estado global actual `READY_FOR_SPRINT_0`, este documento solo puede guiar tareas permitidas por Sprint 0. No autoriza UI visible, Dashboard, Onboarding ni módulos funcionales hasta alcanzar `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT`.
  
**Fuente canónica:** `docs/00-foundation/03-core-definition.md`, `machine/modules.json`.

## Propósito
Fijar el núcleo común que permite conectar módulos, futuras webs y servicios sin rediseñar.

## Responsabilidades del core
- Resolver identidad y sesión.
- Resolver permisos por ruta, método, rol y mutabilidad.
- Cargar módulos según manifest.
- Publicar y consumir eventos registrados.
- Registrar auditoría append-only.
- Centralizar configuración local sin secretos.
- Ejecutar Doctor readonly y gestionar evidencias con permiso separado.

## Invariantes
1. El core no contiene lógica específica de negocio de módulos feature.
2. Ningún módulo accede a tablas ajenas sin contrato.
3. Ningún módulo registra evento no declarado.
4. Ningún permiso crítico se concede por defecto a IA.
5. El core debe poder desactivar módulos por config key.

## Criterios de validación
Todo módulo core debe aparecer en `machine/modules.json`, poseer entidades propias si aplica, declarar rollback y pasar schema profundo.

## Riesgos si se incumple
El ecosistema se convierte en monolito, se dificulta añadir subwebs y se pierde capacidad de operación por IA segura.
