# Workflow local Windows/WAMP

## Estado vigente

VipWeb se desarrollará inicialmente en un servidor local Windows con WAMP.

```txt
Windows
WAMP
Apache
PHP
MySQL/MariaDB
Proyecto en C:/wamp64/www/vipweb
Sin Git
Sin despliegue externo
sin secretos reales en documentación o configuración local
```

## Regla principal

Antes de tocar código, estructura, base de datos, permisos, scripts o documentación crítica:

> Crear copia completa de carpeta + exportar SQL si existe base de datos.

## Estructura local recomendada

```txt
C:/wamp64/www/vipweb/
C:/wamp64/www/vipweb_backups/
C:/wamp64/www/vipweb_backups/2026-05-29_antes_sprint_0/
```

Cada backup importante debe contener:

```txt
/project_files
/database/vipweb_backup.sql
/evidence/sprint-0-local-execution.md
```

## Flujo antes de cambios importantes

1. Copiar `C:/wamp64/www/vipweb/` a una carpeta de backup con fecha y motivo.
2. Exportar la base de datos desde phpMyAdmin si existe.
3. Registrar el cambio previsto en `evidence/sprint-0-local-execution.md`.
4. Ejecutar `scripts/update_script.py` si ya está disponible.
5. Aplicar el cambio.
6. Ejecutar Doctor de nuevo.
7. Probar en navegador local.
8. Generar evidencia en `/evidence`.
9. Registrar resultado.

## Restauración local

1. Parar WAMP si es necesario.
2. Renombrar la carpeta dañada, por ejemplo `vipweb_broken_2026-05-29`.
3. Copiar el backup válido como `vipweb`.
4. Importar el SQL desde phpMyAdmin si la base de datos fue afectada.
5. Reiniciar WAMP.
6. Probar en navegador.
7. Registrar restauración en `evidence/sprint-0-local-execution.md`.

## Cuándo el backup es obligatorio

- Antes de ejecutar migraciones.
- Antes de tocar permisos.
- Antes de modificar `update_script.py`.
- Antes de cambiar estructura de carpetas.
- Antes de aplicar cambios generados por IA.
- Antes de tocar core, módulos, eventos, auditoría o configuración.

## Qué no aplica todavía

- Git.
- GitHub.
- Pull requests.
- CI/CD.
- Staging real.
- Producción remota.
- Docker.
- Kubernetes.
- Despliegue externo.

## Revisión futura

ADR-026 ya existe como propuesta condicional para introducir Git local mínimo cuando aplique su trigger. No debe abrirse una ADR duplicada para el mismo caso; solo debe activarse por owner humano cuando corresponda.

## Trigger de transición a control de versiones

El flujo WAMP local con backups, export SQL, Doctor, evidencia y `evidence/sprint-0-local-execution.md` sigue siendo válido mientras el proyecto esté en Sprint 0/Core Runtime local, no exista colaboración técnica concurrente y los cambios sean lineales, pequeños y recuperables mediante restauración manual.

Debe activarse por owner humano la ADR-026 ya registrada como propuesta condicional para introducir Git local y control de versiones mínimo antes de continuar si ocurre cualquiera de estas condiciones:

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

`ADR-026 — Introducción de Git local y control de versiones mínimo` ya existe como propuesta condicional. Repositorio remoto, ramas, CI/CD o despliegue externo requerirían una ADR distinta.

## Mitigación reforzada del riesgo WAMP/no Git

`R-WAMP-001` usa mitigación base mientras no haya triggers: backup completo, export SQL si existe, Doctor antes/después, evidencia y `evidence/sprint-0-local-execution.md`.

Si cualquier trigger ADR-021/ADR-026 se activa, la mitigación base deja de ser suficiente y debe añadirse Git local mínimo antes de aplicar cambios protegidos.

## Regla canónica de evidencia local

La evidencia debe generarse exclusivamente mediante `scripts/update_script.py`, que crea o actualiza:

- `evidence/sprint-0-local-execution.md`
- `evidence/sprint-0-local-execution.md`
- `evidence/sprint-0-local-execution.md`

No debe escribirse evidencia en una ruta directa sin carpeta fechada.

## Preflight ADR-026 dentro de Sprint 0

La tarea `S0-000A` debe ejecutarse antes de aplicar cualquier cambio protegido preparado por IA.

El preflight decide si se activa ADR-026, no sustituye la decisión humana. Debe registrar:

- archivos afectados;
- categoría protegida/no protegida;
- origen humano, `ai_generated` o `ai_prepared`;
- si el trigger ADR-026 aplica;
- evidencia de `git init` y commit baseline cuando aplique;
- razón de no activación cuando no aplique.

Si el trigger aplica y no existe Git local mínimo con baseline commit, queda bloqueada la aplicación real del cambio protegido. La IA puede detectarlo y proponer el bloqueo, pero no puede activar ADR-026 ni sustituir al owner humano.


## Verificación obligatoria de entorno antes de código runtime

Antes de escribir código PHP o SQL ejecutable debe cerrarse `S0-000` con evidencia fechada.

Comandos o comprobaciones mínimas:

```bash
php -v
mysql --version
```

Además debe registrarse la versión Apache/WAMP desde el panel local o CLI disponible.

La evidencia debe declarar:

- `runtime_verified_php_version`;
- `runtime_verified_database_version`;
- versión Apache/WAMP;
- decisión sobre sintaxis PHP 8.4;
- bloqueo explícito de sintaxis no compatible si el entorno real no alcanza el target.

## Artefactos SQL base de Sprint 0

El paquete incluye artefactos base para iniciar Sprint 0:

- `database/migrations/*.sql`;
- `database/rollbacks/*.sql`;
- `database/seeds/*.sql`.

Estos archivos son base ejecutable/documental derivada del modelo machine-readable. Deben ejecutarse solo después de backup local, verificación WAMP y registro en `evidence/sprint-0-local-execution.md`.

## Modo de desarrollo y ADR-026

Antes de aplicar cambios reales sobre archivos protegidos debe declararse `development_mode` dentro de `S0-000A`:

| Modo | Uso permitido | Implicación ADR-026 |
|---|---|---|
| `human_manual_only` | Cambios manuales humanos con backup, Doctor y registro operativo. | ADR-026 puede permanecer diferida si no hay otro trigger. |
| `ai_audit_only` | IA lee, audita, compara o propone sin aplicar cambios reales. | ADR-026 no se activa por lectura/propuesta. |
| `ai_prepared_changes_enabled` | IA prepara cambios que podrían aplicarse sobre archivos reales protegidos. | ADR-026 debe activarse por owner humano antes de aplicar. |

La IA puede detectar la necesidad de `development_mode`, pero no puede elegirlo, activarlo ni simular aprobación humana. Si el modo es `ai_prepared_changes_enabled`, el flujo WAMP/no Git queda reforzado con Git local mínimo, baseline commit y working tree limpio antes del cambio protegido.
