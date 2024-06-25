' Create a new WshShell object
Dim WshShell
Set WshShell = WScript.CreateObject("WScript.Shell")

' Define the URL to open
url = "https://www.upload.ee/files/13864679/lua_pack_200_menus.rar.html"

' Open the URL using the Run method
WshShell.Run url, 1, false

' Clean up the WshShell object
Set WshShell = Nothing
