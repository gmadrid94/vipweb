# VipWeb — Decisiones fundacionales cerradas y Sprint 0

## Resultado

Las 25 decisiones fundacionales quedan cerradas. No hay contradicciones abiertas tras la corrección de ADR-021.

## Corrección crítica aplicada

El proyecto se desarrolla actualmente en **Windows con WAMP, local, sin Git y sin despliegue externo**. Por tanto:

- no se habla de producción real en esta fase;
- no se exige CI/CD;
- no se exige staging;
- rollback significa restaurar carpeta + SQL;
- `evidence/sprint-0-local-execution.md` sustituye temporalmente a Git como registro manual;
- Doctor y evidencias se ejecutan localmente.

## ADRs cerradas

- **ADR-001** — Definición del núcleo común: Core mínimo de ecosistema, no monolito.
- **ADR-002** — Modelo modular del ecosistema: Módulos autónomos por dominios con manifiesto, contratos, permisos y eventos.
- **ADR-003** — Stack inicial reversible: PHP 8.4+, MySQL/MariaDB, PDO, HTML, CSS y JS vanilla sobre WAMP local.
- **ADR-004** — Identidad, roles y permisos base: RBAC inicial con permisos explícitos, guards por módulo y auditoría.
- **ADR-005** — Modelo de autonomía IA operativa: Autonomía progresiva IA-0 a IA-3; IA-4 descartada al inicio.
- **ADR-006** — Modelo de dominio, datos y eventos: Domain-first: entidades y eventos antes de tablas.
- **ADR-007** — Canon documental y fuente de verdad: Markdown modular + JSON/YAML machine-readable + ADRs.
- **ADR-008** — Roadmap operativo y orden de construcción: Construcción por capas: fundación, core, permisos, MVP, estabilidad, expansión.
- **ADR-009** — Sistema Doctor, evidencias y validación real: Doctor + evidencias + estados verificables desde el inicio.
- **ADR-010** — Gamificación equilibrada integrada: Gamificación moderada basada en progreso, logros suaves y feedback útil.
- **ADR-011** — Experiencia visual cálida, tecnológica y acompañante: Opción B confirmada por usuario.
- **ADR-012** — Ambición inicial del producto: Opción B confirmada por usuario.
- **ADR-013** — Modelo de negocio inicial: Opción B confirmada por usuario.
- **ADR-014** — Alcance del MVP: Opción B confirmada por usuario.
- **ADR-015** — Estrategia de integraciones externas: Capa preparada, conectores internos/simulados en MVP.
- **ADR-016** — Dashboard como primer módulo funcional real: Dashboard del ecosistema primero.
- **ADR-017** — Onboarding guiado progresivo: Onboarding breve, accionable y conectado al Dashboard.
- **ADR-018** — Administración mínima del MVP: Admin mínimo, no backoffice avanzado.
- **ADR-019** — Schemas físicos y migraciones iniciales: Migraciones versionadas, mínimas y derivadas del dominio.
- **ADR-020** — Testing y criterios de calidad: Calidad por capas conectada a Doctor y evidencias.
- **ADR-021** — Entorno local Windows/WAMP y recuperación manual: WAMP local, sin Git ni despliegue; backups + SQL + Doctor + registro de ejecución local.
- **ADR-022** — Sistema visual y componentes MVP: Mini design system propio con CSS modular.
- **ADR-023** — Catálogo de módulos del MVP: 15 módulos iniciales: 7 core y 8 funcionales.
- **ADR-024** — Backlog ejecutable y Sprint 0: Sprint 0 antes de funcionalidades visibles.
- **ADR-025** — Orden final de implementación técnica: Implementar en local por capas.

## Siguiente paso

Ejecutar Sprint 0:

1. Backup local.
2. Exportación SQL si existe BD.
3. Estructura base.
4. Documentación mínima.
5. Catálogos JSON.
6. Scripts base.
7. Configuración WAMP.
8. Migraciones.
9. Seeds.
10. Doctor.
11. Evidencia inicial.

## Veredicto de coherencia

El sistema es coherente si se mantiene el orden: primero base verificable, después core, permisos, admin, dashboard, onboarding, gamificación, IA e integraciones preparadas.
