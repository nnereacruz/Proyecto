-- ============================================================
-- Gestor_ONG - esquema de base de datos (MySQL / MariaDB)
-- ============================================================

CREATE DATABASE IF NOT EXISTS gestor_ong
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE gestor_ong;

-- ------------------------------------------------------------
-- Usuarios que pueden entrar en la aplicación
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS usuarios (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    nombre      VARCHAR(80)  NOT NULL,
    correo      VARCHAR(120) NOT NULL UNIQUE,
    contrasena  VARCHAR(255) NOT NULL,
    rol         VARCHAR(30)  NOT NULL DEFAULT 'usuario',
    activo      BOOLEAN      NOT NULL DEFAULT TRUE
);

-- ------------------------------------------------------------
-- Socios de la ONG
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS socios (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    nombre      VARCHAR(80)  NOT NULL,
    apellidos   VARCHAR(120) NOT NULL,
    correo      VARCHAR(120) UNIQUE,
    telefono    VARCHAR(20),
    fecha_alta  DATE         NOT NULL DEFAULT (CURRENT_DATE),
    activo      BOOLEAN      NOT NULL DEFAULT TRUE
);

-- ------------------------------------------------------------
-- Donaciones (cada una puede estar asociada a un socio)
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS donaciones (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    id_socio    INT NULL,
    cantidad    DECIMAL(10, 2) NOT NULL,
    fecha       DATE NOT NULL DEFAULT (CURRENT_DATE),
    tipo        VARCHAR(30)  NOT NULL DEFAULT 'efectivo',
    concepto    VARCHAR(255),
    CONSTRAINT fk_donaciones_socios
        FOREIGN KEY (id_socio) REFERENCES socios(id)
        ON DELETE SET NULL
);

-- ------------------------------------------------------------
-- Datos de prueba
-- ------------------------------------------------------------
INSERT INTO usuarios (nombre, correo, contrasena, rol, activo)
VALUES ('Administrador', 'admin@ong.org', 'admin123', 'admin', TRUE)
ON DUPLICATE KEY UPDATE nombre = VALUES(nombre);

INSERT INTO socios (nombre, apellidos, correo, telefono, fecha_alta, activo)
VALUES
    ('Lucía', 'García Pérez', 'lucia@example.org', '600111222', '2024-01-15', TRUE),
    ('Carlos', 'Ruiz López', 'carlos@example.org', '600333444', '2024-03-02', TRUE)
ON DUPLICATE KEY UPDATE nombre = VALUES(nombre);

INSERT INTO donaciones (id_socio, cantidad, fecha, tipo, concepto)
VALUES
    (1, 50.00, '2024-05-10', 'transferencia', 'Cuota mensual'),
    (2, 25.50, '2024-05-12', 'efectivo', 'Donación puntual'),
    (NULL, 100.00, '2024-06-01', 'transferencia', 'Donación anónima');
