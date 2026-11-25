# 1. Componentes técnicos

Este apartado recoge los componentes técnicos del proyecto «Gestión de socios y donaciones», tomando como referencia el documento *Análisis y arquitectura* incluido en el repositorio y la estructura real del código Java. Las decisiones que se exponen son la base inicial del proyecto y no implican que la aplicación esté terminada.

## 1.1. Tecnologías y herramientas

| Tecnología o herramienta | Función prevista |
| --- | --- |
| Java | Lenguaje de programación principal para el desarrollo de la aplicación de escritorio. |
| Java Swing | Biblioteca prevista para construir las ventanas y los elementos gráficos de la aplicación. |
| MySQL | Sistema gestor de base de datos relacional previsto para almacenar la información de usuarios, socios y donaciones. |
| JDBC | API estándar de Java prevista para la comunicación entre la aplicación y MySQL. |
| IntelliJ IDEA | Entorno de desarrollo integrado previsto para la edición y organización del proyecto. |
| GitHub | Plataforma prevista para el alojamiento del repositorio y el control de versiones. |
| OpenCode | Herramienta de apoyo al desarrollo prevista dentro del entorno de trabajo. |
| GitHub Copilot | Asistente de programación previsto como apoyo durante el desarrollo. |

Estas tecnologías y herramientas son las previstas inicialmente y podrían cambiar durante el desarrollo en función de las necesidades del proyecto.

## 1.2. Arquitectura del proyecto

Según el análisis del proyecto, se prevé seguir el patrón **MVC (Modelo-Vista-Controlador)**, que permite separar la aplicación en tres partes con responsabilidades concretas y facilita su organización y mantenimiento.

- **Modelo (Model):** parte encargada de representar y gestionar los datos de la aplicación. En el repositorio existe el paquete `modelo`, con las clases `Usuario`, `Socio` y `Donacion`, que actualmente son esqueletos sin funcionalidad implementada.
- **Vista (View):** parte visual de la aplicación. Le corresponde el paquete `vista`, que contiene las clases de las ventanas previstas en el análisis. Todavía no contienen la interfaz implementada.
- **Controlador (Controller):** parte encargada de conectar la vista con el modelo. Le corresponde el paquete `controlador`, con las clases `ControladorLogin`, `SocioController` y `DonacionController`, también pendientes de desarrollo.

El acceso a la información se prevé como un complemento de esta estructura, a través del paquete `datos` y de la clase `ConexionBD`, de forma que modelo, vista y controlador trabajen de manera coordinada sin que cada parte asuma responsabilidades ajenas a la suya.

## 1.3. Estructura de paquetes y clases

La estructura real del código Java en el repositorio es la siguiente:

```text
Gestor_ONG/
└── src/
    └── main/
        ├── java/
        │   ├── Main.java
        │   ├── modelo/
        │   │   ├── Usuario.java
        │   │   ├── Socio.java
        │   │   └── Donacion.java
        │   ├── datos/
        │   │   └── ConexionBD.java
        │   ├── controlador/
        │   │   ├── ControladorLogin.java
        │   │   ├── SocioController.java
        │   │   └── DonacionController.java
        │   └── vista/
        │       ├── VentanaLogin.java
        │       ├── VentanaPrincipal.java
        │       ├── VentanaSocios.java
        │       └── VentanaDonaciones.java
        └── resources/
            └── .gitkeep
```

El documento de análisis propone en su apartado 4 una organización con los nombres `model`, `view`, `controller` y `database`. La estructura del repositorio utiliza los nombres `modelo`, `vista`, `controlador` y `datos` dentro de un proyecto Maven. En este documento se describe la estructura existente para evitar contradicciones; no se han renombrado ni eliminado archivos Java.

La función prevista de cada paquete y clase es la siguiente:

| Paquete / clase | Función prevista |
| --- | --- |
| `modelo` | Agrupar las clases que representan los datos de la aplicación. |
| `Usuario` | Almacenar los datos necesarios para el acceso a la aplicación, según el análisis (identificador, usuario y contraseña). |
| `Socio` | Representar a los miembros de la asociación y contener sus datos personales y de contacto. |
| `Donacion` | Representar las aportaciones realizadas por los socios y su asociación con el socio correspondiente. |
| `datos` | Agrupar las clases necesarias para la conexión y el acceso a la base de datos. |
| `ConexionBD` | Encargarse de la conexión con la base de datos MySQL desde el paquete `datos`. |
| `controlador` | Agrupar las clases encargadas de gestionar las acciones del usuario y de conectar las ventanas con los datos. |
| `ControladorLogin` | Gestionar la acción de inicio de sesión prevista. |
| `SocioController` | Gestionar las acciones relativas a la consulta de socios prevista. |
| `DonacionController` | Gestionar las acciones relativas a la consulta y al registro de donaciones previstas. |
| `vista` | Agrupar las ventanas previstas en el análisis (inicio de sesión, pantalla principal, listado de socios y apartado de donaciones). No existe documentación de diseño de estas ventanas. |
| `VentanaLogin` | Ventana prevista para el inicio de sesión. |
| `VentanaPrincipal` | Ventana prevista como pantalla principal de navegación. |
| `VentanaSocios` | Ventana prevista para el listado de socios. |
| `VentanaDonaciones` | Ventana prevista para el listado y registro de donaciones. |
| `Main.java` | Punto de entrada del proyecto Java. |

Todas estas clases y paquetes existen en el repositorio como estructura inicial, pero ninguno contiene todavía la funcionalidad descrita.

## 1.4. Conexión con la base de datos

Se prevé que la aplicación Java se comunique con MySQL mediante JDBC, la API estándar de Java para acceder a bases de datos relacionales. A través de este mecanismo, y con el controlador JDBC adecuado para MySQL, la aplicación podría consultar la información de socios y donaciones y registrar nuevas donaciones, de acuerdo con las funciones previstas en el análisis.

La gestión de la conexión se prevé concentrada en la clase `ConexionBD`, dentro del paquete `datos`. El archivo `Gestor_ONG/src/main/java/datos/ConexionBD.java` existe actualmente como esqueleto, sin implementación. Los parámetros de conexión —como la dirección del servidor, el nombre de la base de datos, el usuario y la contraseña— se definirán cuando se determine la configuración del entorno de desarrollo.

En este documento no se implementa la conexión ni se especifica ningún valor para esos parámetros.

## 1.5. Base de datos

El repositorio contiene dos scripts SQL:

- `tablas_gestion_socios.sql`, en la raíz: crea las tablas `usuario`, `socio` y `donacion`, con sus campos, claves primarias, restricciones y la relación entre `socio` y `donacion` mediante clave foránea. Su estructura coincide con el modelo de datos descrito en el análisis, por lo que es el esquema de referencia de este proyecto.
- `Gestor_ONG/database/ong.sql`: incluido con el proyecto Java. Crea la base de datos `gestor_ong` y las tablas `usuarios`, `socios` y `donaciones`, e incorpora datos de prueba. Presenta diferencias respecto al análisis, como un campo `rol` de usuario y donaciones que pueden no estar asociadas a un socio.

No se ha modificado ninguno de los dos archivos. La decisión definitiva sobre cuál utilizar durante la implementación debe acordarla el equipo; el README indica partir del esquema de referencia mientras tanto.
