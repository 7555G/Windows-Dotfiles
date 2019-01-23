# 
# ~\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1
#

# disable default alias for "curl", which is "Invoke-WebRequest"
remove-item alias:curl

# use vim to run gvim
Set-Alias -Name vim -Value gvim

# set custom prompt
function prompt {"$(Get-Location | Split-Path -Leaf) "}
