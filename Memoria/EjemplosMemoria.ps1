#Lugar físico en donde se encuentran las memorias
Get-WmiObject Win32_PhysicalMemory | Select-Object BankLabel

#Velocidad de reloj del dispositivo de memoria en megahercios
Get-WmiObject Win32_PhysicalMemory | Select-Object ConfiguredClockSpeed

#Voltaje configurado para los dispositivos de memoria en milivoltios
Get-WmiObject Win32_PhysicalMemory | Select-Object ConfiguredVoltage

#Capacidad de la memoria en bytes
Get-WmiObject Win32_PhysicalMemory | ForEach-Object {$_.capacity / 1GB}

#Tipo de memoria
Get-WmiObject Win32_PhysicalMemory | Select-Object MemoryType

#Tipo de implementación del chip de los dispositivos de memoria
Get-WmiObject Win32_PhysicalMemory | Select-Object FormFactor

#Máxima y mínima tensión soportada por los dispositivos de memoria
Get-WmiObject Win32_PhysicalMemory | Select-Object MaxVoltage,MinVoltage

#Velocidad de la memoria en nanosegundos
Get-WmiObject Win32_PhysicalMemory | Select-Object Speed
