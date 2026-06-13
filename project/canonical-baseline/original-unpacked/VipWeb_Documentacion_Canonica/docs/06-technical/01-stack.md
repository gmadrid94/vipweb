# 01 Stack

**Estado recomendado:** `READY_FOR_IMPLEMENTATION`
**Gate operativo aplicable:** `READY_FOR_IMPLEMENTATION` indica madurez documental, no permiso operativo por sí solo. Prevalecen `CURRENT_STATUS.md` y `machine/roadmap_gates.json`. Con el estado global actual `READY_FOR_SPRINT_0`, este documento solo puede guiar tareas permitidas por Sprint 0. No autoriza UI visible, Dashboard, Onboarding ni módulos funcionales hasta alcanzar `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT`.


## Stack inicial
- Apache local bajo WAMP.
- PHP local para runtime inicial.
- Target técnico: PHP 8.4+.
- Mínimo operativo: versión PHP instalada en WAMP local y registrada en evidencia mediante `php -v` antes de escribir código runtime.
- MySQL/MariaDB para persistencia.
- JSON para catálogos machine-readable.
- Scripts Python para Doctor, sincronización y evidencias.

## Reglas
- No acoplar lógica de dominio a WAMP.
- Mantener migraciones SQL simples y reversibles.
- Separar configuración local de secretos.
- Diseñar rutas, permisos y módulos de forma portable.

## Criterios de validación
El proyecto debe poder reconstruirse desde documentación, catálogos y migraciones sin depender de servicios externos.

## Versiones runtime

- `runtime_target_php_version`: PHP 8.4+.
- `runtime_minimum_php_version`: pendiente de verificación en Sprint 0 mediante `php -v`.
- `runtime_verified_php_version`: se registrará en evidencia antes de escribir código runtime.
- Regla: no usar sintaxis específica de PHP 8.4 ni features superiores al mínimo verificado hasta que WAMP local confirme compatibilidad.
