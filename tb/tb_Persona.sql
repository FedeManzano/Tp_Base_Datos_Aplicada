
USE db_grupo_bases_datos_ap

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'ddbba.Persona')
BEGIN
    CREATE TABLE ddbba.Persona 
    (
        Dni CHAR(8) PRIMARY KEY,
        Nombre VARCHAR(20) NOT NULL,
        Apellido VARCHAR(20) NOT NULL,
        Fecha_Nacimiento DATE NOT NULL,
        IdLocalidad INT NOT NULL,
        Telefono VARCHAR(14),
        CONSTRAINT FK_Localidad FOREIGN KEY(IdLocalidad) REFERENCES ddbba.Localidad(IdLocalidad)
    )
END 

--DROP TABLE ddbba.Persona