USE db_grupo_bases_datos_ap

GO
CREATE OR ALTER PROCEDURE ddbba.sp_insertar_log
@MODULO VARCHAR(10),
@TEXTO VARCHAR(50)
AS
BEGIN
    IF @MODULO = ''
        SET @MODULO = 'N/A'

    
END 


--DROP PROCEDURE ddbba.sp_insertar_log