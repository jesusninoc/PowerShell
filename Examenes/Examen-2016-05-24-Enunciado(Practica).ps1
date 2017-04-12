####################################################################################################################################
####################################################################################################################################
--------------------------------------
SITUACIÓN 1
--------------------------------------
Aparecen unas capturas que se han realizado con la webcam, la webcam esta en estado activo.
--------------------------------------
AYUDA PARA RESOLVER LA SITUACIÓN
--------------------------------------
-Si ha entrado por USB
gwmi Win32_USBControllerDevice
-Hay alguna aplicación temporal que sirva para hacer capturas
-Si DevideID contiene la cadena B27
-Analizar procesos:
	-Si alguno ha abierto muchos procesos
-Hay algún servicio raro
-Analizar los parametros que se te ocurran
-Analizar la red, conexiones remotas y puertos
-Si la batería se consume rapidamente avisar

--------------------------------------
SITUACIÓN 2
--------------------------------------
Un empleado sabe que va a ser despedido, empieza a elimiar archivos, realizar un script que sirva para mover archivos a una carpeta que se llama "basura" y además de moverse a la carpeta también se haga una copia de los archivos que se intentan eliminar.
--------------------------------------
AYUDA PARA RESOLVER LA SITUACIÓN
--------------------------------------
-Crear carpeta basura
-Crear una carpeta donde va el contenido además de la carpeta basura
-La carpeta tiene que tener la fecha de cuando se intenta realizar el borrado
-Guardar el nombre de la persona que ejecuta:
Get-WmiObject win32_process |% {Write-Host $_.processname $_.getowner().user}
([System.Security.Principal.WindowsIdentity]::GetCurrent()).name
-Mover a la carpeta basura

--------------------------------------
SITUACIÓN 3
--------------------------------------
Teniendo en cuenta la situación anterior, detectar que hay un programa que realizar la función de papelera secreta, analizar todo el proceso.
--------------------------------------
AYUDA PARA RESOLVER LA SITUACIÓN
--------------------------------------
-Procesos?
-Cantidad de memoria?
