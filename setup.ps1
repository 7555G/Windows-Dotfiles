#
# ~/dotfiles/setup.ps1
#

${filesPaths} =
  "${HOME}\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1",
  "${HOME}\Documents\readline_shortcuts.ahk",
  "${HOME}\_gvimrc",
  "${HOME}\_vimrc"
${dotfilesDir} = "${PSScriptRoot}"

${extFilesPaths} =
  "${HOME}\vimfiles\after",
  "${HOME}\vimfiles\colors"
${extDotfilesDir} = "${HOME}\freebsd_dotfiles\vim"

function Make-Symlinks(${filesPaths}, ${dotfilesDir}) {

    foreach(${filePath} in ${filesPaths}) {
        ${fileParentDir} = Split-Path ${filePath}
        ${fileName} = Split-Path ${filePath} -Leaf
        ${dotfilePath} = "${dotfilesDir}\${fileName}"
        ${isDir} = Test-Path ${dotfilePath} -PathType Container

        # skip if the dotfile is not found
        If (!(Test-Path ${dotfilePath})) {
            "Skipped: ${dotfilePath}"
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

            "Replacing existing symlink."
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

Make-Symlinks ${filesPaths} ${dotfilesDir}
Make-Symlinks ${extFilesPaths} ${extDotfilesDir}
