# Gestión de socios y donaciones

## Descripción del proyecto

Proyecto de 2.º de DAM consistente en una aplicación de escritorio para la **gestión de socios y donaciones** de una asociación u ONG. El repositorio reúne el análisis y la arquitectura de la aplicación, la documentación del proyecto, los scripts de base de datos y el proyecto Java inicial aportado por una integrante del equipo.

## Objetivo de la aplicación

La aplicación pretende reunir en un único lugar la información de los socios y las donaciones registradas, para poder consultarla de forma sencilla y ordenada. Según el análisis del proyecto, las funciones previstas son el inicio de sesión, la consulta del listado de socios, la visualización del detalle de un socio, la consulta de las donaciones realizadas por cada socio, la visualización de todas las donaciones y el registro de nuevas donaciones.

## Tecnologías

Las tecnologías previstas para el desarrollo son:

- **Java**: lenguaje de programación de la aplicación.
- **Java Swing**: biblioteca para la interfaz gráfica de escritorio.
- **JDBC**: API para la comunicación entre Java y la base de datos.
- **MySQL**: sistema gestor de base de datos relacional.

La relación de herramientas previstas inicialmente, junto con las decisiones de arquitectura, se recoge en `documentacion/componentes-tecnicos.md`.

## Estructura del repositorio

```text
Proyecto/
├── README.md
├── .gitignore
├── AnalisisyArquitectura.pdf
├── tablas_gestion_socios.sql
│
├── documentacion/
│   ├── componentes-tecnicos.md
│   └── planificacion.md
│
└── Gestor_ONG/
    ├── .gitignore
    ├── README.md
    ├── pom.xml
    ├── database/
    │   └── ong.sql
    └── src/
        └── main/
            └── java/
                ├── Main.java
                ├── modelo/
                ├── datos/
                ├── controlador/
                └── vista/
```

### Contenido de las carpetas principales

- **`documentacion/`**: documentación del proyecto. `componentes-tecnicos.md` describe tecnologías, arquitectura y organización prevista; `planificacion.md` recoge el reparto de tareas, el calendario y el orden de implementación.
- **`Gestor_ONG/`**: proyecto Java inicial subido por una integrante. Incluye un `pom.xml` de Maven y una estructura de paquetes Java.
- **`Gestor_ONG/database/`**: script SQL aportado con el proyecto Java.

### Paquetes Java existentes

Dentro de `Gestor_ONG/src/main/java/` se encuentran los paquetes:

- **`modelo`**: clases previstas para representar usuarios, socios y donaciones.
- **`datos`**: clase prevista para la conexión con la base de datos.
- **`controlador`**: clases previstas para gestionar las acciones de la aplicación.
- **`vista`**: clases previstas para las ventanas de la aplicación.

Actualmente son estructuras iniciales: las clases están creadas pero todavía no contienen la funcionalidad de la aplicación. La documentación de componentes técnicos propone como referencia los paquetes `model`, `view`, `controller` y `database`; la nomenclatura definitiva se acordará antes de continuar el desarrollo.

## Preparación inicial del proyecto y la base de datos

1. Clonar el repositorio:

   ```bash
   git clone https://github.com/nnereacruz/Proyecto.git
   ```

2. Revisar `AnalisisyArquitectura.pdf` y los documentos de `documentacion/` antes de modificar código.

3. Revisar los scripts SQL disponibles. Hay dos:
   - `tablas_gestion_socios.sql`, en la raíz: creación de las tablas `usuario`, `socio` y `donacion`.
   - `Gestor_ONG/database/ong.sql`: creación de la base de datos `gestor_ong`, sus tablas y datos de prueba.

   Todavía no se ha acordado cuál de los dos será el esquema oficial del proyecto, por lo que no deben importarse ambos sobre la misma base de datos sin revisión previa. Una vez acordado, el script elegido puede importarse en MySQL mediante MySQL Workbench o desde la línea de comandos con `mysql -u <usuario> -p < archivo.sql`.

4. Preparar el entorno Java: el `pom.xml` de `Gestor_ONG` indica Java 21 y Maven. El controlador JDBC de MySQL todavía no está configurado en dicho archivo, por lo que será necesario añadirlo cuando se implemente la conexión.

**Estado de la aplicación:** la aplicación Java **todavía no está implementada**. Las clases presentes en `Gestor_ONG/src/main/java/` son esqueletos sin funcionalidad, por lo que en este momento no hay instrucciones de ejecución ni de uso de la interfaz.

## Colaboración con GitHub

- Trabajar siempre sobre una rama propia, creada desde `main`, y no hacer push directamente a `main`.
- Hacer `git pull --rebase origin main` antes de empezar a trabajar y antes de subir cambios, para incorporar el trabajo de los demás integrantes.
- Realizar commits pequeños y descriptivos, y subir la rama con `git push -u origin <nombre-de-la-rama>`.
- Abrir un *pull request* para integrar los cambios en `main` y revisar las modificaciones antes de aceptarlo.
- No sobrescribir archivos de otros integrantes: si dos personas modifican el mismo archivo, resolverlo de forma acordada.
- Mantener la documentación actualizada cuando se añadan funcionalidades.

El reparto de tareas y el calendario previsto se encuentran en `documentacion/planificacion.md`.
