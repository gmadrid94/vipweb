# Decisiones críticas cerradas

**Estado:** aceptadas.  
**Pendientes bloqueantes:** 0.

## Decisiones bloqueantes

| ID | Decisión | Recomendación cerrada | Bloquea desarrollo |
| --- | --- | --- | --- |
| ADR-001 | Definición del núcleo común | Core mínimo de ecosistema, no monolito. | Sí |
| ADR-002 | Modelo modular del ecosistema | Módulos autónomos por dominios con manifiesto, contratos, permisos y eventos. | Sí |
| ADR-003 | Stack inicial reversible | PHP 8.4+, MySQL/MariaDB, PDO, HTML, CSS y JS vanilla sobre WAMP local. | Sí |
| ADR-004 | Identidad, roles y permisos base | RBAC inicial con permisos explícitos, guards por módulo y auditoría. | Sí |
| ADR-005 | Modelo de autonomía IA operativa | Autonomía progresiva IA-0 a IA-3; IA-4 descartada al inicio. | Sí |
| ADR-006 | Modelo de dominio, datos y eventos | Domain-first: entidades y eventos antes de tablas. | Sí |
| ADR-007 | Canon documental y fuente de verdad | Markdown modular + JSON/YAML machine-readable + ADRs. | Sí |
| ADR-008 | Roadmap operativo y orden de construcción | Construcción por capas: fundación, core, permisos, MVP, estabilidad, expansión. | Sí |
| ADR-009 | Sistema Doctor, evidencias y validación real | Doctor + evidencias + estados verificables desde el inicio. | Sí |
| ADR-012 | Ambición inicial del producto | Opción B confirmada por usuario. | Sí |
| ADR-014 | Alcance del MVP | Opción B confirmada por usuario. | Sí |
| ADR-015 | Estrategia de integraciones externas | Capa preparada, conectores internos/simulados en MVP. | Sí |
| ADR-016 | Dashboard como primer módulo funcional real | Dashboard del ecosistema primero. | Sí |
| ADR-017 | Onboarding guiado progresivo | Onboarding breve, accionable y conectado al Dashboard. | Sí |
| ADR-018 | Administración mínima del MVP | Admin mínimo, no backoffice avanzado. | Sí |
| ADR-019 | Schemas físicos y migraciones iniciales | Migraciones versionadas, mínimas y derivadas del dominio. | Sí |
| ADR-020 | Testing y criterios de calidad | Calidad por capas conectada a Doctor y evidencias. | Sí |
| ADR-021 | Entorno local Windows/WAMP y recuperación manual | WAMP local sin despliegue; backups + SQL + Doctor + registro de ejecución local. ADR-030 añade Git local y tools externas para AI-first. | Sí |
| ADR-022 | Sistema visual y componentes MVP | Mini design system propio con CSS modular. | Sí |
| ADR-023 | Catálogo de módulos del MVP | 15 módulos iniciales: 7 core y 8 funcionales. | Sí |
| ADR-024 | Backlog ejecutable y Sprint 0 | Sprint 0 antes de funcionalidades visibles. | Sí |
| ADR-025 | Orden final de implementación técnica | Implementar en local por capas. | Sí |
| ADR-027 | Contratos de lectura cross-module | Toda lectura de entidad ajena requiere contrato data_read validable. | Sí, antes de implementación funcional cross-module |
| ADR-029 | Raíz limpia y separación APP_ROOT/PROJECT_CONTROL_ROOT | Documentación y control operativo viven bajo project/; runtime visible/privado queda fuera. | Sí |
| ADR-030 | Modelo de ejecución AI-first con tools externas locales | GPT + Codex + tools externas, Git local en el repo oficial, backups externos y logs revisables. | Sí |

## Decisiones no bloqueantes pero vinculantes

| ID | Decisión | Aplicación |
| --- | --- | --- |
| ADR-010 | Gamificación equilibrada integrada | No bloquea backend/core, pero sí diseño del MVP. |
| ADR-011 | Experiencia visual cálida, tecnológica y acompañante | No bloquea backend/core, pero sí UI real. |
| ADR-013 | Modelo freemium modular progresivo | No bloquea código base, pero sí clasificación futura core/premium. |
| ADR-028 | Runbooks IA machine-readable | No concede permisos nuevos, pero vincula operación IA a JSON validable. |

## Conclusión

No queda ninguna decisión fundacional abierta antes de Sprint 0. Las condiciones operativas imprescindibles son respetar ADR-021, ADR-029 y ADR-030: trabajar en local WAMP con backup, exportación SQL, Git local en el repo oficial, tools externas cuando aplique, validación readonly, evidencias, `evidence/sprint-0-local-execution.md` y raíz limpia con canon operativo bajo `project/`.
