#Realizado por Diego
#https://github.com/DiegoAlfa

cls
write-host "Fabricante de Placa base:           "(Get-ItemProperty -Path "HKLM:\HARDWARE\DESCRIPTION\System\BIOS").BaseBoardManufacturer
write-host "Familia de Placa Base:              "(Get-ItemProperty -Path "HKLM:\HARDWARE\DESCRIPTION\System\BIOS").SystemFamily
write-host "Placa base:                         "(Get-ItemProperty -Path "HKLM:\HARDWARE\DESCRIPTION\System\BIOS").BaseBoardProduct
write-host "Versión de Placa Base:              "(Get-ItemProperty -Path "HKLM:\HARDWARE\DESCRIPTION\System\BIOS").BaseBoardVersion
Write-host ""
write-host "BIOS:                               "(Get-ItemProperty -Path "HKLM:\HARDWARE\DESCRIPTION\System\BIOS").BIOSVendor
write-host "Versión de BIOS:                    "(Get-ItemProperty -Path "HKLM:\HARDWARE\DESCRIPTION\System\BIOS").BIOSVersion
write-host "Fecha de lanzamiento de BIOS:       "(Get-ItemProperty -Path "HKLM:\HARDWARE\DESCRIPTION\System\BIOS").BiosReleaseDate


write-host ""
Write-Host "Nucleos:"(ls -Path "HKLM:\HARDWARE\DESCRIPTION\System\CentralProcessor").count
(ls -Path "HKLM:\HARDWARE\DESCRIPTION\System\CentralProcessor").Name | % {
write-host " -"((Get-ItemProperty -Path "HKLM:\$_")).ProcessorNameString "-" ((Get-ItemProperty -Path "HKLM:\$_"))."~MHz" "MHz"
}
