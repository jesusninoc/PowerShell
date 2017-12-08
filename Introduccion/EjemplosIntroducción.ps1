#Crear fichero leyendo el nombre desde consola
$fichero = Read-Host 'Introduzca nombre de fichero'
New-Item -Name $fichero
Get-ChildItem $fichero

#Añadir contenido al fichero creado
"Hola amigo" | Out-File $fichero -Append

#Añadir fecha actual al fichero creado
$fecha = Get-Date
$fecha | Out-File $fichero -Append

#Ver el contenido de un fichero
Get-Content $fichero

#Leer fichero línea a línea
$longitud = (Get-Content $fichero).Length
0..$longitud | %{(Get-Content $fichero)[$_]}
