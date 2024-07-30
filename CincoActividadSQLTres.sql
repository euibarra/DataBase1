USE CincoActividadSQL;

-- ---------------------------------------------------------------------
-- Consulta 1
-- ---------------------------------------------------------------------
SELECT
    CONCAT(e.Nombre, ' ', e.Apellido) AS Empleado, -- Une el Nombre y Apellido con un espacio entre ellos para formar la columna Empleado
    p.Fecha_inicio AS Fecha_Inicio,
    p.Fecha_fin AS Fecha_Fin,
    DATEDIFF(p.Fecha_fin, p.Fecha_inicio) AS Duracion_Dias -- Función que calcula la diferencia en días entre la fecha de finalización y la fecha de inicio del proyecto
FROM
    Asignacion a
JOIN
    Empleado e ON a.ID_empleado = e.ID_empleado -- Esta cláusula une Asignacion con Empleado. Se obtienen los detalles de los empleados relacionados con cada asignación
JOIN
    Proyecto p ON a.ID_empleado = p.ID_proyecto -- Esta cláusula une Asignacion con Proyecto. Se obtienen los detalles de los proyectos relacionados con cada asignación
ORDER BY
    e.Apellido, p.Fecha_inicio; -- Ordena los resultados por apellido y fecha de inicio

-- --------------------------------------------------------------------- 
-- Consulta 2   
-- ---------------------------------------------------------------------
SELECT
    emp.Titulo AS Empleo,
    AVG(emp.Salario) AS Salario_Promedio -- Calcula el salario promedio de los empleados para cada tipo de empleo
FROM
    Empleado e
JOIN
    Empleo emp ON e.ID_empleo = emp.ID_empleo -- Une las tablas Empleado y Empleo
JOIN
    Asignacion a ON e.ID_empleado = a.ID_empleado -- Une las tablas Empleado y Asignacion
GROUP BY
    emp.Titulo -- Agrupa los resultados por título de empleo para calcular el salario promedio por empleo
ORDER BY
    Salario_Promedio DESC -- Ordena los resultados en orden descendente de salario promedio
LIMIT 3; --  Limita el resultado a solo los 3 empleos con el mayor salario promedio
