################
################
¿Qué hacen los siguientes scripts?
################
################
Get-Process
################
Get-ChildItem D:\power\fichero -File
################
Get-ChildItem D:\power\fichero -File -Recurse
################
(Get-Process | Select-Object -first 5)
################
($S=Get-Process | Sort-Object CPU -DESC)
################
Get-Process | Where-Object WorkingSet -gt 500kb | Sort-Object -Descending Name
################
Write-Host "------------------------------------------------------"
Write-Host "Agenda"
$nombre=Read-Host "Introduzca nombre: "
$dni=Read-Host "Introduzca DNI: "
$edad=Read-Host "Introduzca edad: "
$nombre,$dni,$edad > $dni".txt"
################
ls D:\power\ejeclase | select Name,CreationTime | where CreationTime -LT (Get-Date).AddDays(-2)
################
Get-ChildItem | Where-Object {
$_.LastWriteTime -ge (Get-Date).AddDays(-1)
}
