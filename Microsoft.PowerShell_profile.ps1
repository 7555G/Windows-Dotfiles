# 
# ~\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1
#

# set $PATH
$env:Path = $env:Path + "$HOME\bin"

# set custom prompt
function prompt {"$(Get-Location | Split-Path -Leaf) "}

# disable default aliases
remove-item alias:curl # which is "Invoke-WebRequest"
remove-item -Force alias:diff

# use vim to run gvim
Set-Alias -Name vim -Value gvim

# 'cd' follows ".lnk" shortcuts
remove-item -force alias:cd

function cd($target) {
    if($target.EndsWith(".lnk")) {
        $sh = new-object -com wscript.shell
        $fullpath = resolve-path $target
        $targetpath = $sh.CreateShortcut($fullpath).TargetPath
        set-location $targetpath
    }
    else {
        set-location $target
    }
}

# 'ln' for powershell
function ln() {
    param(
        [string][Parameter(Mandatory = $true, Position = 0)]
        ${ItemType},
        [string][Parameter(Mandatory = $true, Position = 1)]
        ${Target},
        [string][Parameter(Mandatory = $true, Position = 2)]
        ${Link},
        [string[]][Parameter(Position=3, ValueFromRemainingArguments)]
        ${Remaining}
    )

    ${LinkPath} = Split-Path -Parent ${Link}
    ${LinkName} = Split-Path -Leaf ${Link}

    ${Command} = "New-Item -ItemType ${ItemType} -Path ${LinkPath}
        -name ${LinkName} -value ${Target}
        ${Remaining}".replace("`r`n", " ")
    Invoke-Expression ${Command}
}

# 'which' for powershell
function which(${target}) {
    Get-Command ${target} -Syntax
}

# 'killall' for powershell
function killall(${target}) {
    Stop-Process -Name ${target} -Force
}
