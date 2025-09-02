
USE db_grupo_bases_datos_ap

/***
    Obtiene las personas que estan entre el 5% mas joven y las que son 5% mas viejas según la edad
*/
WITH Ranking_Edad_Acumulada (Dni, Nombre, Apellido, IdLocalidad, Telefono, Fecha_Nacimiento, RANKING_EDAD)
AS 
(
    SELECT per.Dni, per.Nombre, per.Apellido, per.IdLocalidad, per.Telefono, per.Fecha_Nacimiento,
    PERCENT_RANK() OVER (ORDER BY per.Fecha_Nacimiento DESC) RANKING_EDAD
    FROM ddbba.Persona AS per 
)


SELECT * FROM Ranking_Edad_Acumulada 
WHERE   RANKING_EDAD >= 0 AND RANKING_EDAD <= 0.05 OR 
        RANKING_EDAD >= 0.95 AND RANKING_EDAD <= 1


/***
    Ejercicio 9 Eliminar duplicados de la tabla Alumnos/Persona que tengan el mismo nombre , apellido y Localidad
    no se puede hacer por DNI porque no hay duplicados.
*/

WITH Personas_Duplicadas (Dni, Nombre, Apellido, Fecha_Nac, IdLocalidad, Telefono, REPETIDOS) 
AS 
(
    SELECT per.Dni, per.Nombre, per.Apellido, per.Fecha_Nacimiento, per.IdLocalidad, per.Telefono,
        COUNT(*) OVER (PARTITION BY per.Nombre, per.Apellido, per.IdLocalidad) AS REPETIDOS
    FROM ddbba.Persona AS per 
)

DELETE FROM Personas_Duplicadas WHERE REPETIDOS > 1


/**
12. Cree una vista empleando la opción “SCHEMABINDING” para visualizar las
comisiones (nro de comisión, código de materia, nombre de materia, apellido y
nombre de los alumnos). El apellido y nombre debe mostrarse con el formato
“Apellido, Nombres” (observe la coma intermedia).
*/

GO 
CREATE OR ALTER VIEW vw_Asignacion_Comision
WITH SCHEMABINDING
AS 
(
    SELECT ins.NroComision NRO_COM, ins.CodMateria COD_MAT, mat.NombreMateria NOM_MAT,CONCAT( CONCAT(per.Nombre, ', '), per.Apellido) APE_NOM
    FROM ddbba.Inscribe ins INNER JOIN ddbba.Materia mat ON mat.CodMateria = ins.CodMateria 
        INNER JOIN ddbba.Persona per ON ins.DniAlumno = per.Dni
) 


SELECT * FROM vw_Asignacion_Comision


/**
Msg 5074, Level 16, State 1, Line 1
The object 'vw_Asignacion_Comision' is dependent on column 'Nombre'.
Msg 4922, Level 16, State 9, Line 1
ALTER TABLE ALTER COLUMN Nombre failed because one or more objects access this column.
*/
ALTER TABLE ddbba.Persona ALTER COLUMN Nombre VARCHAR(5)

/**
Started executing query at  Line 66
(1 row affected) Lo agregó
*/
INSERT INTO ddbba.Persona(Dni, Nombre, Apellido, Fecha_Nacimiento, IdLocalidad, Telefono)
VALUES 
('32595830', 'Federico', 'Manzano', '1987-01-03', 1, '5401146547521')

/**
Started executing query at  Line 74
Commands completed successfully.
*/
ALTER TABLE ddbba.Persona ADD TEST VARCHAR(100)


/**
Msg 1054, Level 15, State 6, Procedure vw_Asignacion_Comision, Line 5
Syntax '*' is not allowed in schema-bound objects.
*/
GO 
CREATE OR ALTER VIEW vw_Asignacion_Comision
WITH SCHEMABINDING
AS 
(
    SELECT *
    FROM ddbba.Persona per
) 

