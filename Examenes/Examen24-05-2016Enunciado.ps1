####################################################################################################################################
####################################################################################################################################
##########################################
##Qué hace esto?
#Para qué te puede servir?
##########################################
####################################################################################################################################
####################################################################################################################################
#Qué hace esto?
#$env:TEMP -> C:\Users\jess\AppData\Local\Temp
if((Get-WmiObject -query "select * from Win32_PnPEntity where caption like '%cam%'").status)
{
"Status ok"
Start-BitsTransfer -Source ‘http://www.jesusninoc.com/wp-content/uploads/2015/06/commandcam.exe’ -Destination $env:TEMP\commandcam.exe
cd $env:TEMP; .\commandcam.exe /filename capture.bmp
}
####################################################################################################################################
#Qué hace esto?
if ((Get-WmiObject -Class win32_battery).EstimatedChargeRemaining -lt 50)
{
"Inferior a 50"
Send-MailMessage -to "mail2@example.com" -from “mail@example.com” -subject “YYY” -SmtpServer localhost
}
####################################################################################################################################
#Qué hace esto?, para qué sirve?
Get-Process | Group-Object name | select count, name | sort count | %{
if($_.count -gt 5){
((Get-Process $_.Name).Threads).Count
}
}
####################################################################################################################################
#Para qué sirve esto?
if(Get-Process notepad)
{
Stop-Process notepad
Start-BitsTransfer -Source ‘http://www.jesusninoc.com/wp-content/uploads/2015/06/notepad.exe’ -Destination $env:TEMP\notepad.exe
cd $env:TEMP; .\notepad.exe
}
####################################################################################################################################
#Qué pones en lugar de xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
$mediatiempo=2
$VM=86
$contador=0
Get-Process notepad | Where-Object CPU -gt $mediatiempo ; $contador++
Get-Process notepad | Where-Object VM -gt $VM ; $contador++
$contador
if($contador -gt 1){"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"}
####################################################################################################################################
#Qué hace esto?
Get-ComputerRestorePoint
Restore-Computer -RestorePoint 255
Get-ComputerRestorePoint -LastStatus
####################################################################################################################################
#Qué hace esto?
Set-Location d:/
ls *.doc -Recurse | %{$_.FullName | Out-File listado.txt -WhatIf -Append; Copy-Item $_ d:/copias/ -WhatIf}
####################################################################################################################################
#Qué hace esto?
[int]$rangoip= read-host "Rango de dirección IP a escanear (1-254)"
1 .. 254 | %{$_
$ip="192.168.$rangoip."+$_
$resultadoping = Resolve-DnsName $ip -ErrorAction Ignore
if ($resultadoping.Type -eq "PTR")
{
 "$ip" + "--> existe"
 "$ip"+ "-->" ,($resultadoping).NameHost >> Q:\direccionesip.txt
}
else 
{
 "$ip"+"--> no existe, haciendo ping..."
 $ping2=ping $ip
 if($ping2 -match "TTL")
 {
 "$ip"+"--> si existe" 
 "$ip"+ "-->" >> Q:\direccionesip.txt
}
}
}
####################################################################################################################################
#Qué hace esto?
(Get-WmiObject -Class Win32_Product) | %{
New-Item $_.vendor -WhatIf
$_.name | Out-File $_.vendor -WhatIf
}
####################################################################################################################################
#Qué hace esto?
$kb=Read-Host ‘NúmeroActualización’
((Get-HotFix).hotfixid | Select-String $kb)
####################################################################################################################################
#Qué hace esto?
(Get-HotFix).hotfixid | %{
$ur="https://support.microsoft.com/es-es/kb/"+$_.replace("KB","")
$ur
Start-Process chrome $ur
Start-Sleep -Seconds 10
}
####################################################################################################################################
#Qué hace?, qué funcion realiza la función scarparaping()
Get-EventLog Application | Where-Object Message -Match "192.168" | %{
ping (scarparaping $_)
}
####################################################################################################################################
#Qué hace?, explica la situación
Start-BitsTransfer -Source 'http://www.jesusninoc.com/wp-content/uploads/2014/12/config.txt' -Destination $env:TEMP\config.ps1
powershell -File $env:TEMP\config.ps1
if((Get-WmiObject -Class Win32_Account).name | Select-String "usuariofantasma"){"Problema"}
if((Get-WmiObject -Class Win32_Group).name  | Select-String "usuariofantasma"){"Problema"}
####################################################################################################################################
####################################################################################################################################
#Qué hace?, explica la situación
1..254|%{
$ip="192.168.1."+$_
$resultadoping=ping $ip
$resultadoping
if($resultadoping -match 'inaccesible')
{"Inaccesible"}
else
{"Accesible"}
}
####################################################################################################################################
#Qué hace?, explica la situación
gc .\listadodominios.txt | %{Resolve-DnsName $_}

####################################################################################################################################
####################################################################################################################################
--------------------------------------
SITUACIÓN 1
--------------------------------------
Aparecen unas capturas que se han realizado con la webcam, la webcam esta en estado activo.
--------------------------------------
AYUDA PARA RESOLVER LA SITUACIÓN
--------------------------------------
-Si ha entrado por USB
gwmi Win32_USBControllerDevice
-Hay alguna aplicación temporal que sirva para hacer capturas
-Si DevideID contiene la cadena B27
-Analizar procesos:
	-Si alguno ha abierto muchos procesos
-Hay algún servicio raro
-Analizar los parametros que se te ocurran
-Analizar la red, conexiones remotas y puertos
-Si la batería se consume rapidamente avisar

--------------------------------------
SITUACIÓN 2
--------------------------------------
Un empleado sabe que va a ser despedido, empieza a elimiar archivos, realizar un script que sirva para mover archivos a una carpeta que se llama "basura" y además de moverse a la carpeta también se haga una copia de los archivos que se intentan eliminar.
--------------------------------------
AYUDA PARA RESOLVER LA SITUACIÓN
--------------------------------------
-Crear carpeta basura
-Crear una carpeta donde va el contenido además de la carpeta basura
-La carpeta tiene que tener la fecha de cuando se intenta realizar el borrado
-Guardar el nombre de la persona que ejecuta:
Get-WmiObject win32_process |% {Write-Host $_.processname $_.getowner().user}
([System.Security.Principal.WindowsIdentity]::GetCurrent()).name
-Mover a la carpeta basura

--------------------------------------
SITUACIÓN 3
--------------------------------------
Teniendo en cuenta la situación anterior, detectar que hay un programa que realizar la función de papelera secreta, analizar todo el proceso.
--------------------------------------
AYUDA PARA RESOLVER LA SITUACIÓN
--------------------------------------
-Procesos?
-Cantidad de memoria?
