#Listar procesos
Get-Process
#Listar nombre de los procesos
Get-Process | Select-Object Name
(Get-Process).Name

#Crear un directorio
New-Item procesos -ItemType Directory
#Meterse dentro del directorio
Set-Location procesos
#Crear varios directorios a la vez
New-Item (1..10) -ItemType Directory -WhatIf

#Crear varios directorios cuyo nombre sea el nombre de los procesos que se están ejecutando
ni (gps).name -Force -ItemType Directory -WhatIf
#Añadir a cada directorio creado un fichero con el nombre del proceso y escribir dentro del fichero creado el nombre del proceso
Get-ChildItem * | % {ni -Path ($_.Name) -Name ($_.Name) -Value ($_.Name) -ItemType File}

#Crear un directorio para cada proceso y dentro de cada directorio guardar el nombre del proceso (sobrescribir si existe el directorio)
gps | %{ni ($_.Name) -ItemType Directory -Force}
#Para cada directorio con el nombre del proceso guardar un fichero con información sobre el proceso
gps | %{ni -Path ($_.Name) -Name ($_.Name) -Value ($_ | select CPU,Id) -Force}
#Ver la información guardada el fichero
Get-Content .\powershell_ise\powershell_ise
