#######################################################
#Analizar el contenido de una página web con PowerShell
#######################################################

#Listado de las propiedades y métodos de Invoke-WebRequest
(Invoke-WebRequest "http://www.jesusninoc.com") | Get-Member

#Información sobre la petición web a un servidor
(Invoke-WebRequest "http://www.jesusninoc.com").BaseResponse

#Obtener los formularios que tiene una página web
(Invoke-WebRequest "https://www.jesusninoc.com/contact/").Forms

#Mostrar los campos de los formularios de una página web
(Invoke-WebRequest "https://www.jesusninoc.com/contact/").Forms | Select-Object Fields | Format-Custom

#Mostrar los campos de los formularios de una página web
(Invoke-WebRequest "https://www.jesusninoc.com/contact/").InputFields | Format-Custom

#Mostrar las cabeceras de un servidor web
(Invoke-WebRequest "https://www.jesusninoc.com/contact/").Headers

#Obtener las imágenes que tiene una página web
(Invoke-WebRequest "https://es.pinterest.com/microsoft/you-inspire-us/").Images

#Seleccionar información sobre enlaces de una página web
(Invoke-WebRequest "http://www.jesusninoc.com").Links

#Seleccionar los href de los enlaces
((Invoke-WebRequest "http://www.jesusninoc.com").Links).href

#Recorrer el primer nivel de un sitio web y obtener información de todos los enlaces del sitio
$url="http://www.jesusninoc.com"
foreach($links in (Invoke-WebRequest $url).Links.href){($links,(Invoke-WebRequest $links).RawContentLength,1)}

#Mostrar el contenido de la web en bruto
(Invoke-WebRequest "http://www.jesusninoc.com").RawContent

#Tamaño de la respuesta a la petición web
(Invoke-WebRequest "http://www.jesusninoc.com").RawContentLength

#Listado de scripts que hay en una página web
(Invoke-WebRequest "http://www.jesusninoc.com").Scripts

#Código de estado
(Invoke-WebRequest "http://www.jesusninoc.com").StatusCode

#Estado de la petición
(Invoke-WebRequest "http://www.jesusninoc.com").StatusDescription
