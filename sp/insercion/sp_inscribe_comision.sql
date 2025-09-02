USE db_grupo_bases_datos_ap

GO 
CREATE OR ALTER PROCEDURE ddbba.sp_Inscribe_Comision 
@NRO_COMISION INT,
@COD_MATERIA CHAR(4),
@DNI_DOC CHAR(8),
@NRO_CUATR INT,
@TURNO CHAR(2),
@DNI_ALUMNO CHAR(8)
AS 
BEGIN 
    DECLARE @DNI_DOCENTE CHAR(8) = 
    (
        SELECT DniDocente FROM ddbba.Comision WHERE NroComision = @NRO_COMISION
                                    AND CodMateria = @COD_MATERIA 
                                    AND NroCuatrimestre = @NRO_CUATR
                                    AND Turno = @TURNO

    )

  --  IF @DNI_DOCENTE IS NULL 
    --    RETURN 0
  IF NOT EXISTS (SELECT * FROM ddbba.Alumno WHERE DniPersona = @DNI_ALUMNO)
      RETURN 0

   -- IF @DNI_ALUMNO = @DNI_DOC
     --   RETURN 0

    INSERT INTO ddbba.Inscribe (DniAlumno, CodMateria, DniDocente, NroComision)
    VALUES(@DNI_ALUMNO, @COD_MATERIA, @DNI_DOC, @NRO_COMISION)

END
