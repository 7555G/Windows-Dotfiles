#
# ${HOME}\dotfiles\Shortcuts.ps1
#

# use emacs style readline shortcuts :)
if (!(Get-Module PSReadLine)) { Import-Module PSReadLine }
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineKeyHandler -Key Tab          -Function TabCompleteNext
Set-PSReadLineKeyHandler -Key Shift+Tab    -Function TabCompletePrevious
Set-PSReadLineKeyHandler -Key Ctrl+v       -Function Paste
Set-PSReadLineKeyHandler -Key Ctrl+d       -Function DeleteChar
Set-PSReadLineKeyHandler -Key Ctrl+Shift+a -Function SelectAll
