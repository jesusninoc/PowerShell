##caso 1
$listado='1','2','3','4'
foreach($numero in $listado)
{
$operacion=$numero%2
if($operacion -eq 0)
{
“par”
}
else
{
“impar”
}
}

##caso 2
$listado='1'
foreach($numero in $listado)
{
$operacion=$numero%2
if($operacion -eq 0)
{
“par”
}
else
{
“impar”
}
}


##caso 3
$numero=1
$operacion=$numero%2
if($operacion -eq 0)
{
“par”
}
else
{
“impar”
}
