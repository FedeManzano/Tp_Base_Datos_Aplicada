
USE db_grupo_bases_datos_ap

GO 
CREATE OR ALTER PROCEDURE ddbba.sp_Generar_Dni 
@DNI CHAR(8) OUTPUT
AS 
BEGIN 
    DECLARE @PRIMER_VALOR VARCHAR(1) = ''
    EXEC ddbba.sp_Cadena_Random 1,5,1, @S_RES = @PRIMER_VALOR OUTPUT

    DECLARE @RESTO VARCHAR(7) = ''
    EXEC ddbba.sp_Cadena_Random 0,9,7, @S_RES = @RESTO OUTPUT 

    WHILE EXISTS (SELECT * FROM ddbba.Persona WHERE Dni = @PRIMER_VALOR + @RESTO )
    BEGIN 
        EXEC ddbba.sp_Cadena_Random 1,9,1, @S_RES = @PRIMER_VALOR OUTPUT
        EXEC ddbba.sp_Cadena_Random 0,9,7, @S_RES = @RESTO OUTPUT 
    END 
    SET @DNI = @PRIMER_VALOR + @RESTO
END

DECLARE @D CHAR(8) = ''
EXEC ddbba.sp_Generar_Dni @DNI = @D OUTPUT
SELECT @D