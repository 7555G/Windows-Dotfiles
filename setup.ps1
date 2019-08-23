#
# ~/Dotfiles/setup.ps1
#

${DotfilesDir} = "${PSScriptRoot}"
${Links} = @{
    "${HOME}\_gvimrc" =
    "${DotfilesDir}\_gvimrc"

    "${HOME}\_vimrc" =
    "${DotfilesDir}\_gvimrc"

    "${PROFILE}" =
    "${DotfilesDir}\Microsoft.PowerShell_profile.ps1"

    "${HOME}\vimfiles\after" =
    "${HOME}\freebsd_dotfiles\vim\after"

    "${HOME}\vimfiles\colors" =
    "${HOME}\freebsd_dotfiles\vim\colors"

    "${HOME}\bin\schemes\mushin.ini" =
    "${DotfilesDir}\colorschemes\mushin.ini"
}

function Make-Symlinks(${Dotfiles}) {
    foreach (${FilePath} in ${Links}.Keys) {
        # skip if the dotfile is not found
        if (!(Test-Path ${Links}[${FilePath}])) {
            "`r`n!! Skipped:"
            "$( ${Links}[${FilePath}] )"
            continue
        }

        # replacement warnign
        if (Test-Path ${FilePath}) {
            "`r`n!! Replacing existing symlink:"
        }

        # make symlink
        ${NewItemParameters} = @{
            ItemType = 'SymbolicLink'
            Path = Split-Path ${FilePath} -Parent 
            Name = Split-Path ${FilePath} -Leaf
            Value = ${Links}[${FilePath}]
            Force = $true
        }

        New-Item @NewItemParameters
    }
}

Make-Symlinks ${Dotfiles}
