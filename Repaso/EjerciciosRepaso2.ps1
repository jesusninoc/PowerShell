##Introducción (ejemplos clase 2)

#Variables
#Operaciones aritméticas
#Almacenar y abrir ficheros
#Partir cadenas
#Listar ficheros y directorios
#Sentencias de repetición

##Ejemplo 1
$a=1
$a

##Ejemplo 2
$a=1
$a
$letra=’a’
$letra
$frase=’hola’
$frase

##Ejemplo 3
$ipcon=ps
$ipcon

##Ejemplo 4
$listado=ps
foreach($proceso in $listado)
{
$proceso
}

##Ejemplo 5
#Listar procesos guardados en fichero.txt
ps > 'd:\power\ficheroscrear.txt'
$listado=gc d:\power\ficheroscrear.txt
foreach($proceso in $listado)
{
$proceso
}

##Ejemplo 6
$listado='1','2','3','4'
foreach($numero in $listado)
{
$numero
}

##Ejemplo 7
$numero=7
$operacion=$numero%2
$operacion

##Ejemplo 8
$numero=7
$operacion=$numero%2
if($operacion -eq 0)
{
“par”
}
else
{
“impar”
}

##Ejemplo 9
$listado='1','2','3','4'
foreach($numero in $listado)
{
$operacion=$numero%2
if($operacion -eq 0)
{
“par”
}
else
{
“impar”
}
}
