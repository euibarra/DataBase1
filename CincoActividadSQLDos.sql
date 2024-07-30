USE CincoActividadSQL;

-- Insertar datos en la tabla `EMPLEO`
INSERT INTO `CincoActividadSQL`.`EMPLEO` (`Titulo`, `Salario`) VALUES
('Desarrollador', 3000),
('Diseñador', 2500),
('Analista', 2800),
('Gerente', 4000);

-- Insertar datos en la tabla `EMPLEADO`
INSERT INTO `CincoActividadSQL`.`EMPLEADO` (`ID_empleo`, `Nombre`, `Apellido`, `Direccion`, `Telefono`) VALUES
(1, 'Juan', 'Pérez', 'Av. Siempre Viva 123', '555-1234'),
(2, 'Ana', 'García', 'Calle Falsa 456', '555-5678'),
(3, 'Carlos', 'Lopez', 'Boulevard Central 789', '555-8765'),
(4, 'Laura', 'Martínez', 'Paseo del Sol 321', '555-4321');

-- Insertar datos en la tabla `PROYECTO`
INSERT INTO `CincoActividadSQL`.`PROYECTO` (`ID_empleado`, `Nombre`, `Descripcion`, `Fecha_inicio`, `Fecha_fin`) VALUES
(1, 'Proyecto A', 'Desarrollo de software', '2024-01-01', '2024-06-30'),
(2, 'Proyecto B', 'Rediseño de sitio web', '2024-02-01', '2024-07-31'),
(3, 'Proyecto C', 'Análisis de datos', '2024-03-01', '2024-08-31'),
(4, 'Proyecto D', 'Gestión de equipos', '2024-04-01', '2024-09-30');

-- Insertar datos en la tabla `ASIGNACION`
INSERT INTO `CincoActividadSQL`.`ASIGNACION` (`ID_empleado`, `Asignacion_horas`, `Fecha_asignacion`) VALUES
(1, 40, '2024-01-05'),
(2, 30, '2024-02-10'),
(3, 25, '2024-03-15'),
(4, 35, '2024-04-20');

-- Insertar datos en la tabla `EmpleoProyecto`
INSERT INTO `CincoActividadSQL`.`EmpleoProyecto` (`ID_empleo`, `ID_proyecto`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);
