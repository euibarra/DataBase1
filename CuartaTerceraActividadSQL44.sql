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
-- 2 tablas - selecciona todos los clientes que tienen una entrada correspondiente en la tabla HOTEL
SELECT *
FROM clientes
INNER JOIN hotel ON clientes.ID_clientes = hotel.ID_clientes;
-- 3 tablas - une las tres tablas mediante las claves que las relacionan  
SELECT *
FROM clientes
INNER JOIN hotel ON clientes.ID_clientes = hotel.ID_clientes
INNER JOIN reservas ON hotel.ID_reservas = reservas.ID_reservas;

-- LEFT JOIN
-- 2 tablas - selecciona todos los clientes, si un cliente no tiene una entrada correspondiente en HOTEL, los campos de HOTEL serán NULL
SELECT *
FROM clientes
LEFT JOIN hotel ON clientes.ID_clientes = hotel.ID_clientes;
-- 3 tablas - devuelve todos los clientes, junto con sus reservas si existen, si la reserva está vinculada
SELECT *
FROM clientes
LEFT JOIN hotel ON clientes.ID_clientes = hotel.ID_clientes
LEFT JOIN reservas ON hotel.ID_reservas = reservas.ID_reservas;

-- RIGHT JOIN
-- 2 tablas - selecciona todas las entradas de la tabla HOTEL, junto con los datos de clientes correspondientes si existen. Si un cliente no tiene una entrada correspondiente en CLIENTES, los campos de CLIENTES serán NULL
SELECT *
FROM clientes
RIGHT JOIN hotel ON clientes.ID_clientes = hotel.ID_clientes;
-- 3 tablas - se devuelven todas las entradas de la tabla HOTEL, junto con las reservas si existen, y los datos de clientes correspondientes si la reserva está vinculada a un cliente
SELECT *
FROM clientes
RIGHT JOIN hotel ON clientes.ID_clientes = hotel.ID_clientes
RIGHT JOIN reservas ON hotel.ID_reservas = reservas.ID_reservas;
