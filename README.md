# TP Nro 1 Base de Datos Aplicada

<p align="center">
  <img src="logo/logo-uni.png"/>
  
</p>
<p align='center'>
    <a  href='https://www.unlam.edu.ar/'>Unlam Sitio Oficial</a>
</p>

<br/>

## Integrantes

- [GONZÁLEZ FERNÁNDEZ, IVÁN ALEJANDRO]()
- [LORENZANA, AGUSTÍN NICOLAS]()
- [MANZANO, FEDERICO](https://github.com/FedeManzano)
- [RODRIGUEZ CHRISTIAN MARTIN]()

Trabajo práctico número de de Bases de Datos Aplicada, equipo: [SQL Warriors](https://github.com/SQL-Warriors/TP_1_Base_De_Datos_Aplicada)

## Diseño de la base de datos

![Diseño](modelado/DER.png)

## Creación de elementos en orden 

```SQL

/*
    CREACIÓN DE ELEMENTOS:
    Primero crear los esquemas
    EXEC('CREATE SCHEMA ddbba')
    EXEC('CREATE SCHEMA test')


    En Orden
    /tb/tb_Registro.sql
    /tb/tb_Localidad.sql
    /tb/tb_Persona.sql
    /tb/tb_Alumno.sql
    /tb/tb_Docente.sql
    /tb/tb_apyn.sql Y todos las tuplas que están en el mismo archivo

    Luego de crear estas tablas crear
    /sp/sp_insertar_log.sql
    /sp/random/sp_cadena_random.sql
    /sp/random/sp_cadena_random_letras.sql 
    
    /sp/random/sp_fechas_random.sql 
    EXEC sp_Fecha_Random 

    /sp/random/sp_get_nombre.sql
    /sp/random/sp_get_apellido.sql
    /sp/random/sp_generar_telefono_random.sql
    /sp/random/sp_generar_dni.sql
    /sp/random/sp_insertar_log.sql

    Crear la función 
    /fn/fn_seleccionar_id_fecha.sql

    /sp/random/sp_localidad_random
    EXEC ddbba.sp_Localidad_Random

    /sp/random/sp_generar_1100_personas.sql
    EXEC ddbba.sp_Generar_1100_Personas

    /sp/random/sp_generar_alumnos_docentes.sql
    EXEC sp_Generar_Alumnos_Docentes

    /tb/tb_Materia.sql
    /tb/tb_Comision.sql
    /tb/tb_Dia_Semana.sql
    /tb/tb_Vehiculo.sql Todo el código del archivo

*/
```

## Esquemas

```SQL
EXEC('CREATE SCHEMA ddbba') -- Esquema del dominio de problema
EXEC('CREATE SCHEMA test') -- Esquema de test unitarios
```

## Tablas

[PATH Tablas](tb/)

```SQL
-- BITÁCORA

/**
    Tabla Registro cumplirá la función de simular una bitácora (Log) cuando 
    existan modificaciones en los datos de las tablas.
*/
CREATE TABLE ddbba.Registro 
(
    IdRegistro INT IDENTITY(1,1) PRIMARY KEY,
    Fecha_y_Hora DATETIME DEFAULT GETDATE(), -- En cada inserción se carga en este campo la fecha y la hora actual
    Texto VARCHAR(50),
    Modulo VARCHAR(10),
    -- Restricción explícita: Campo texto solo puede tener hasta 50 caracteres
    CONSTRAINT CK_Texto CHECK
    (
        LEN(Texto) <= 50
    ),
    -- Restricción explícita: Campo modulo solo puede tener hasta 10 caracteres
    CONSTRAINT CK_Modulo CHECK 
    (
       LEN(Modulo) <= 10
    )
)
```

```SQL
CREATE TABLE ddbba.Persona 
(
        Dni CHAR(8) PRIMARY KEY,
        Nombre VARCHAR(20) NOT NULL,
        Apellido VARCHAR(20) NOT NULL,
        Edad VARCHAR(2)       
)
```
