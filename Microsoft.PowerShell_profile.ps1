# 
# ${PROFILE}
#

# set $PATH
$env:Path = $env:Path + "${HOME}\bin"

# set custom prompt
function Prompt {"$(Get-Location | Split-Path -Leaf) "}

# disable default aliases
#Remove-Item alias:curl # which is "Invoke-WebRequest"
Remove-Item -Force alias:diff
Remove-Item -Force Alias:cd

# use vim to run gvim
Set-Alias -Name vim -Value gvim

# 'cd' follows ".lnk" shortcuts
Function cd {
    [CmdletBinding()]
    param([string][Parameter(Mandatory = $true)]${Target})

    if($Target.EndsWith(".lnk")) {
        $sh = New-Object -com wscript.shell
        $Fullpath = Resolve-Path $Target
        $TargetPath = $sh.CreateShortcut($fullpath).TargetPath
        Set-Location $TargetPath
    }
    else {
        Set-Location $Target
    }
}

# 'ln' for powershell
function ln {
    [CmdletBinding()]
    param(
        [string][Parameter(Mandatory = $true, Position = 0)]
        ${ItemType},
        [string][Parameter(Mandatory = $true, Position = 1)]
        ${Target},
        [string][Parameter(Mandatory = $true, Position = 2)]
        ${Link},
        [string[]][Parameter(Position = 3, ValueFromRemainingArguments)]
        ${Remaining}
    )

    # check the link is a directory or file
    if (Test-Path -Path ${Link} -PathType Container) {
        ${LinkPath} = Resolve-Path ${Link}
        ${LinkName} = Split-Path ${Target} -Leaf
    } else {
        ${LinkPath} = Resolve-Path $( Split-Path ${Link} -Parent )
        ${LinkName} = Split-Path ${Link} -Leaf
    }
    ${Target} = Resolve-Path ${Target}

    ${NewItemParameters} = @{
        ItemType = ${ItemType}
        Path = ${LinkPath}
        Name = ${LinkName}
        Value = ${Target}
    }

    #$NewItemParameters
    Invoke-Expression "New-Item @NewItemParameters ${Remaining}"
}

# 'which' for powershell
function which {
    [CmdletBinding()]
    param([string][Parameter(Mandatory = $true)]${Target})

    Get-Command ${Target} -Syntax
}

# 'killall' for powershell
function killall {
    [CmdletBinding()]
    param([string][Parameter(Mandatory = $true)]${Target})

    Stop-Process -Name ${Target} -Force
}
