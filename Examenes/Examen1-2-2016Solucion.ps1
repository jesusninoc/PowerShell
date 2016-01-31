#----------
#PowerShell
#----------
#Almacenar en un fichero información sobre los programas instalados y las actualizaciones.
#Guardar dicha información en una carpeta con la fecha actual.
$instalados=((Get-WmiObject -Class Win32_Product).name)
$actualizaciones=(Get-HotFix).HotFixID
$directoriofecha=(Get-Date).tostring("dd-MM-yyyy-hh-mm-ss")
New-Item -itemType Directory -Path D:\power\ -Name $directoriofecha
$actualizaciones,$instalados | Out-File D:\power\$directoriofecha\datosprogramas.txt

#Listar procesos, crear carpeta para cada uno y dentro de la carpeta meter un fichero con el hash del proceso (necesario saber la ruta absoluta del programa).
New-Item -itemType Directory -Path D:\power\ -Name procesos
Get-Process | Select-Object Name, Path | %{
New-Item -itemType Directory -Path D:\power\procesos -Name $_.Name 
Set-Location D:\power\procesos
$fichero=$_.Name + ".txt"
New-Item -itemType File -Path $_.Name -Name $fichero -Value (Get-FileHash $_.Path -Algorithm SHA1)
}

#Si el nombre de un proceso es explorer almacenar información completa sobre dicho proceso ( | select *) y realizar un hash, almacenar el hash.
New-Item -itemType Directory -Path D:\power\ -Name procesos
Get-Process | Select-Object Name, Path | Where-Object Name -EQ "Explorer" | %{
New-Item -itemType Directory -Path D:\power\procesos -Name $_.Name 
Set-Location D:\power\procesos
$fichero=$_.Name + ".txt"
New-Item -itemType File -Path $_.Name -Name $fichero -Value (Get-FileHash $_.Path -Algorithm SHA1)
}
