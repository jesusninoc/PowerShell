#Fechas y propiedades
(Get-Date)
(Get-Date).Year

#Fecha en formato string
$fecha=(Get-Date).Year.tostring()+(Get-Date).Month.tostring()+(Get-Date).Day.tostring()
$fecha

(Get-Date).ToString("yyyyMMdd")
(Get-Date).ToString("ddMMyyyy")

#Fecha un día menos
(Get-Date).AddDays(-1)
(Get-Date).AddDays(-1).ToString("ddMMyyyy")

#Listado de fechas, mostrar fechas de la semana pasada de lunes a domingo
-2..-8 | % {(Get-Date).AddDays($_).ToString("ddMMyyyy")}

#Crear carpeta para cada fecha de la semana pasada
-2..-8 | % {mkdir (Get-Date).AddDays($_).ToString("ddMMyyyy") -WhatIf}
