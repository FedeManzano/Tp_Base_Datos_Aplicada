
USE db_grupo_bases_datos_ap


IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'ddbba.Comision')
BEGIN
    CREATE TABLE ddbba.Comision 
    (
        NroComision VARCHAR(7) NOT NULL,
        NroCuatrimestre TINYINT NOT NULL,
        Turno CHAR(2) NOT NULL,
        CodMateria CHAR(4) NOT NULL,
        DniDocente CHAR(8) NOT NULL,
        DniAlumno CHAR(8) NOT NULL,
        CONSTRAINT PK_COMISION PRIMARY KEY(NroComision, NroCuatrimestre, CodMateria, DniAlumno),
        CONSTRAINT FK_MATERIA FOREIGN KEY(CodMateria) REFERENCES ddbba.Materia(CodMateria),
        CONSTRAINT FK_ALUMNO FOREIGN KEY(DniAlumno) REFERENCES ddbba.Alumno(DniPersona),
        CONSTRAINT FK_DOCENTE FOREIGN KEY(DniDocente) REFERENCES ddbba.Docente(DniPersona),
    )
END 

--DROP TABLE ddbba.Comision


SELECT * FROM ddbba.Comision
INSERT INTO ddbba.Comision(NroComision, NroCuatrimestre,Turno, DniAlumno, DniDocente, CodMateria)
VALUES
('03-1438', 1, 'TM', '14888983', '11948905', '1438'),
('03-1438', 1, 'TM', '18354039', '11948905', '1438'),
('03-1438', 1, 'TM', '12544348', '11948905', '1438'),
('03-1438', 1, 'TM', '16428870', '11948905', '1438'),
('03-1438', 1, 'TM', '16969969', '11948905', '1438'),
('02-1942', 2, 'TM', '16969969', '10334020', '1942'),
('02-1942', 2, 'TM', '15670772', '10334020', '1942'),
('02-1942', 2, 'TM', '16428870', '10334020', '1942'),
('02-1942', 2, 'TM', '14888983', '10334020', '1942'),
('02-1942', 2, 'TM', '11655621', '10334020', '1942'),
('02-1942', 2, 'TM', '12544348', '10334020', '1942'), --- HAY QUE ELMINAR 
('02-1942', 1, 'TM', '12195276', '10334020', '1942'),
('02-1942', 1, 'TM', '12544348', '10334020', '1942'),
('02-1942', 1, 'TM', '14888983', '10334020', '1942'),
('02-1942', 1, 'TN', '11583550', '10334020', '1942'),--
('01-1347', 2, 'TM', '12544348', '10089516', '1347'),
('01-1347', 2, 'TM', '14888983', '10089516', '1347'),
('01-1347', 2, 'TN', '11583550', '10089516', '1347'),
('01-1347', 2, 'TN', '11592727', '10089516', '1347'),
('01-1347', 2, 'TN', '18354039', '10089516', '1347'),--
('01-1347', 1, 'TM', '12544348', '10089516', '1347'),
('01-1347', 1, 'TM', '14888983', '10089516', '1347'),
('01-1347', 1, 'TN', '11583550', '10089516', '1347'),
('01-1347', 1, 'TN', '11592727', '10089516', '1347'),
('01-1347', 1, 'TN', '18354039', '10089516', '1347'),
('01-1347', 1, 'TN', '10377676', '10089516', '1347'),
('01-1347', 1, 'TM', '10220447', '10089516', '1347'), 
('01-1347', 1, 'TN', '10103677', '10089516', '1347')


SELECT DniPersona, FechaIngreso,
    NTILE(100) OVER(ORDER BY DniPersona) GRUPO
FROM ddbba.Alumno