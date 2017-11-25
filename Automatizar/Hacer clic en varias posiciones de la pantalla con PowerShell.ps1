#Ver las coordenadas del ratón en la pantalla
[System.Windows.Forms.Cursor]::Position

#Mover la posición del ratón a las coordenadas 100,100
[System.Windows.Forms.Cursor]::Position = New-Object System.Drawing.Point(100,100)

#Mover la posición del ratón a las coordenadas 100,100 y hacer clic
#Primero mover el ratón a la coordenada 100,100
[System.Windows.Forms.Cursor]::Position = New-Object System.Drawing.Point(100,100)
#Hacer clic con las siguientes funciones
$MouseEventSig=@'
[DllImport("user32.dll",CharSet=CharSet.Auto, CallingConvention=CallingConvention.StdCall)]
public static extern void mouse_event(long dwFlags, long dx, long dy, long cButtons, long dwExtraInfo);
'@
$MouseEvent = Add-Type -memberDefinition $MouseEventSig -name "MouseEventWinApi" -passThru
$MouseEvent::mouse_event(0x00000002, 0, 0, 0, 0)
$MouseEvent::mouse_event(0x00000004, 0, 0, 0, 0)

#Almacenar en un fichero coordenadas
"100,100" | Out-File posiciones
"200,100" | Out-File posiciones -Append

#Leer de un fichero coordenadas
Get-Content posiciones

#Leer varias coordenadas de un fichero separando la coordenada X y la coordenada Y
Get-Content posiciones | % {
    "X:"+$_.split(",")[0]
    "Y:"+$_.split(",")[1]
}

#Leer coordenadas de un fichero y hacer clic
#Hacer clic con las siguientes funciones
$MouseEventSig=@'
[DllImport("user32.dll",CharSet=CharSet.Auto, CallingConvention=CallingConvention.StdCall)]
public static extern void mouse_event(long dwFlags, long dx, long dy, long cButtons, long dwExtraInfo);
'@
$MouseEvent = Add-Type -memberDefinition $MouseEventSig -name "MouseEventWinApi" -passThru
#Leer varias coordenadas de un fichero
Get-Content posiciones | % {
    [System.Windows.Forms.Cursor]::Position = New-Object System.Drawing.Point($_.split(",")[0],$_.split(",")[1])
    $MouseEvent::mouse_event(0x00000002, 0, 0, 0, 0)
    $MouseEvent::mouse_event(0x00000004, 0, 0, 0, 0)
    #Esperar 5 segundos entre clic y clic
    Start-Sleep -Seconds 5
}
