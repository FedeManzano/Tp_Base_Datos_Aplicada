
USE db_grupo_bases_datos_ap


-- ACA HAY QUE HACER LOS TEST DE LAS FUNCIONALIDADES RANDOM

GO 
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