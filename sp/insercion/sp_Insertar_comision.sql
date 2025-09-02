USE db_grupo_bases_datos_ap


GO
CREATE OR ALTER PROCEDURE ddbba.sp_Insertar_Comision
@NRO_CUATRI TINYINT,
@COD_MAT CHAR(4),
@DNI_DOCENTE CHAR(8),
@TURNO CHAR(2),
@ANO INT
AS 
BEGIN 
    /*IF @NRO_CUATRI IS NULL OR @NRO_CUATRI < 1 OR @NRO_CUATRI > 2 
        RETURN 0
    IF @COD_MAT LIKE '%[^0-9]%' AND LEN(@COD_MAT) <> 4
        RETURN 0
    IF @DNI_DOCENTE LIKE '%[^0-9]%' AND LEN(@DNI_DOCENTE) <> 8
        RETURN 0
    IF @ANO < 1900 OR @ANO > 3000
        RETURN 0
    IF @TURNO <> 'TM' OR @TURNO <> 'TT' OR @TURNO <> 'TN'
        RETURN 0*/
    
    DECLARE @NRO_COMISION INT = 
    (
        SELECT COUNT(*)
        FROM ddbba.Comision AS com 
        WHERE com.CodMateria = @COD_MAT 
            AND com.DniDocente = @DNI_DOCENTE 
            AND com.NroCuatrimestre = @NRO_CUATRI 
    ) + 1
    
    DECLARE @TEXTO VARCHAR(50) = CAST( @NRO_COMISION AS VARCHAR(2)) + '|' + @COD_MAT 
                                + '|' + @DNI_DOCENTE + '|' + @TURNO + '|' + @NRO_CUATRI

    EXEC ddbba.sp_insertar_log 'ddbba.Comision', @TEXTO
    INSERT INTO ddbba.Comision(NroComision, CodMateria, DniDocente, Ano, NroCuatrimestre, Turno)  
    VALUES 
    (@NRO_COMISION, @COD_MAT, @DNI_DOCENTE, @ANO, @NRO_CUATRI, @TURNO) 
    RETURN 1 
END