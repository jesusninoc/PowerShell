#Obtener MD5 para una cadena
[Reflection.Assembly]::LoadWithPartialName("System.Web")
[System.Web.Security.FormsAuthentication]::HashPasswordForStoringInConfigFile("Hola", "MD5")
[System.Web.Security.FormsAuthentication]::HashPasswordForStoringInConfigFile("hola", "MD5")
