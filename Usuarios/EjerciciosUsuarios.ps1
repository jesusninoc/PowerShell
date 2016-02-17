#Listar usuarios cuyo nombre contenta la palabra
Get-WmiObject -Class Win32_Account | select-string "marta"
