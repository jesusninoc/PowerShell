#Listar hilos mediante Get-Process
Get-Process | select Name,Threads

#Listar hilos mediante la llamada WMI Win32_Thread
Get-WmiObject -Class Win32_Thread | Select-Object -First 20

#Prioridad de los hilos de los procesos (opción 1)
(Get-WmiObject -Class Win32_Thread) | Select-Object ProcessHandle,Priority,PriorityBase | Sort-Object ProcessHandle

#Prioridad de los hilos de los procesos (opción 2)
(Get-Process).Threads | Select-Object Id,CurrentPriority,BasePriority | Sort-Object Id

#Conocer el estado de los hilos de los procesos (opción 1)
(Get-WmiObject -Class Win32_Thread) | Select-Object ProcessHandle,ThreadState | Sort-Object ProcessHandle

#Conocer el estado de los hilos de los procesos (opción 2)
(Get-Process).Threads | Select-Object Id,ThreadState | Sort-Object Id

#Mostrar los hilos que ejecuta cada proceso
Get-Process | %{
Write-Host $_.Name ($_.Threads).Id
}

#Mostrar el número de hilos que ejecuta cada proceso
Get-Process | %{
Write-Host $_.Name ($_.Threads).Count
}

#Mostrar el proceso que creó el hilo
(Get-WmiObject -Class Win32_Thread).ProcessHandle | %{
Get-Process -Id $_
}
