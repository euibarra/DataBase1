USE ActividadSQL;

-- Actualiza una reserva de 'RESERVAS'
UPDATE reservas
SET fecha_inicio = '2024-07-01'
WHERE ID_reservas = 1;

-- Elimina un tipo de cuarto de 'HABITACIONES'
DELETE FROM habitaciones
WHERE tipo = 'Doble';

-- Agregar una columna a 'CLIENTES'
ALTER TABLE habitaciones
ADD COLUMN fecha_nacimiento DATE;

-- Joins

-- INNER JOIN
SELECT *
FROM hotel
INNER JOIN reservas ON ID_hotel = reservas.ID_hotel
INNER JOIN habitaciones ON ID_hotel = habitaciones.ID_hotel



