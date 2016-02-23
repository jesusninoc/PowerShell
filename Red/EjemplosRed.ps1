#Realizar ping a las direcciones IP que están en un fichero
gc .\ips.txt | %{ping $_}
gc .\ips.txt | %{Test-Connection $_}

#Realizar ping a las direcciones IP de un rango
1..254 | %{ping ('192.168.1.'+$_)}
1..254 | %{Test-Connection ('192.168.1.'+$_)}

#Realizar ping a las direcciones IP de un rango variando el tercer y cuarto octeto
foreach($tercero in 1..254)
{
    foreach($cuarto in 1..254)
    {
        $ip='192.168.'+$tercero+'.'+$cuarto
        ping $ip
    }
}

#Apagar equipos remotos
foreach ($equipo in Get-Content "F:\pcs.txt"){(Get-WmiObject -class win32_operatingsystem -computername $equipo).win32shutdown(12)}

#Cerrar aplicacines remotamente
1..254 | %{Invoke-Command -ComputerName ('192.168.1.'+$_) {Stop-Process Powershell}}
