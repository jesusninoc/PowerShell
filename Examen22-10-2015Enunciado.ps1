#Examen 22-10-2015

#Crear una función para:
#-Listar todos los procesos
#-Mostrar los 5 primeros procesos
#-Mostrar los 5 últimos procesos
#-Ordenar todos los procesos por CPU de forma descendente
#-Mostrar los 5 procesos cuyo consumo (el que quieras utilizar) sea mayor que el valor que quieras monitorizar
#-Agrupar los procesos y muestrar los que sean svchost

#Los comandos para conocer si un servicio está running es:
#Get-Service -DisplayName PPP(nombre de servicio)
#La relación entre procesos y servicios se obtiene:
#Get-WmiObject -Class Win32_Service | Select-Object Name,ProcessID
#-Indica qué servicios no se están ejecutando
#-Indica qué qué servicios se están ejecutando en relación con los procesos

#Para conocer la ruta del programa es:
#Get-Process -Id NNN(id del proceso) -FileVersionInfo
#-Intentar introducir un fichero en la ruta en donde se ejecutan los procesos.

#Detectar relaciones entre los procesos y los hilos
#(Get-WmiObject -Class Win32_Thread) | Select-Object ProcessHandle,ThreadState | Sort-Object ProcessHandle
#*(Get-Process).Threads | Select-Object Id,ThreadState | Sort-Object Id

#Indicar la prioridad de los procesos que se ejecutan
#Ayuda: *| Format-Table -view PPP
