#Listado donde fecha menor que dos días
ls D:\power\ejeclase | select Name,CreationTime | where CreationTime -LT (Get-Date).AddDays(-2)

#Mostrar según listado menor un día última fecha de escritura del fichero
Get-ChildItem | Where-Object {
$_.LastWriteTime -ge (Get-Date).AddDays(-1)
}

#Comparar contenido de dos ficheros
Compare-Object -ReferenceObject $(Get-Content F:\fichero1.txt) -DifferenceObject $(Get-Content F:\fichero2.txt)

#Get-ChildItem
Get-ChildItem -Path $home | select *
Get-ChildItem -Path $home | Get-Member
Get-ChildItem D:\power -Directory

#Comprimir y descomprimir
Compress-Archive -LiteralPath C:\powershell\example.txt –CompressionLevel Optimal -DestinationPath C:\powershell\comprimido.zip
Expand-Archive -LiteralPath C:\powershell\comprimido.zip -DestinationPath C:\powershell\descomprimir
Compress-Archive -LiteralPath C:\powershell\example2.txt -Update -DestinationPath C:\powershell\comprimido.zip

#Comprobar si existe o no un fichero
Test-Path c:\scripts\test.txt

#Listar ficheros según criterio de días
Get-Childitem F:\power\files | ? {$_.LastAccessTime -le (get-date).adddays(-1) -and $_.LastAccessTime -ge (get-date).adddays(-2) } | % {copy $_.Fullname c:\backup}
