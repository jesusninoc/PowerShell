#Monitorizar procesos
#Número de procesos
Get-Process
Get-Process chrome
(Get-Process chrome).count
if((Get-Process chrome).count -gt 5){"Más de 5"}

#CPU
Get-Process | Where-Object CPU -gt 10
(Get-Process | Where-Object CPU -gt 10).count

#Restaurar
#Comprobar estado
Get-ComputerRestorePoint
Restore-Computer -RestorePoint 255
Get-ComputerRestorePoint -LastStatus

#Copia seguridad
Set-Location d:/
ls *.doc -Recurse | %{$_.FullName | Out-File listado.txt -WhatIf -Append; Copy-Item $_ d:/copias/ -WhatIf}

#Leer dominios y saber IP
gc .\listadodominios.txt | %{Resolve-DnsName $_}
gc .\listadodominios.txt | %{Resolve-DnsName $_ | Where-Object Type -eq A | Select-Object IPAddress}

#Leer dominios, saber IP y conocer país de la IP
########################
$ip=New-WebServiceProxy -uri "http://www.webservicex.net/geoipservice.asmx?WSDL"
$ip.GetGeoIP('8.8.8.8') | Select-Object CountryName
########################
$ip=New-WebServiceProxy -uri "http://www.webservicex.net/geoipservice.asmx?WSDL"
$ip.GetGeoIP('172.217.19.131') | Select-Object CountryName
########################
gc .\listadodominios.txt | %{
$ip=Resolve-DnsName $_ | Where-Object Type -eq A | Select-Object IPAddress
$ipc=New-WebServiceProxy -uri "http://www.webservicex.net/geoipservice.asmx?WSDL"
$ipc.GetGeoIP($ip) | Select-Object CountryName
}
