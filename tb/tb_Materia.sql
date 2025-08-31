USE db_grupo_bases_datos_ap

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'ddbba.Materia')
BEGIN
    CREATE TABLE ddbba.Materia 
    (
        CodMateria CHAR(4) PRIMARY KEY,
        NombreMateria VARCHAR(50) NOT NULL
    )
END 


DECLARE @CODIGO VARCHAR(4) = ''
EXEC ddbba.sp_Cadena_Random 1,9,4, @S_RES = @CODIGO OUTPUT
SELECT @CODIGO
INSERT INTO ddbba.Materia(CodMateria, NombreMateria)
VALUES (@CODIGO, 'SISTEMAS OPERATIVOS')


SELECT * FROM ddbba.Materia
