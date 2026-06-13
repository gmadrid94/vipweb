# 01 Vision and Principles

**Estado recomendado:** `READY_FOR_IMPLEMENTATION`
**Gate operativo aplicable:** `READY_FOR_IMPLEMENTATION` indica madurez documental, no permiso operativo por sí solo. Prevalecen `CURRENT_STATUS.md` y `machine/roadmap_gates.json`. Con el estado global actual `READY_FOR_SPRINT_0`, este documento solo puede guiar tareas permitidas por Sprint 0. No autoriza UI visible, Dashboard, Onboarding ni módulos funcionales hasta alcanzar `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT`.
  
**Fuente canónica:** ADR-001, ADR-002, ADR-005, ADR-006, ADR-014, ADR-023.

## Propósito
Fijar los principios que no deben romperse durante Sprint 0, Core Runtime y MVP.

## Alcance
Aplica a producto, arquitectura, datos, UX, IA operativa, documentación, roadmap y cambios ejecutados por humanos o IA.

## Reglas canónicas
1. **Ecosistema antes que web:** cada funcionalidad debe poder convivir con futuras webs, módulos o servicios.
2. **Core mínimo y fuerte:** identidad, permisos, módulos, eventos, auditoría, configuración, Doctor y evidencias son transversales.
3. **Modularidad verificable:** un módulo sin contrato no existe para runtime.
4. **Datos gobernados:** toda entidad MVP requiere campos, constraints, índices, retención y borrado.
5. **IA asistida, no autónoma:** AI-4 está prohibido; AI-2 requiere aprobación para escritura.
6. **Gamificación útil:** progreso y logros nacen de eventos de valor, no de decoración visual.
7. **WAMP reversible:** el stack local es punto de partida, no dependencia estratégica irreversible.
8. **Evidencia reproducible:** ningún estado se considera listo sin evidencia o justificación explícita.

## Criterios de validación
Cada nueva decisión debe poder responder: qué principio afecta, qué riesgo reduce y qué catálogo/documento debe actualizarse.

## Riesgos si se incumple
Rediseño del core, módulos acoplados, permisos ambiguos, automatización insegura o producto visualmente atractivo pero no operable.
