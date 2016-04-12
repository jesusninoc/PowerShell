#Recorre IP's, hacer ping y obtener MAC
1..254|%{$_}
1..254|%{"192.168.1."+$_}
1..254|%{$ip="192.168.1."+$_;$ip}
1..254|%{$ip="192.168.1."+$_;ping $ip}
1..254|%{$ip="192.168.1."+$_;ping $ip;arp -a $ip}
1..254|%{$ip="192.168.1."+$_;$ip;arp -a | Select-String $ip}
#En PowerShell
1..254|%{$ip="192.168.1."+$_;$ip;Test-Connection $ip}
1..254|%{$ip="192.168.1."+$_;$ip;NetNeighbor $ip}
1..254|%{$ip="192.168.1."+$_;$ip;(NetNeighbor $ip).LinkLayerAddress}

#MAC
Get-NetNeighbor | Select-Object LinkLayerAddress

#Seleccionar MAC donde la IP es 192.168.1.34
Get-NetNeighbor | Where-Object IPAddress -EQ 192.168.1.34 | Select-Object LinkLayerAddress

#6 caracteres hexadecimales de la MAC donde la IP es 192.168.1.34
[String]$a=(Get-NetNeighbor | Where-Object IPAddress -EQ 192.168.1.34 | Select-Object LinkLayerAddress).LinkLayerAddress
$a.Substring(0,6)

#Recorrer IP's de un rango y obtener la MAC
1..254|%{
$ip="192.168.1."+$_
Get-NetNeighbor | Where-Object IPAddress -EQ $ip | Select-Object LinkLayerAddress
}
#Otra solución
1..254|%{$ip="192.168.1."+$_;$ip;(NetNeighbor $ip).LinkLayerAddress}

1..254|%{
$ip="192.168.1."+$_
$mac=[String](Get-NetNeighbor | Where-Object IPAddress -EQ $ip | Select-Object LinkLayerAddress).LinkLayerAddress
$mac
$mac.Substring(0,6)
}
#Otra solución
1..254|%{$ip="192.168.1."+$_;$ip;((NetNeighbor $ip).LinkLayerAddress).Substring(0,6)}
