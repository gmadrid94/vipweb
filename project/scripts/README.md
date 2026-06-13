# Scripts canónicos

`scripts/update_script.py` es el único validador documental ejecutable de la baseline actual.

Reglas:

- Vive bajo `PROJECT_CONTROL_ROOT`.
- Se puede ejecutar desde `APP_ROOT` con `python project/scripts/update_script.py`.
- Se puede ejecutar desde `PROJECT_CONTROL_ROOT` con `python scripts/update_script.py`.
- No modifica archivos.
- No ejecuta migraciones.
- No ejecuta seeds.
- No genera evidencia.
