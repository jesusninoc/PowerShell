#----------------------
ls '*.txt'
#----------------------
foreach($ficheros in (ls '*.txt').Name)
{
$ficheros.split('-')
}
#----------------------
foreach($ficheros in (ls '*.txt').Name)
{
$ficheros.split('-')[1]
}
#----------------------
foreach($ficheros in (ls '*.txt').Name)
{
$ficheros.split('-')[1].Replace('.txt','')
}
#----------------------
foreach($ficheros in (ls '*.txt').Name)
{
($ficheros.split('-')[1].Replace('.txt','')%2 -eq 0)
}
#----------------------
foreach($ficheros in (ls '*.txt').Name)
{
if($ficheros.split('-')[1].Replace('.txt','')%2 -eq 0){Write-Host 'par'}

}
#----------------------
foreach($ficheros in (ls '*.txt').Name)
{
if($ficheros.split('-')[1].Replace('.txt','')%2 -eq 0){Write-Host 'par'}
else{
Write-Host 'impart'}
}
#----------------------
foreach($ficheros in (ls '*.txt').Name)
{
if($ficheros.split('-')[1].Replace('.txt','')%2 -eq 0){Write-Host 'par'}
elseif(xxxxxxxxx -eq 0){
Write-Host 'cero'}
else{
Write-Host 'impart'}
}
#----------------------
foreach($ficheros in (ls '*.txt').Name)
{
if($ficheros.split('-')[1].Replace('.txt','')%2 -eq 0){
Write-Host 'par'}
elseif($ficheros.split('-')[1].Replace('.txt','') -eq 0){
Write-Host 'cero'}
else{
Write-Host 'impart'}
}
#----------------------
$ruta='q:\'
foreach($ficheros in (ls '*.txt').Name)
{
if($ficheros.split('-')[1].Replace('.txt','')%2 -eq 0){
$ruta+$ficheros
Write-Host 'par'}
elseif($ficheros.split('-')[1].Replace('.txt','') -eq 0){
Write-Host 'cero'}
else{
Write-Host 'impart'}
}
