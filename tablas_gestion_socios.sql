CREATE TABLE usuario (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    nombre      VARCHAR(50)  NOT NULL,
    usuario     VARCHAR(50)  NOT NULL UNIQUE,
    contrasena  VARCHAR(255) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE socio (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    nombre      VARCHAR(50)  NOT NULL,
    apellidos   VARCHAR(100) NOT NULL,
    dni         VARCHAR(9)   NOT NULL UNIQUE,
    email       VARCHAR(100) NOT NULL UNIQUE,
    telefono    VARCHAR(15),
    fecha_alta  DATE         NOT NULL,
    activo      BOOLEAN      NOT NULL DEFAULT TRUE
) ENGINE=InnoDB;

CREATE TABLE donacion (
    id        INT AUTO_INCREMENT PRIMARY KEY,
    id_socio  INT           NOT NULL,
    importe   DECIMAL(10,2) NOT NULL,
    fecha     DATE          NOT NULL,
    concepto  VARCHAR(150)  NOT NULL,
    FOREIGN KEY (id_socio) REFERENCES socio(id)
) ENGINE=InnoDB;
