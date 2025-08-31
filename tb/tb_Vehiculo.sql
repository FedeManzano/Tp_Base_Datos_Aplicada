
USE db_grupo_bases_datos_ap

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'ddbba.Vehiculo')
BEGIN 
    CREATE TABLE ddbba.Vehiculo 
    (
        Patente CHAR(7) PRIMARY KEY,
        Modelo VARCHAR(20) NOT NULL,
        DniPersona CHAR(8),
        CONSTRAINT FK_Persona FOREIGN KEY(DniPersona) REFERENCES ddbba.Persona(Dni),
       /* CONSTRAINT CK_Patente CHECK
        (
            Patente LIKE '[A-Z][A-Z][A-Z] [0-9][0-9][0-9]'
        ) */
    )
END


--DROP TABLE ddbba.Vehiculo


DECLARE @DNI_PERSONAS_AUX TABLE
(
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Dni CHAR(8)
)


INSERT INTO @DNI_PERSONAS_AUX
SELECT Dni FROM ddbba.Persona


DECLARE @PATENTE_L VARCHAR(7) = ''
DECLARE @PATENTE_N VARCHAR(7) = ''
DECLARE @MODELO VARCHAR(20) = ''
DECLARE @RAN_DNI VARCHAR(4) = ''
DECLARE @CANTIDAD INT = 500

WHILE @CANTIDAD > 0
BEGIN 
    EXEC ddbba.sp_Cadena_Random_Letras 3, @S_RES = @PATENTE_L OUTPUT 
    EXEC ddbba.sp_Cadena_Random 0,9,3, @S_RES = @PATENTE_N OUTPUT
    EXEC ddbba.sp_Cadena_Random_Letras 9, @S_RES = @MODELO OUTPUT 
    EXEC ddbba.sp_Cadena_Random 1,5,3, @S_RES = @RAN_DNI OUTPUT

    DECLARE @DNI_PERSONA CHAR(8) = 
    (
        SELECT Dni
        FROM @DNI_PERSONAS_AUX
        WHERE ID = @RAN_DNI
    )    

    INSERT INTO ddbba.Vehiculo(Patente, Modelo, DniPersona)
    VALUES (@PATENTE_L + ' '+ @PATENTE_N, @MODELO, @DNI_PERSONA)


    SET @PATENTE_L = ''
    SET @PATENTE_N  = ''
    SET @MODELO = ''
    SET @RAN_DNI  = ''

    SET @CANTIDAD = @CANTIDAD - 1
END 

SELECT * FROM ddbba.Vehiculo