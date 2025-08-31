
USE db_grupo_bases_datos_ap

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'ddbba.Docente')
BEGIN
    CREATE TABLE ddbba.Docente 
    (
        DniPersona CHAR(8) PRIMARY KEY,
        Cargo VARCHAR(20) NOT NULL,
        CONSTRAINT FK_DNI_PERSONA 
        FOREIGN KEY(DniPersona) REFERENCES  ddbba.Persona(Dni) ON DELETE CASCADE
    )
END 

--DROP TABLE ddbba.Docente
SELECT * FROM ddbba.Registro






