#1)
$nombre=(Get-Date).tostring("dd-MM-yyyy")
New-Item -ItemType Directory -Path d:\power\powershell -Name $nombre
$ruta='d:\power\powershell\'+$nombre
cd $ruta
ps | Sort-Object CPU -Descending | Select-Object -First 5 | Out-File procesos.txt -Append

#2)
$nombre=(Get-Date).tostring("dd-MM-yyyy")
New-Item -ItemType Directory -Path d:\power\powershell -Name $nombre
$ruta='d:\power\powershell\'+$nombre
cd $ruta
$nombresegundo=(Get-Date).tostring("dd-MM-yyyy-hh-mm-ss")
ps | Sort-Object CPU -Descending | Select-Object -First 5 | Out-File procesos$nombresegundo.txt

#3)
$nombre=(Get-Date).tostring("dd-MM-yyyy")
New-Item -ItemType Directory -Path d:\power\powershell -Name $nombre
$ruta='d:\power\powershell\'+$nombre
cd $ruta
$nombresegundo=(Get-Date).tostring("dd-MM-yyyy-hh-mm-ss")
ps | Sort-Object CPU -Descending | Select-Object -First 5 -Unique| %{
$nombrecompleto=$_.Name+$nombresegundo+'.txt'
$valor=$_.NPM+$_.PM+$_.WS+$_.VM+$_.CPU
New-Item -ItemType file -Path $ruta -Name $nombrecompleto -Value $valor
}
