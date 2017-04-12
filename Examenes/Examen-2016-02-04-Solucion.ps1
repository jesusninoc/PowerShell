#Realizar un programa que pida al usuario un proceso y almacene el nombre de todos los ficheros dll de dicho proceso junto con su hash en un fichero.
$programa=Read-Host "Proceso del que obtener ficheros DLL"
Get-Process -Name $programa -Module | % {(Get-FileHash $_.FileName -Algorithm SHA1) | Out-File D:\power\dllhash.txt -Append}
