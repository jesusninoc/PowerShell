-Funciones de un sistema operativo.
--Controlar y gestionar el uso del hardware del ordenador: CPU, dispositivos de E/S, Memoria principal, tarjetas gráficas y el resto de periféricos.
--------------------------------------------------------------------------------------------------------
Get-WmiObject win32_processor | Select-Object LoadPercentage
--------------------------------------------------------------------------------------------------------
Get-WmiObject -query "select NumberOfCores from Win32_Processor"
--------------------------------------------------------------------------------------------------------
Get-WmiObject -Class Win32_Processor | Select-Object NumberOfCores
--------------------------------------------------------------------------------------------------------
Get-WmiObject -query “select Name,Status from Win32_PnPEntity”
Get-WmiObject -query “select * from Win32_PnPEntity” | Select-Object Name, Status
--------------------------------------------------------------------------------------------------------
Get-WmiObject -query "select * from Win32_PnPEntity where caption like '%cam%'"
Get-WmiObject Win32_PnPEntity | where {$_.caption -match 'webcam'}
--------------------------------------------------------------------------------------------------------
gwmi Win32_USBControllerDevice |%{[wmi]($_.Dependent)} | Sort Manufacturer,Description,DeviceID | Ft -GroupBy Manufacturer Description,Service,DeviceID
--------------------------------------------------------------------------------------------------------
Get-WmiObject -Class win32_battery
--------------------------------------------------------------------------------------------------------
--Administrar la ejecución de los procesos. Planificación.
--------------------------------------------------------------------------------------------------------
Get-Process
gps
ps
Get-WmiObject -Class win32_process
--------------------------------------------------------------------------------------------------------
Stop-Process
--------------------------------------------------------------------------------------------------------
Get-WmiObject -Class Win32_Thread
--------------------------------------------------------------------------------------------------------
Get-Service
Get-WmiObject -Class Win32_Service
Get-WmiObject -query "select * from win32_service"
--------------------------------------------------------------------------------------------------------
--Controlar el acceso de los programas o los usuarios a los recursos del sistema.
--------------------------------------------------------------------------------------------------------
Get-WmiObject win32_process |% {Write-Host $_.processname $_.getowner().user}
--------------------------------------------------------------------------------------------------------
([System.Security.Principal.WindowsIdentity]::GetCurrent()).name
--------------------------------------------------------------------------------------------------------
-Consideraciones previas a la instalación de sistemas operativos libres y propietarios.
--Particionado del disco duro.
--------------------------------------------------------------------------------------------------------
df -h
--------------------------------------------------------------------------------------------------------
sudo fdisk -l
--------------------------------------------------------------------------------------------------------
sudo blkid
--------------------------------------------------------------------------------------------------------
sudo mkdir mount_name
--------------------------------------------------------------------------------------------------------
sudo mount -t auto -v /dev/sdb1 /mnt/mount_name
--------------------------------------------------------------------------------------------------------
-Instalación/desinstalación de aplicaciones. Requisitos hardware y software, versiones y licencias.
--------------------------------------------------------------------------------------------------------
(Get-WmiObject -Class Win32_Product).version
(Get-WmiObject -Class Win32_Product) | Select-Object name,version
--------------------------------------------------------------------------------------------------------
((Get-WmiObject -Class Win32_Product).name) | Select-String 'Antivirus'
--------------------------------------------------------------------------------------------------------
Install-Package filezilla
--------------------------------------------------------------------------------------------------------
-Actualización de sistemas operativos y aplicaciones.
--------------------------------------------------------------------------------------------------------
$kb=Read-Host ‘NúmeroActualización’
((Get-HotFix).hotfixid | Select-String $kb)
--------------------------------------------------------------------------------------------------------
-Registros (logs) del sistema.
--------------------------------------------------------------------------------------------------------
Get-EventLog
--------------------------------------------------------------------------------------------------------
--Formato de los registros: fuente/origen, prioridades (informativos, advertencias, errores, etc.)
--Herramientas para su monitorización en sistemas libres y propietarios.
--Gestión: Aplicar filtros, asociar tareas en respuesta a ciertos eventos, etc.
--------------------------------------------------------------------------------------------------------
Get-EventLog Application | Where-Object Message -Match "192.168"
--------------------------------------------------------------------------------------------------------
Get-EventLog Application | Where-Object Message -Match "gupdate" | Select-Object Message | Format-Custom
--------------------------------------------------------------------------------------------------------
-Administración de usuarios y grupos locales.
--------------------------------------------------------------------------------------------------------
net user
Get-WmiObject -Class Win32_Account
--------------------------------------------------------------------------------------------------------
--Crear, modificar y editar usuarios y grupos. Añadir usuarios a los grupos.
--Cambiar la ruta del perfil del usuario, scripts de inicio y carpeta particular.
-Usuarios y grupos predeterminados.
--------------------------------------------------------------------------------------------------------
net localgroup
Get-WmiObject -Class Win32_Group
--------------------------------------------------------------------------------------------------------
-Seguridad de cuentas de usuario.
-Seguridad de las contraseñas:
--Algoritmos para la elección de contraseñas seguras.
--------------------------------------------------------------------------------------------------------
net user $partiruserandpass[0] /add $partiruserandpass[1]
--------------------------------------------------------------------------------------------------------
-Configuración del protocolo TCP/IP en un cliente de red.
--------------------------------------------------------------------------------------------------------
netsh
Get-NetUDPEndpoint
Get-NetTCPConnection
--------------------------------------------------------------------------------------------------------
-Configuración de la resolución de nombres.
--------------------------------------------------------------------------------------------------------
Resolve-DnsName
--------------------------------------------------------------------------------------------------------
-Ficheros de configuración de red.
--------------------------------------------------------------------------------------------------------
Get-NetAdapterHardwareInfo
Get-NetAdapter -Physical
Get-NetNeighbor
--------------------------------------------------------------------------------------------------------
-Gestión de sistemas de archivos mediante comandos y entornos gráficos.
--------------------------------------------------------------------------------------------------------
#Crear o modificar un archivo
New-Item
#Crear un directorio
New-Item
#Ver el contenido de un archivo
Get-Content
#Acceder al contenido de un directorio
Set-Location
#Listar el contenido de un directorio
Get-ChildItem
#Eliminar un archivo
Remove-Item
#Eliminar un directorio
Remove-Item
#Copiar un archivo o un directorio
Copy-Item
#Mover un archivo o un directorio
Move-Item
#Renombrar un archivo o un directorio
Rename-Item
#Comprimir y descomprimir un archivo o un directorio
Compress-Archive
Expand-Archive
#Imprimir
Out-Printer
#Ver carpetas compartidas
Get-SmbShare
Get-WmiObject -Class Win32_Share
#Compartir carpeta
New-SmbShare
#Ver y asignar permisos
Get-Acl
Set-Acl
New-Object -TypeName System.Security.AccessControl.FileSystemAccessRule
--------------------------------------------------------------------------------------------------------
-Gestión de la información del sistema. Rendimiento. Estadísticas
--------------------------------------------------------------------------------------------------------
Get-Process
gps
ps
Get-WmiObject -Class win32_process
--------------------------------------------------------------------------------------------------------
Stop-Process
--------------------------------------------------------------------------------------------------------
Get-WmiObject -Class Win32_Thread
--------------------------------------------------------------------------------------------------------
Get-Service
Get-WmiObject -Class Win32_Service
Get-WmiObject -query "select * from win32_service"
--------------------------------------------------------------------------------------------------------
Get-EventLog
--------------------------------------------------------------------------------------------------------
-Herramientas de administración de discos. Particiones y volúmenes. Desfragmentación y chequeo.
--------------------------------------------------------------------------------------------------------
New-VHD –Path d:\disc.vhdx –SizeBytes 1GB
--------------------------------------------------------------------------------------------------------
-Permisos locales de acceso a ficheros y directorios.
--------------------------------------------------------------------------------------------------------
Get-Acl d: | Select-Object Access
--------------------------------------------------------------------------------------------------------
-Tipos de copias de seguridad:
--Locales y Remotas.
-Planes de copias de seguridad y restablecimiento.
-Compresión de datos.
--------------------------------------------------------------------------------------------------------
#Comprimir
Compress-Archive -LiteralPath C:\powershell\example.txt –CompressionLevel Optimal -DestinationPath C:\powershell\comprimido.zip
#Actualizar un archivo comprimido
Compress-Archive -LiteralPath C:\powershell\example2.txt -Update -DestinationPath C:\powershell\comprimido.zip
#Descomprimir
Expand-Archive -LiteralPath C:\powershell\comprimido.zip -DestinationPath C:\powershell\descomprimir
--------------------------------------------------------------------------------------------------------
-Permisos de red. Permisos locales. Herencia. Permisos efectivos.
--------------------------------------------------------------------------------------------------------
New-SmbShare -Name fso -Path F:\power –FullAccess administrador -ReadAccess Everyone
--------------------------------------------------------------------------------------------------------
-Herramientas de monitorización en tiempo real.
-Herramientas de monitorización continuada.
-Herramientas de análisis del rendimiento.
-Tipos de sucesos: sucesos del sistema, sucesos de seguridad, sucesos de aplicaciones, etc.
-Registros de sucesos.
--------------------------------------------------------------------------------------------------------
Get-EventLog Application | Where-Object Message -Match "192.168"
--------------------------------------------------------------------------------------------------------
Get-EventLog Application | Where-Object Message -Match "gupdate" | Select-Object Message | Format-Custom
--------------------------------------------------------------------------------------------------------
-Monitorización de sucesos.
-Gestión de aplicaciones, procesos y subprocesos.
-Monitorización de aplicaciones y procesos.
