#Posible solución...

#Almacenar en un fichero los dispositivos que suelen conectarse
#(Get-PnpDevice | Where-Object {$_.FriendlyName -EQ 'Dispositivo de almacenamiento USB'}).InstanceId | Out-File usb.txt
#Almacenar en un fichero las letras de unidades que se suelen usar
(Get-Partition | Where-Object Type -EQ "Basic").DriveLetter | Out-File unidades.txt

#Ver los dispositivos conectados y si hay uno nuevo listar unidades de disco y realizar copia recursiva
gc .\usb.txt | %{
    #$_
    if((Get-PnpDevice | Where-Object {$_.FriendlyName -EQ 'Dispositivo de almacenamiento USB'}).InstanceId -contains $_)
    {
        #"USB conocido"
    }
    else
    {
        "USB extraño, copiar contenido"
        #Si la letra de la unidad es nueva copiamos contenido
        gc .\unidades.txt | %{
            if((Get-Partition | Where-Object Type -EQ "Basic").DriveLetter -contains $_)
            {
                "Unidad $_ conocida"
            }
            else
            {
                "Unidad $_ desconocida, copiar contenido en c:\temp"
                Copy-Item $_ -Destination c:\temp\usb\ -Force -Recurse -WhatIf
            }
        }
    }
}
