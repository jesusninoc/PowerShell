#Simular copia incremental
$valor1="hola"
$valor2="hola a"
$valor3="hola ad"
$valor4="hola adi"
$valor5="hola adio"
$valor6="hola adios"

$lunesc=$valor2.Replace($valor1,"");$lunesc
$martesi=$valor3.Replace($valor2,"");$martesi
$xi=$valor4.Replace($valor3,"");$xi
$ji=$valor5.Replace($valor4,"");$ji
$vi=$valor6.Replace($valor5,"");$vi

#Qué valores han cambiado
Compare-Object -ReferenceObject $valor2 -DifferenceObject $valor1 | where {$_.SideIndicator -eq "<=" -or $_.SideIndicator -eq "=>"}
