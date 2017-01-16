#Leer del fichero el componente hardware y la llamada WMI que hay que realizar, ejemplo
#procesador,Win32_Processor
#Guardar la información sobre la llamada WMI dentro del fichero que tiene como nombre la primera parte de cada línea del fichero

gc .\hardware.txt | %{
$linea=$_.split(",")
mkdir $linea[0]
cd $linea[0]
Get-WmiObject $linea[1] | Out-File $linea[0]
cd ..
}
