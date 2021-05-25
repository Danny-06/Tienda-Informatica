CREATE DATABASE TIENDA


CREATE TABLE productos (
  id INT NOT NULL,
  nombre VARCHAR(50) NOT NULL,
  nombreArchivo VARCHAR(50) NOT NULL,
  precio INT NOT NULL

  PRIMARY KEY(id)
)


INSERT INTO productos
VALUES

(1,  'Televisión',       'television.png',       630),
(2,  'Móvil',            'movil.webp',           250),
(3,  'Portátil',         'portatil.jpg',        1300),
(4,  'Teclado',          'teclado.jpg',           15),

(5,  'Ratón',            'raton.jpg',             12),
(6,  'Cascos',           'cascos.jpg',            10),
(7,  'Silla Gaming',     'silla-gaming.jpg',     450),
(8,  'Realidad Virtual', 'realidad-virtual.jpg', 310),

(9,  'Tablet',           'tablet.jpg',           200),
(10, 'Altavoces',        'altavoces.jpg',         50),
(11, 'Webcam',           'webcam.jpg',            10),
(12, 'Tarjeta Gráfica',  'tarjeta-grafica.jpg', 1560),

(13, 'Procesador',       'procesador.jpg',      1000),
(14, 'Memoria Ram',      'memoria-ram.jpg',      500),
(15, 'Disco SSD',        'disco-ssd.jpg',        790),
(16, 'Reloj Avanzado',   'reloj-avanzado.jpg',    60)



CREATE TABLE registro (
  id INT NOT NULL,
  idProducto INT NOT NULL,
  nombreProducto VARCHAR(20) NOT NULL,
  precioProducto INT NOT NULL,
  cantidadProducto INT NOT NULL,

  PRIMARY KEY(id, idProducto),
  FOREIGN KEY (idProducto) REFERENCES productos(id)
)


INSERT INTO registro
VALUES

(1, 1,  'Televisión',      630,   1),
(1, 9,  'Tablet',          200,   2),
(2, 6,  'Cascos',          10,    1),
(2, 14, 'Memoria Ram',     500,   4),
(3, 13, 'Procesador',      1000,  2),
(3, 16, 'Reloj Avanzado',  60,   10),
(3, 15, 'Disco SSD',       790,   7),
(4, 10, 'Altavoces',       50,    5)
