USE ActividadSQL;

-- Insertar cuatro registros en la tabla 'RESERVAS'
INSERT INTO reservas (fecha_inicio, fecha_fin) VALUES
('2024-08-01', '2024-08-05'),
('2024-09-10', '2024-09-15'),
('2024-10-20', '2024-10-25'),
('2024-11-12', '2024-11-18');

-- Insertar cuatro registros en la tabla 'HABITACIONES'
INSERT INTO habitaciones (tipo, precio, disponibilidad) VALUES
('Doble', 120.00, 'Disponible'),
('Suite', 250.00, 'Disponible'),
('Individual', 80.00, 'No disponible'),
('Doble', 130.00, 'Disponible');