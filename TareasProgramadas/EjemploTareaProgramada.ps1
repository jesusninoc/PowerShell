#Crear una tarea programada que ejecuta un script en PowerShell
$action=New-ScheduledTaskAction -Execute 'Powershell.exe' -Argument '-NoProfile -WindowStyle Hidden -command D:\mysqlmail.ps1'
$trigger=New-ScheduledTaskTrigger -Daily -At 9am
Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "TareaProgramada" -Description "Comprobación de valor"

#Crear una tarea programada que ejecuta Notepad
Register-ScheduledTask Task01 -Action (New-ScheduledTaskAction -Execute "notepad") -Principal (New-ScheduledTaskPrincipal -GroupId "BUILTIN\administradores" -RunLevel Highest) -Settings (New-ScheduledTaskSettingsSet -RestartCount 5 -RestartInterval 60)

#Crear una tarea programada en un equipo remoto
1..254 | %{Invoke-Command -ComputerName ('192.168.1.'+$_) {Register-ScheduledTask Task01 -Action (New-ScheduledTaskAction -Execute "notepad") -Principal (New-ScheduledTaskPrincipal -GroupId "BUILTIN\administradores" -RunLevel Highest) -Settings (New-ScheduledTaskSettingsSet -RestartCount 5 -RestartInterval 60)}}
