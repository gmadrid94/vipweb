# Registro de decisiones ADR — VipWeb

**Estado:** cerrado para Sprint 0.  
**Entorno vigente:** Windows local + WAMP + sin Git + sin despliegue externo.  
**Autoridad:** este documento y los archivos individuales en `/docs/12-decisions/adr/` prevalecen sobre fuentes consolidadas. `/docs/12-decisions/adr/` contiene únicamente ADRs aceptadas; las propuestas viven en `/docs/12-decisions/proposed/`.

## Resumen

- ADRs aceptadas: **27**.
- Decisiones fundacionales pendientes: **0**.
- Decisiones bloqueantes cerradas: **23**.
- Decisiones no bloqueantes pero vinculantes para MVP/UX/IA: **4**.
- Corrección crítica incorporada: **ADR-021 adapta operación a Windows/WAMP local, sin Git ni despliegue**.

## Tabla maestra

| ID | Título | Área | Estado | Bloqueante | Depende de |
| --- | --- | --- | --- | --- | --- |
| ADR-001 | Definición del núcleo común | Arquitectura | Aceptada | Sí | — |
| ADR-002 | Modelo modular del ecosistema | Arquitectura | Aceptada | Sí | ADR-001 |
| ADR-003 | Stack inicial reversible | Técnica | Aceptada | Sí | ADR-001, ADR-002 |
| ADR-004 | Identidad, roles y permisos base | Seguridad | Aceptada | Sí | ADR-001, ADR-002 |
| ADR-005 | Modelo de autonomía IA operativa | IA | Aceptada | Sí | ADR-004, ADR-007, ADR-009 |
| ADR-006 | Modelo de dominio, datos y eventos | Datos | Aceptada | Sí | ADR-001, ADR-002 |
| ADR-007 | Canon documental y fuente de verdad | Documentación | Aceptada | Sí | ADR-001 |
| ADR-008 | Roadmap operativo y orden de construcción | Roadmap | Aceptada | Sí | ADR-001, ADR-002, ADR-006, ADR-007 |
| ADR-009 | Sistema Doctor, evidencias y validación real | Calidad | Aceptada | Sí | ADR-007 |
| ADR-010 | Gamificación equilibrada integrada | Gamificación | Aceptada | No | ADR-006, ADR-014 |
| ADR-011 | Experiencia visual cálida, tecnológica y acompañante | UX | Aceptada | No | ADR-010, ADR-014 |
| ADR-012 | Ambición inicial del producto | Producto/Negocio | Aceptada | Sí | ADR-001, ADR-002 |
| ADR-013 | Modelo de negocio inicial | Negocio | Aceptada | No | ADR-012 |
| ADR-014 | Alcance del MVP | Producto | Aceptada | Sí | ADR-012, ADR-013 |
| ADR-015 | Estrategia de integraciones externas | Integraciones | Aceptada | Sí | ADR-001, ADR-002, ADR-006 |
| ADR-016 | Dashboard como primer módulo funcional real | Producto/UX | Aceptada | Sí | ADR-014, ADR-023 |
| ADR-017 | Onboarding guiado progresivo | UX/Producto | Aceptada | Sí | ADR-014, ADR-016 |
| ADR-018 | Administración mínima del MVP | Admin/Seguridad | Aceptada | Sí | ADR-004, ADR-009, ADR-023 |
| ADR-019 | Schemas físicos y migraciones iniciales | Datos/Técnica | Aceptada | Sí | ADR-006, ADR-004, ADR-023 |
| ADR-020 | Testing y criterios de calidad | Calidad | Aceptada | Sí | ADR-004, ADR-006, ADR-009 |
| ADR-021 | Entorno local Windows/WAMP y recuperación manual | Operación local | Aceptada corregida | Sí | ADR-003, ADR-009, ADR-020 |
| ADR-022 | Sistema visual y componentes MVP | UX/Frontend | Aceptada | Sí | ADR-003, ADR-011 |
| ADR-023 | Catálogo de módulos del MVP | Arquitectura/Producto | Aceptada | Sí | ADR-001, ADR-002, ADR-014 |
| ADR-024 | Backlog ejecutable y Sprint 0 | Roadmap/Backlog | Aceptada | Sí | ADR-007, ADR-008, ADR-019, ADR-020, ADR-021, ADR-023 |
| ADR-025 | Orden final de implementación técnica | Implementación | Aceptada | Sí | ADR-024 |
| ADR-027 | Contratos de lectura cross-module | Arquitectura/Datos | Aceptada | Sí | ADR-002, ADR-006, ADR-009 |
| ADR-028 | Runbooks IA machine-readable | IA/Documentación | Aceptada | No | ADR-005, ADR-007, ADR-009, ADR-020 |

## Regla de autoridad

1. ADR aceptada.
2. Documento fundacional afectado.
3. Catálogo machine-readable.
4. Backlog / roadmap.
5. Código.

Si el código contradice una ADR, el código debe corregirse o debe crearse una ADR nueva que reemplace la anterior.

## ADRs propuestas o condicionales no aceptadas

Estas decisiones no cuentan como ADRs aceptadas ni como decisiones fundacionales pendientes mientras su trigger no se active.

| ID | Título | Estado | Activación | Catálogo machine-readable |
| --- | --- | --- | --- | --- |
| ADR-026 | Introducción de Git local y control de versiones mínimo | Propuesta condicional | Solo si se activa un trigger ADR-021 | `machine/proposed_decisions.json` |


## Regla de carpeta ADR

Todo archivo dentro de `docs/12-decisions/adr/` cuenta como ADR aceptada. Toda ADR propuesta o condicional debe vivir en `docs/12-decisions/proposed/` y declarar metadata `status` y `counts_as_accepted_adr=false`.
