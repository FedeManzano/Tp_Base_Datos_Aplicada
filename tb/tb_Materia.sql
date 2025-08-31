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
INSERT INTO ddbba.Materia(CodMateria, NombreMateria)
VALUES (@CODIGO, 'SISTEMAS OPERATIVOS')

SET @CODIGO = ''
EXEC ddbba.sp_Cadena_Random 1,9,4, @S_RES = @CODIGO OUTPUT
INSERT INTO ddbba.Materia(CodMateria, NombreMateria)
VALUES (@CODIGO, 'BASES DE DATOS')


EXEC ddbba.sp_Cadena_Random 1,9,4, @S_RES = @CODIGO OUTPUT
INSERT INTO ddbba.Materia(CodMateria, NombreMateria)
VALUES (@CODIGO, 'BASES DE DATOS APLICADA')


SET @CODIGO = ''
EXEC ddbba.sp_Cadena_Random 1,9,4, @S_RES = @CODIGO OUTPUT
INSERT INTO ddbba.Materia(CodMateria, NombreMateria)
VALUES (@CODIGO, 'ALGEBRA I')


SET @CODIGO = ''
EXEC ddbba.sp_Cadena_Random 1,9,4, @S_RES = @CODIGO OUTPUT
INSERT INTO ddbba.Materia(CodMateria, NombreMateria)
VALUES (@CODIGO, 'ALGEBRA II')

SET @CODIGO = ''
EXEC ddbba.sp_Cadena_Random 1,9,4, @S_RES = @CODIGO OUTPUT
INSERT INTO ddbba.Materia(CodMateria, NombreMateria)
VALUES (@CODIGO, 'ANALISIS MATEMATICO I')

SET @CODIGO = ''
EXEC ddbba.sp_Cadena_Random 1,9,4, @S_RES = @CODIGO OUTPUT
INSERT INTO ddbba.Materia(CodMateria, NombreMateria)
VALUES (@CODIGO, 'ANALISIS MATEMATICO II')


SET @CODIGO = ''
EXEC ddbba.sp_Cadena_Random 1,9,4, @S_RES = @CODIGO OUTPUT
INSERT INTO ddbba.Materia(CodMateria, NombreMateria)
VALUES (@CODIGO, 'PRINCIPIO DISEÑO')


SET @CODIGO = ''
EXEC ddbba.sp_Cadena_Random 1,9,4, @S_RES = @CODIGO OUTPUT
INSERT INTO ddbba.Materia(CodMateria, NombreMateria)
VALUES (@CODIGO, 'PRINCIPIO CALIDAD')

SELECT * FROM ddbba.Materia
