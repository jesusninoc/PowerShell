#REALIZAR UN SCRIPT QUE LEA DE UN FICHERO OPERACIONES RELACIONADAS CON LOS SISTEMAS DE ARCHIVOS (TAREAS BÁSICAS EN SISTEMAS OPERATIVOS) Y LAS REALICE AUTOMÁTICAMENTE
#http://www.jesusninoc.com/2013/11/16/tareas-basicas-ii-sistemas-operativos-monopuesto/

#TAREAS BÁSICAS II (SISTEMA DE ARCHIVOS)
#Crear o modificar un archivo..................New-item
#Crear un directorio...........................New-item
#Ver el contenido de un archivo................Get-Content
#Acceder al contenido de un directorio.........Set-Location
#Listar el contenido de un directorio..........Get-Childitem
#Eliminar un archivo...........................Remove-Item
#Eliminar un directorio........................Remove-Item
#Copiar un archivo o un directorio.............Copy-Item
#Mover un archivo o un directorio..............Move-Item
#Renombrar un archivo o un directorio..........Rename-Item
#Imprimir un archivo...........................Out-Printer

#SOLUCIÓN
#Añadir operaciones al fichero (crear, ver, eliminar, etc.)
"crear,fichero" | Out-File operaciones.txt -Append
"crear,fichero" | Out-File operaciones.txt -Append
"eliminar,fichero" | Out-File operaciones.txt -Append

#Ver el contenido del fichero todo de golpe
gc .\operaciones.txt

#Partir todos los elementos que hay en el fichero de golpe
(gc .\operaciones.txt).split(",")

#Ver el contenido del fichero línea a línea
gc .\operaciones.txt | %{$_}

#Partir el contenido del fichero línea a línea
gc .\operaciones.txt | %{$_.split(",")}

#Partir el contenido del fichero línea a línea y quedarse con la primera parte, la operación
gc .\operaciones.txt | %{$_.split(",")[0]}

#Partir el contenido del fichero línea a línea y mostrar las dos partes de la línea
gc .\operaciones.txt | %{
"parte 1 " + $_.split(",")[0]
"parte 2 " + $_.split(",")[1]
}

#Simular la operación de crear leyendo del fichero
gc .\operaciones.txt | %{
    if($_.split(",")[0] -eq "crear")
    {
    "operación de crear"
    }
    else
    {
    "no es operación de crear"
    }
}

#Realizar la operación de crear leyendo del fichero
gc .\operaciones.txt | %{
    if($_.split(",")[0] -eq "crear")
    {
    New-Item $_.split(",")[1] -ItemType Directory -WhatIf
    }
    else
    {
    "no es operación de crear"
    }
}

#Realizar la operación de crear y de eliminar leyendo del fichero
gc .\operaciones.txt | %{
    if($_.split(",")[0] -eq "crear")
    {
    New-Item $_.split(",")[1] -ItemType Directory
    }
    elseif($_.split(",")[0] -eq "eliminar")
    {
    Remove-Item $_.split(",")[1] -WhatIf
    }
    else
    {
    "no es operación de crear"
    }
}

#Simular la operación de crear y de eliminar leyendo del fichero utilizando un switch (achtung!, la parte del $_.split(",")[1] no funciona porque la variable $_ no tiene valor)
gc .\operaciones.txt | %{
    switch($_.split(",")[0])
    {
    "crear"{"operación de crear";$_.split(",")[1]}
    "eliminar"{"operación de eliminar";$_.split(",")[1]}
    default{"ninguna operación"}
    }
}

#Realizar la operación de crear y de eliminar leyendo del fichero utilizando un switch (y una variable donde se almacena la línea de operación que después se puede partir)
#Añadir el resto de operaciones
gc .\operaciones.txt | %{
    $operaciones=$_
    switch($operaciones.split(",")[0])
    {
    "crear"
        {
        $operaciones.split(",")[1]
        New-Item $operaciones.split(",")[1] -ItemType Directory
        break
        }
    "eliminar"
        {
        $operaciones.split(",")[1]
        Remove-Item $operaciones.split(",")[1] -WhatIf
        break
        }
    default
        {
        "ninguna operación"
        break
        }
    }
}
