#Listar programas instalados
Get-Package | Select-Object name

#Número de programas instalados (count)
(Get-Package | Select-Object name).count

#Selecciona el nombre y versión de los programas instalados
Get-Package | Select-Object name, version

#Dime la versión de los programas instalados
(Get-Package).version

#Agrupa los programas cuyo nombre sea "Chrome"
Get-Package | Select-Object name | Select-String "Chrome" | Group-Object

#Dime si está instalado Chrome
if(((Get-Package).name) | Select-String "Chrome"){"Instalado"}

#Crear una función que indique si se ha instalado o no un programa (function)
function ProgramaInstalado($programa)
{
if(((Get-Package).name) | Select-String $programa){"Instalado"}
}
ProgramaInstalado Chrome
