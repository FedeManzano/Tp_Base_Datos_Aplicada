
USE db_grupo_bases_datos_ap

GO 
CREATE OR ALTER PROCEDURE ddbba.sp_Localidad_Random
AS 
BEGIN 

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


EXEC ddbba.sp_Localidad_Random

SELECT * FROM ddbba.Localidad
