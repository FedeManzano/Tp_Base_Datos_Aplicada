
USE db_grupo_bases_datos_ap

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




/***
    Obtiene las personas que estan entre el 5% mas joven y las que son 5% mas viejas según la edad
*/
WITH Ranking_Edad_Acumulada (Dni, Nombre, Apellido, Edad, RANKING_EDAD)
AS 
(
    SELECT per.Dni, per.Nombre, per.Apellido, per.Edad,
    PERCENT_RANK() OVER (ORDER BY per.Edad) RANKING_EDAD
    FROM ddbba.Persona AS per 
)


SELECT * FROM Ranking_Edad_Acumulada 
WHERE   RANKING_EDAD >= 0 AND RANKING_EDAD <= 0.05 OR 
        RANKING_EDAD >= 0.95 AND RANKING_EDAD <= 1


