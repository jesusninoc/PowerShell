#---------------------------------------------------------------------------------------------------------
#Listar todas las dll que se están ejecutando en un momento determinado
Get-Process -Module
#En un momento, pon fecha
Get-Date
#Guardarlo en un fichero

#---------------------------------------------------------------------------------------------------------
#Abrir Notepad y listar las dll que están cargadas cuando se ejecuta, ver la ruta dónde se ejecutan
Get-Process -Name notepad -Module

#---------------------------------------------------------------------------------------------------------
#Pedir al usuario un nombre de proceso y listar las dll
Get-Process -Name (Read-Host 'Nombre de proceso del que listar las dll') -Module

#---------------------------------------------------------------------------------------------------------
#Listar servicios
Get-Service

#---------------------------------------------------------------------------------------------------------
#Contar servicios
(Get-Service).count

#---------------------------------------------------------------------------------------------------------
#Información sobre procesos
Get-Process | Select-Object ProcessName | Select-String "svchost"
Get-Process | Select-String "svchost" | Select-Object ProcessName
(Get-Process).ProcessName | Select-String "svchost"
Get-Process | Select-Object ProcessName | Select-String "svchost" | Group-Object
Get-Process | Select-Object ProcessName | Select-String "svchost" | Group-Object ProcessName
Get-Process | Select-Object ProcessName | Group-Object | Select-String "svchost" #No funciona la agrupación
Get-Process | Select-Object ProcessName | Group-Object ProcessName | Select-String "svchost"

#---------------------------------------------------------------------------------------------------------
#Obtener información de un proceso concreto
#Notepad
Get-Process -Name notepad
Get-Process -Name notepad -Module
(Get-Process -Name notepad).ProcessName
Get-Process -Name notepad | Select-Object ProcessName

#---------------------------------------------------------------------------------------------------------
#Obtener información de un proceso concreto
#Sublime
Get-Process -Name sublime_text -Module

#---------------------------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------------------------
#Qué relación con los ficheros que están en la carpeta del programa
#Todos los ficheros que están dentro de la carpeta valen para algo?, ayuda en modules y dlls
#Comparar los ficheros que se están ejecutados y los que están en la carpeta
Get-Process -Name sublime_text | Select-Object Path

(Get-Process -Name sublime_text | Select-Object Path)
(Get-Process -Name sublime_text).Path

$ruta=(Get-Process -Name sublime_text).Path
[String]$rutapartir=$ruta
$rutapartida=$rutapartir.split('\')[($rutapartir.split('\').Length)-1]
$rutadondemeterse=$rutapartir.replace($rutapartida,'')
ls $rutadondemeterse

#---------------------------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------------------------
#Listados mal realizados
ls (Get-Process -Name sublime_text | Select-Object Path)
Get-Process -Name sublime_text -Module
ls (Get-Process -Name sublime_text -Module)

#---------------------------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------------------------
#Sacar las dll y realizar función hash
Get-Process -Module | Select-Object FileName | %{Get-FileHash $_.FileName}
Get-Process -Name notepad -Module | Select-Object FileName | %{Get-FileHash $_.FileName}

#---------------------------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------------------------
#Solución no posible porque no se puede iniciar algo que no se sabe la ruta
$positivo=Get-Process (Read-Host 'Nombre de proceso del que listar las dll')
if($positivo){
$positivo | Stop-Process
}
else{
$positivo
Start-Process $positivo
}

#---------------------------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------------------------
#Solución posible porque no hace falta saber la ruta directamente
$procesobuscar=(Read-Host 'Nombre de proceso del que listar las dll')
$positivos=(Get-Process | Select-Object Name | Select-String $procesobuscar).count
if($positivos){
Stop-Process -Name $procesobuscar
}
else{
Start-Process $procesobuscar
}

#---------------------------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------------------------
#Crear función para pedir nombre de proceso
function buscarproceso($nombre)
{
$positivos=(Get-Process | Select-Object Name | Select-String $nombre).count
if($positivos){
Stop-Process -Name $nombre
}
else{
Start-Process $nombre
}
}

buscarproceso notepad
