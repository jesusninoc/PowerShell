#Buscar un fichero utilizando el bucle ForEach (%)
(ls).Name | %{
if($_ -eq 'java')
{
Write-Host 'Es el fichero buscado'
}
else
{
$_
}
}

#Buscar un fichero utilizando el bucle ForEach
foreach($fichero in (ls).Name)
{
if($fichero -eq 'java')
{
Write-Host 'Es el fichero buscado'
}
else
{
$fichero
}
}
