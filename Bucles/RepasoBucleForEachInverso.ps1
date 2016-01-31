#Mostrar los 5 últimos procesos que se están ejecutando de forma descendente

for($i=(ps).count ; $i -gt ((ps).count)-5 ; $i=$i-1){(ps)[$i]}
