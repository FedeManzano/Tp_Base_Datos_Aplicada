USE db_grupo_bases_datos_ap
GO 
CREATE OR ALTER PROCEDURE ddbba.sp_Get_Nombre
@NOMBRE VARCHAR(25) OUTPUT
AS 
BEGIN 
    DECLARE @RES VARCHAR(25) = ''
    EXEC ddbba.sp_Cadena_Random 1,9,2, @S_RES = @RES OUTPUT
    SELECT @NOMBRE = Nombre
    FROM ddbba.Apyn 
    WHERE IdApyn = CONVERT(INT, @RES ) %  (SELECT COUNT(1) FROM ddbba.Apyn ) + 1
END

