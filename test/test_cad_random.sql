
USE db_grupo_bases_datos_ap

/**
    TEST Unitarios del SP cadena_random ubicado en /sp/random/sp_cadena_random.sql
*/

GO
/*
    Comprueba lo que sucede cuando I_RANGO es 0
    El valor esperado del retorno tiene que ser 1 
*/
CREATE OR ALTER PROCEDURE test.sp_test_Cadena_Random_I_RANGO_IGualACero_Retorno_1
AS 
BEGIN
    DECLARE @CAD_RET VARCHAR(MAX) = ''
    DECLARE @VAL INT = 0
    EXEC @VAL = ddbba.sp_Cadena_Random 0, 4, 1, @S_RES = @CAD_RET OUTPUT
    SELECT 'Resultado: ' + CAST(@VAL AS VARCHAR(1)) + ' Esperado: 1'
    IF @VAL = 1
        PRINT('El valor devuelto es 1. Pasa la prueba')
END


GO 
/*
    Comprueba que sucede cuando el parámetro I_RANGO es negativo
    El valor de retorno esperado es 0
*/
CREATE OR ALTER PROCEDURE test.sp_test_Cadena_Random_I_RANGO_Menor_A_0_Retorno_0
AS 
BEGIN
    DECLARE @CAD_RET VARCHAR(MAX) = ''
    DECLARE @VAL INT = 0
    EXEC @VAL = ddbba.sp_Cadena_Random -1, 4, 1, @S_RES = @CAD_RET OUTPUT
    SELECT 'Resultado: ' + CAST(@VAL AS VARCHAR(1)) + ' Esperado: 0'
    IF @VAL = 0
        PRINT('El valor devuelto es 0. Pasa la prueba')
END

-- EJECUCIÓN DE LAS PRUEBAS
EXEC test.sp_test_Cadena_Random_I_RANGO_IGualACero_Retorno_1
EXEC test.sp_test_Cadena_Random_I_RANGO_Menor_A_0_Retorno_0

