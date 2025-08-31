
GO 
CREATE OR ALTER PROCEDURE ddbba.sp_Generar_Telefono_Random 
@TEL VARCHAR(14) OUTPUT 
AS 
BEGIN 
    DECLARE @TEL_AUX VARCHAR(14) = '54011'
    DECLARE @TEL_PP VARCHAR(1) = ''
    DECLARE @TEL_SP VARCHAR(7) = ''

    EXEC ddbba.sp_Cadena_Random 4,6,1,@S_RES = @TEL_PP OUTPUT
    EXEC ddbba.sp_Cadena_Random 0,9,7,@S_RES = @TEL_SP OUTPUT

    SET @TEL_AUX = @TEL_AUX + @TEL_PP + @TEL_SP

    SET @TEL = @TEL_AUX
END

/*
DECLARE @TELEFONO VARCHAR(14) = ''
EXEC ddbba.sp_Generar_Telefono_Random @TEL = @TELEFONO OUTPUT

SELECT @TELEFONO*/
