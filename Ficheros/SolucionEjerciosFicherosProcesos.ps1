#Crear un directorio para cada uno de los usuarios: Juan, Marta, Pedro, Carlos
ni juan,marta,pedro,carlos -ItemType Directory -Force -WhatIf

#Crear un fichero en cada uno de los directorios creados anteriormente
ni -Path juan,marta,pedro,carlos -Name fichero -ItemType File -WhatIf

#Crear contenido en cada uno de los ficheros, en concreto los procesos que se están ejecutando ahora mismo
#Achtung!, VALUE necesita un tipo de objeto, le tenemos que decir que sea TEXTO (STRING)
ni -Path juan,marta,pedro,carlos -Name procesos.txt -Value ([String](ps)) -ItemType File

#Añadir contenido a cada uno de los ficheros (ya existen los ficheros), en concreto los procesos que se están ejecutando ahora mismo
Add-Content -Path .\juan\procesos.txt,.\marta\procesos.txt,.\pedro\procesos.txt,carlos\procesos.txt -Value ([String](ps))

#Copiar cada uno de los directorios en una carpeta nueva añadiendo un 2 a cada nombre de directorio: Juan2, Marta2, Pedro2, Carlos2
#Sencillo
Copy-Item juan -Destination juan2
#Complejo
("juan,marta,pedro,carlos").Split(",") | %{Copy-Item $_ -Destination ([String]($_+"2")) -WhatIf}

#Eliminar la carpeta nueva cuyo contenido empiza por J (recurse)
Remove-Item j*

#Mover las carpetas creadas al principio en una carpeta nueva que se llame Copias
Copy-Item juan,marta,pedro,carlos -Destination Copias -WhatIf
