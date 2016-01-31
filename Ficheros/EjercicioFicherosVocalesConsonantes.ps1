#De una lista de ficheros que tienen una letra y la extensión TXT
#Ejemplo:
#a.txt
#b.txt
#c.txt
#Mover los ficheros que tengan vocales a la carpeta vocales y los que no sean vocales a la carpeta consonantes

#Paso 1
echo "a" > "a.txt"
echo "b" > "b.txt"

#Paso 2
(ls).name | % {$_}

#Paso 3
(ls) | % {$_.name}

#Paso 4
(ls).name | % {$_.replace('.txt','')}

#Paso 5
(ls).name | % {($_.replace('.txt','') -eq 'a')}

#Paso 6
(ls).name | % {($_.replace('.txt','') -eq 'e')}

#Paso 7
(ls).name | % {
if($_.replace('.txt','') -eq 'a')
{
#Hacer el move
Write-Host $_ "vocal"
}
else
{
#Hacer el move
Write-Host $_ "novocal"
}
}

#Paso 8
(ls -File).name | % {
if($_.replace('.txt','') -eq 'a')
{
#Hacer el move
Write-Host $_ "vocal"
}
else
{
#Hacer el move
Write-Host $_ "novocal"
}
}
