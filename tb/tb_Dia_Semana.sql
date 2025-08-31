
USE db_grupo_bases_datos_ap

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'ddbba.Dia_Semana')
BEGIN
    CREATE TABLE ddbba.Dia_Semana
    (
        IdDia TINYINT IDENTITY(1,1) PRIMARY KEY,
        Nombre VARCHAR(12) NOT NULL
    )
END 


INSERT INTO ddbba.Dia_Semana(Nombre) VALUES 
('Lunes'),
('Martes'),
('Miercoles'),
('Jueves'),
('Viernes'),
('Sabado'),
('Domingo')

SELECT * FROM ddbba.Dia_Semana