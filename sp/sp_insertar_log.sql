USE db_grupo_bases_datos_ap

GO
CREATE OR ALTER PROCEDURE ddbba.sp_Insertar_Log
@MODULO VARCHAR(10),
@TEXTO VARCHAR(50)
AS
BEGIN

    BEGIN TRANSACTION T_LOG -- Inicio la transacción 
                            -- No hace definir el nivel de aislamiento
                            -- ya que al ser una inserción el bloqueo utilizado es EXCLUSIVE
    BEGIN TRY
        IF @MODULO IS NULL OR @TEXTO IS NULL 
            RAISERROR('Los parámetros no pueden ser nulos en la tabla Registro', 20, 1) -- Severidad = 20 Corta la ejecución

        IF @MODULO = ''
            SET @MODULO = 'N/A'
        
        INSERT INTO ddbba.Registro(Modulo, Texto)
        VALUES 
        (@MODULO, @TEXTO)
        COMMIT TRANSACTION
    END TRY 
    BEGIN CATCH
        DECLARE @MJE_ERROR NVARCHAR(200) = '',
                @SEVERIDAD INT,
                @ESTADO INT 
        SELECT @MJE_ERROR = ERROR_MESSAGE(),
               @SEVERIDAD = ERROR_SEVERITY(),
               @ESTADO = ERROR_STATE()

        RAISERROR(@MJE_ERROR, @SEVERIDAD, @ESTADO) 
        ROLLBACK TRANSACTION 
    END CATCH    
END 


--DROP PROCEDURE ddbba.sp_Insertar_Log