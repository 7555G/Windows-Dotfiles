# 
# ${PROFILE}
#

# source script with my functions
. ~/dotfiles/Functions.ps1

# source script with my colors
. ~/dotfiles/Colors.ps1

# source script with my shortcuts
. ~/dotfiles/Shortcuts.ps1

# chocolatey profile
${ChocolateyProfile} =
    "${env:ChocolateyInstall}\helpers\chocolateyProfile.psm1"
if (Test-Path ${ChocolateyProfile}) {
  Import-Module ${ChocolateyProfile}
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
alias     which     "Get-Command -Syntax"
alias     killkll   "Stop-Process -Force -Name"
alias     New-Shell "Start-Process pwsh -ArgumentList '-NoLogo'"
