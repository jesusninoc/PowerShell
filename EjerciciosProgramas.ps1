#Listar programas instalados
(Get-WmiObject -Class Win32_Product).name

#Número de programas instalados (count)
((Get-WmiObject -Class Win32_Product).name).count

#Mostrar programas instalados por familia (forma split)
((Get-WmiObject -Class Win32_Product).name) | %{$_.split(' ')[0]}

#Agrupar por familia los programas instalados (forma split)
((Get-WmiObject -Class Win32_Product).name) | %{$_.split(' ')[0]} | Group-Object

#Recorrer todos los programas instalados (foreach)
(Get-WmiObject -Class Win32_Product).name | %{$_}

#Indicar si un programa se ha instalado o no (if)
if(((Get-WmiObject -Class Win32_Product).name) | Select-String "VMware"){"Instalado"}

#Indicar cuántos programas hay por familia (sin split)
((Get-WmiObject -Class Win32_Product).vendor | Group-Object)

#Indicar si un programa se ha instalado o no (sin if)
((Get-WmiObject -Class Win32_Product).vendor) | Select-String 'Microsoft Corporation'
(((Get-WmiObject -Class Win32_Product).vendor) | Select-String 'Microsoft Corporation').count
((Get-WmiObject -Class Win32_Product).vendor | Group-Object)
((Get-WmiObject -Class Win32_Product).vendor | Group-Object).Name | Select-String 'Microsoft Corporation'

#Crear una función que indique si se ha instalado o no un programa (function)
function ProgramaInstalado($programa)
{
if(((Get-WmiObject -Class Win32_Product).name) | Select-String $programa){"Instalado"}
}
ProgramaInstalado VMware Player

#¿Qué antivirus utilizamos?
((Get-WmiObject -Class Win32_Product).name) | Select-String 'Antivirus'

#Buscar en el registro información sobre programas
$name='Google'
$producto=(Get-WmiObject -Class Win32_Product)
foreach($uno in $producto)
{
if($uno.name -match $name)
{
$valor=$uno.IdentifyingNumber
$valor=$valor.replace('{','')
$valor=$valor.replace('}','')
}
}
Get-ChildItem hklm:\ -rec -ea SilentlyContinue | % {
if($_ -match $valor){$_}
}
