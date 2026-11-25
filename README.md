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
            ├── java/
            │   ├── Main.java
            │   ├── modelo/
            │   ├── datos/
            │   ├── controlador/
            │   └── vista/
            └── resources/
                └── .gitkeep
```

### Contenido de las carpetas principales

- **`documentacion/`**: documentación del proyecto. `componentes-tecnicos.md` describe tecnologías, arquitectura y estructura real del código; `planificacion.md` recoge el reparto de tareas, el calendario y el orden de implementación.
- **`Gestor_ONG/`**: proyecto Java inicial subido por una integrante. Incluye un `pom.xml` de Maven, las clases esqueleto y su propio script SQL.
- **`Gestor_ONG/database/`**: script SQL aportado con el proyecto Java.
- **`Gestor_ONG/src/main/resources/`**: carpeta de recursos de Maven, conservada con `.gitkeep` mientras no contenga archivos.

Existen dos archivos `.gitignore`, uno en la raíz y otro dentro de `Gestor_ONG/`. Ambos son válidos: el de la raíz cubre al resto del repositorio y el de `Gestor_ONG/` añade exclusiones propias del proyecto Maven.

### Paquetes Java existentes

Dentro de `Gestor_ONG/src/main/java/` se encuentran los paquetes:

- **`modelo`**: contiene `Usuario.java`, `Socio.java` y `Donacion.java`, esqueletos de las clases que representarán los datos.
- **`datos`**: contiene `ConexionBD.java`, esqueleto de la futura conexión con la base de datos.
- **`controlador`**: contiene `ControladorLogin.java`, `SocioController.java` y `DonacionController.java`.
- **`vista`**: contiene `VentanaLogin.java`, `VentanaPrincipal.java`, `VentanaSocios.java` y `VentanaDonaciones.java`.

Estos son los nombres y las rutas reales del código. El documento de análisis propone otros nombres (`model`, `view`, `controller`, `database`), pero no se han renombrado ni eliminado clases o carpetas Java. Todavía no hay funcionalidad implementada.

### Documentación del diseño de interfaces

--PARTE DE NEREA

## Preparación inicial del proyecto y la base de datos

1. Clonar el repositorio:

   ```bash
   git clone https://github.com/nnereacruz/Proyecto.git
   ```

2. Revisar `AnalisisyArquitectura.pdf` y los documentos de `documentacion/` antes de modificar código.

3. Utilizar el script SQL adecuado. Hay dos archivos con estructuras diferentes:

   - **`tablas_gestion_socios.sql` (raíz): esquema de referencia.** Crea `usuario`, `socio` y `donacion` con los campos del modelo descrito en el análisis (`dni`, `email`, `importe`, `concepto`, entre otros). Al coincidir con el PDF, es el archivo que debe utilizarse como punto de partida mientras el equipo no acuerde lo contrario.
   - **`Gestor_ONG/database/ong.sql`**: esquema aportado con el proyecto Java. Crea la base de datos `gestor_ong`, sus tablas y datos de prueba, e incluye elementos que no aparecen en el análisis, como un campo `rol` de usuario y donaciones sin socio asociado. Debe revisarse antes de usar; no debe importarse junto con el esquema de referencia sobre la misma base de datos.

   Una vez decidido el esquema, puede importarse en MySQL mediante MySQL Workbench.

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
