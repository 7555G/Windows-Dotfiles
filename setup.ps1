$dotfiles_dir = "$PSScriptRoot"

#cmd /c mklink "${HOME}\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1" "$dotfiles_dir\Microsoft.PowerShell_profile.psi"
#cmd /c mklink "${HOME}\_gvimrc" "$dotfiles_dir\_gvimrc"
#cmd /c mklink "${HOME}\_vimrc" "$dotfiles_dir\_vimrc"
#cmd /c mklink "${HOME}\Documents\readline_shortcuts.ahk" "$dotfiles_dir\readline_shortcuts.ahk"

"at ${HOME}\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1 to $dotfiles_dir\Microsoft.PowerShell_profile.psi"
"at ${HOME}\_gvimrc to $dotfiles_dir\_gvimrc"
"at ${HOME}\_vimrc to $dotfiles_dir\_vimrc"
"at ${HOME}\Documents\readline_shortcuts.ahk to $dotfiles_dir\readline_shortcuts.ahk"
