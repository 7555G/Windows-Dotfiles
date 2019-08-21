# 
# ${PROFILE}
#

# source script with my functions
. ~/dotfiles/Functions.ps1

# set $PATH
$env:Path = $env:Path + ";${HOME}\bin"

# set custom prompt
function Prompt {"$(Get-Location | Split-Path -Leaf) "}

# disable default aliases
#Remove-Item alias:curl # originally "Invoke-WebRequest"
Remove-Item alias:diff -Force
Remove-Item alias:cd
Remove-Item alias:rm

# aliases
alias vim     'gvim'
alias ex      'explorer'
alias which   'Get-Command -Syntax'
alias killall 'Stop-Process -Force -Name'
