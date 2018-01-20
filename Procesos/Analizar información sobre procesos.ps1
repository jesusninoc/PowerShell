#Todos los procesos
ps
#Todas las propiedades del proceso
ps | select *
#Nombre de procesos que se ejecutan
ps | select Name
#Fabricante procesos
ps | select Name,Company

#Todas las propiedades del proceso concreto
ps audiodg | select *
#Todas las propiedades del proceso utilizando WMI
(Get-WmiObject win32_process) | Where-Object processName -eq audiodg.exe

#Ruta de los procesos que se están ejecutando
ps | select Name, Path
#Ruta de los procesos que se están ejecutando utilizando WMI
(Get-WmiObject win32_process) | select Name,Path

#Buscar proceso en toda la unidad c:\
ls c:\ -name audiodg.exe -Recurse
#Buscar en carpeta por defecto, solo en esa carpeta y obtener información
ls (ls C:\Windows\System32 -name audiodg.exe -Recurse) | Select *
#Buscar en carpeta por defecto, solo en esa carpeta y obtener información (con formato)
ls (ls C:\Windows\System32 -name audiodg.exe -Recurse) | Select * | Format-Custom
#Buscar en carpeta por defecto, solo en esa carpeta y mostrar solo información sobre Version (con formato)
ls (ls C:\Windows\System32 -name audiodg.exe -Recurse) | Select VersionInfo | Format-Custom
ps | select *
(Get-WmiObject win32_process)
#Descripción de todos los procesos
(ps) | %{if($_.path){Get-ChildItem $_.path | select VersionInfo | Format-Custom}}
#Información sobre la ruta de los procesos
(ps) | %{if($_.path){(Get-ChildItem $_.path | select VersionInfo)}}
#Obtener la descriptión de la ruta de los procesos
(ps) | %{
if($_.path)
{
$_.name;(Get-ChildItem $_.path).VersionInfo | Select 'FileDescription'
}
}

#Módulos que se ejecutan en los procesos
ps -Module
#Información sobre la ruta de los módulos de los procesos
ls (ps -Module | Select-Object Filename).Filename | Select VersionInfo | Format-Custom

#Dónde se conectan los procesos
netstat -ano

#Preguntar en Internet qué hacen los procesos
