CREATE DATABASE tienda;

USE tienda;


CREATE TABLE producto (
  id INT NOT NULL,
  nombre VARCHAR(50) NOT NULL,
  nombreArchivo VARCHAR(50) NOT NULL,
  precio INT NOT NULL,

  PRIMARY KEY(id)
);


INSERT INTO producto
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
(16, 'Reloj Avanzado',   'reloj-avanzado.jpg',    60);



CREATE TABLE registro (
  id INT NOT NULL,
  idProducto INT NOT NULL,
  cantidadProducto INT NOT NULL,

  PRIMARY KEY(id, idProducto),
  FOREIGN KEY (idProducto) REFERENCES producto(id)
);


INSERT INTO registro
VALUES

(1, 1,   1),
(1, 9,   2),
(2, 6,   1),
(2, 14,  4),
(3, 13,  2),
(3, 16, 10),
(3, 15,  7),
(4, 10,  5);
