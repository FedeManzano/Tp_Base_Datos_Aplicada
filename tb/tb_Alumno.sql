USE db_grupo_bases_datos_ap

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'ddbba.Alumno')
BEGIN
    CREATE TABLE ddbba.Alumno 
    (
        DniPersona CHAR(8) PRIMARY KEY,
        FechaIngreso DATETIME NOT NULL,
        CONSTRAINT FK_DNIPERSONA 
        FOREIGN KEY(DniPersona) REFERENCES  ddbba.Persona(Dni)
    )
END 

