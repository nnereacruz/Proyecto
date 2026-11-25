# Gestor_ONG

Aplicación de escritorio (Java Swing + JDBC) para gestionar **socios** y **donaciones** de una ONG.

## Estructura del proyecto

```
Gestor_ONG/
├── src/
│   └── main/
│       ├── java/
│       │   ├── modelo/        Usuario, Socio, Donacion
│       │   ├── vista/         VentanaLogin, VentanaPrincipal, VentanaSocios, VentanaDonaciones
│       │   ├── controlador/   ControladorLogin, SocioController, DonacionController
│       │   ├── datos/         ConexionBD
│       │   └── Main.java
│       └── resources/
├── database/
│   └── ong.sql
├── pom.xml
├── .gitignore
└── README.md
```

## Abrir en NetBeans

1. En NetBeans: **File → Open Project…** y selecciona la carpeta `Gestor_ONG`.
2. NetBeans detectará el `pom.xml` (proyecto Maven) y cargará los paquetes.
3. Botón derecho sobre el proyecto → **Build with Dependencies** para compilar.
4. Ejecuta con **Run Project** (la clase main es `Main`, en el paquete por defecto).

> Si prefieres importarlo como proyecto nuevo: **File → New Project → Maven → Java Application**, nombre `Gestor_ONG`, y copia el contenido de esta carpeta.

## Base de datos

1. Instala MySQL/MariaDB y crea la base ejecutando el script:

   ```bash
   mysql -u root -p < database/ong.sql
   ```

   También puedes abrir `database/ong.sql` en NetBeans (**Services → Databases**) y ejecutarlo.

2. Ajusta la URL, usuario y contraseña en `src/main/java/datos/ConexionBD.java` con los valores de tu instalación.

3. Para que JDBC pueda connectar con MySQL, añade el driver al `pom.xml` (dentro de `<dependencies>`):

   ```xml
   <dependency>
       <groupId>com.mysql</groupId>
       <artifactId>mysql-connector-j</artifactId>
       <version>8.4.0</version>
       <scope>runtime</scope>
   </dependency>
   ```

   Maven lo descargará automáticamente al compilar. Si usas MariaDB, usa `org.mariadb.jdbc:mariadb-java-client`.

## Usuario de prueba

El script `ong.sql` crea el usuario `admin` con contraseña `admin123` (solo para desarrollo; cambia la contraseña en un entorno real).

## Funcionalidad

- **Login** contra la tabla `usuarios`.
- **Ventana principal** con acceso a socios y donaciones.
- **Socios**: listar, crear, editar y eliminar.
- **Donaciones**: listar, registrar, editar y eliminar (asociadas a un socio).
