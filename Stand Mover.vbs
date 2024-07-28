Dim fso, sourceFolder, targetFolder, shell, downloadsFolder
Set fso = CreateObject("Scripting.FileSystemObject")
Set shell = CreateObject("WScript.Shell")

' Get the user's profile path
userProfile = shell.ExpandEnvironmentStrings("%USERPROFILE%")

' Define the Downloads directory
downloadsFolder = userProfile & "\Downloads"

' Define the source and target folders
sourceFolder = downloadsFolder & "\Stand"
targetFolder = shell.ExpandEnvironmentStrings("%appdata%") & "\Stand"

' Check if the source folder exists
If fso.FolderExists(sourceFolder) Then
    ' Check if the target folder already exists
    If Not fso.FolderExists(targetFolder) Then
        ' Copy the folder to %appdata% if it doesn't exist
        fso.CopyFolder sourceFolder, targetFolder, True
    End If
End If

Set fso = Nothing
Set shell = Nothing
