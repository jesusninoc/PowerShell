Números del 1 al 254
1..254|%{$_}

#IP cuarto octeto del 1 al 254
1..254|%{"192.168.1."+$_}

#IP almacenada en una variable
1..254|%{$ip="192.168.1."+$_;$ip}

#Ping a la IP almacenada en una variable
1..254|%{$ip="192.168.1."+$_;ping $ip}

#Resultado del Ping a una IP almacenando en una variable
1..254|%{
$ip="192.168.1."+$_
$resultadoping=ping $ip
$resultadoping
}

#Si el resultado del ping es inaccesible o accesible mostrar el mensaje
1..254|%{
$ip="192.168.1."+$_
$resultadoping=ping $ip
$resultadoping
if($resultadoping -match 'inaccesible')
{"Inaccesible"}
else
{"Accesible"}
}

#Si el resultado del ping es accesible (aparece la palabra tiempo) se muestra la IP
1..254|%{
$ip="192.168.1."+$_
$resultadoping=ping $ip
$resultadoping
if($resultadoping -match 'tiempo')
{"Accesible"}
else
{"Inaccesible"}
}

#Si el ping a la IP responde, hacer petición web (Invoke-WebRequest) y abrir Chrome con la IP
1..254|%{
$ip="192.168.1."+$_
$resultadoping=ping $ip
$resultadoping
if($resultadoping -match 'tiempo')
{
    $ip
    "Accesible"
    (Invoke-WebRequest $ip)
    Start-Process Chrome $ip
}
else
{
    $ip
    "Inaccesible"
}
}

#Si el ping a la IP responde, hacer petición web (Invoke-WebRequest), abrir Chrome con la IP y realizar captura de pantalla de Chrome
1..254|%{
$ip="192.168.1."+$_
$resultadoping=ping $ip
$resultadoping
if($resultadoping -match 'tiempo')
{
    $ip
    "Accesible"
    (Invoke-WebRequest $ip)
    Start-Process Chrome $ip
    $path=’F:\power\'+$ip+'.bmp’
    $Bitmap=New-Object System.Drawing.Bitmap([System.Windows.Forms.Screen]::PrimaryScreen.Bounds.Width, [System.Windows.Forms.Screen]::PrimaryScreen.Bounds.Height)
    $Graphics=[System.Drawing.Graphics]::FromImage($Bitmap)
    $Graphics.CopyFromScreen((New-Object System.Drawing.Point(0,0)), (New-Object System.Drawing.Point(0,0)), $Bitmap.Size)
    $Graphics.Dispose()
    $Bitmap.Save($path,'Bmp')
}
else
{
    $ip
    "Inaccesible"
}
}
