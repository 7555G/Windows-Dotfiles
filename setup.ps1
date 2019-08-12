#
# ~/dotfiles/setup.ps1
#

${dotfilesDir} = "${PSScriptRoot}"
${dotfiles} = @{
    '_gvimrc' = @{
        dotfileParentDir = "${dotfilesDir}"};
        fileParentDir = "${HOME}";
    '_vimrc' = @{
        dotfileParentDir = "${dotfilesDir}"};
        fileParentDir = "${HOME}";
    'Microsoft.PowerShell_profile.ps1' = @{
        dotfileParentDir = "${dotfilesDir}"}
        fileParentDir = "${HOME}\Documents\WindowsPowerShell";
    'after' = @{
        dotfileParentDir = "${HOME}\freebsd_dotfiles\vim"};
        fileParentDir = "${HOME}\vimfiles";
    'colors' = @{
        dotfileParentDir = "${HOME}\freebsd_dotfiles\vim"};
        fileParentDir = "${HOME}\vimfiles";
}

function Make-Symlinks(${dotfiles}) {
    foreach(${dotfileName} in ${dotfiles}.keys) {
        ${fileParentDir} =
            "$(${dotfiles}["${dotfileName}"]['fileParentDir'])"
        ${dotfileParentDir} =
            "$(${dotfiles}["${dotfileName}"]['dotfileParentDir'])"
        ${filePath} = "${fileParentDir}\${dotfileName}"
        ${dotfilePath} = "${dotfileParentDir}\${dotfileName}"
        ${isDir} = Test-Path ${dotfilePath} -PathType Container

        # skip if the dotfile is not found
        If (!(Test-Path ${dotfilePath})) {
            "!! Skipped:`r`n${dotfilePath}"
            Continue
        }

        # prepare path
        if (Test-Path ${filePath}) {
            # delete possible existing symlinks
            If ($isDir) {
                cmd /c rmdir /s /q ${filePath}
            } Else {
                rm ${filePath}
            }

            "!! Replacing existing symlink:"
        } ElseIf (!(Test-Path ${fileParentDir})) {
            # create parent directory if needed
            mkdir ${fileParentDir} > $null
            "Created directory: ${fileParentDir}"
        }

        # make new symlink
        If ($isDir) {
            cmd /c mklink /D ${filePath} ${dotfilePath}
        } Else {
            cmd /c mklink ${filePath} ${dotfilePath}
        }
    }
}

Make-Symlinks ${dotfiles}
