
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

DECLARE @DOCENTES_DNI TABLE 
(
    ID INT IDENTITY(1,1) PRIMARY KEY,
    DniDocente CHAR(8) NOT NULL
) 

INSERT INTO @DOCENTES_DNI 
SELECT DniPersona
FROM ddbba.Docente 
WHERE DniPersona NOT IN 
(
    SELECT DniPersona
    FROM ddbba.Alumno
)

SELECT * FROM @DOCENTES_DNI


DECLARE @TURNOS TABLE 
(
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Nombre CHAR(2) NOT NULL 
)

INSERT INTO @TURNOS 
VALUES 
('TM'),
('TT'),
('TN')

DECLARE @COD_MAT TABLE 
(
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Codigo CHAR(4) NOT NULL
)

INSERT INTO @COD_MAT 
SELECT CodMateria
FROM ddbba.Materia

SELECT * FROM @COD_MAT

DECLARE @CANT INT = 0
DECLARE @MAX INT = (SELECT COUNT(*) FROM ddbba.Materia)

DECLARE @C_MATERIA VARCHAR(4) = ''
DECLARE @D_DOCENTE VARCHAR(8) = ''
DECLARE @CUATR VARCHAR(1) = ''
DECLARE @TUR VARCHAR(2) = ''


WHILE @MAX > 0
BEGIN 
    WHILE @CANT < 5
    BEGIN 
        EXEC ddbba.sp_Cadena_Random 1,8,1, @S_RES = @C_MATERIA OUTPUT 
        EXEC ddbba.sp_Cadena_Random 1,9,2, @S_RES = @D_DOCENTE OUTPUT 
        EXEC ddbba.sp_Cadena_Random 1,2,1, @S_RES = @CUATR OUTPUT
        EXEC ddbba.sp_Cadena_Random 1,3,1, @S_RES = @TUR OUTPUT

        DECLARE @CODIGO_MATERIA VARCHAR(4) = (SELECT Codigo FROM @COD_MAT WHERE ID = @C_MATERIA)
        DECLARE @DNI_DOCENTE VARCHAR(8) = (SELECT DniDocente FROM @DOCENTES_DNI WHERE ID = @D_DOCENTE)
        DECLARE @CUATRIMESTRE INT = CAST(@CUATR AS INT)
        DECLARE @TURNO_AS VARCHAR(2) = (SELECT Nombre FROM @TURNOS WHERE ID = @TUR)


        EXEC ddbba.sp_Insertar_Comision @CUATRIMESTRE, @CODIGO_MATERIA, @DNI_DOCENTE, @TURNO_AS, 2025 


        SET @C_MATERIA = ''
        SET @D_DOCENTE  = ''
        SET @CUATR = ''
        SET @TUR = ''


        SET @CANT = @CANT + 1
    END
    SET @MAX = @MAX -1
END

SELECT * FROM ddbba.Comision
