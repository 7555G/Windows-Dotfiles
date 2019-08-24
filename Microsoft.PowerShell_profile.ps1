# 
# ${PROFILE}
#

# use emacs style readline shortcuts :)
if (!(Get-Module PSReadLine)) { Import-Module PSReadLine }
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineKeyHandler -Key Tab          -Function TabCompleteNext
Set-PSReadLineKeyHandler -Key Shift+Tab    -Function TabCompletePrevious
Set-PSReadLineKeyHandler -Key Ctrl+v       -Function Paste
Set-PSReadLineKeyHandler -Key Ctrl+d       -Function DeleteChar
Set-PSReadLineKeyHandler -Key Ctrl+Shift+a -Function SelectAll

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
Set-Alias open    start
Set-Alias ex      explorer
Set-Alias vim     gvim
function  which     { Get-Command -Syntax $args }
function  killall   { Stop-Process -Force -Name $args }
function  New-Shell { Start-Process pwsh -ArgumentList "-NoLogo" }
