# ADR-021 — Entorno local Windows/WAMP y recuperación manual

**Estado:** Aceptada corregida  
**Área:** Operación local  
**Bloqueante:** Sí  
**Recomendación:** WAMP local con recuperación manual; ADR-030 añade Git local obligatorio y tools externas para el modo AI-first sin introducir despliegue externo.

## Contexto

Esta decisión forma parte del cierre fundacional de VipWeb previo al Sprint 0. Debe considerarse vigente salvo que una ADR posterior la reemplace explícitamente.

## Decisión

VipWeb se desarrollará inicialmente en Windows con WAMP y sin despliegue externo. La protección operativa base será mediante copias completas, exportaciones SQL, Doctor/validador, evidencias y evidence/sprint-0-local-execution.md. Para el modelo AI-first, ADR-030 añade Git local obligatorio en el repo oficial y tools externas con logs revisables.

## Motivo

Ajusta el proceso a la realidad actual del proyecto.

## Consecuencias

- No hay staging/producción/CI-CD al inicio.
- Rollback base equivale a restaurar carpeta y base SQL.
- En modo AI-first, Git añade diff y baseline pero no sustituye backups.
- Antes de cambios críticos se hace copia obligatoria.

## Dependencias

- ADR-003
- ADR-009
- ADR-020

## Documentos afectados

- `docs/06-technical/08-deployment.md`
- `evidence/sprint-0-local-execution.md`

## Riesgos mitigados o residuales

- Sin controles Git activos es más difícil comparar y revertir cambios parciales. En baseline 1.2 la mitigación se refuerza con ADR-030: Git local en el repo oficial, backups nombrados, logs externos y registro operativo local.

## Revisión futura

Solo debe revisarse si cambia el entorno real del proyecto, si se incorpora Git/despliegue externo, si el MVP cambia de alcance o si un módulo futuro introduce requisitos incompatibles.

## Trigger de transición a control de versiones

El flujo WAMP local con backups, export SQL, Doctor, evidencia y `evidence/sprint-0-local-execution.md` sigue siendo válido mientras el proyecto esté en Sprint 0/Core Runtime local, no exista colaboración técnica concurrente y los cambios sean lineales, pequeños y recuperables mediante restauración manual.

Debe abrirse y aprobarse una ADR nueva para introducir Git local y control de versiones mínimo antes de continuar si ocurre cualquiera de estas condiciones:

1. Se van a aplicar cambios generados o preparados por IA sobre archivos reales de código, migraciones, rollbacks, schemas, catálogos machine-readable o contratos técnicos.
2. Una tanda de cambios afecta a más de 10 archivos.
3. Se modifica una migración ya aplicada o se crea una migración que altera tablas existentes.
4. Existen dos o más líneas de trabajo paralelas.
5. Se necesita comparar diferencias entre versiones más allá de `evidence/sprint-0-local-execution.md`.
6. Se prepara AI-2 para algo más que borradores no aplicados o evidencia append-only aprobada.
7. Se plantea AI-3.
8. Se prepara staging, despliegue externo, repositorio remoto o colaboración con otra persona.
9. Se repite rollback manual más de una vez en la misma fase.
10. El Doctor pasa, pero se necesita auditar exactamente qué líneas cambiaron.

No dispara este trigger la creación de un `AIDraft` revisable que no modifica archivos reales, ni la ejecución de Doctor readonly, ni la escritura de evidencia append-only aprobada.

Mientras no se active ningún trigger, siguen siendo obligatorios:

- backup completo de carpeta;
- export SQL si existe base de datos;
- Doctor antes/después;
- evidencia;
- `evidence/sprint-0-local-execution.md`.

ADR futura prevista: `ADR-026 — Introducción de Git local y control de versiones mínimo`.

## Interpretación canónica para cambios preparados por IA

La IA puede leer contexto, ejecutar Doctor readonly, proponer cambios y crear `AIDraft` revisables sin activar Git, siempre que no modifique archivos reales.

Debe activarse ADR-026 antes de aplicar sobre archivos reales cualquier cambio generado o preparado por IA que afecte a:

- código;
- migraciones;
- rollbacks;
- schemas;
- catálogos machine-readable;
- contratos técnicos;
- permisos;
- rutas;
- módulos;
- eventos;
- trazabilidad.

La aplicación manual por parte de un humano no elimina el origen IA del cambio. Si el cambio procede de una propuesta IA y afecta a un área protegida, se considera cambio preparado por IA y requiere control de versiones mínimo antes de continuar.

## Relación con ADR-026 y ADR-030

`ADR-026 — Introducción de Git local y control de versiones mínimo` sigue siendo el contrato de activación verificable para cambios protegidos preparados por IA.

`ADR-030 — Modelo de ejecución AI-first con tools externas locales` acepta que el proyecto oficial esté bajo Git y que existan `vipweb_backups` y `vipweb_tools` como carpetas hermanas externas. ADR-030 no sustituye backups, SQL exportado, Doctor ni `evidence/sprint-0-local-execution.md`.
