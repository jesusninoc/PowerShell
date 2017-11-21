#Si la versión de la BIOS del equipo se encuentra dentro del fichero, hay que actualizarla

#Fichero bios.txt contiene _ASUS_ - 1072009
#"_ASUS_ - 1072009" | Out-File bios.txt -Append

gc .\bios.txt | %{
if((Get-WmiObject Win32_BIOS).version -eq $_)
{
"Actualizar BIOS del equipo"+(hostname)
}
