/*
    Trabajo Práctico Nro 1
    Bases de Datos Aplicada 
*/
USE master 

IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'db_grupo_bases_datos_ap')
BEGIN
    -- El nombre lo podemos cambiar con la instrucción RENAME
    CREATE DATABASE db_grupo_bases_datos_ap
END 

USE db_grupo_bases_datos_ap

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'ddbba')
BEGIN
   EXEC('CREATE SCHEMA ddbba')
END 

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
    /sp/random/sp_insertar_comisiones.sql
    Y todo el codigo del archivo /tb/tb_Comision.sql 

    /tb/tb_Inscribe.sql 
    /sp/random/sp_inscribe_comision.sql
    /tb/tb_Inscribe.sql Código que está en el archivo debajo de la tabla

    /tb/tb_Dia_Semana.sql
    /tb/tb_Vehiculo.sql Todo el código del archivo
*/
