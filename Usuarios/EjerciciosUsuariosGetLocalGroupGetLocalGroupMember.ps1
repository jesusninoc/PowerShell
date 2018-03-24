#Listar grupos
Get-LocalGroup

#Seleccionar los nombres de los grupos
Get-LocalGroup | Select-Object Name

#Seleccionar SID de los grupos
Get-LocalGroup | Select-Object SID

#Seleccionar los nombre y las descripciones de los grupos
Get-LocalGroup | Select-Object Name,Description

#Contar el número de grupos
(Get-LocalGroup).count

#Buscar un nombre de grupo en la lista de grupos
Get-LocalGroup | Select-String "Administrador"

#Buscar un nombre de grupo en la lista de grupos
Get-LocalGroup | Select-Object Name | Select-String "Administrador"

#Mostrar información sobre los usuarios que pertenecen al grupo de "Administradores"
Get-LocalGroupMember Administradores
