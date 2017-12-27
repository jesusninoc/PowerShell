#------------------------------------------
#Introducción a la ofuscación en PowerShell
#------------------------------------------
#Ejecutar el cmdlet Invoke-WebRequest ofuscado mediante la expresión invertida

#Invertir el contenido de la variable que contiene la expresión que se va a ejecutar
$var='((Get-Command I*-W*t).name + " https://www.jesusninoc.com")'
$varinvertida=$var[$var.Length..0] -join ""
$varinvertida

#Invertir el contenido de la variable invertida que contiene la expresión que se va a ejecutar
$varinvertida=')"moc.coninsusej.www//:sptth " + eman.)t*W-*I dnammoC-teG(('
$var=$varinvertida[$varinvertida.Length..0] -join ""
$var

#Invocar la expresión invertida que permite ejecutar el cmdlet obtenido con Get-Command (utilizando una variable con el contenido invertido)
$varinvertida=')"moc.coninsusej.www//:sptth " + eman.)t*W-*I dnammoC-teG(('
Invoke-Expression (Invoke-Expression ($varinvertida[$varinvertida.Length..0] -join ""))

#Otra forma de ejecutar la expresión invertida
$varinvertida=')"moc.coninsusej.www//:sptth " + eman.)t*W-*I dnammoC-teG(('
($varinvertida[$varinvertida.Length..0] -join "" | iex) | iex
