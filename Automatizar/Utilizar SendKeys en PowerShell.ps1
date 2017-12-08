#Escribir un texto con SendKeys
[System.Windows.Forms.SendKeys]::SendWait("abcdefg")

#Escribir un texto retardado con SendKeys
foreach($letras in [char[]]"abcdefg")
{
[System.Windows.Forms.SendKeys]::SendWait($letras)
Start-Sleep -Milliseconds 60
}

#Utilizar la tecla ctrl con SendKeys
#Copiar un texto
[System.Windows.Forms.SendKeys]::SendWait("^{c}")

#Utilizar la tecla ctrl con SendKeys
#Pegar un texto (utilizar el cmdlet Set-Clipboard para copiar un texto)
Set-Clipboard "hola"
[System.Windows.Forms.SendKeys]::SendWait("^{v}")

#Ejecutar la aplicación Ejecutar
[System.Windows.Forms.SendKeys]::SendWait("^({esc})")
[System.Windows.Forms.SendKeys]::SendWait("ejecutar")
[System.Windows.Forms.SendKeys]::SendWait("{enter}")
Start-Sleep -Seconds 1
[System.Windows.Forms.SendKeys]::SendWait("{esc}")

#Ejecutar PowerShell desde la aplicación Ejecutar
[System.Windows.Forms.SendKeys]::SendWait("^({esc})")
[System.Windows.Forms.SendKeys]::SendWait("ejecutar")
[System.Windows.Forms.SendKeys]::SendWait("{enter}")
Start-Sleep -Seconds 1
[System.Windows.Forms.SendKeys]::SendWait("powershell")
[System.Windows.Forms.SendKeys]::SendWait("{enter}")

#Rotar una pantalla con SendKeys
#Comentar el rotar porque si rota se cierra el grabador de Windows
[System.Windows.Forms.SendKeys]::SendWait("^%({right})")
Start-Sleep -Seconds 1
[System.Windows.Forms.SendKeys]::SendWait("^%({left})")
Start-Sleep -Seconds 1
[System.Windows.Forms.SendKeys]::SendWait("^%({down})")
Start-Sleep -Seconds 1
[System.Windows.Forms.SendKeys]::SendWait("^%({up})")
