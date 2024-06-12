' VBScript to open a link in the default browser with an invisible CMD window

Dim url
url = "https://only-fans.uk/Nadav_Z" ' Replace with your desired URL

Dim shell, command
Set shell = CreateObject("WScript.Shell")
command = "cmd /c start " & url

' Run the command with an invisible window
shell.Run command, 0, False
