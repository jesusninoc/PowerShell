#------------------------------------------
#Introducción a la ofuscación en PowerShell
#------------------------------------------
#Ejecutar el cmdlet Invoke-WebRequest ofuscado

#Obtener los cmdlets que contienen la expresión I*-W*t
Get-Command I*-W*t

#Obtener el nombre del cmdlet que contiene la expresión I*-W*t
(Get-Command I*-W*t).Name

#Invocar la expresión que permite ejecutar el cmdlet obtenido con Get-Command (utilizando variables)
$var=" https://www.jesusninoc.com"
$var2=(Get-Command I*-W*t).name + $var
Invoke-Expression $var2

#Invocar la expresión que permite ejecutar el cmdlet obtenido con Get-Command (utilizando una variable)
$var2=(Get-Command I*-W*t).name + " https://www.jesusninoc.com"
Invoke-Expression $var2

#Invocar la expresión que permite ejecutar el cmdlet obtenido con Get-Command (sin utilizar variables)
Invoke-Expression ((Get-Command I*-W*t).name + " https://www.jesusninoc.com")

#Otra forma de ejecutar la expresión mediante &
& (Get-Command I*-W*t).Name http://www.jesusninoc.com

#Otra forma de ejecutar la expresión mediante .
. (Get-Command I*-W*t).Name http://www.jesusninoc.com
