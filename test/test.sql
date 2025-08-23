
USE db_grupo_bases_datos_ap

/**
    Creé un esquema para las pruebas unitarias de los procedimientos que tengamos que probar
    Esquemas ddbba y test (DBO que no se puede usar)
*/

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'test')
BEGIN
   EXEC('CREATE SCHEMA test')
END 





