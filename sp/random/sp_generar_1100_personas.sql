
USE db_grupo_bases_datos_ap

GO 
CREATE OR ALTER PROCEDURE ddbba.sp_Generar_1100_Personas
AS 
BEGIN 
    DECLARE @I INT = 0
    DECLARE @D VARCHAR(8) = ''
    DECLARE @NOMBRE VARCHAR(20) = ''
    DECLARE @APELLIDO VARCHAR(20) = ''
    DECLARE @EDAD VARCHAR(2) = '' 

    DECLARE @TEXTO VARCHAR(50) = ''

    WHILE @I < 1100
    BEGIN 
        EXEC ddbba.sp_Generar_Dni @DNI = @D OUTPUT
        EXEC ddbba.sp_Get_Nombre @NOMBRE = @NOMBRE OUTPUT
        EXEC ddbba.sp_Get_Apellido @APELLIDO = @APELLIDO OUTPUT
        EXEC ddbba.sp_Cadena_Random 1,7,2, @S_RES = @EDAD OUTPUT
        SET @TEXTO = 'I: '+ @D + '|' + @NOMBRE + '|' + @APELLIDO + '|' + @EDAD

        EXEC ddbba.sp_Insertar_Log 'ddbba.Registro', @TEXTO
        INSERT INTO ddbba.Persona(Dni, Nombre, Apellido, Edad)
        VALUES(@D, @NOMBRE, @APELLIDO, @EDAD)


        SET @D = ''
        SET @NOMBRE = ''
        SET @APELLIDO = ''
        SET @EDAD = '' 
        SET @I = @I + 1 
    END
END

--EXEC ddbba.sp_Generar_1100_Personas
SELECT * FROM ddbba.Persona