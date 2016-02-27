#Usuarios del sistema
(Get-WmiObject -Class Win32_Account)
#Fecha de creación de la carpeta del usuario
Get-ChildItem C:\Users | Select-Object CreationTime,name
