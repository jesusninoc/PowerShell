#Listar por descripción de las actualizaciones instaladas en el equipo
Get-HotFix | Select-Object Description
(Get-HotFix).Description

#Agrupar actualizaciones por descripción
Get-HotFix | Group-Object Description
(Get-HotFix).Description | Group-Object

#Agrupar actualizaciones por descripción y mostrar el nombre de la agrupación
(Get-HotFix | Group-Object Description).Name

#Listar por fecha las actualizaciones instaladas en el equipo
Get-HotFix | Sort-Object InstalledOn

#Buscar una actualización entre las actualizaciones instaladas en el equipo
$kb=Read-Host ‘NúmeroActualización’
((Get-HotFix).hotfixid | Select-String $kb)
