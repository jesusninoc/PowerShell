#Crear un fichero dentro de la unidad q: con tu nombre, apellidos y con el nombre del fichero examen291015

#Crear una función para hacer un login con dos factores de verificación (incluye comprobar el nombre de usuario)
#Guardar un fichero con la siguiente información: procesos que se están ejecutando, añade una línea con tu nombre al fichero y la hora en que has comprobado los procesos (hazlo tres veces y comprueba que se añaden los datos de las tres ejecuciones)

#Crear una función que intente localizar los hilos que se crean para un proceso (ayuda):
#$i=0
#(Get-WmiObject -Class Win32_Thread) | %{
#$i++
#Write-Host $i,$_.Handle,$_.ProcessHandle,(Get-WmiObject -Class Win32_Service | Where-Object State -EQ ‘Running’ | Where-Object ProcessId -EQ $_.ProcessHandle),(Get-Process -Id $_.ProcessHandle).ProcessName
