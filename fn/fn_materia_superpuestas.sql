USE db_grupo_bases_datos_ap

GO
CREATE OR ALTER FUNCTION ddbba.fn_Superposicion_Inscripciones(@DNI_ALUMNO CHAR(8))
RETURNS TABLE 
AS
    RETURN 
    (
        SELECT ins.DniAlumno,ins.NroComision, ins.CodMateria, ins.DniDocente, ins.NroCuatrimestre, ins.Turno,
            ROW_NUMBER() OVER(PARTITION BY ins.DniAlumno, ins.Turno ORDER BY ins.DniAlumno) SUPERPUESTAS
        FROM ddbba.Inscribe ins
        WHERE ins.DniAlumno = @DNI_ALUMNO
    )
