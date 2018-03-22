#------------------------------------------
#Introducción a la ofuscación en PowerShell
#------------------------------------------
#Invocar la expresión que permite ejecutar el cmdlet obtenido mediante la lectura de nombres de directorios

#Crear los directorios con información sobre el cmdlet
mkdir leer; Set-Location leer
New-Item 1i
New-Item 2w
New-Item 3r

#Leer la información de los directorios creados anteriormente
ls * | %{($_.Name)[1]}

#Leer la información de los directorios en una línea
(ls * | %{($_.Name)[1]}) -join ""

#Leer la información de los directorios y utilizar el cmdlet que se obtiene
$var=" https://www.jesusninoc.com"
$var2=((ls * | %{($_.Name)[1]}) -join "") + $var
Invoke-Expression $var2
