
USE master 

IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'db_grupo_bases_datos_ap')
BEGIN
    CREATE DATABASE db_grupo_bases_datos_ap
END 

USE db_grupo_bases_datos_ap

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'ddbba')
BEGIN
   EXEC('CREATE SCHEMA ddbba')
END 


