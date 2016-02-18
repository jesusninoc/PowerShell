#Listar usuarios
Get-WmiObject -Class Win32_Account
Get-WmiObject -Query "SELECT * FROM Win32_Account"

#Seleccionar los nombres de usuarios
Get-WmiObject -Class Win32_Account | Select-Object Name
Get-WmiObject -Query "SELECT * FROM Win32_Account" | Select-Object Name

#Seleccionar SID de los usuarios
Get-WmiObject -Class Win32_Account | Select-Object SID
Get-WmiObject -Query "SELECT * FROM Win32_Account" | Select-Object SID

#Seleccionar los nombre y el SID de usuarios
Get-WmiObject -Class Win32_Account | Select-Object Name, SID
Get-WmiObject -Query "SELECT * FROM Win32_Account" | Select-Object SID

#Contar el número de usuarios
(Get-WmiObject -Class Win32_Account | Select-Object Name).count
(Get-WmiObject -Query "SELECT * FROM Win32_Account" | Select-Object Name).count

#Buscar un nombre de usuario en la lista de usuarios
Get-WmiObject -Class Win32_Account | Select-String "Administrador"
Get-WmiObject -Query "SELECT * FROM Win32_Account" | Select-String "Administrador"

#Buscar un nombre de usuario en la lista de usuarios
Get-WmiObject -Class Win32_Account | Select-Object Name | Select-String "Administrador"
Get-WmiObject -Query "SELECT * FROM Win32_Account" | Select-Object Name | Select-String "Administrador"
