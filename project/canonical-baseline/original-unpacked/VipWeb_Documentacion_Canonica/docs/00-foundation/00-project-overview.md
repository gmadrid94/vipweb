# 00 Project Overview

**Estado recomendado:** `READY_FOR_IMPLEMENTATION`
**Gate operativo aplicable:** `READY_FOR_IMPLEMENTATION` indica madurez documental, no permiso operativo por sí solo. Prevalecen `CURRENT_STATUS.md` y `machine/roadmap_gates.json`. Con el estado global actual `READY_FOR_SPRINT_0`, este documento solo puede guiar tareas permitidas por Sprint 0. No autoriza UI visible, Dashboard, Onboarding ni módulos funcionales hasta alcanzar `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT`.
  
**Fuente canónica:** ADR-001, ADR-003, ADR-005, ADR-007, ADR-023, `machine/modules.json`, `machine/roadmap_gates.json`.

## Propósito
Definir VipWeb como ecosistema web modular, no como web aislada. Este documento fija la lectura mínima antes de iniciar Sprint 0 o modificar arquitectura, permisos, IA, datos o roadmap.

## Alcance
VipWeb parte de un núcleo común que coordina identidad, permisos, módulos, eventos, auditoría, configuración, Doctor y evidencias. Sobre ese núcleo se cargan módulos MVP como dashboard, onboarding, perfil, notificaciones, administración, gamificación, IA asistida e integraciones stub.

Fuera del alcance inicial quedan proveedores reales, automatización IA autónoma, producción, pagos reales, API pública y subwebs activas no declaradas por contrato.

## Reglas canónicas
1. La fuente machine-readable prevalece para catálogos, pero cada decisión crítica debe tener explicación humana.
2. Todo módulo necesita manifest, owner, rutas, permisos, eventos, datos, validación y rollback.
3. Toda acción sensible debe ser trazable mediante permiso, rol, audit log y evidencia si aplica.
4. Doctor valida, pero no escribe evidencia por defecto.
5. La IA puede leer, auditar y proponer; no valida estados ni escribe evidencia sin aprobación.
6. El roadmap válido es el de gates, no documentos legacy.

## Relación con otros documentos
- Fundación: define criterio de lectura.
- Arquitectura: baja core y módulos a contratos.
- Datos: convierte entidades y relaciones en migraciones futuras.
- IA: fija niveles, permisos y guardrails.
- Calidad: exige Doctor y evidencias.

## Criterios de validación
Este documento es válido si enlaza con ADRs, módulos, roadmap, permisos e IA; si distingue alcance MVP/futuro; y si no contiene instrucciones genéricas sin decisión.

## Riesgos si se incumple
Un cambio puede tratar VipWeb como monolito, añadir proveedores prematuros, acoplar módulos o permitir IA con capacidades no aprobadas.
