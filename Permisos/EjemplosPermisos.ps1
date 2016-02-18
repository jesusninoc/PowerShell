#Obtener permisos de un recurso
Get-Acl d:

#Mostrar permisos de acceso
Get-Acl d: | Select-Object Access
