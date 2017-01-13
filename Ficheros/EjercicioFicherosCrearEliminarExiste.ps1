#PEDIR AL USUARIO UN NOMBRE DE DIRECTORIO PARA CREAR O ELMINAR

$nombre=Read-Host "Introduzca nombre de directorio para crear o borrar"
if(Test-Path $nombre)
{
rm $nombre -WhatIf
}
else
{
mkdir $nombre -WhatIf
}
