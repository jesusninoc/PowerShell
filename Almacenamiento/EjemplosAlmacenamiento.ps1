####################################################
#Listar particiones
####################################################
Get-Partition | Select-Object DriveLetter
(Get-Partition).DriveLetter

####################################################
#DeviceID, Free Space, Size of Partition
####################################################
Get-WmiObject -Class win32_logicalDisk

####################################################
#Comprimir
####################################################
Compress-Archive -LiteralPath C:\powershell\example.txt –CompressionLevel Optimal -DestinationPath C:\powershell\comprimido.zip

####################################################
#Descomprimir
####################################################
Expand-Archive -LiteralPath C:\powershell\comprimido.zip -DestinationPath C:\powershell\descomprimir

####################################################
#Añadir archivo al fichero comprimido
####################################################
Compress-Archive -LiteralPath C:\powershell\example2.txt -Update -DestinationPath C:\powershell\comprimido.zip

####################################################
#Comprobar espacio en unidades
####################################################
get-wmiobject win32_volume -computername . | select name, @{expression={$_.capacity/1GB}}, @{expression={$_.freespace/1GB}}, @{name=”% Free”;expression={$_.freespace/$_.capacity*100}}

####################################################
#Capacity, Serial Number of Drive and other info of the Hard-disk
####################################################
Get-WmiObject -Class win32_DiskDrive
