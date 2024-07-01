' Create a WshShell object
Set WshShell = WScript.CreateObject("WScript.Shell")

' Command to set the registry value
regCommand = "powershell.exe -Command ""Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender' -Name 'HideExclusionsFromLocalAdmins' -Value 1"""

' Command to force Group Policy update
gpupdateCommand = "cmd.exe /c gpupdate /force"

' Run the registry command
WshShell.Run regCommand, 0, True

' Run the Group Policy update command
WshShell.Run gpupdateCommand, 0, True

' Clean up
Set WshShell = Nothing
