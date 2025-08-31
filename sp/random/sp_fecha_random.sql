USE db_grupo_bases_datos_ap

GO
CREATE OR ALTER PROCEDURE sp_Fecha_Random 
AS 
BEGIN 
    
   IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'ddbba.Fechas')
    BEGIN
    CREATE TABLE ddbba.Fechas 
    (
        IdFechas INT IDENTITY(1,1) PRIMARY KEY,
        FechaRan DATE NOT NULL
    )


    INSERT INTO ddbba.Fechas(FechaRan)
    VALUES 
    ('1987-03-01'),
    ('1988-03-01'),
    ('2000-03-01'),
    ('1991-03-01'),
    ('2003-04-01'),
    ('2002-05-01'),
    ('1995-02-01'),
    ('1996-01-01'),
    ('1997-06-01'),
    ('1998-09-01'),
    ('1999-02-01'),
    ('1992-03-01'),
    ('1990-03-01'),
    ('1991-12-01'),
    ('1996-11-01'),
    ('1985-04-01'),
    ('1984-05-01'),
    ('1975-09-01'),
    ('1978-09-01'),
    ('1980-10-01')
    END 
END

EXEC sp_Fecha_Random 

SELECT * FROM ddbba.Fechas