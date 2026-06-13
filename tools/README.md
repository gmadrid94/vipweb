# Tools internas del proyecto

Esta carpeta pertenece al proyecto oficial `C:/wamp64/www/vipweb` y se versiona con el repo.

Uso previsto:

- wrappers internos del producto;
- comandos de mantenimiento local propios de VipWeb;
- ejecución de validador readonly;
- reset local controlado cuando exista contrato;
- operaciones runtime internas que deban vivir junto al proyecto.

No confundir con:

```txt
C:/wamp64/www/vipweb_tools
```

`vipweb_tools` es la carpeta hermana externa para tools de ejecución del roadmap AI-first. Sus tools crean logs en `C:/wamp64/www/vipweb_tools/logs` y se revisan con GPT.

Reglas de esta carpeta:

- No es fuente canónica; la fuente está en `project/` y `machine/`.
- No sustituye a `project/scripts/`.
- No escribe evidencia canónica automáticamente.
- Guarda logs en `logs/` cuando procede.
- Las acciones destructivas deben exigir backup previo y confirmación explícita.

Tools incluidos:

- `doctor-readonly.bat`: ejecuta el validador readonly y guarda log.
- `sprint0-preflight.bat`: captura información básica de entorno y ejecuta el validador readonly.
- `backup-local.bat`: crea una copia local de la carpeta `vipweb` en `C:/wamp64/www/vipweb_backups/`.
