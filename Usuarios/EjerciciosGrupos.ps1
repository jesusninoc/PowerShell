#Listar grupos
Get-WmiObject -Class Win32_Group

#Seleccionar los nombres de los grupos
Get-WmiObject -Class Win32_Group | Select-Object Name

#Seleccionar SID de los grupos
Get-WmiObject -Class Win32_Group | Select-Object SID

#Seleccionar los nombre y las descripciones de los grupos
Get-WmiObject -Class Win32_Group | Select-Object Name,Description

#Contar el número de grupos
(Get-WmiObject -Class Win32_Group | Select-Object Name).count

#Buscar un nombre de grupo en la lista de grupos
Get-WmiObject -Class Win32_Group | Select-String "Administrador"

#Buscar un nombre de grupo en la lista de grupos
Get-WmiObject -Class Win32_Group | Select-Object Name | Select-String "Administrador"
