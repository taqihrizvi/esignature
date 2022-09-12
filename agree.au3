$application_exe = "esignatur Desktop Setup.exe"
$application_name = "esignatur Desktop Setup"
Sleep(5000)
Run($application_exe)
Sleep(5000)
if ProcessExists($application_exe) Then
    winactivate($application_exe)
EndIf
ControlFocus($application_name,"","Button2")
Sleep(300)
Send("{ENTER}")
Sleep(300)
ControlFocus($application_name,"","Button2")
Sleep(100)
Send("{ENTER}")
Sleep(15000)
Send("{ENTER}")