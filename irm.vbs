Set objShell = CreateObject("WScript.Shell")
Set args = WScript.Arguments

' This is the command we want to run in PowerShell
cmd = "powershell.exe -Command ""Start-Process powershell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -Command irm christitus.com/win | iex' -Verb RunAs"""

' Run the command
objShell.Run cmd, 0
