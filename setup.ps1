#
# ~/dotfiles/setup.ps1
#

${filesPaths} =
    "${HOME}\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1",
    "${HOME}\Documents\readline_shortcuts.ahk",
    "${HOME}\_gvimrc",
    "${HOME}\_vimrc"
${dotfilesDir} = "${PSScriptRoot}"

foreach(${filePath} in ${filesPaths}) {
    ${fileDir} = Split-Path ${filePath}
    ${fileName} = Split-Path ${filePath} -leaf
    ${dotfilePath} = "${dotfilesDir}\${fileName}"

    # prepare path
    if (Test-Path ${filePath}) {
        # delete possible existing symlinks
        rm ${filePath}
        "Replacing existing file: ${filePath}"
    } ElseIf (!(Test-Path ${fileDir})) {
        # create parent directory if needed
        "Created directory: ${fileDir}"
        mkdir ${fileDir}
    }

    # make new symlink
    cmd /c mklink ${filePath} ${dotfilePath}
}
