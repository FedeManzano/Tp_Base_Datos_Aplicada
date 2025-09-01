
USE db_grupo_bases_datos_ap


IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'ddbba.Comision')
BEGIN
    CREATE TABLE ddbba.Comision 
    (
        NroComision INT NOT NULL,
        NroCuatrimestre TINYINT NOT NULL,
        CodMateria CHAR(4) NOT NULL,
        DniDocente CHAR(8) NOT NULL,
        Ano INT NOT NULL,
        CONSTRAINT PK_COMISION PRIMARY KEY(NroComision, CodMateria, DniDocente),
        CONSTRAINT FK_MATERIA FOREIGN KEY(CodMateria) REFERENCES ddbba.Materia(CodMateria),
        CONSTRAINT FK_DOCENTE FOREIGN KEY(DniDocente) REFERENCES ddbba.Docente(DniPersona),
    )
END 

-- Agrega el turno a la comisión
ALTER TABLE ddbba.Comision ADD Turno CHAR(2) NOT NULL

--DROP TABLE ddbba.Comision
SELECT DniPersona, FechaIngreso,
    NTILE(100) OVER(ORDER BY DniPersona) GRUPO
FROM ddbba.Alumno