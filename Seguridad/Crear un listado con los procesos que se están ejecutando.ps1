#---------------------------------------------------------
#Crear un listado con los procesos que se están ejecutando
#---------------------------------------------------------
#Crear una lista con los procesos que se ejecutan en el sistema operativo y comprobar si aparece uno que no se encuentra en la lista

##############################
#Introducción
##############################
#Listar procesos
Get-Process

#Listar nombre de procesos
Get-Process | Select-Object ProcessName

#Listar nombre de procesos y agruparlos por nombre de proceso
Get-Process | Select-Object ProcessName | Group-Object ProcessName | Select-Object Name

#Contar el número de procesos agrupados por nombre
(Get-Process | Select-Object ProcessName | Group-Object ProcessName | Select-Object Name).count

##############################
#Comparar los dos ficheros creados con los nombres de los procesos y ver qué proceso aparece como diferencia entre los dos ficheros
#Crear un fichero con la hora y fecha en que se ejecuta el listado de procesos
##############################
#Almacenar en el fichero el listado de procesos
$nombre=(Get-Date).tostring("hh-mm-ss-dd-MM-yyyy");$nombre
$procesos=Get-Process | Select-Object ProcessName | Out-File $nombre
#Contar el número de procesos que se guardan en el fichero
(Get-Content $procesos).Length

#Arrancar el proceso notepad para comprobar que se añade un proceso nuevo al listado de procesos
Start-Process notepad
#Esperar a que se arranque notepad
Start-Sleep -Seconds 5

#Crear un fichero con la hora y fecha en que se ejecuta el listado de procesos
$nombre2=(Get-Date).tostring("hh-mm-ss-dd-MM-yyyy");$nombre2
#Almacenar en el fichero el listado de procesos
Get-Process | Select-Object ProcessName | Out-File $nombre2
(Get-Content $nombre2).Length

#Comparar los dos ficheros creados con los nombres de los procesos
Compare-Object -ReferenceObject (Get-Content $nombre) -DifferenceObject (Get-Content $nombre2) | select *

##############################
#Comparar los dos ficheros creados con los nombres de los procesos y ver qué proceso aparece como diferencia entre los dos ficheros
#Crear un fichero con la hora y fecha en que se ejecuta el listado de procesos agrupados
##############################
#Almacenar en el fichero el listado de procesos
$nombre=(Get-Date).tostring("hh-mm-ss-dd-MM-yyyy");$nombre
$procesos=Get-Process | Select-Object ProcessName | Group-Object ProcessName | Select-Object Name | Out-File $nombre
(Get-Content $procesos).Length

#Arrancar el proceso notepad para comprobar que se añade un proceso nuevo al listado de procesos
Start-Process notepad
#Esperar a que se arranque notepad
Start-Sleep -Seconds 5

#Crear un fichero con la hora y fecha en que se ejecuta el listado de procesos
$nombre2=(Get-Date).tostring("hh-mm-ss-dd-MM-yyyy");$nombre2
#Almacenar en el fichero el listado de procesos
Get-Process | Select-Object ProcessName | Group-Object ProcessName | Select-Object Name | Out-File $nombre2
(Get-Content $nombre2).Length

#Comparar los dos ficheros creados con los nombres de los procesos
Compare-Object -ReferenceObject (Get-Content $nombre) -DifferenceObject (Get-Content $nombre2) | select *

##############################
#Listar los procesos en dos momentos distintos, después comprobar que aparece un proceso nuevo y ver el identificador del proceso
##############################
$data=Get-Process
Start-Process notepad
$data2=Get-Process
Compare-Object -ReferenceObject $data -DifferenceObject $data2 -Property ProcessName -PassThru | Sort-Object -Property ProcessName | Select-Object -Property ProcessName, Id, SideIndicator
