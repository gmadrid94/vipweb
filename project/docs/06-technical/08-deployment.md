# Entorno local Windows/WAMP y recuperación manual

**Estado:** vigente para la fase actual.  
**ADR aplicable:** ADR-021, ADR-029 y ADR-030. ADR-026 sigue siendo el contrato de activación verificable para cambios protegidos preparados por IA.

## Decisión operativa

VipWeb se desarrollará inicialmente en un servidor local Windows con WAMP. No existe despliegue externo, staging real, producción remota ni CI/CD en esta fase.

El proyecto oficial local vive en `C:/wamp64/www/vipweb` y debe estar enlazado a Git para el modelo AI-first. Git no sustituye backups, export SQL, Doctor/validador ni evidencia.

## Entorno vigente

```txt
Windows
WAMP
Apache
PHP local verificado mediante php -v
Target recomendado: PHP 8.4+
Sin features específicas de PHP 8.4 hasta verificar compatibilidad local
MySQL/MariaDB
WAMP_WWW_ROOT = C:/wamp64/www
APP_ROOT = OFFICIAL_REPO_ROOT = C:/wamp64/www/vipweb
PROJECT_CONTROL_ROOT = C:/wamp64/www/vipweb/project
PUBLIC_DOCUMENT_ROOT = C:/wamp64/www/vipweb/public
BACKUP_ROOT = C:/wamp64/www/vipweb_backups
EXTERNAL_ROADMAP_TOOLS_ROOT = C:/wamp64/www/vipweb_tools
EXTERNAL_TOOL_LOG_ROOT = C:/wamp64/www/vipweb_tools/logs
Sin despliegue externo
```

## Public root

WAMP ya está configurado por el owner para servir:

```txt
C:/wamp64/www/vipweb/public
```

Sprint 0 debe verificar que `public/` es el único punto accesible por navegador y que carpetas privadas no quedan expuestas.

## Protección antes de cambios importantes

Antes de tocar estructura, base de datos, core, permisos, scripts o módulos:

1. Ejecutar la tool externa correspondiente si se requiere acceso local real.
2. Conservar su log en `C:/wamp64/www/vipweb_tools/logs`.
3. Copiar carpeta completa del proyecto cuando aplique.
4. Exportar base de datos desde phpMyAdmin o CLI si existe.
5. Confirmar Git limpio para cambios protegidos preparados por IA.
6. Ejecutar validación readonly si está disponible.
7. Registrar cambio previsto en `evidence/sprint-0-local-execution.md`.
8. Aplicar cambios permitidos.
9. Ejecutar validación readonly de nuevo.
10. Registrar resultado manualmente.

## Estructura recomendada de backups

```txt
C:/wamp64/www/vipweb/
C:/wamp64/www/vipweb_backups/
C:/wamp64/www/vipweb_backups/2026-05-29_antes_sprint_0/
  /project_files
  /database/vipweb_backup.sql
  /project/evidence/sprint-0-local-execution.md
  /logs
  /metadata
```

## Rollback local

Rollback significa restaurar copia de carpeta y base SQL:

```txt
1. Parar WAMP si hace falta.
2. Renombrar carpeta rota: vipweb_broken_YYYY-MM-DD.
3. Copiar backup bueno como vipweb.
4. Restaurar SQL desde phpMyAdmin o CLI.
5. Reiniciar WAMP.
6. Probar navegador local.
7. Registrar restauración en evidence/sprint-0-local-execution.md.
```

## Raíz limpia y visibilidad

La raíz local del proyecto debe contener solo:

```txt
public/
app/
config/
project/
tools/
logs/
tmp/
```

`public/` es el único punto previsto para navegador. La configuración de Apache declarada por el owner es:

```txt
DocumentRoot = C:/wamp64/www/vipweb/public
```

## Fuera de alcance actual

- GitHub remoto obligatorio.
- CI/CD.
- Staging real.
- Producción remota.
- Docker.
- Kubernetes.
- Despliegues automatizados.

## Revisión futura

Repositorio remoto, ramas, pull requests, CI/CD o despliegue externo requieren una ADR posterior. Esta baseline solo exige Git local/controlado para proteger el trabajo AI-first dentro del repo oficial local.

## ADR-026

ADR-026 no debe duplicarse. Sigue definiendo el gate para aplicar cambios reales preparados por IA sobre archivos protegidos.

Mientras ADR-026 no tenga activation_record completo, los cambios protegidos preparados por IA permanecen bloqueados aunque exista Git local.

## Regla de versión PHP

- `runtime_target_php_version`: PHP 8.4+.
- `runtime_minimum_php_version`: la versión instalada en WAMP local y registrada en evidencia.
- `runtime_verified_php_version`: resultado de `php -v` capturado en Sprint 0.
- Hasta verificar el entorno, el código runtime debe evitar sintaxis o features específicas de PHP 8.4.

## Regla de backup de evidencias

Todo backup operativo debe conservar conjuntamente:

- `project/evidence/sprint-0-local-execution.md`
- logs relevantes bajo `logs/` si existen
- logs externos relevantes bajo `C:/wamp64/www/vipweb_tools/logs`
- SQL exportado si existe base local

La ruta directa sin carpeta fechada no es canónica y no debe usarse como ejemplo operativo.
