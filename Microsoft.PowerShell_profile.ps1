# 
# ~\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1
#

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
function ln(${opt}, ${target}, ${link}) {
    cmd /c mklink ${opt} ${link} ${target}
    if ($LASTEXITCODE -ne 0) {
        "ln [[/D] | [/H] | [/J/]] Target Link"
    }
}

# 'which' for powershell
function which(${target}) {
    Get-Command ${target} -Syntax
}

# 'killall' for powershell
function killall(${target}) {
    Stop-Process -Name ${target} -Force
}
