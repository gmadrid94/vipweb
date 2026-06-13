
# 07 MVP Qualitative Validation

**Estado recomendado:** `READY_FOR_IMPLEMENTATION`  
**Gate operativo aplicable:** `READY_FOR_IMPLEMENTATION` indica madurez documental, no permiso operativo por sí solo. Prevalecen `CURRENT_STATUS.md` y `machine/roadmap_gates.json`. Con el estado global actual `READY_FOR_SPRINT_0`, este protocolo no autoriza UI visible ni módulos funcionales hasta alcanzar `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT`.

**Fuente machine-readable:** `machine/mvp_qualitative_validation.json`.

## Propósito

Validar de forma temprana si el primer ICP real entiende VipWeb como ecosistema, percibe acompañamiento y sabe qué hacer después de entrar.

Las métricas cuantitativas siguen siendo canónicas para seguimiento, pero al inicio puede no existir muestra suficiente. Este protocolo evita tomar decisiones de expansión visual o funcional sin aprendizaje cualitativo mínimo.

## Supuesto razonable

El primer piloto puede incluir owner individual, equipo pequeño o ambos. El protocolo se diseña compatible con ambos perfiles y no cambia el alcance del MVP.

## Muestra mínima

- 3 a 5 sesiones observadas.
- Usuarios: owner operador de ecosistema web modular o equipo pequeño provisionado.
- Cuenta: provisionada, sin auto-registro público.
- Modalidad: sesión guiada por tareas, sin explicar previamente la interfaz salvo credenciales de acceso.

## Tareas observables

| ID | Tarea | Señal observada |
|---|---|---|
| QV-001 | Acceder con cuenta provisionada | Comprende login y estado de entrada. |
| QV-002 | Completar onboarding mínimo | No requiere explicación externa. |
| QV-003 | Interpretar dashboard | Entiende estado, módulos y próximo paso. |
| QV-004 | Identificar siguiente acción | Puede decir qué haría después. |
| QV-005 | Entender progreso | Percibe orientación, no decoración. |
| QV-006 | Volver tras cerrar sesión | Reconoce continuidad. |
| QV-007 | Entender ayuda contextual IA si aparece | No la percibe como autónoma ni intrusiva. |

## Preguntas post-sesión

1. ¿Qué crees que debes hacer ahora?
2. ¿Qué parte te acompañó mejor?
3. ¿Dónde dudaste?
4. ¿Qué esperabas encontrar y no encontraste?
5. ¿Volverías? ¿Para qué?
6. ¿El progreso te orientó o te pareció decorativo?
7. ¿La ayuda contextual fue clara sobre sus límites?

## Criterios de éxito

El piloto cualitativo se considera suficiente para continuar si se cumplen estas condiciones:

- al menos 3 sesiones completas;
- la mayoría identifica el siguiente paso sin ayuda;
- el dashboard se entiende como punto de continuidad;
- el onboarding no requiere explicación externa relevante;
- el progreso se percibe como orientación;
- no aparece confusión crítica sobre permisos, IA o módulos;
- las dudas detectadas se pueden resolver con copy, orden visual o contrato de pantalla sin rediseñar core.

## Criterios de fallo

Debe bloquearse la expansión visible y revisar UX/producto si ocurre cualquiera de estas señales:

- el usuario no entiende qué es el ecosistema;
- el dashboard parece un panel técnico sin acompañamiento;
- el usuario no sabe por qué volver;
- el onboarding necesita explicación externa constante;
- la gamificación se percibe como adorno o presión;
- la IA se percibe como autónoma cuando no lo es;
- la solución exige cambiar core, permisos o modelo de datos para ser comprensible.


## Prevalencia con muestra pequeña

Si las métricas cuantitativas no alcanzan su `minimum_sample`, el piloto cualitativo decide únicamente sobre comprensión, acompañamiento, continuidad y fricción observable. En ese estado:

- las métricas cuantitativas son baseline no concluyente;
- una métrica por debajo de objetivo no bloquea por sí sola si la muestra es insuficiente;
- una métrica por encima de objetivo no desbloquea por sí sola expansión visible;
- cualquier fallo cualitativo crítico sí bloquea expansión visible aunque las señales cuantitativas parezcan favorables;
- la decisión debe registrar si se usó `quantitative_baseline_only` o muestra cuantitativa suficiente.

## Relación con métricas

| Métrica | Uso cualitativo |
|---|---|
| `activation_rate` | Contrastar si completar onboarding significa comprensión real. |
| `dashboard_return_rate` | Explicar por qué el usuario vuelve o no vuelve. |
| `onboarding_completion_time` | Distinguir rapidez de comprensión. |
| `module_usage_count` | Observar si el usuario entiende qué módulo usar primero. |
| `ai_suggestion_acceptance_rate` | Evaluar confianza y límites de ayuda IA si aparece. |

## Decisión posterior

Tras las sesiones se registra una decisión de una de estas categorías:

- `continue`: se puede continuar con implementación visible planificada;
- `iterate_copy_or_layout`: ajustar copy, orden o composición sin cambiar core;
- `block_visible_expansion`: no ampliar módulos visibles hasta corregir comprensión;
- `reopen_product_assumption`: reabrir hipótesis de producto si el problema afecta valor, acompañamiento o continuidad.

## Criterios de validación

Doctor debe validar `MVP_QUALITATIVE_VALIDATION_PROTOCOL_DECLARED` y `MVP_QUALITATIVE_VALIDATION_LINKS_METRICS_AND_JOURNEYS`.
