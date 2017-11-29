Get-WMIObject Win32_LogicalDisk

Get-WMIObject Win32_LogicalDisk -Filter "DeviceID='E:'"

Get-WMIObject Win32_LogicalDisk -Filter "DeviceID='E:'" | Select-Object FreeSpace,Size

[Double](Get-WMIObject Win32_LogicalDisk -Filter "DeviceID='E:'" | Select-Object FreeSpace).FreeSpace/1GB

[System.Math]::Round((Get-WMIObject Win32_LogicalDisk -Filter "DeviceID='E:'" | Select-Object FreeSpace).FreeSpace/1GB)
