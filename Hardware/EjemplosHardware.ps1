#Sistema operativo instalado sobre una partición
(Get-WmiObject Win32_AutochkSetting).SettingID
#Ejemplo
if((Get-WmiObject Win32_AutochkSetting).SettingID -match "8.1"){"No actualizado a 10"}

#Fabricante de placa base
(Get-WmiObject Win32_BaseBoard).Manufacturer

$consulta="https://www.asus.com/es/Notebooks/" + (Get-WmiObject Win32_BaseBoard).Product
Start-Process chrome $consulta

#Versión de la BIOS
(Get-WmiObject Win32_BIOS).Version

#Buses conectados
(Get-WmiObject Win32_Bus).DeviceID

#Información sobre el procesador
Get-WmiObject Win32_Processor

if((Get-WmiObject Win32_Processor).Caption -match "Intel"){"Intel"}else{"No es Intel"}

#Serial del fabricante que identifica el equipo
Get-WmiObject Win32_SystemEnclosure
(Get-WmiObject Win32_SystemEnclosure).SerialNumber

$tag=(Get-WmiObject Win32_SystemEnclosure).SerialNumber
$consulta="https://www.asus.com/es/Notebooks/"
Start-Process chrome $consulta+$tag

#Estimación del porcentaje de la carga de la batería restante
Get-WmiObject Win32_Battery
(Get-WmiObject Win32_Battery).EstimatedChargeRemaining

$noba=(Get-WmiObject Win32_Battery).Name
$consulta="https://www.asus.com/"
Start-Process chrome $consulta+$noba

#Impresoras en el equipo
Get-WmiObject Win32_Printer

(Get-WmiObject Win32_Printer).name | %{$_ | Out-Printer}

#Almacenar información sobre hardware
(Get-WmiObject Win32_AutochkSetting).SettingID | Out-File inf.txt -Append
(Get-WmiObject Win32_BaseBoard).Manufacturer | Out-File inf.txt -Append
(Get-WmiObject Win32_BIOS).Version | Out-File inf.txt -Append
(Get-WmiObject Win32_Bus).DeviceID | Out-File inf.txt -Append
Get-WmiObject Win32_Processor | Out-File inf.txt -Append
Get-WmiObject Win32_SystemEnclosure | Out-File inf.txt -Append
Get-WmiObject Win32_Battery | Out-File inf.txt -Append
Get-WmiObject Win32_Printer | Out-File inf.txt -Append

#Carpeta sistema operativo con partición
mkdir syst
cd syst
((Get-WmiObject Win32_AutochkSetting).SettingID).split("\")[4] | Out-File syst.txt -WhatIf

#Carpeta placa con fichero de información
mkdir info
cd info
(Get-WmiObject Win32_BaseBoard) | Out-File info.txt -WhatIf
