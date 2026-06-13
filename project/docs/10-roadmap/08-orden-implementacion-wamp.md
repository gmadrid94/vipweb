
# Orden final de implementación técnica en WAMP

**Estado recomendado:** `CANONICAL_COMPLEMENT`

**ADR aplicable:** ADR-025.  
**Fuente canónica complementaria:** `machine/roadmap_gates.json`, `machine/backlog_items.json`.

## Orden aprobado

```txt
1. Backup local
2. Estructura de carpetas
3. Documentación mínima
4. Catálogos JSON
5. Scripts base
6. Configuración WAMP
7. Migraciones
8. Seeds
9. C1-000 Identity/session runtime
10. C1-001 Loader de módulos
11. C1-002 Guards de permisos
12. C1-003 Event dispatcher
13. C1-004 Audit log
14. C1-005 Config registry
15. C1-006 Doctor runtime wrapper
16. UX2-001 AppShell base
17. UX2-002 Pantalla login/logout
18. UX2-005 Profile básico
19. UX2-003 Onboarding progresivo
20. UX2-004 Dashboard inicial
21. UX2-006 Notifications internas
22. G3-001A Motor mínimo de progreso
23. UX2-007 Dashboard enrichment pass
24. G3-001B Enriquecimiento visual de gamificación
25. A3-001 Admin read-only
26. AI3-001 AIActionLog
27. AI3-002 Flujo AI-0/AI-1
28. AI3-003 Política runtime de aprobación IA
29. AI3-004 Doctor asistido por IA
30. I3-001 Integraciones stub
31. Validación general
```

## Regla
No se empieza por pantallas visibles. Primero debe existir base verificable: identidad runtime, permisos, módulos, eventos, auditoría, configuración y Doctor.

## Prohibido al inicio

- Git si todavía no se desea usar.
- Despliegue externo.
- Pagos.
- Marketplace.
- Integraciones externas reales.
- IA autónoma.
- Frameworks pesados.
- Microservicios.

## Nota de gamificación

`G3-001` no debe usarse como tarea ejecutable. El runtime mínimo se implementa en `G3-001A` y la capa visual adicional en `G3-001B`.

## Refinamiento de orden post-Sprint 0

Tras completar Sprint 0, el primer tramo de Core Runtime debe ejecutarse en subtareas granulares: `C1-008`, `C1-009`, `C1-010`, `C1-011`, `C1-012`, `C1-013` y `C1-014`. Estas tareas preceden a cualquier UI visible porque fijan seguridad PHP/WAMP, contratos de acción, autorización IA estructural, eventos y auditoría.
