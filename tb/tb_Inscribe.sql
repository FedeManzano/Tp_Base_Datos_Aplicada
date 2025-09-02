USE db_grupo_bases_datos_ap

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'ddbba.Inscribe')
BEGIN 
    CREATE TABLE ddbba.Inscribe 
    (
        DniAlumno CHAR(8) NOT NULL,
        NroComision INT NOT NULL,
        CodMateria CHAR(4) NOT NULL,
        DniDocente CHAR(8) NOT NULL,
        Turno CHAR(2) NOT NULL,
        NroCuatrimestre TINYINT NOT NULL, 
        CONSTRAINT PK_Inscribe PRIMARY KEY(DniAlumno, NroComision, CodMateria, DniDocente, Turno, NroCuatrimestre),
        CONSTRAINT FK_Dni_Alumno FOREIGN KEY(DniAlumno) REFERENCES ddbba.Alumno(DniPersona),
        CONSTRAINT FK_Comision FOREIGN KEY(NroComision, CodMateria, DniDocente, NroCuatrimestre, Turno )
        REFERENCES ddbba.Comision(NroComision, CodMateria, DniDocente, NroCuatrimestre, Turno)
    )
END


DECLARE @DNI_ALUMNOS TABLE 
(
    ID INT IDENTITY(1,1) PRIMARY KEY,
    DniAlumno CHAR(8) NOT NULL
)

INSERT INTO @DNI_ALUMNOS
SELECT DniPersona FROM ddbba.Alumno

DECLARE @COMISIONES TABLE 
(
    ID INT IDENTITY(1,1) PRIMARY KEY,
    NroComision INT NOT NULL,
    CodMateria CHAR(4),
    DniDocente CHAR(8),
    NroCuatri INT,
    Turno CHAR(2)
)

INSERT INTO @COMISIONES
SELECT NroComision, CodMateria, DniDocente, NroCuatrimestre, Turno
FROM ddbba.Comision


DECLARE @INDEX_ALU INT = 1
DECLARE @INDEX_COM INT = 1


DECLARE @CANTIDAD_ALUMNOS INT = (SELECT COUNT(*) FROM @DNI_ALUMNOS)

DECLARE @CANTIDAD_COM INT = (SELECT COUNT(*) FROM @COMISIONES)


DECLARE @CANT_COMISION INT = 15
DECLARE @DNI_ALU_RAN CHAR(1) = '' 

   
WHILE @CANTIDAD_ALUMNOS > 0
BEGIN 
    --IF @CANTIDAD_COM > @INDEX_COM
    --BEGIN 
        DECLARE @NRO_COMISION INT = (SELECT NroComision FROM @COMISIONES WHERE ID = @INDEX_COM)
        DECLARE @COD_MAT CHAR(4) = (SELECT CodMateria FROM @COMISIONES WHERE ID = @INDEX_COM)
        DECLARE @DNI_DOCENTE CHAR(8) = (SELECT DniDocente FROM @COMISIONES WHERE ID = @INDEX_COM)
        DECLARE @NRO_CUATR INT = (SELECT NroCuatri FROM @COMISIONES WHERE ID = @INDEX_COM)
        DECLARE @TURNO CHAR(2) = (SELECT Turno FROM @COMISIONES WHERE ID = @INDEX_COM)

        SELECT @NRO_COMISION

        WHILE @CANT_COMISION > 0
        BEGIN 
            EXEC ddbba.sp_Cadena_Random 1,9,3, @S_RES = @DNI_ALU_RAN OUTPUT
            SELECT @DNI_ALU_RAN
            DECLARE @DNI_ALUMNO CHAR(8) = (SELECT DniAlumno FROM @DNI_ALUMNOS WHERE ID = @DNI_ALU_RAN)
            EXEC ddbba.sp_Inscribe_Comision @NRO_COMISION, @COD_MAT, @DNI_DOCENTE, @NRO_CUATR, @TURNO, @DNI_ALUMNO
            SET @CANT_COMISION = @CANT_COMISION - 1
        END
    --END
    SET @CANT_COMISION = 15
    SET @CANTIDAD_ALUMNOS = @CANTIDAD_ALUMNOS - 15
    SET @INDEX_COM = @INDEX_COM + 1
END    



SELECT * FROM ddbba.Inscribe







