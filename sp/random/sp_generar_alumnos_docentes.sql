USE db_grupo_bases_datos_ap


GO 
CREATE OR ALTER PROCEDURE sp_Generar_Alumnos_Docentes
AS 
BEGIN 
    DECLARE @ESTADO VARCHAR(1) = ''

    CREATE TABLE ddbba.Persona_AUX
    (
        ID INT IDENTITY(1,1) PRIMARY KEY,
        Dni CHAR(8) NOT NULL
    )

    INSERT INTO ddbba.Persona_AUX(Dni)
    SELECT per.Dni
    FROM ddbba.Persona AS per 

    DECLARE @CANT_REG INT = 0

    DECLARE @DNI CHAR(8) = ''
    DECLARE @TEXTO VARCHAR(50) = ''
    WHILE @CANT_REG < 1100
    BEGIN 
        EXEC ddbba.sp_Cadena_Random 1, 5, 1, @S_RES = @ESTADO OUTPUT
        SET @DNI = (SELECT TOP(1) Dni FROM ddbba.Persona_AUX)
        IF @ESTADO = '1' OR @ESTADO = '2' OR @ESTADO = '3'
        BEGIN 
            SET @TEXTO = 'I: ' + @DNI + ' 2023-10-12'
            EXEC ddbba.sp_Insertar_Log 'ddbba.Alumno', @TEXTO
            INSERT INTO ddbba.Alumno(DniPersona, FechaIngreso) VALUES (@DNI, '2023-10-12')
        END
        IF @ESTADO = '4'
        BEGIN
            SET @TEXTO = 'I: ' + @DNI + ' 2023-10-12'
            EXEC ddbba.sp_Insertar_Log 'ddbba.Alumno', @TEXTO

            SET @TEXTO = 'I: ' + @DNI + ' xxxxx'
            EXEC ddbba.sp_Insertar_Log 'ddbba.Docente', @TEXTO
            INSERT INTO ddbba.Alumno(DniPersona, FechaIngreso) VALUES (@DNI, '2023-10-12')
            INSERT INTO ddbba.Docente(DniPersona, Cargo) VALUES (@DNI, 'xxxxx')
        END 
        IF @ESTADO = '5'
        BEGIN
            SET @TEXTO = 'I: ' + @DNI + ' xxxxx'
            EXEC ddbba.sp_Insertar_Log 'ddbba.Docente', @TEXTO
            INSERT INTO ddbba.Docente(DniPersona, Cargo) VALUES (@DNI, 'xxxxx')
        END 
        DELETE TOP(1) FROM ddbba.Persona_AUX
        SET @CANT_REG = @CANT_REG + 1
        SET @ESTADO = ''
    END
    DROP TABLE ddbba.Persona_AUX
END


--EXEC sp_Generar_Alumnos_Docentes
