#Arrancar procesos en PowerShell
#En PowerShell se pueden arrancar procesos de las siguientes formas

#Iniciar un proceso con un cmdlet
#Start-Process
Start-Process notepad

#Invocar un cmdlet
#Invoke-Expression
Invoke-Expression notepad

#Invocar un elemento
#Invoke-Item
Invoke-Item C:\Windows\system32\notepad.exe

#Crear un bloque e invocarlo
#Invoke-Command
Invoke-Command -scriptblock {notepad}

#Iniciar una instancia de una aplicación mediante WMI
([Wmiclass]'Win32_Process').GetMethodParameters('Create')
Invoke-WmiMethod -Path win32_process -Name create -ArgumentList notepad.exe

#Iniciar un proceso mediante la clase Process .NET
$proc=[System.Diagnostics.Process]::Start("notepad")
$proc.responding
$proc.hasexited
