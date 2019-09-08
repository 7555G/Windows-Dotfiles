# This is a powershell script, run with administrator privileges.

# Request Administrative Privileges
function Check-Admin {
    try {
        ${UserIdentity} =
            [Security.Principal.WindowsIdentity]::GetCurrent()
        ${CurrentUser} =
            New-Object Security.Principal.WindowsPrincipal ${UserIdentity}
        ${AdminRole} =
            [Security.Principal.WindowsBuiltinRole]::Administrator

        Return ${CurrentUser}.IsInRole(${AdminRole})
    } catch {
        throw "Failed to determine admin privileges. Error '{0}' " -f $_
    }
}

# if not running in Admin mode rerun as administrator
if ((Check-Admin) -eq $false)  {
    ${PowershellArguments} = @{
        NoProfile = $true
        NoExit = $true
        Elevated = $true
        File = ${PSCommandPath}
    }
    ${StartProcesParameters} = @{
        FilePath = 'powershell.exe'
        Verb = "RunAs"
        ArgumentList = ${PowershellArguments}
    }

    Start-Process @StartProcesParameters
    exit
}

# Reverse mouse wheel vertical scroll FlipFlopWheel = 1
Get-ItemProperty HKLM:\SYSTEM\CurrentControlSet\Enum\HID\*\*\Device` Parameters FlipFlopWheel -EA 0 | ForEach-Object { Set-ItemProperty $_.PSPath FlipFlopWheel 1 }

# Reverse mouse wheel horizontal scroll FlipFlopHScroll = 1
Get-ItemProperty HKLM:\SYSTEM\CurrentControlSet\Enum\HID\*\*\Device` Parameters FlipFlopHScroll -EA 0 | ForEach-Object { Set-ItemProperty $_.PSPath FlipFlopHScroll 1 }

Start-Sleep -Seconds 5
