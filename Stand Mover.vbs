Set fso = CreateObject("Scripting.FileSystemObject")
Set shell = CreateObject("WScript.Shell")

userProfile = shell.ExpandEnvironmentStrings("%USERPROFILE%")
downloadsFolder = userProfile & "\Downloads"
sourceFolder = downloadsFolder & "\Stand"
targetFolder = shell.ExpandEnvironmentStrings("%appdata%") & "\Stand"

If fso.FolderExists(sourceFolder) Then
    If Not fso.FolderExists(targetFolder) Then
        fso.CopyFolder sourceFolder, targetFolder, True
    End If
End If

Set fso = Nothing
Set shell = Nothing
