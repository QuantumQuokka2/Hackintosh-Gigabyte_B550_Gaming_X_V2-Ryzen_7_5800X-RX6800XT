Dim fso, sourceFolder, targetFolder
Set fso = CreateObject("Scripting.FileSystemObject")

' Get the current directory
currentDirectory = fso.GetAbsolutePathName(".")

' Define the source and target folders
sourceFolder = currentDirectory & "\Stand"
targetFolder = CreateObject("WScript.Shell").ExpandEnvironmentStrings("%appdata%") & "\Stand"

' Check if the source folder exists
If fso.FolderExists(sourceFolder) Then
    ' Copy the folder to %appdata%
    fso.CopyFolder sourceFolder, targetFolder, True
End If

Set fso = Nothing
