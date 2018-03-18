#Listar usuarios
Get-LocalUser

#Seleccionar los nombres de usuarios
Get-LocalUser | Select-Object name

#Seleccionar SID de los usuarios
Get-LocalUser | Select-Object SID

#Seleccionar los nombre y los SID de usuarios
Get-LocalUser | Select-Object name, SID

#Contar el número de usuarios
(Get-LocalUser).count

#Buscar un nombre de usuario en la lista de usuarios
Get-LocalUser | Select-String "Administrador"

#Buscar un nombre de usuario en la lista de usuarios
Get-LocalUser | Select-Object name | Select-String "Administrador"
