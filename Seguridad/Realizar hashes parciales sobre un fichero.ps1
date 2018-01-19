###############################################################################################################
# Dividir un fichero en varios ficheros (cada línea en un fichero distinto) y realizar hash a cada fichero
###############################################################################################################

mkdir ficherosdivididos

gc ..\ficheromaestro.txt

$numfichero=1
gc ..\ficheromaestro.txt | % {
    $_ | Out-File "fichero$numfichero"
    $numfichero+=1
}

# Realizar el Hash a los ficheros

Get-FileHash ..\ficheromaestro.txt

ls | % {
    Get-FileHash $_
}

###############################################################################################################
# Modificar parte del fichero y detectar el lugar de modificación
###############################################################################################################

notepad ..\ficheromaestro.txt

###############################################################################################################
# Volver a dividir en ficheros el fichero modificado y realizar el hash para detectar dónde ha cambiado
###############################################################################################################

$numfichero=1
gc ..\ficheromaestro.txt | % {
    $_ | Out-File "fichero$numfichero"
    $numfichero+=1
}

# Realizar el Hash a los ficheros

Get-FileHash ..\ficheromaestro.txt

ls | % {
    Get-FileHash $_
}
