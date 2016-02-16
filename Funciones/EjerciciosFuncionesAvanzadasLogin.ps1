#Login de user y pass
#El user y pass correcto se escriben en el bloque BEGIN

function login0
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
    $usercorrecto="user"
    $passcorrecto="pass"
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
