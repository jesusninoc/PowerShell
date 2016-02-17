#Crear una tarea programada que ejecuta un script en PowerShell
$action=New-ScheduledTaskAction -Execute 'Powershell.exe' -Argument '-NoProfile -WindowStyle Hidden -command D:\mysqlmail.ps1'
$trigger=New-ScheduledTaskTrigger -Daily -At 9am
Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "TareaProgramada" -Description "Comprobación de valor"
