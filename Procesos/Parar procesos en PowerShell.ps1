#Parar procesos en PowerShell
#En PowerShell se pueden parar procesos de las siguientes formas

#Parar un proceso con un cmdlet
#Stop-Process
notepad;Start-Sleep -Seconds 2
Stop-Process -Name notepad

#Parar un proceso mediante el método Kill
notepad;Start-Sleep -Seconds 2
Get-Process -Name notepad | ForEach-Object -Process {$_.Kill()}

#Parar un proceso mediante la clase Process .NET
$proc=[System.Diagnostics.Process]::Start("notepad")
$proc.kill()
$proc.hasexited
