#Eventos

#Eventos disponibles
Get-EventLog -List

#Información sobre log
Get-EventLog Application
Get-EventLog HardwareEvents
Get-EventLog "Internet Explorer"
Get-EventLog Security
Get-EventLog System
Get-EventLog "Windows PowerShell"

#Agrupar mensajes del log Application
Get-EventLog Application | Group-Object Message
Get-EventLog Application | Group-Object Message | Select-Object Name
Get-EventLog Application | Group-Object Message | Select-Object Name | Format-Custom

#Información sobre el mensaje "gupdate" OJO!!
Get-EventLog Application | Where-Object Message -Match "gupdate" | Select-Object Message | Format-Custom

#Información sobre el mensaje "gpupdate"
Get-EventLog Application | Where-Object Message -Match "guppdate" | Select-Object Message | Format-Custom

#Información sobre IP en los logs
Get-EventLog Application | Where-Object Message -Match "192.168"
Get-EventLog Application | Where-Object Message -Match "192.168" | Select-Object Message
Get-EventLog Application | Where-Object Message -Match "192.168" | Select-Object Message | Format-Custom

#Información sobre el mensaje "explore", analizar el proceso Explore
Get-EventLog Application | Where-Object Message -Match "explore" | Select-Object Message | Format-Custom

#Mostrar logs por fecha
$today = Get-Date
$1day = New-TimeSpan -Days 1
$yesterday = $today - $1day
Get-EventLog -LogName system -EntryType Error, Warning -After $yesterday

#Primeros 40 registros del log
Get-EventLog -LogName System -EntryType Error -Newest 40
