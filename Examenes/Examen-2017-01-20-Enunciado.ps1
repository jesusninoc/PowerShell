#############################################################################################################
#¿Qué hacen los siguientes scripts y para qué sirven?
#############################################################################################################
Set-Alias -Name Eliminar New-Item
#############################################################################################################
Get-WmiObject -Class Win32_Service | %{
Write-Host $_.Name,$_.ProcessID,(Get-Process -Id $_.ProcessID).name
}
#############################################################################################################
"notepad" > fichero.txt; saps(gc (ls ./fichero.txt))
#############################################################################################################
ni (Get-Date).tostring("dd-MM-yyyy-hh-mm-ss") -Value ([String](ps).Name)
#############################################################################################################
ls -Recurse | Select-String "hola"
#############################################################################################################
mkdir (gc .\fichero.txt).Split(" ") -WhatIf
#############################################################################################################
-(365/2)..(365/2) | % {mkdir (Get-Date).AddDays($_).ToString("yyyy/MM/dd") -WhatIf}
#############################################################################################################
ni (gc .\fichero.txt).Split(" ") -WhatIf
#############################################################################################################
(Get-Date).AddDays(-1).ToString("ddMMyyyy")
#############################################################################################################
Get-Disk
New-Partition -DiskNumber 1 -UseMaximumSize -AssignDriveLetter
Format-Volume -DriveLetter f
#############################################################################################################
New-VHD –Path d:\disc.vhdx –SizeBytes 1GB
Mount-VHD –Path f:\disco.vhdx
#############################################################################################################
function id{
gps | select id | %{
mkdir $_.id -WhatIf
ni -Path $_.id -name ($_.id) -Value $_.Name -ItemType file -WhatIf
}
}

function nombre{ 
[char]'a'..[char]'z' | %{mkdir ([char]$_) -WhatIf}
gps | select name | %{
ni -Path $_.name[0] -name ($_.Name) -Value $_.Name -ItemType file -WhatIf
}
}

$operacion=Read-Host "Operación que quiera realizar i (id) o n (name):"
if ($operacion -eq 'i')
{
"operación id"
id
}
else
{
"operación name"
nombre
}
#############################################################################################################
gc .\asignaturas.txt | %{mkdir $_ -WhatIf; Set-Location $_; mkdir 1e,2e,3e -WhatIf}
gc .\notas.txt | %{ni -Path $_.split(',')[0] -Name nota.txt -Value $_.split(',')[1] -WhatIf}
#############################################################################################################
