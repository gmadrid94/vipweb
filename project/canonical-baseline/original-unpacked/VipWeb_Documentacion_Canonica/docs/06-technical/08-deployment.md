# Entorno local Windows/WAMP y recuperación manual

**Estado:** vigente para la fase actual.  
**ADR aplicable:** ADR-021.

## Decisión operativa

VipWeb se desarrollará inicialmente en un servidor local Windows con WAMP. No existe despliegue externo, staging real, producción remota, Git ni CI/CD en esta fase.

## Entorno vigente

```txt
Windows
WAMP
Apache
PHP local verificado mediante `php -v`
Target recomendado: PHP 8.4+
Sin features específicas de PHP 8.4 hasta verificar compatibilidad local
MySQL/MariaDB
Proyecto en C:/wamp64/www/vipweb/
Sin Git
Sin despliegue externo
```

## Protección antes de cambios importantes

Antes de tocar estructura, base de datos, core, permisos, scripts o módulos:

1. Copiar carpeta completa del proyecto.
2. Exportar base de datos desde phpMyAdmin si existe.
3. Ejecutar Doctor si existe.
4. Registrar cambio previsto en `/evidence/sprint-0-local-execution.md`.
5. Aplicar cambios.
6. Ejecutar Doctor de nuevo.
7. Registrar resultado.

## Estructura recomendada de backups

```txt
C:/wamp64/www/vipweb/
C:/wamp64/www/vipweb_backups/
C:/wamp64/www/vipweb_backups/2026-05-29_antes_sprint_0/
  /project_files
  /database/vipweb_backup.sql
  /evidence/sprint-0-local-execution.md
```

## Rollback local

Rollback significa restaurar copia de carpeta y base SQL:

```txt
1. Parar WAMP si hace falta.
2. Renombrar carpeta rota: vipweb_broken_YYYY-MM-DD.
3. Copiar backup bueno como vipweb.
4. Restaurar SQL desde phpMyAdmin.
5. Reiniciar WAMP.
6. Probar navegador local.
7. Registrar restauración en evidence/sprint-0-local-execution.md.
```

## Fuera de alcance actual

- Git.
- GitHub.
- CI/CD.
- Staging real.
- Producción remota.
- Docker.
- Kubernetes.
- Despliegues automatizados.

## Revisión futura

Cuando exista base estable, podrá abrirse una ADR distinta para repositorio remoto, ramas, paquetes, CI/CD y despliegue externo. Esta revisión no debe duplicar ADR-026.

## Trigger de transición a control de versiones

El flujo actual sin Git sigue siendo válido mientras el proyecto esté en Sprint 0 documental/local y los cambios sean lineales, pequeños y recuperables mediante restauración manual.

ADR-026 ya existe como propuesta condicional para introducir Git local mínimo. Debe activarla un owner humano antes de continuar si ocurre cualquiera de estas condiciones:

1. Se van a aplicar cambios generados o preparados por IA sobre archivos reales de código, migraciones, rollbacks, schemas, catálogos machine-readable o contratos técnicos. La creación de un `AIDraft` no aplicado no activa este trigger.
2. Una tanda de cambios afecta a más de 10 archivos.
3. Se modifica una migración ya aplicada o se crea una migración que altera tablas existentes.
4. Existen dos o más líneas de trabajo paralelas.
5. Se necesita comparar diferencias entre versiones más allá de `evidence/sprint-0-local-execution.md`.
6. Se prepara AI-2 para algo más que borradores no aplicados o evidencia append-only aprobada.
7. Se plantea AI-3.
8. Se prepara staging, despliegue externo, repositorio remoto o colaboración con otra persona.
9. Se repite rollback manual más de una vez en la misma fase.
10. El Doctor pasa, pero se necesita auditar exactamente qué líneas cambiaron.

A efectos de este trigger, “aplicar cambios preparados por IA” significa modificar archivos reales a partir de una propuesta, patch, borrador, diff o instrucción generada por IA, aunque la aplicación final la haga manualmente un humano.

Mientras no se active ningún trigger, siguen siendo obligatorios:

- backup completo de carpeta;
- export SQL si existe base de datos;
- Doctor antes/después;
- evidencia;
- `evidence/sprint-0-local-execution.md`.

ADR aplicable: `ADR-026 — Introducción de Git local y control de versiones mínimo`, ubicada en `docs/12-decisions/proposed/` y mantenida en estado `proposed_conditional` hasta activación humana por trigger. No debe duplicarse ni marcarse como aceptada automáticamente.

## Regla de versión PHP

- `runtime_target_php_version`: PHP 8.4+.
- `runtime_minimum_php_version`: la versión instalada en WAMP local y registrada en evidencia.
- `runtime_verified_php_version`: resultado de `php -v` capturado en Sprint 0.
- Hasta verificar el entorno, el código runtime debe evitar sintaxis o features específicas de PHP 8.4.

## Regla de backup de evidencias

Todo backup operativo debe conservar conjuntamente:

- `evidence/sprint-0-local-execution.md`
- `evidence/sprint-0-local-execution.md`
- `evidence/sprint-0-local-execution.md`

La ruta directa sin carpeta fechada no es canónica y no debe usarse como ejemplo operativo.
