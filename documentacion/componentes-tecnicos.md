# 1. Componentes técnicos

Este apartado recoge los componentes técnicos previstos para el proyecto «Gestión de socios y donaciones», tomando como referencia el documento *Análisis y arquitectura* incluido en el repositorio. Las decisiones que se exponen constituyen una propuesta inicial y no implican que exista código desarrollado en este momento.

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

- **Modelo (Model):** parte encargada de representar y gestionar los datos de la aplicación. Está previsto que incluya las clases `Usuario`, `Socio` y `Donacion`, que representarán los elementos principales con los que trabajará la aplicación.
- **Vista (View):** parte visual de la aplicación. Agrupará las ventanas y los elementos con los que interactuará el usuario, y se encargará de mostrar la información y de permitir la realización de acciones a través de dichos elementos gráficos.
- **Controlador (Controller):** parte encargada de conectar la vista con el modelo. Gestionará las acciones del usuario, recogerá los datos introducidos y realizará las comprobaciones necesarias antes de guardarlos.

El acceso a la información se prevé como un complemento de esta estructura, a través del paquete `database`, de forma que modelo, vista y controlador trabajen de manera coordinada sin que cada parte asuma responsabilidades ajenas a la suya.

## 1.3. Estructura de paquetes y clases

Se propone la siguiente organización inicial del código Java

```text
GestionSocios/
└── src/
    ├── Main.java
    ├── model/
    │   ├── Usuario.java
    │   ├── Socio.java
    │   └── Donacion.java
    ├── view/
    ├── controller/
    │   ├── LoginController.java
    │   ├── SocioController.java
    │   └── DonacionController.java
    └── database/
        └── ConexionBD.java
```

La función prevista de cada paquete y clase es la siguiente:

| Paquete / clase | Función prevista |
| --- | --- |
| `model` | Agrupar las clases que representan los datos de la aplicación. |
| `Usuario` | Almacenar los datos necesarios para el acceso a la aplicación, según el análisis (identificador, usuario y contraseña). |
| `Socio` | Representar a los miembros de la asociación y contener sus datos personales y de contacto. |
| `Donacion` | Representar las aportaciones realizadas por los socios y su asociación con el socio correspondiente. |
| `view` | Agrupar las ventanas previstas en el análisis (inicio de sesión, pantalla principal, listado de socios y apartado de donaciones). No se detalla aquí su diseño. |
| `controller` | Agrupar las clases encargadas de gestionar las acciones del usuario y de conectar las ventanas con los datos. |
| `LoginController` | Gestionar la acción de inicio de sesión prevista. |
| `SocioController` | Gestionar las acciones relativas a la consulta de socios prevista. |
| `DonacionController` | Gestionar las acciones relativas a la consulta y al registro de donaciones previstas. |
| `database` | Agrupar las clases necesarias para establecer la conexión con MySQL y trabajar con la información almacenada. |
| `ConexionBD` | Encargarse de la conexión con la base de datos MySQL desde el paquete `database`. |

Todas estas clases y paquetes forman parte de la organización propuesta; en el repositorio no se ha implementado ninguna de ellas.

## 1.4. Conexión con la base de datos

Se prevé que la aplicación Java se comunique con MySQL mediante JDBC, la API estándar de Java para acceder a bases de datos relacionales. A través de este mecanismo, y con el controlador JDBC adecuado para MySQL, la aplicación podría consultar la información de socios y donaciones y registrar nuevas donaciones, de acuerdo con las funciones previstas en el análisis.

La idea es que la gestión de la conexión se concentre en la clase `ConexionBD`, dentro del paquete `database`, para que el resto de la estructura pueda acceder a la base de datos sin duplicar esa responsabilidad. Los parámetros de conexión —como la dirección del servidor, el nombre de la base de datos, el usuario y la contraseña— se definirán cuando se determine la configuración del entorno de desarrollo.


## 1.5. Base de datos

El repositorio contiene el archivo `tablas_gestion_socios.sql`, que incluye la creación de las tablas `usuario`, `socio` y `donacion`, con sus campos, claves primarias, restricciones y la relación entre `socio` y `donacion` mediante clave foránea. Dicho archivo constituye la referencia prevista para la estructura de datos del proyecto.

El archivo no ha sido modificado y no se ha creado ningún otro archivo SQL en esta tarea.
