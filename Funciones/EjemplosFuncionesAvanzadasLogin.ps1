#################################################################################
#Función 1
#Función que muestra por pantalla dos textos

#Ejecutar la función
#PS C:\Users\usuario> funcion1 Hola Carlos

function funcion1
{
  param
  (
    [Parameter(Mandatory=$true, ValueFromPipeline=$true)]
    [String[]]
    [AllowEmptyString()] 
    $Text,$Text2
  )

  begin
  {
    
  }

  process
  {
   
  }
  end
  {
    $Text
    $Text2
  }
}
#################################################################################
#Función 2
#Función que comprueba si un nombre de usuario es correcto

#Ejecutar la función
#PS C:\Users\usuario> funcion2 Carlos

function funcion2
{
  param
  (
    [Parameter(Mandatory=$true, ValueFromPipeline=$true)]
    [String[]]
    [AllowEmptyString()] 
    $Text
  )

  begin
  {
    
  }

  process
  {
   if($Text -eq "Carlos")
    {
        Write-Host "User correcto"
    }
  }
  end
  {
    Write-Host "Fin de login"
  }
}
#################################################################################
#Función 3
#Función que comprueba si un nombre de usuario es correcto

#Ejecutar la función
#PS C:\Users\usuario> funcion3 Carlos

function funcion3
{
  param
  (
    [Parameter(Mandatory=$true, ValueFromPipeline=$true)]
    [String[]]
    [AllowEmptyString()] 
    $Text
  )

  begin
  {
    Write-Host "Principio de login"
  }

  process
  {
   if($Text -eq "Carlos")
    {
        Write-Host "User correcto"
    }
  }
  end
  {
    Write-Host "Fin de login"
  }
}
#################################################################################
#Función 4
#Función que comprueba un nombre de usuario y una contraseña

#Ejecutar la función
#PS C:\Users\usuario> funcion4 Carlos Contraseña

function funcion4
{
  param
  (
    [Parameter(Mandatory=$true, ValueFromPipeline=$true)]
    [String[]]
    [AllowEmptyString()] 
    $User,$Pass
  )

  begin
  {
    Write-Host "Principio de login"
  }

  process
  {
   if($User -eq "Carlos" -and $Pass -eq "Contraseña")
    {
        Write-Host "User correcto"
    }
    else
    {
        Write-Host "User no correcto"
    }
  }
  end
  {
    Write-Host "Fin de login"
  }
}
#################################################################################
#Función 5
#Función que comprueba un nombre de usuario y una contraseña

#Ejecutar la función
#PS C:\Users\usuario> funcion4 Carlos Contraseña

function funcion5
{
  param
  (
    [Parameter(Mandatory=$true, ValueFromPipeline=$true)]
    [String[]]
    [AllowEmptyString()] 
    $User,$Pass
  )

  begin
  {
    Write-Host "Principio de login"
    $usercorrecto="Carlos"
    $passcorrecto="Contraseña"
  }

  process
  {
   if($User -eq $usercorrecto -and $Pass -eq $passcorrecto)
    {
        $ok=1
    }
    else
    {
        $ok=0
    }
  }
  end
  {
   if($ok)
    {
        Write-Host "User correcto"
    }
    else
    {
        Write-Host "User no correcto"
    }
    Write-Host "Fin de login"
  }
}
#################################################################################
