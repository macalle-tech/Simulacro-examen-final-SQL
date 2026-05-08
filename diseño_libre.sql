-- DISEÑO LIBRE

CREATE DATABASE biblioteca;
USE biblioteca;

CREATE TABLE socios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    telefono VARCHAR(20),
    ciudad VARCHAR(50)
);

CREATE TABLE autores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    nacionalidad VARCHAR(50)
);

CREATE TABLE libros (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    autor_id INT,
    genero VARCHAR(50),
    stock INT,
    FOREIGN KEY (autor_id) REFERENCES autores(id)
);

CREATE TABLE prestamos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    socio_id INT,
    libro_id INT,
    fecha_prestamo DATE,
    fecha_devolucion DATE,
    FOREIGN KEY (socio_id) REFERENCES socios(id),
    FOREIGN KEY (libro_id) REFERENCES libros(id)
);


-- REGISTROS

-- Socios

INSERT INTO socios (nombre, email, telefono, ciudad) VALUES
('Carlos Ramirez', 'carlos@mail.com', '3001234567', 'Manizales'),
('Laura Gomez', 'laura@mail.com', '3012345678', 'Bogota'),
('Andres Torres', 'andres@mail.com', '3023456789', 'Medellin'),
('Maria Lopez', 'maria@mail.com', '3034567890', 'Cali'),
('Juan Herrera', 'juan@mail.com', '3045678901', 'Pereira');


-- Autores

INSERT INTO autores (nombre, nacionalidad) VALUES
('Gabriel Garcia Marquez', 'Colombiano'),
('Jorge Luis Borges', 'Argentino'),
('Isabel Allende', 'Chilena'),
('Mario Vargas Llosa', 'Peruano'),
('Pablo Neruda', 'Chileno');


-- Libros

INSERT INTO libros (titulo, autor_id, genero, stock) VALUES
('Cien Anos de Soledad', 1, 'Novela', 5),
('El Amor en los Tiempos del Colera', 1, 'Novela', 3),
('Ficciones', 2, 'Cuento', 4),
('El Aleph', 2, 'Cuento', 2),
('La Casa de los Espiritus', 3, 'Novela', 6),
('La Ciudad y los Perros', 4, 'Novela', 3),
('Veinte Poemas de Amor', 5, 'Poesia', 7);


-- Prestamos

INSERT INTO prestamos (socio_id, libro_id, fecha_prestamo, fecha_devolucion) VALUES
(1, 1, '2026-01-10', '2026-01-20'),
(2, 3, '2026-01-15', '2026-01-25'),
(3, 2, '2026-02-01', '2026-02-10'),
(4, 5, '2026-02-20', '2026-03-01'),
(5, 4, '2026-03-05', '2026-03-15'),
(1, 6, '2026-03-10', '2026-03-20'),
(2, 7, '2026-03-15', '2026-03-25'),
(3, 1, '2026-04-01', '2026-04-10'),
(4, 3, '2026-04-10', '2026-04-20'),
(5, 2, '2026-04-20', '2026-04-30');


-- 1. Mostrar todos los socios
SELECT * FROM socios;

-- 2. Mostrar todos los libros
SELECT * FROM libros;

-- 3. Mostrar libros con stock menor a 4
SELECT * FROM libros WHERE stock < 4;


-- consulta con INNER JOIN

-- 1. Mostrar título del libro y nombre del autor
SELECT libros.titulo, autores.nombre AS autor
FROM libros
JOIN autores ON libros.autor_id = autores.id;

-- 2. Mostrar qué libro tomó prestado cada socio
SELECT socios.nombre AS socio, libros.titulo, prestamos.fecha_prestamo
FROM prestamos
JOIN socios ON prestamos.socio_id = socios.id
JOIN libros ON prestamos.libro_id = libros.id;

-- 3. Mostrar cuántos libros ha prestado cada socio
SELECT socios.nombre AS socio, COUNT(prestamos.id) AS total_prestamos
FROM prestamos
JOIN socios ON prestamos.socio_id = socios.id
GROUP BY socios.nombre;


-- INDICE

CREATE INDEX idx_titulo ON libros(titulo);












































