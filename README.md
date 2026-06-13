# VipWeb — raíz local limpia

Esta carpeta es la raíz runtime local de VipWeb y debe vivir en:

```txt
C:/wamp64/www/vipweb
```

Esta carpeta es el proyecto oficial y debe estar enlazada a Git.

- `public/`: único punto previsto para contenido visible por navegador. WAMP ya debe servir esta carpeta como document root público.
- `app/`: código backend privado.
- `config/`: configuración runtime local sin secretos reales.
- `project/`: documentación canónica operativa, machine-readable, database specs, evidencias, scripts canónicos y changelog.
- `tools/`: tools internas del proyecto, por ejemplo wrappers de reset local, Doctor wrapper o mantenimiento runtime.
- `logs/`: salidas generadas por tools internas/scripts del proyecto.
- `tmp/`: comprobaciones temporales prescindibles.

Carpetas hermanas esperadas bajo `C:/wamp64/www`:

```txt
vipweb_backups/  # backups externos
vipweb_tools/    # tools externas de ejecución del roadmap AI-first
```

La fuente operativa vigente está en `project/README.md` y `project/CURRENT_STATUS.md`.
