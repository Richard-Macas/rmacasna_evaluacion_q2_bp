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
> 2. Todos los archivos de datos JSON DEBEN ubicarse en `src/test/resources/data/[nombre_microservicio]/`.
> 3. Estas rutas son estándar para TODOS los proyectos y NO deben modificarse.

---

## Objetivo

Crear escenarios `.feature` con enfoque senior: estandarizado, limpio, escalable y mantenible.

### Fuentes de entrada y estrategias de generación

- **Si la entrada es una colección Postman:** Se usarán sus requests y ejemplos de respuesta para generar los JSON necesarios en `src/test/resources/data` y construir los escenarios para cada caso de uso.

- **Si la entrada es un comando cURL:** Se generarán automáticamente al menos 3 escenarios base:
  - 200 (respuesta exitosa)
  - 400 (datos inválidos)
  - 500 (error interno del sistema)
---

## 1. Convenciones y nombres
>
> **Nota sobre variables de entorno:** Es OBLIGATORIO usar las variables definidas en `karate-config.js` para las URLs de los microservicios. Estas variables deben tener el prefijo `port_` seguido del nombre del microservicio en snake_case. Si la variable que necesitas no existe en `karate-config.js`, debes añadirla siguiendo esta convención.
>