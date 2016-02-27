#Ejemplo 1
foreach($val in Get-Content D:\usergroup.txt)
{
$val
}

#Ejemplo 2
foreach($val in Get-Content D:\usergroup.txt)
{
$val.Split(",")
}

#Ejemplo 3
foreach($val in Get-Content D:\usergroup.txt)
{
$val.Split(",")[0]
}

#Ejemplo 4
foreach($val in Get-Content D:\usergroup.txt)
{
switch($val.Split(",")[0])
{
'u'{"user"}
'g'{"group"}
'a'{"add user into"}
}
}

#Ejemplo 5
foreach($val in Get-Content D:\usergroup.txt)
{
switch($val.Split(",")[0])
{
'u'{Write-Host "Create user"}
'g'{Write-Host "Create group"}
'a'{Write-Host "Add user into a group"}
}
}

#Ejemplo 6
foreach($val in Get-Content D:\usergroup.txt)
{
$sli=$val.Split(",")
switch($sli[0])
{
'u'{Write-Host "Create user, directory and share";net user $sli[1] /add $sli[2];[string]$ruta="d:\"+$sli[1];New-Item $ruta -ItemType directory;[string]$aux=$sli[1];net share $aux=$ruta}
'g'{Write-Host "Create group";net localgroup $sli[1] /add}
'a'{Write-Host "Add user into a group";net localgroup $sli[2] $sli[1] /add}
}
}
