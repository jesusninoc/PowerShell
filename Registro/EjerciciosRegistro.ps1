#Relación entre registro y servicios
Get-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\*' | % {Write-host $_.DisplayName : $_.Start}
