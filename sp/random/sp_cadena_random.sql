USE db_grupo_bases_datos_ap


/**
    Procedimiento almacenado para generar una cadena de caracteres numérica 
    de forma random. Recibe tres parámetros de entrada y uno de sus parámetros es de salida.

    @I_RANGO es el inicio del rango de valores posibles que se desee para la cadena de salida
    POR EJ: 0123456789 Si no queremos utilizar todos estos valores podemos elegir un valor inicia diferente
    @I_RANGO = 2
    @F_RANGO = 7 Con esto limitamos los valores que nos entrega el procedimiento
    
    IMP: Los valores permitidos I_RANGO y F_RANGO están entre 0 y 9
    
    El otro parámetro es la cantidad de caracteres que van a componer la cadena resultado
    POR EJ si es un código de materia de 4 caracteres numéricos

    EXEC ddbba.sp_Cadena_Random 0,9,4, @S_RES = @CAD_SALIDA OUTPUT

    Salida: 0512 // posible salida

    El procedimiento también devuelve un valor entero
    1: Si se pudo calcular la cadena
    0: No se pudo calcular la cadena

    Para ver el valor entero en pantalla 

    DECLARE @RES INT = 0 // Lo defino en 0 para empezar

    EXEC @RES = ddbba.sp_Cadena_Random 0,9,4, @S_RES = @CAD_SALIDA OUTPUT 
    SELECT @RES
*/
GO
CREATE OR ALTER PROCEDURE ddbba.sp_Cadena_Random
/** 
    Los parámetros de entrada podrían ser más apropiados
    como TINYINT, por una cuestión de simplicidad los definí 
    con el tipo más utilizado INT.
*/
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
        SET @VAL_POSIBLES = @VAL_POSIBLES + CAST(@I_RANGO AS CHAR(1))
        SET @I_RANGO = @I_RANGO + 1
    END -- FIN WHILE

    SET @I_RANGO = 0 -- Lo pongo en 0 para generar el bucle y contar las cantidad de caracteres
                     -- Uso esta variable para no crear otra, en cualquier caso lo podemos cambiar
    DECLARE @INDEX INT = 0
    
    WHILE @I_RANGO < @C_CAR
    BEGIN
        -- INDEX Random para acceder a la @val_posibles y obtener un caracter
        SET @INDEX = CAST((RAND() * LEN(@VAL_POSIBLES) + 1 ) AS INT)

        -- Accede a la posición de la cadena INDEX y devuelve el caracter
        -- Para eso el OFFSET está en 1
        SET @S_RES = @S_RES + SUBSTRING(@VAL_POSIBLES, @INDEX, 1) 
        SET @I_RANGO = @I_RANGO + 1
    END -- FIN WHILE

    RETURN 1 -- No es tan necesario pero es para tener una medida de control de como
             -- se llevó a cabo el procedimiento
END

