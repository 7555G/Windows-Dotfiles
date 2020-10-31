# 
# ${PROFILE}
#

# source script with my functions
. ~/dotfiles/Functions.ps1

# source script with my colors
. ~/dotfiles/Colors.ps1

# source script with my shortcuts
. ~/dotfiles/Shortcuts.ps1

# import modules
${ChocolateyProfile} = # chocolatey profile
    "${env:ChocolateyInstall}\helpers\chocolateyProfile.psm1"
if (Test-Path ${ChocolateyProfile}) {
  Import-Module ${ChocolateyProfile}
}

if (Get-InstalledModule Get-ChildItemColor) {
    Import-Module Get-ChildItemColor
} else {
    Install-Module -AllowClobber Get-ChildItemColor
}

# set $PATH
$env:PATH += ";${HOME}\bin"

# set custom prompt
function Prompt {"$( Get-Location | Split-Path -Leaf ) "}

# disable default aliases
#Remove-Item alias:curl # originally "Invoke-WebRequest"
Remove-Item alias:diff -Force
Remove-Item alias:cd
Remove-Item alias:rm

# aliases
Set-Alias open      start
Set-Alias ex        explorer
Set-Alias vim       gvim
Set-Alias less      more
alias     New-Shell "Start-Process pwsh -ArgumentList '-NoLogo'"
alias     which     "Get-Command -Syntax"
alias     killall   "Stop-Process -Force -Name"
alias     touch     "New-Item -ItemType File"
