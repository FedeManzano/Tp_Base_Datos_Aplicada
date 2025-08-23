USE db_grupo_bases_datos_ap

GO
CREATE OR ALTER PROCEDURE ddbba.sp_Cadena_Random
@I_RANGO    INT, -- INICIO DEL RANGO DE VALORES POR EJ 2
@F_RANGO    INT, -- FIN DEL RANGO DE VALORES POR EJ 7
@C_CAR      INT, -- CANTIDAD DE CAREACRES DE LA CADENA ALEATOREA
@S_RES VARCHAR(MAX) = '' OUTPUT -- CADENA GENERADA EN LA SALIDA
AS 
BEGIN 
    IF @I_RANGO < 0 OR @I_RANGO >= @F_RANGO
        RETURN 0
    IF @F_RANGO < 0 OR @F_RANGO > 9
        RETURN 0
    IF @C_CAR <= 0
        RETURN 0

    -- Se carga esta cadena con los valores posibles
    -- según el rango que entra por parámetro
    DECLARE @VAL_POSIBLES VARCHAR(MAX) = ''


    -- Se caraga la cadena @VAL_POSIBLES con los valores posibles
    -- según el rango
    WHILE @I_RANGO <= @F_RANGO 
    BEGIN 
        SET @VAL_POSIBLES = @VAL_POSIBLES + CAST(@I_RANGO AS VARCHAR(1))
        SET @I_RANGO = @I_RANGO + 1
    END

    SET @I_RANGO = 0
    DECLARE @INDEX INT = 0
    
    WHILE @I_RANGO < @C_CAR
    BEGIN
        -- INDEX Random para acceder a la @val_posibles y obtener un caracter
        SET @INDEX = CAST((RAND() * LEN(@VAL_POSIBLES) + 1 ) AS INT)
        SET @S_RES = @S_RES + SUBSTRING(@VAL_POSIBLES, @INDEX, 1) 
        SET @I_RANGO = @I_RANGO + 1
    END
    RETURN 1
END

