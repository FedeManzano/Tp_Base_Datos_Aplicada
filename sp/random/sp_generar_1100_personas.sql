
USE db_grupo_bases_datos_ap

GO 
CREATE OR ALTER PROCEDURE ddbba.sp_Generar_1100_Personas
AS 
BEGIN 
    DECLARE @I INT = 0
    DECLARE @D VARCHAR(8) = ''
    DECLARE @NOMBRE VARCHAR(20) = ''
    DECLARE @APELLIDO VARCHAR(20) = ''
    DECLARE @FECHA_RAN DATE 
    DECLARE @ID_FECHA_RAN VARCHAR(2) = ''
    DECLARE @ID_LOCALIDAD VARCHAR(2) = ''
    DECLARE @TELEFONO VARCHAR(14) = ''


    DECLARE @TEXTO VARCHAR(50) = ''

    WHILE @I < 1100
    BEGIN 
        EXEC ddbba.sp_Generar_Dni @DNI = @D OUTPUT
        EXEC ddbba.sp_Get_Nombre @NOMBRE = @NOMBRE OUTPUT
        EXEC ddbba.sp_Get_Apellido @APELLIDO = @APELLIDO OUTPUT

        EXEC ddbba.sp_Cadena_Random 0, 2, 2, @S_RES = @ID_FECHA_RAN OUTPUT
        EXEC ddbba.sp_Cadena_Random 1, 7, 1, @S_RES = @ID_LOCALIDAD OUTPUT


        DECLARE @ID_FECHA_RAN_INT INT = ddbba.fn_Seleccionar_Id_Fecha(@ID_FECHA_RAN)

        SET @FECHA_RAN = 
        (
            SELECT FE.FechaRan
            FROM ddbba.Fechas AS FE 
            WHERE FE.IdFechas = @ID_FECHA_RAN_INT
        )

        EXEC ddbba.sp_Generar_Telefono_Random @TEL = @TELEFONO OUTPUT

        SET @TEXTO = 'I: '+ @D + '|' + @NOMBRE + '|' + @APELLIDO + '|' + CAST(@FECHA_RAN AS VARCHAR(11))

        EXEC ddbba.sp_Insertar_Log 'Persona', @TEXTO
        INSERT INTO ddbba.Persona(Dni, Nombre, Apellido, Fecha_Nacimiento, IdLocalidad, Telefono)
        VALUES(@D, @NOMBRE, @APELLIDO, @FECHA_RAN, @ID_LOCALIDAD, @TELEFONO)


        SET @D = ''
        SET @NOMBRE = ''
        SET @APELLIDO = ''
        SET @ID_FECHA_RAN = ''
        SET @ID_LOCALIDAD = '' 
        SET @TELEFONO = ''
        SET @I = @I + 1 
    END
END

--EXEC ddbba.sp_Generar_1100_Personas
SELECT * FROM ddbba.Persona
SELECT * FROM ddbba.Fechas