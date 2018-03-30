# Ejecutar PowerShell como administrador
# Es necesario para poder crear y eliminar usuarios

# Ver o listar usuarios
Get-LocalUser

# Crear la contraseña con SecureString
$pass=ConvertTo-SecureString "11234aaa@@€dsf" -asplaintext -force
# Crear usuario con contraseña
New-LocalUser usuario -Password $pass

# Ver información sobre usuario creado
Get-LocalUser usuario

# Modificar usuario
Set-LocalUser -Name usuario -Description "Usuario Nuevo"

# Ver información sobre usuario modificado
Get-LocalUser usuario

# Eliminar usuario
Remove-LocalUser usuario

# Ver información sobre usuario modificado
Get-LocalUser usuario
