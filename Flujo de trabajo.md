#Flujo de Trabajo para el Desarrollo de la Aplicación de Gestión de
Acciones

Objetivo:

Establecer un flujo claro y ordenado para las actividades de desarrollo
del sistema, asegurando el cumplimiento de los objetivos y la calidad
del producto.

Fases del desarrollo

1.  Planificación

Objetivos:

-   Definir los requerimientos funcionales y no funcionales

-   Identificar las tecnologías a utilizar.

-   Elaborar los casos de uso principales.

Entregables: Documento de Diseño del Producto.

2.  Diseño

Objetivos:

-   Crear el diseño de la arquitectura.

-   Definir el modelo de datos.

-   Prototipar interfaces de usuarios.

Entregables: Diagramas de arquitectura

3.  Configuración del Entorno

Requisitos del Sistema

-   Lenguaje: Java 8 o Superior

-   Dependencias: 'org,json' librería necesaria para manejar respuestas
    JSON.

Configuración de Git

Clonar el Repositorio

> *git clone \<URL_DEL_REPOSITORIO\>*
>
> *cd \<NOMBRE_DEL_REPOSITORIO\>*

Flujo de Trabajo para gestión de ramas en Github

Descripción:

El flujo de trabajo está diseñado para gestionar eficientemene las ramas
principales del repositorio en su caso main, Codigo, documentación.

Ramas del proyecto

El repositorio se organiza en las siguientes ramas principales:

1.  Main: Contiene la versión estable del proyecto. Solo se actualiza
    después de las revisiones y aprobaciones de los cambios en otras
    ramas.

2.  Código: Rama destinada al desarrollo del código fuente y nuevas
    funcionalidades.

3.  Documentación técnica y funcionalidades.

> Se pueden agregar mas ramas dependiendo del avance del proyecto.
>
> Proceso de Trabajo

1.  Creación de Cambios:

-   Los desarrolladores trabajan en una rama específica según el tipo de
    cambio (código, documentación, o mejoras de la próxima versión).

-   Se recomienda trabajar en ramas de características (feature
    branches) temporales para desarrollar funcionalidades específicas.
    Estas ramas se crean a partir de la rama correspondiente (codigo,
    documentacion o version-2).

2.  Subir Cambios:

-   Los desarrolladores realizan un push de sus cambios a la rama
    asignada.

3.  Revisión de Cambios:

-   Una vez que los cambios están listos, se abre un Pull Request (PR)
    desde la rama de desarrollo hacia la rama principal (main).

-   Los revisores evalúan el código/documentación, verifican el
    cumplimiento de los estándares, y realizan sugerencias si es
    necesario.

4.  Integración a la Rama Principal (main):

-   Después de que el PR sea aprobado, un miembro del equipo fusiona
    (merge) los cambios manualmente con la rama main.

-   Se realizan pruebas finales para garantizar que el proyecto no se
    vea afectado por los cambios integrados.

![image](https://github.com/user-attachments/assets/c6767558-9dd9-41fb-9d93-f2660feb8468)


4.  Desarrollo

Base de Datos: Diseño y configuración de tabla en SQLite.

Back-End: Implementación de controladores y servicios en Node.js para
gestionar la lógica de negocio y exponer la API.

Front-End: Creación de vistas y componentes interactivos utilizando
HTML, CSS, y JavaScript.

5.  Revisión de Código

Objetivos:

-   Validar funcionalidad de cada módulo.

-   Revisión por pares del código, proveer retroalimentación y solicitar
    si es necesario.

Entregables: Informe de pruebas.

6.  Mantenimiento

Objetivos:

-   Planificar y ejecutar actualizaciones periódicas

-   Gestionar actualizaciones y nuevos requerimientos.

Entregables: Actualizaciones y mejoras continuas.

Conclusión

Se asegura que el flujo es flexible, está estructurado de tal forma que
se puede cumplir con el objetivo planteado.
