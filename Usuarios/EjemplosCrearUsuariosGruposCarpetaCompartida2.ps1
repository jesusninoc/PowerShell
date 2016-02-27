-------------------
#1. Ejecutar bucle y partir contenido
foreach($val in Get-Content "C:\user.txt")
{
$sli=$val.Split(",")
}

------------------
#2. Los valores que sean dos se muestra el mensaje de crear grupo
foreach($val in Get-Content "C:\user.txt")
{
$sli=$val.Split(",")
$sli
if($sli.Length -eq 2)
{
	Write-Host "Crear grupo"
}
}

-----------------
#3. Colocamos la posibilidad de error cuando no es 2
foreach($val in Get-Content C:\user.txt)
{
$sli=$val.Split(",")
if($sli.Length -eq 2)
{
	$sli
	Write-Host "Crear grupo"
}
else
{
Write-Host "Error"
}
}

-----------------
#4. Tenemos un nuevo caso, cuando son 4 valores
foreach($val in Get-Content C:\user.txt)
{
$sli=$val.Split(",")
if($sli.Length -eq 2)
{
Write-Host "Crear grupo"
}
elseif($sli.Length -eq 4)
{
Write-Host "Crear usuario"
}
else
{
Write-Host "Error"
}
}

----------------
#5. Crear el grupo, caso dos valores
foreach($val in Get-Content "C:\user.txt")
{
$sli=$val.Split(",")
$sli
if($sli.Length -eq 2)
{
	Write-Host "Crear grupo"
	#Crear grupo para el valor $sli[1]
}
}

----------------
#6. Crear usuario, caso cuatro valores
foreach($val in Get-Content C:\user.txt)
{
$sli=$val.Split(",")
if($sli.Length -eq 2)
{
	Write-Host "Crear grupo"
	#Crear grupo para el valor $sli[1]
}
elseif($sli.Length -eq 4)
{
	Write-Host "Crear usuario"
	#Crear usuario para el valor $sli[1], con los valores $sli[2] (password que se tiene que utilizar)
}
else
{
Write-Host "Error"
}
}

----------------
#7. Añadir usuario al grupo, pero el grupo debe existir
foreach($val in Get-Content C:\user.txt)
{
$sli=$val.Split(",")
if($sli.Length -eq 2)
{
	Write-Host "Crear grupo"
	#Crear grupo para el valor $sli[1]
}
elseif($sli.Length -eq 4)
{
	Write-Host "Crear usuario"
	#Crear usuario para el valor $sli[1], con los valores $sli[2]
	#Añadir usuario al grupo, el grupo debe existir, utilizar $sli[3] (nombre del grupo)
}
else
{
Write-Host "Error"
}
}

--------------
#8. Comandos añadidos para añadir usuario al grupo, pero el grupo debe existir
foreach($val in Get-Content C:\user.txt)
{
$sli=$val.Split(",")
if($sli.Length -eq 2)
{
	Write-Host "Crear grupo"
	#Crear grupo para el valor $sli[1]
    net localgroup $sli[1] /add
}
elseif($sli.Length -eq 4)
{
	Write-Host "Crear usuario"
    net user $sli[1] /add $sli[2]
    net localgroup $sli[3] $sli[1] /add
	#Crear usuario para el valor $sli[1], con los valores $sli[2]
	#Añadir usuario al grupo, el grupo debe existir, utilizar $sli[3] (nombre del grupo)
}
else
{
Write-Host "Error"
}
}

-----------
#9. Compartir
foreach($val in Get-Content C:\user.txt)
{
$sli=$val.Split(",")
if($sli.Length -eq 2)
{
    Write-Host "Crear grupo"
    #Crear grupo para el valor $sli[1]
    net localgroup $sli[1] /add
}
elseif($sli.Length -eq 4)
{
    Write-Host "Crear usuario"
    #Crear usuario para el valor $sli[1], con los valores $sli[2]
    #Añadir usuario al grupo, el grupo debe existir, utilizar $sli[3] (nombre del grupo)
    net user $sli[1] /add $sli[2]
    net localgroup $sli[3] $sli[1] /add
    #Add directory and share
    $ruta="C:\Users\administrador\"+$sli[1]
    New-Item $ruta -ItemType directory
    net share $sli[1]=$ruta

}
else
{
Write-Host "Error"
}
}

----------
#10. Read file, create users and groups, add a user in a group, create a directory for each user and share
#Create file. 
#Content:
#g,grupo
#u,pepe,pass,grupo

foreach($val in Get-Content C:\user.txt)
{
$sli=$val.Split(",")
if($sli.Length -eq 2)
{
    Write-Host "Create gruop"
    #Create a group $sli[1]
    net localgroup $sli[1] /add
}
elseif($sli.Length -eq 4)
{
    Write-Host "Create user"
    #Crete user $sli[1], value $sli[2]
    #Add user in a group $sli[3]
    net user $sli[1] /add $sli[2]
    net localgroup $sli[3] $sli[1] /add
    #Add directory and share
    [string]$ruta="C:\"+$sli[1]
    New-Item $ruta -ItemType directory
    #Command use string parameters
    [string]$aux=$sli[1]
    net share $aux=$ruta
}
else
{
Write-Host "Error"
}
}
