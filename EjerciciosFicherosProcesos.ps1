#Analizar procesos y guardar cada uno de los procesos en un fichero txt
New-Item -ItemType Directory -Path d:\power\ -Name procesos
foreach ($proceso in (Get-Process | Select-Object Name).name){
New-Item -Path D:\power\procesos -Name $proceso -Value $proceso -ItemType file
}

#Añadir información sobre el proceso cada hora, analizar procesos y guardar cada uno de los procesos en un fichero txt
New-Item -ItemType Directory -Path d:\power\ -Name procesos
while(1)
{
foreach ($proceso in (Get-Process | Select-Object Name).name){
New-Item -Path D:\power\procesos -Name $proceso'.txt' -Value $proceso -ItemType file
(Get-Process $proceso | Select-Object NPM,PM,WS,VM,CPU) | Out-File d:\power\procesos\$proceso'.txt'
}
Start-Sleep -Seconds 3600
}

#NPM(K): The amount of non-paged memory that the process is using, in kilobytes.
#PM(K): The amount of pageable memory that the process is using, in kilobytes.
#WS(K): The size of the working set of the process, in kilobytes. The working set consists of the pages of memory that were recently referenced by the process.
#VM(M): The amount of virtual memory that the process is using, in megabytes. Virtual memory includes storage in the paging files on disk.
#CPU(s): The amount of processor time that the process has used on all processors, in seconds.
$fecha=(Get-Date).tostring("dd-MM-yyyy-hh-mm-ss")
New-Item -ItemType Directory -Path d:\power\ -Name $fecha
New-Item -ItemType File -Path d:\power\$fecha -Name $fecha'.txt'
(Get-Process | Select-Object NPM,PM,WS,VM,CPU) | Out-File d:\power\$fecha\$fecha'.txt'
