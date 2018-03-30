# Ejecutar PowerShell como administrador
# Es necesario para poder crear y eliminar grupos

# Ver o listar grupos
Get-LocalGroup

# Crear un grupo
New-LocalGroup grupo

# Ver información sobre grupo creado
Get-LocalGroup grupo

# Modificar grupo
Set-LocalGroup -Name grupo -Description "Nuevo grupo de usuarios"

# Ver información sobre grupo modificado
Get-LocalGroup grupo

# Ver miembros de un grupo
Get-LocalGroupMember grupo

# Añadir un usuario a un grupo (el usuario tiene que existir)
Add-LocalGroupMember -Member usuario -Group grupo

# Ver miembros de un grupo
Get-LocalGroupMember grupo

# Quitar usuario de grupo
Remove-LocalGroupMember -Member usuario -Group grupo

# Ver miembros de un grupo
Get-LocalGroupMember grupo

# Eliminar grupo
Remove-LocalGroup grupo

# Ver información sobre grupo modificado
Get-LocalGroup grupo
