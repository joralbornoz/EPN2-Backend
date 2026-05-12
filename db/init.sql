-- 1. Crear la tabla para el microservicio de Ventas
CREATE TABLE IF NOT EXISTS ventas (
    id_venta BIGINT AUTO_INCREMENT PRIMARY KEY,
    direccion_compra VARCHAR(255) NOT NULL,
    valor_compra INT NOT NULL,
    fecha_compra DATE NOT NULL,
    despacho_generado BOOLEAN NOT NULL DEFAULT FALSE
);

-- 2. Crear la tabla para el microservicio de Despachos
CREATE TABLE IF NOT EXISTS despachos (
    id_despacho BIGINT AUTO_INCREMENT PRIMARY KEY,
    fecha_despacho DATE,
    patente_camion VARCHAR(20),
    intento INT DEFAULT 0,
    id_compra BIGINT,
    direccion_compra VARCHAR(255),
    valor_compra BIGINT,
    despachado BOOLEAN NOT NULL DEFAULT FALSE
);

-- 3. Datos de prueba para Ventas
INSERT INTO ventas (direccion_compra, valor_compra, fecha_compra, despacho_generado) 
VALUES ('Avenida Siempre Viva 123', 50000, '2026-05-12', TRUE);

INSERT INTO ventas (direccion_compra, valor_compra, fecha_compra, despacho_generado) 
VALUES ('Calle Falsa 123', 25000, '2026-05-11', FALSE);

-- 4. Datos de prueba para Despachos (Vinculados a las ventas anteriores)
INSERT INTO despachos (fecha_despacho, patente_camion, intento, id_compra, direccion_compra, valor_compra, despachado)
VALUES ('2026-05-13', 'ABCD-12', 1, 1, 'Avenida Siempre Viva 123', 50000, TRUE);

INSERT INTO despachos (fecha_despacho, patente_camion, intento, id_compra, direccion_compra, valor_compra, despachado)
VALUES (NULL, NULL, 0, 2, 'Calle Falsa 123', 25000, FALSE);