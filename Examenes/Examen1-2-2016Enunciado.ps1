----------
PowerShell
----------
Almacenar en un fichero información sobre los programas instalados y las actualizaciones.
Guardar dicha información en una carpeta con la fecha actual.

Listar procesos, crear carpeta para cada uno y dentro de la carpeta meter un fichero con el hash del proceso (necesario saber la ruta absoluta del programa).

Si el nombre de un proceso es explorer almacenar información completa sobre dicho proceso ( | select *) y realizar un hash, almacenar el hash.

Tenemos un problema, el script se ejecuta tan rápido que no podemos ver el contenido de la variable $valors2, comenta algunas solución para resolver el problema.

$valors1=Get-HotFix | Select-Object HotFixID
$valors2=Get-WmiObject -Class Win32_Product | Select-Object name
$valors1
Start-Sleep -Seconds 5
$valors2

----------
Linux
----------
Crear un script en el que pida un nombre al usuario y si el nombre es 'pepito' que almacene dicho nombre en un fichero.

Recorrer un fichero que tiene nombres de personas y si la persona que está dentro del fichero es 'pepito' almacenar dicho nombre en un fichero.
