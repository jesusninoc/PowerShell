#Agrupa actualizaciones por descripción
Get-HotFix | Group-Object Description
(Get-HotFix).Description | Group-Object

#Agrupa programas instalados por vendedor
(Get-WmiObject -Class Win32_Product).vendor | Group-Objec

#Indica si está instalado o no Microsoft Office
if(((Get-WmiObject -Class Win32_Product).name) | Select-String "Microsoft Office"){"Instalado"}

#Dime el número total de programas y actualizaciones instaladas en el sistema
((Get-HotFix).Description).count + ((Get-WmiObject -Class Win32_Product).name).count


#Ejercicio A
#Listar por nombre las actualizaciones
$actualizaciones=(Get-HotFix).HotFixID

#Listar por nombre los programas instalados
$instalados=((Get-WmiObject -Class Win32_Product).name)

#Listar por nombre los programas que se ejecutan
$programas=(Get-Process).name

#Guardar todos los listados en un fichero
$actualizaciones,$instalados,$programas | Out-File D:\power\datosprogramas.txt


#Ejercicio B
#Indicar qué programas que están instalados o ejecutados están relacionados con atualizaciones (buscar en Internet)
(Get-Process).name
$actualizaciones=(Get-HotFix).HotFixID
