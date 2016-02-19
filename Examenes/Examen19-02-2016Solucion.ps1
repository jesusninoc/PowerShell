#---------------------------------------------------------------
#Comando para ver servicios
#---------------------------------------------------------------
Get-Service

#---------------------------------------------------------------
#Comando para ver tareas programadas
#---------------------------------------------------------------
Get-ScheduledTask

#---------------------------------------------------------------
#Comandos para crear carpetas, pon ejemplos
#---------------------------------------------------------------
New-Item -ItemType Directory -Name ejemplo
mkdir ejemplo

#---------------------------------------------------------------
#Comandos moverse por carpetas
#---------------------------------------------------------------
cd /
cd .
cd ..

#---------------------------------------------------------------
#Comando para ver actualizaciones
#---------------------------------------------------------------
Get-HotFix

#---------------------------------------------------------------
#Comando para ver programas instalados (PowerShell 5.0)
#---------------------------------------------------------------
Get-Package

#---------------------------------------------------------------
#Crear una tarea para ejecutar una aplicacion cada día a las 17:00
#---------------------------------------------------------------
$action=New-ScheduledTaskAction -Execute 'Notepad'
$trigger=New-ScheduledTaskTrigger -Daily -At 9am
Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "TareaProgramada" -Description "Comprobación de valor"

#---------------------------------------------------------------
#Buscar un fichero
#---------------------------------------------------------------
Get-ChildItem

#---------------------------------------------------------------
#Buscar ficheros creados en los últimos 30 minutos
#---------------------------------------------------------------
Get-ChildItem | Where-Object LastWriteTime -gt (Get-Date).AddMinutes(-30)

#---------------------------------------------------------------
#Alias de Get-ChildItem
#---------------------------------------------------------------
dir
ls

#---------------------------------------------------------------
#Alias de Get-Process
#---------------------------------------------------------------
ps
gps

#---------------------------------------------------------------
#Alias de Set-Location
#---------------------------------------------------------------
cd

#---------------------------------------------------------------
#¿Qué hacen los siguientes scripts?
#---------------------------------------------------------------
$kb=Read-Host ‘NúmeroActualización’
((Get-HotFix).hotfixid | Select-String $kb)
#---------------------------------------------------------------
 (Get-HotFix).Description | Group-Object
#---------------------------------------------------------------
 ((Get-WmiObject -Class Win32_Product).name).count
#---------------------------------------------------------------
if(((Get-WmiObject -Class Win32_Product).name) | Select-String "Gimp"){"Instalado"}
#---------------------------------------------------------------
Get-Process -Name (Read-Host 'N') -Module
#---------------------------------------------------------------
Get-Process | Select-Object ProcessName | Select-String "svchost"
#---------------------------------------------------------------
