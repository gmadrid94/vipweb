# 04 Documentation Quality

**Estado recomendado:** `READY_FOR_IMPLEMENTATION`
**Gate operativo aplicable:** `READY_FOR_IMPLEMENTATION` indica madurez documental, no permiso operativo por sí solo. Prevalecen `CURRENT_STATUS.md` y `machine/roadmap_gates.json`. Con el estado global actual `READY_FOR_SPRINT_0`, este documento solo puede guiar tareas permitidas por Sprint 0. No autoriza UI visible, Dashboard, Onboarding ni módulos funcionales hasta alcanzar `READY_FOR_VISIBLE_FEATURE_DEVELOPMENT`.


## Documento sustantivo
Un documento es sustantivo si contiene decisión, reglas, alcance, relaciones, validación y riesgos. No basta con indicar qué debería cubrir.

## Documento plantilla
Un documento se considera plantilla si contiene frases como frases de marcador genéricas o instrucciones sin contenido operativo sin desarrollar reglas propias.

## Criterios de validación
Doctor debe fallar en documentos canónicos que sigan siendo armazón.

## Política de referencias de validación

`validated_by` solo debe apuntar a checks ejecutables por Doctor. Las revisiones humanas usan `manual_review_ref` y las evidencias generadas usan `evidence_ref`.
