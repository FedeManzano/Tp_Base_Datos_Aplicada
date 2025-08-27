
CREATE TABLE ddbba.Apyn
(
    IdApyn INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(25) NOT NULL,
    Apellido VARCHAR(25) NOT NULL
)


INSERT INTO ddbba.Apyn(Nombre, Apellido)
VALUES 
('Pedro', 'Alonso'),
('Ezequiel', 'Morales'),
('Esteban', 'Ramirez'),
('Diego', 'Fernandez'),
('Lionel', 'Medina'),
('Ismael', 'Perez'),
('Estefania', 'Gutierrez'),
('Carla', 'Ambrosio'),
('Teresa', 'Medina'),
('Sebastian', 'Mejia'),
('Viviana', 'Lopez'),
('Maximiliano', 'Albornoz'),
('Matias', 'Sanchez'),
('Marcos', 'Medina'),
('Ramiro', 'Cardozo'),
('Maria', 'García'),
('Esteban', 'Lopez'),
('Sebastian', 'Palco'),
('Estefania', 'Berizo'),
('Julian', 'Franco'),
('Diego', 'Gutierrez'),
('Narciso', 'Fernandez'),
('Carlos', 'Suazo'),
('Pablo', 'Valerdi'),
('Ramon', 'Mejia'),
('Gustavo', 'Albornoz'),
('Santiago', 'Sanchez'),
('Carla', 'Brasa'),
('Bernardo', 'Gimenez')




DECLARE @RES VARCHAR(5) = ''
EXEC ddbba.sp_Cadena_Random 1,9,2, @S_RES = @RES OUTPUT
SELECT *
FROM ddbba.Apyn 
WHERE IdApyn = CONVERT(INT, @RES ) % 29 + 1