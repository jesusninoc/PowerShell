#Del siguiente listado de ficheros:

#PS F:\power\fichero> ls
#Directorio: F:\power\fichero
#Mode        LastWriteTime     	      Length Name
#-a---        15/12/2014     22:24          8 a1.txt
#-a---        15/12/2014     22:24          8 b.txt

#1. Si el fichero tiene una vocal y el número 1 al lado, se mueve el fichero a la carpeta vocal y si es una letra no vocal se mueve a la carpeta novocal.
#Solución de Eduardo
foreach($fichero in (Get-ChildItem C:\powershell\ficheros).Name)
{
if($fichero.Split('.')[0] -eq  "a" -or "e"-or "i" -or "u" -or "o" -and $fichero.Split('.')[1] -eq 1) 
{
Move-Item  -Path C:\powershell\ficheros\$fichero'.txt'  -Destination C:\powershell\vocal  -PassThru | Rename-Item -NewName $fichero.Split('.')[0]
}
else
{
Move-Item -Path C:\powershell\ficheros\$fichero'.txt'   -Destination C:\powershell\novocal -PassThru 
}
}

#2. Realizar el mismo ejercicio pero en el caso de tener un 1 el nombre, el nombre que se guarda en la carpeta es sin el 1, es decir en lugar de a1.txt se mueve a la carpeta correspondiente con el nuevo nombre que es a.txt.
#Solución de Eduardo
foreach($fichero in (Get-ChildItem C:\powershell\ficheros).Name -replace ".txt" , "")
{
if($fichero.Split('.')[0] -eq  "a" -or "e"-or "i" -or "u" -or "o" -and $fichero.Split('.')[1] -eq 1) 
{
Move-Item  -Path C:\powershell\ficheros\$fichero'.txt'  -Destination C:\powershell\vocal  -PassThru | Rename-Item -NewName $fichero.Split('.')[0]
}
else
{
Move-Item -Path C:\powershell\ficheros\$fichero'.txt'   -Destination C:\powershell\novocal -PassThru 
}
}
