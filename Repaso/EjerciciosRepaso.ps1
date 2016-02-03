##Introducción (ejemplos clase 1)

#Variables
#Operaciones aritméticas
#Almacenar y abrir ficheros
#Partir cadenas
#Listar ficheros y directorios
#Sentencias de repetición

##Ejemplo 1
$ficheros=ls
$ficheros

##Ejemplo 2
$listado=ls
foreach($fichero in $listado)
{
$fichero
}

##Ejemplo 3
#Crear ficheros
#fichero1, fichero2, fichero3, fichero4
$listado=gc d:\power\ficheroscrear.txt
foreach($fichero in $listado)
{
New-Item -ItemType file -Path D:\power\$fichero
}

##Ejemplo 4
$listado='1','2','3','4'
foreach($numero in $listado)
{
$numero
}

##Ejemplo 5
$numero=7
$operacion=$numero%2
$operacion

##Ejemplo 6
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

##Ejemplo 7
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

##Ejemplo 8
$listado=ls C:\power
foreach($numero in $listado)
{
$operacion=$numero.name.Split(“.”)[0]%2
if($operacion -eq 0)
{
“par”
}
else
{
“impar”
}
}

##Ejemplo 9.1
$listado=ls C:\power
foreach($numero in $listado)
{
$numero
}

##Ejemplo 9.2
$listado=ls C:\power
foreach($numero in $listado)
{
$operacion=$numero.name
$operacion
}

##Ejemplo 9.3
$listado=ls C:\power
foreach($numero in $listado)
{
$numero
$operacion=$numero.name.Split(“.”)[0]%2
$operacion
}

##Ejemplo 10
$listado=ls C:\power
foreach($numero in $listado)
{
$operacion=$numero.name.Split(“.”)[0]%2
$parte1=$numero.name.Split(“.”)[1]
$parte2=$numero.name.Split(“.”)[2]

if($operacion -eq 0)
{
“par”
}
else
{
“impar”
}
}
