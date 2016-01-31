#Función para mostrar todos los procesos
function Procesos
{
Get-Process
}
Procesos


#Función para mostrar los X primeros procesos
function ProcesosPrimeros($numero)
{
Get-Process | Select-Object -First $numero
}
ProcesosPrimeros 5


#Función para mostrar los X últimos procesos
function ProcesosUltimos($numero)
{
Get-Process | Select-Object -Last $numero
}
ProcesosUltimos 5

#Servicio-Proceso
Get-WmiObject -Class Win32_Service | Select-Object Name,ProcessID


#Función para mostrar los X procesos cuyo consumo (el parámetro que quieras utilizar) sea mayor que el valor que quieras monitorizar
function ProcesosConsumo([String]$parametro,[Int]$valor,[Int]$numerovalores)
{
$parametro
$valor
$numerovalores
Get-Process | Select-Object -First $numerovalores | Where-Object $parametro -GT $valor
}
ProcesosConsumo CPU 30 5


#Mostrar los procesos que se están ejecutando en relación con los servicios
(Get-WmiObject -Class Win32_Service | Where-Object State -EQ ‘Running’) | %{
Write-Host $_.Name,$_.ProcessId,$_.State,(Get-Process -Id $_.ProcessId).Name
}


#Identificar servicios mediante identificadores de procesos
Get-WmiObject -Class Win32_Service | Select-Object Name,ProcessID


#Listar los hilos de un proceso
$name = ‘notepad’
$contador=0
foreach($procesoid in (Get-Process -Name $name).Id)
{
$contador+=((Get-WmiObject -Class Win32_Thread).where{$_.ProcessHandle -match $procesoid}).count
Write-Host ‘PID:’ $procesoid ‘del proceso’ $name ‘tiene’ $contador ‘hilos’
$contador=0
}
