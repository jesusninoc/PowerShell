####################################################################################################################################
####################################################################################################################################
##########################################
##Qué hace esto?
##Para qué te puede servir?
##########################################
####################################################################################################################################
####################################################################################################################################
#Qué hace esto?
(Get-WmiObject Win32_AutochkSetting).SettingID

#Qué hace esto?
if((Get-WmiObject Win32_AutochkSetting).SettingID -match "8.1"){"No actualizado a 10"}

#Qué hace esto?
(Get-WmiObject Win32_BaseBoard).Manufacturer

#Qué hace esto?
$consulta="https://www.asus.com/es/Notebooks/" + (Get-WmiObject Win32_BaseBoard).Product
Start-Process chrome $consulta

#Qué hace esto?
(Get-WmiObject Win32_BIOS).Version

#Qué hace esto?
(Get-WmiObject Win32_Bus).DeviceID

#Qué hace esto?
Get-WmiObject Win32_Processor

#Qué hace esto?
if((Get-WmiObject Win32_Processor).Caption -match "Intel"){"Intel"}else{"No es Intel"}

#Qué hace esto?
Get-WmiObject Win32_SystemEnclosure
(Get-WmiObject Win32_SystemEnclosure).SerialNumber

#Qué hace esto?
$tag=(Get-WmiObject Win32_SystemEnclosure).SerialNumber
$consulta="https://www.asus.com/es/Notebooks/"
Start-Process chrome $consulta+$tag

#Qué hace esto?
Get-WmiObject Win32_Battery
(Get-WmiObject Win32_Battery).EstimatedChargeRemaining

#Qué hace esto?
$noba=(Get-WmiObject Win32_Battery).Name
$consulta="https://www.asus.com/"
Start-Process chrome $consulta+$noba

#Qué hace esto?
Get-WmiObject Win32_Printer

#Qué hace esto?
(Get-WmiObject Win32_Printer).name | %{$_ | Out-Printer}

#Qué hace esto?
(Get-WmiObject Win32_AutochkSetting).SettingID | Out-File inf.txt -Append
(Get-WmiObject Win32_BaseBoard).Manufacturer | Out-File inf.txt -Append
(Get-WmiObject Win32_BIOS).Version | Out-File inf.txt -Append
(Get-WmiObject Win32_Bus).DeviceID | Out-File inf.txt -Append
Get-WmiObject Win32_Processor | Out-File inf.txt -Append
Get-WmiObject Win32_SystemEnclosure | Out-File inf.txt -Append
Get-WmiObject Win32_Battery | Out-File inf.txt -Append
Get-WmiObject Win32_Printer | Out-File inf.txt -Append

#Qué hace esto?
mkdir syst
cd syst
((Get-WmiObject Win32_AutochkSetting).SettingID).split("\")[4] | Out-File syst.txt -WhatIf

#Qué hace esto?
mkdir info
cd info
(Get-WmiObject Win32_BaseBoard) | Out-File info.txt -WhatIf

#Qué hace esto?
ls *.* -Recurse | %{$_.name | Out-File ls.txt -WhatIf}

#Qué hace esto?
ls *.doc -Recurse | %{$_.name | Out-File ls.txt -WhatIf}
ls *.txt -Recurse | %{$_.name | Out-File ls.txt -WhatIf}

#Qué hace esto?
ls *.* -Recurse | %{Get-Acl $_.Name}
ls *.* -Recurse | %{(Get-Acl $_.Name) | Out-File ls.txt -WhatIf}
ls *.* -Recurse | %{$_.name, (Get-Acl $_.Name) | Out-File ls.txt -WhatIf}

#Qué hace esto?
ps -Module
ps | select Name,Company

#Qué hace esto?
(Get-Service).Status

#Qué hace esto?
(Get-WmiObject -Class Win32_Product).count

#Qué hace esto?
Get-HotFix | Select-Object HotFixID,InstalledOn

#Qué hace esto?
1..254|%{$ip="192.168.1."+$_;ping $ip}

#Qué hace esto?
Get-NetNeighbor | Where-Object IPAddress -EQ 192.168.1.34 | Select-Object LinkLayerAddress

#Qué hace esto?
Get-NetTCPConnection | Select-Object LocalPort,Remoteport
Get-NetUDPEndpoint | Select-Object LocalPort

#Qué hace esto?
(Get-NetTCPConnection).LocalPort | % {mkdir $_ -WhatIf}
(Get-NetTCPConnection).Remoteport | % {mkdir $_ -WhatIf}
(Get-NetUDPEndpoint).LocalPort | % {mkdir $_ -WhatIf}

#Qué hace esto?
Get-WmiObject -Class Win32_UserAccount
Get-WmiObject -Class Win32_GroupUser

#Qué hace esto?
Get-WmiObject -Class Win32_UserAccount | Select-Object name

#Qué hace esto?
if((Get-WmiObject -Class Win32_UserAccount | Select-Object name) -match "hack2323"){"Problem"}
