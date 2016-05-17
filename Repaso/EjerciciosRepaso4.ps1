#Escanear IP creado por Edu
[int]$rangoip= read-host "Rango de dirección IP a escanear (1-254)"
1 .. 254 | %{$_
$ip="192.168.$rangoip."+$_
$resultadoping = Resolve-DnsName $ip -ErrorAction Ignore
if ($resultadoping.Type -eq "PTR")
{
 "$ip" + "--> existe"
 "$ip"+ "-->" ,($resultadoping).NameHost >> Q:\direccionesip.txt
}
else 
{
 "$ip"+"--> no existe, haciendo ping..."
 $ping2=ping $ip
 if($ping2 -match "TTL")
 {
 "$ip"+"--> si existe" 
 "$ip"+ "-->" >> Q:\direccionesip.txt
}
}
}
