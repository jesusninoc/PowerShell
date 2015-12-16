$numeros='1','2','3'
$numeros | %{$_}
$numeros | %{$PSItem}
foreach($numero in $numeros)
{
$numero
}

$numeros=1,2,3
$numeros | %{$PSItem}
$numeros | %{$_}
foreach($numero in $numeros)
{
$numero
}

$numeros=1..3
$numeros | %{$PSItem}
$numeros | %{$_}
foreach($numero in $numeros)
{
$numero
}

$numeros='1','2','3'
$numeros | %{$PSItem}
$numeros | %{$_}
foreach($numero in $numeros)
{
$numeros
}

$numeros='1''2''3'
$numeros | %{$PSItem}
$numeros | %{$_}
foreach($numero in $numeros)
{
$numero
}

$numeros='1,2,3'
$numeros | %{$PSItem}
$numeros | %{$_}
foreach($numero in $numeros)
{
$numero
}

$numeros='1''2''3'
$numeros | %{$PSItem}
$numeros | %{$_}
foreach($numero in $numeros)
{
$numeros
}

$numeros="'1','2','3'"
$numeros | %{$PSItem}
$numeros | %{$_}
foreach($numero in $numeros)
{
$numeros
}