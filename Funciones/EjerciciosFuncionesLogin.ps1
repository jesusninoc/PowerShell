#Introducir usuario y decir si es correcto
$user=Read-Host
if($user -eq "pepito")
{
Write-Host $user
}

#Introducir pass y ver si es correcto
$user=Read-Host
$pass=Read-Host
if($user -eq "pepito" -and $pass -eq "secreto")
{
Write-Host $user
}

#Introducir usuario y pass y ver si son correctos leyendo en un fichero
$user=Read-Host
$pass=Read-Host
Get-Content .\users.txt | % {if(($_.split(",")[0] -like $user) -and ($_.split(",")[1] -like $pass)){"correcto"}}

#Introducir pass y ver si es correcto
function validacion(){
$user=Read-Host
$pass=Read-Host
if($user -eq "pepito" -and $pass -eq "secreto" -and (gc q:\fich.txt) -eq 1234)
{
Write-Host $user
}
}
validacion

#Introducir pass y ver si es correcto
function validacion($parametro1, $parametro2){
$user=$parametro1
$pass=$parametro2
if($user -eq "pepito" -and $pass -eq "secreto")
{
Write-Host $user "validado correctamente"
}
}
validacion pepito sec
validacion pepito secreto
