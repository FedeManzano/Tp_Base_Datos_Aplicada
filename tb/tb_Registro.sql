
USE db_grupo_bases_datos_ap

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'ddbba.Registro')
BEGIN
    CREATE TABLE ddbba.Registro 
    (
        IdRegistro INT IDENTITY(1,1) PRIMARY KEY,
        Fecha_y_Hora DATETIME DEFAULT GETDATE(),
        Texto VARCHAR(50),
        Modulo VARCHAR(10),
        CONSTRAINT CK_Texto CHECK
        (
            LEN(Texto) >= 0 AND LEN(Texto) <= 50
        ),
        CONSTRAINT CK_Modulo CHECK 
        (
            LEN(Modulo) >= 0 AND LEN(Modulo) <= 10
        )
    )
END 

--DROP TABLE ddbba.Registro

