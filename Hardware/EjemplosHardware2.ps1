##
##Buses
##

#PCI
#Express
#ISA
Get-WmiObject Win32_AllocatedResource
Get-WmiObject Win32_Bus
Get-WmiObject Win32_DeviceBus
Get-WmiObject Win32_PortResource

#IDE
Get-WmiObject Win32_IDEController
Get-WmiObject Win32_IDEControllerDevice

#SCSI
Get-WmiObject Win32_SCSIController
Get-WmiObject Win32_SCSIControllerDevice

#USB
Get-WmiObject Win32_ControllerHasHub
Get-WmiObject Win32_USBController
Get-WmiObject Win32_USBControllerDevice
Get-WmiObject Win32_USBHub

##
##Entrada
##

#Teclado
Get-WmiObject Win32_Keyboard

#Ratón
Get-WmiObject Win32_PointingDevice

##
##Salida
##

#Monitor y vídeo
Get-WmiObject Win32_DesktopMonitor
Get-WmiObject Win32_DisplayControllerConfiguration
Get-WmiObject Win32_VideoController
Get-WmiObject Win32_VideoSettings

##
##Entrada y salida
##

#CD y DVD
Get-WmiObject Win32_CDROMDrive
Get-WmiObject Win32_PhysicalMedia

#Adaptadores de red
Get-WmiObject Win32_NetworkAdapter
Get-WmiObject Win32_NetworkAdapterConfiguration
Get-WmiObject Win32_NetworkAdapterSetting
