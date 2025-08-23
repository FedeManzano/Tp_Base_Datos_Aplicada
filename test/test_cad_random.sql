
USE db_grupo_bases_datos_ap


-- ACA HAY QUE HACER LOS TEST DE LAS FUNCIONALIDADES RANDOM



DECLARE @PRI_DIG_DNI VARCHAR(MAX) = ''
    DECLARE @DNI VARCHAR(MAX) = ''
    EXEC ddbba.sp_Cadena_Random 1, 4, 1, @S_RES = @PRI_DIG_DNI OUTPUT
    EXEC ddbba.sp_Cadena_Random 0, 9, 7, @S_RES = @DNI OUTPUT
PRINT(@PRI_DIG_DNI + @DNI)
