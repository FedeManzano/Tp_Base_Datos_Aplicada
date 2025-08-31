
USE db_grupo_bases_datos_ap

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'ddbba.Localidad')
BEGIN
    CREATE TABLE ddbba.Localidad 
    (
        IdLocalidad INT IDENTITY(1,1) PRIMARY KEY,
        Nombre VARCHAR(20) NOT NULL
    )
END