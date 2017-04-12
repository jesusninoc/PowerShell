#Explica cada apartado

###########
#Apartado 1
###########

Invoke-WebRequest 'http://www.iana.org/assignments/service-names-port-numbers/service-names-port-numbers.csv' -OutFile d:\service-names-port-numbers.csv
$portscsv=Import-Csv d:\service-names-port-numbers.csv
$listado=$portscsv | Select-Object 'Service Name','Port Number','Transport Protocol' | Where-Object 'Transport Protocol' -EQ udp
Get-NetUDPEndpoint | Select-Object Localaddress,Localport | %{$_.Localaddress; $listado | Select-Object 'Service Name','Port Number' | Where-Object 'Port Number' -EQ $_.Localport}

###########
#Apartado 2
###########

$portscsv=Import-Csv d:\service-names-port-numbers.csv
$listado=$portscsv | Select-Object 'Service Name','Port Number','Transport Protocol' | Where-Object 'Transport Protocol' -EQ tcp
Get-NetTCPConnection | Select-Object Localaddress,Remoteport,Remoteaddress | %{$_.Localaddress; $listado | Select-Object 'Service Name','Port Number' | Where-Object 'Port Number' -EQ $_.RemotePort;$_.Remoteaddress} | Format-Custom

###########
#Apartado 3
###########

Get-NetNeighbor

###########
#Apartado 4
###########

New-NetIPAddress -InterfaceAlias Wi-Fi -IPAddress 192.168.1.56 -PrefixLength 24 -DefaultGateway 192.168.1.1
Set-NetIPAddress –InterfaceIndex 12 –IPAddress 192.168.0.16
Remove-NetIPAddress –IPAddress 192.168.0.16 -DefaultGateway 192.168.0.1

###########
#Apartado 5
###########

$macwifi=netsh wlan show networks mode=bssid | Select-String '([0-9A-F]{2}[:]){5}([0-9A-F]{2})$' | % {$_.matches} | Select-Object value

foreach($mac in $macwifi.value)
{
$url=”http://standards.ieee.org/cgi-bin/ouisearch?”+$mac.Substring(0,8).replace(':','-')
$url
$result=Invoke-WebRequest $url
#Here are the results of your search through the public section of the IEEE Standards MA-L database report for MAC
($result.AllElements | Where tagName -eq “PRE”).outerText
}

###########
#Apartado 6
###########

Get-NetTCPConnection | Where-Object State -EQ 'Established'

###########
#Apartado 7
###########

New-Item -ItemType Directory -Path F:\power\powershell -Name (Get-Date).tostring("dd-MM-yyyy-hh-mm-ss")

###########
#Apartado 8
###########

New-SmbShare -Name fso -Path F:\power –FullAccess administrador -ReadAccess Everyone

###########
#Apartado 9
###########

Get-WmiObject –query “SELECT * from win32_logicaldisk” | Select-Object DeviceID

###########
#Apartado 10
###########

Expand-Archive -LiteralPath C:\powershell\comprimido.zip -DestinationPath C:\powershell\descomprimir
Compress-Archive -LiteralPath C:\powershell\example.txt –CompressionLevel Optimal -DestinationPath C:\powershell\comprimido.zip

###########
#Apartado 11
###########

Get-ChildItem | Where-Object {
$_.LastWriteTime -ge (Get-Date).AddDays(-1)
}

###########
#Apartado 12
###########

Get-Childitem F:\power\files | ? {$_.LastAccessTime -le (get-date).adddays(-1) -and $_.LastAccessTime -ge (get-date).adddays(-2) } | % {copy $_.Fullname c:\backup}

###########
#Apartado 13
###########

Import-Csv F:\power\users.csv |%{
$nombreco=$_.FirstName + " " + $_.LastName
$ru="OU=" + $_.Group + ",OU=ou3,OU=ou2,OU=ou1,DC=domain,DC=local"
 
$HomeDirectory="\serverdepartament" + $_.Group + "" + $_.sAMAccountname
mkdir $HomeDirectory
$HomeDirectory
$HomeDrive=’Q:’
 
New-ADUser -Name $_.FirstName -SamAccountName $_.sAMAccountname -HomeDrive $HomeDrive –HomeDirectory $HomeDirectory -DisplayName $nombreco -Enabled $true -ChangePasswordAtLogon $false -AccountPassword (ConvertTo-SecureString $_.Password -AsPlainText -force) -PassThru -UserPrincipalName $_.sAMAccountname -Path $ru
 
$usereta="domain" + $_.sAMAccountname + ":F"
$HomeDirectory + "-" + $usereta
cacls $HomeDirectory /G $usereta /E
 
Add-ADGroupMember -Identity "CN=groupusers,CN=Builtin,DC=domain,DC=local" $_.sAMAccountname
