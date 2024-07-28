' VBScript to move a folder named "Stand" to the %appdata% location silently

Option Explicit

Dim objFSO, sourceFolder, destFolder, appDataFolder

' Create a FileSystemObject
Set objFSO = CreateObject("Scripting.FileSystemObject")

' Get the %appdata% folder path
appDataFolder = CreateObject("WScript.Shell").ExpandEnvironmentStrings("%appdata%")

' Define the source folder path (current directory + "\Stand")
sourceFolder = objFSO.GetAbsolutePathName(".") & "\Stand"

' Define the destination folder path
destFolder = appDataFolder & "\Stand"

' Check if the source folder exists
If objFSO.FolderExists(sourceFolder) Then
    ' Check if the destination folder exists
    If Not objFSO.FolderExists(destFolder) Then
        ' Create the destination folder if it does not exist
        objFSO.CreateFolder(destFolder)
    End If

    ' Move the folder
    objFSO.MoveFolder sourceFolder, destFolder
End If

' Clean up
Set objFSO = Nothing
