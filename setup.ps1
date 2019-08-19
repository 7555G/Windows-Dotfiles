#
# ~/Dotfiles/setup.ps1
#

${DotfilesDir} = "${PSScriptRoot}"
${Dotfiles} = @{
    '_gvimrc' = @{
        DotfileParentDir = "${DotfilesDir}"
        FileParentDir = "${HOME}"}
    '_vimrc' = @{
        DotfileParentDir = "${DotfilesDir}"
        FileParentDir = "${HOME}"}
    'Microsoft.PowerShell_profile.ps1' = @{
        DotfileParentDir = "${DotfilesDir}"
        FileParentDir = "${HOME}\Douments\WindowsPowerShell"}
    'after' = @{
        DotfileParentDir = "${HOME}\freebsd_Dotfiles\vim"
        FileParentDir = "${HOME}\vimfiles")}
    'colors' = @{
        DotfileParentDir = "${HOME}\freebsd_Dotfiles\vim"
        FileParentDir = "${HOME}\vimfiles"}
}

function Make-Symlinks(${Dotfiles}) {
    foreach(${DotfileName} in ${Dotfiles}.Keys) {
        ${FileParentDir} =
            $( ${Dotfiles}[${DotfileName}]['FileParentDir'] )
        ${DotfileParentDir} =
            $( ${Dotfiles}[${DotfileName}]['DotfileParentDir'] )
        ${FilePath} = ${FileParentDir}\${DotfileName}
        ${DotfilePath} = ${DotfileParentDir}\${DotfileName}
        ${IsDir} = Test-Path ${DotfilePath} -PathType Container

        # skip if the Dotfile is not found
        if (!(Test-Path ${DotfilePath})) {
            "!! Skipped:`r`n${DotfilePath}"
            continue
        }

        # prepare path
        if (Test-Path ${FilePath}) {
            # delete possible existing symlinks
            if ($IsDir) {
                cmd /c rmdir /s /q ${FilePath}
            } else {
                rm ${FilePath}
            }

            "!! Replacing existing symlink:"
        } elseIf (!(Test-Path ${FileParentDir})) {
            # create parent directory if needed
            mkdir ${FileParentDir} > $Null
            "Created directory: ${FileParentDir}"
        }

        # make new symlink
        if ($IsDir) {
            cmd /c mklink /D ${FilePath} ${DotfilePath}
        } else {
            cmd /c mklink ${FilePath} ${DotfilePath}
        }
    }
}

Make-Symlinks ${Dotfiles}
