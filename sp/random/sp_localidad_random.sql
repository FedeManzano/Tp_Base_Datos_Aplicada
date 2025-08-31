
USE db_grupo_bases_datos_ap

GO 
CREATE OR ALTER PROCEDURE ddbba.sp_Localidad_Random
AS 
BEGIN 
    IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'ddbba.Localidad')
    BEGIN
    CREATE TABLE ddbba.Localidad 
    (
        IdLocalidad INT IDENTITY(1,1) PRIMARY KEY,
        Nombre VARCHAR(20) NOT NULL
    )


    INSERT INTO ddbba.Localidad(Nombre)
    VALUES 
    ('Ramos Mejía'),
    ('San Justo'),
    ('General Rojo'),
    ('General Mansilla'),
    ('Luján'),
    ('El Palomar'),
    ('Ciudad Jardín')
    END 
END


EXEC ddbba.sp_Localidad_Random

SELECT * FROM ddbba.Localidad
