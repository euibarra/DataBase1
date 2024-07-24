-- Muestra todos los registros de la tabla CLIENTES
SELECT *
FROM clientes;

-- Muestra todos los registros de la tabla HABITACIONES
SELECT *
FROM habitaciones;

-- Muestra todos los registros de la tabla RESERVAS
SELECT *
FROM reservas;

-- Muestra todos los registros de la tabla HOTEL
SELECT *
FROM hotel;

-- Muestra todos los registros de la tabla combinada CLIENTES-HOTEL
SELECT *
FROM clientes
INNER JOIN hotel ON clientesS.ID_clientes = hotel.ID_clientes;

-- Muestra todos los registros de la tabla combinada CLIENTES-RESERVAS-HOTEL
SELECT *
FROM clientes
INNER JOIN hotel ON clientes.ID_clientes = hotel.ID_clientes
INNER JOIN reservas ON hotel.ID_reservas = reservas.ID_reservas;

-- Muestra todos los registros de la tabla combinada CLIENTES-HOTEL
SELECT *
FROM clientes
LEFT JOIN hotel ON clientes.ID_clientes = hotel.ID_clientes;

-- Muestra todos los registros de la tabla combinada CLIENTES-RESERVAS-HOTEL
SELECT *
FROM clientes
LEFT JOIN hotel ON clientes.ID_clientes = hotel.ID_clientes
LEFT JOIN reservas ON hotel.ID_reservas = reservas.ID_reservas;

-- Muestra todos los registros de la tabla combinada CLIENTES-HOTEL
SELECT *
FROM clientes
RIGHT JOIN hotel ON clientes.ID_clientes = hotel.ID_clientes;

-- Muestra todos los registros de la tabla combinada CLIENTES-RESERVAS-HOTEL
SELECT *
FROM clientes
RIGHT JOIN hotel ON clientes.ID_clientes = hotel.ID_clientes
RIGHT JOIN reservas ON hotel.ID_reservas = reservas.ID_reservas;
