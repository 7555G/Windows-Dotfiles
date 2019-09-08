#
# ${HOME}\Dotfiles\Setup.ps1
#

${DotfilesDir} = "${PSScriptRoot}"

# source script with my functions
. "${DotfilesDir}\Functions.ps1"

${Targets} = @{
    "${PROFILE}" =
    "${DotfilesDir}\Profile.ps1"

    "${HOME}\_gvimrc" =
    "${DotfilesDir}\vimrc"

    "${HOME}\_vimrc" =
    "${DotfilesDir}\vimrc"

    "${HOME}\vimfiles" =
    "${HOME}\freebsd_dotfiles\vim\*"

    "${HOME}\AppData\Local\lf\lfrc" =
    "${DotfilesDir}\lfrc"
}

function Make-Symlinks(${Dotfiles}) {
    foreach (${Link} in ${Targets}.Keys) {
        # skip if the dotfile is not found
        if (!(Test-Path ${Targets}[${Link}])) {
            "`r`n!! Skipped:"
            "$( ${Targets}[${Link}] )"
            continue
        }

        ${LinkParent} = Split-Path ${Link} -Parent
        if (Test-Path ${Link}) {
            # show replacement warning if needed
            "`r`n!! Replacing existing symlink:"
        } elseif (!(Test-Path ${LinkParent})) {
            # create parent directory if needed
            mkdir ${LinkParent} > $null
            "Created directory: ${LinkParent} )"
        }

        # make symlink
        #${NewItemParameters} = @{
        #    ItemType = 'SymbolicLink'
        #    Path = Split-Path ${Link} -Parent 
        #    Name = Split-Path ${Link} -Leaf
        #    Value = ${Targets}[${Link}]
        #    Force = $true
        #}
        #
        #New-Item @NewItemParameters

        ln SymbolicLink ${Targets}[${Link}] ${Link} -Force
    }
}

Make-Symlinks ${Dotfiles}
