## Estructura estándar del proyecto
```
src/
└── test/
    ├── java/ <-- Ubicación de runner
    │   └── karate-config.js 
    │
    └── resources/
        ├── features/ <-- Ubicación features
        │   
        └── data/ <-- Ubicación farchivos de datos de prueba
            
```

> **IMPORTANTE**: 
> 1. Todos los escenarios DEBEN crearse en el archivo `src/test/java/karate-test.feature`.
> 2. Todos los archivos de datos JSON DEBEN CREARSE y ubicarse en `src/test/resources/data/[nombre_microservicio]/`.
> 3. Estas rutas son estándar para TODOS los proyectos y NO deben modificarse.
> 4. Los matches deben venir comentados por defecto, y se deben descomentar solo cuando se necesite validar un match específico.
---

## Objetivo

Crear escenarios `.feature` con enfoque senior: estandarizado, limpio, escalable y mantenible.

### Fuentes de entrada y estrategias de generación

- **Si la entrada es una colección Postman:** Se usarán sus requests y ejemplos de respuesta para generar los JSON necesarios en `src/test/resources/data` y construir los escenarios para cada caso de uso.

- **Si la entrada es un comando cURL:** Se generarán automáticamente al menos 3 escenarios base y se crearán los JSON necesarios en `src/test/resources/data` para cada uno de ellos.:
  - 200 (respuesta exitosa)
  - 400 (datos inválidos)
  - 500 (error interno del sistema)

---

## 1. Convenciones y nombres
| Elemento            | Convención                      | Ejemplo                                 |
|---------------------|----------------------------------|-----------------------------------------|
| Carpeta de JSON     | nombre del servicio             | src/test/resources/data/tre_msa_savings_account |
| Archivos JSON       | snake_case_descriptivo          | request_creation_account.json           |
| Tags escenario      | @id:N @descripcion @resultado   | @id:1 @crearCuentaKyc @solicitudExitosa200 |
| Escenarios          | T-API-ID-CAN-Descripción        | T-API-BTPMCDP-118-CA01-Crear cuenta exitosamente 201 - karate |
> **Nota importante:** En los ejemplos, "BTPMCDP-118" es el identificador de una historia de usuario específica. Cuando actualices el feature, debes reemplazarlo por el número de la historia de usuario que estés automatizando. Pregunta al usuario por el ID de la historia de usuario si no lo tienes.
>
> **Nota sobre variables de entorno:** Es OBLIGATORIO usar las variables definidas en `karate-config.js` para las URLs de los microservicios. Estas variables deben tener el prefijo `port_` seguido del nombre del microservicio en snake_case. Si la variable que necesitas no existe en `karate-config.js`, debes añadirla siguiendo esta convención.
>
> **Importante:** Todos los features DEBEN incluir los siguientes tags en la primera línea:
> - `@REQ_[HISTORIA-ID]`: Número de la historia de usuario (ej: @REQ_BTPMCDP-118)
> - `@HU[ID-SIN-PREFIJO]`: ID de la historia de usuario sin prefijo (ej: @HU118)
> - `@descripcion_historia`: Descripción breve de la historia de usuario en snake_case (ej: @account_creation_savings)
> - `@nombre_microservicio`: Nombre del microservicio con guion bajo (ej: @tre_msa_savings_account). Si el nombre original contiene guiones, debe convertirse a guiones bajos.
> - `@Agente2 @E2`: Tags fijos que deben ir siempre
> - `@iniciativa_descripcion`: Descripción corta de la iniciativa en snake_case (ej: @iniciativa_cuentas)
>
> Donde `[HISTORIA-ID]` debe ser reemplazado con el ID real de la historia de usuario que estás automatizando (ej: BTPMCDP-118).

---

## 3. JSON de ejemplo (`src/test/resources/data/usuarios/usuarios_validos.json`)

```json
[
  {
    "nombre": "Marco Clavijo",
    "email": "marco@test.com",
    "rol": "admin"
  },
  {
    "nombre": "Erick Torres",
    "email": "etorres@test.com",
    "rol": "usuario"
  }
]
```

---

## 4. Buenas prácticas de código limpio

- Reutiliza `Background` para autenticación y headers comunes.
- Centraliza y reutiliza datos de prueba en `src/test/resources/data/...`.
- No hardcodees valores repetitivos (usar `karate-config.js` o archivos JSON).
- Usa `Scenario Outline` cuando haya múltiples combinaciones de datos.
- **Los escenarios deben tener el formato**: `T-API-[HISTORIA-ID]-CAXX-Descripción acción resultado código - karate`
- **Solicita siempre el ID de la historia de usuario** antes de comenzar a crear un feature, para poder incluirlo correctamente en todos los lugares necesarios.
- **Gestión de variables de entorno**:
  - Usar siempre snake_case (guiones bajos) para los nombres de microservicios, independientemente de su nombre original

---