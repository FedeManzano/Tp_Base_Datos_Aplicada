
USE db_grupo_bases_datos_ap


GO 
CREATE OR ALTER FUNCTION ddbba.fn_Seleccionar_Id_Fecha(@ID_ran VARCHAR(2))
RETURNS INT
AS
BEGIN 

    RETURN
    (
        CASE 
            WHEN CAST(@ID_ran AS INT) > 20 THEN 20
            ELSE CAST(@ID_ran AS INT)
        END
    )

END
