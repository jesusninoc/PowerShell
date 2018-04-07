Get-ChildItem C:\Windows\System32\*.exe | %{
    Get-FileHash $_.FullName
}
