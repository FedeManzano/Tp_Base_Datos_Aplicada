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

    TABLAS SCHEMA ddbba 
    /tb/tb_Registro.sql
    /tb/tb_Persona.sql
    /tb/tb_Alumno.sql
    /tb/tb_Docente.sql
    /tb/tb_apyn.sql

    PROCEDIMIENTOS ALMACENADOS SCHEMA ddbba 
    /sp/random/sp_cadena_random.sql
    /sp/random/sp_cadena_random_letras.sql 
    /sp/random/sp_generar_dni_random.sql
    /sp/random/sp_get_nombre.sql
    /sp/random/sp_get_apellido.sql
    /sp/random/sp_generar_1100_personas.sql
    /sp/sp_insertar_log.sql

    TEST SCHEMA test
    /test/test.sql Para crear el esquema test 
    /test/test_cad_random.sql TODAS LAS PRUEBAS EL SP ddbba.sp_Cadena_Random
*/
