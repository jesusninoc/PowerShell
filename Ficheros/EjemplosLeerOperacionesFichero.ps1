#1 Leer del fichero que tiene los usuarios
$fichero=get-content asignaturas.txt
Get-Content $fichero | % {
$_
}

#2 Leer del fichero que tiene los usuarios y obtener solo la operación que hay que realizar
$fichero=get-content asignaturas.txt
Get-Content $fichero | % {
$_.split(',')[1]
}

#3 Leer el fichero y detectar la operación a realizar utilizando el if
$fichero=get-content asignaturas.txt
Get-Content $fichero | % {
if($_.split(',')[1] -eq 0)
{
Write-Host "CREAR"
}
if($_.split(',')[1] -eq 1)
{
Write-Host "ELIMINAR"
}
}

