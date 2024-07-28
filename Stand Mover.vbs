Dim fso, sourceFolder, targetFolder, downloadsFolder
Set fso = CreateObject("Scripting.FileSystemObject")

' Get the Downloads directory
downloadsFolder = CreateObject("WScript.Shell").SpecialFolders("Downloads")

' Define the source and target folders
sourceFolder = downloadsFolder & "\Stand"
targetFolder = CreateObject("WScript.Shell").ExpandEnvironmentStrings("%appdata%") & "\Stand"

' Check if the source folder exists
If fso.FolderExists(sourceFolder) Then
    ' Check if the target folder already exists
    If Not fso.FolderExists(targetFolder) Then
        ' Copy the folder to %appdata% if it doesn't exist
        fso.CopyFolder sourceFolder, targetFolder, True
    End If
End If

Set fso = Nothing
