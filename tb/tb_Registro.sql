
USE db_grupo_bases_datos_ap

/**
    Tabla Registro cumplirá la función de simular una bitácora (Log) cuando 
    existan modificaciones en los datos de las tablas.
*/
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'ddbba.Registro')
BEGIN
    CREATE TABLE ddbba.Registro 
    (
        IdRegistro INT IDENTITY(1,1) PRIMARY KEY,
        Fecha_y_Hora DATETIME DEFAULT GETDATE(), -- En cada inserción se carga en este campo la fecha y la hora actual
        Texto VARCHAR(50),
        Modulo VARCHAR(10),

        -- Restricción explícita: Campo texto solo puede tener hasta 50 caracteres
        CONSTRAINT CK_Texto CHECK
        (
            LEN(Texto) >= 0 AND LEN(Texto) <= 50
        ),

        -- Restricción explícita: Campo modulo solo puede tener hasta 10 caracteres
        CONSTRAINT CK_Modulo CHECK 
        (
            LEN(Modulo) >= 0 AND LEN(Modulo) <= 10
        )
    )
END 

--DROP TABLE ddbba.Registro

