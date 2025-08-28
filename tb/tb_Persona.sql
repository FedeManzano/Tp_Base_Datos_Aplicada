
USE db_grupo_bases_datos_ap

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'ddbba.Persona')
BEGIN
    CREATE TABLE ddbba.Persona 
    (
        Dni CHAR(8) PRIMARY KEY,
        Nombre VARCHAR(20) NOT NULL,
        Apellido VARCHAR(20) NOT NULL,
        Edad VARCHAR(2)       
    )
END 

--DROP TABLE ddbba.Persona