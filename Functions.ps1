#
# ${HOME}\dotfiles\Functions.ps1
#

# function to set more flexible aliases
function alias {
    [CmdletBinding()]
    param(
        [string][Parameter(Mandatory = $true, Position = 0)]
        ${Name},
        [string][Parameter(Mandatory = $true, Position = 1)]
        ${Value}
    )

    ${SetFunction} =
        "function global:${Name} {
            [CmdletBinding()]
            param(
                [Parameter(ValueFromRemainingArguments)]
                [string[]]`${Arguments}
            )
            
            if (`${Arguments} -eq `$null) {
                Invoke-Expression `"${value}`"
            } else {
                Invoke-Expression `"${value} `'`${Arguments}`'`"
            }
        }"

    Invoke-Expression ${SetFunction}
}

# 'cd' that follows ".lnk" shortcuts
Function cd {
    [CmdletBinding()]
    param([Parameter(Mandatory = $true)][string]${Target})

    if (${Target}.EndsWith(".lnk")) {
        ${shell} = New-Object -com wscript.shell
        ${Target} = Resolve-Path ${Target}
        ${TargetPath} = ${shell}.
                            CreateShortcut(${Target}).
                            TargetPath
        Set-Location ${TargetPath}
    }
    else {
        Set-Location ${Target}
    }
}

# 'rm' that moves target to Recycle Bin
function rm {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true, ValueFromRemainingArguments)]
        [string[]]${Targets}
    )

    ${Targets} = Resolve-Path ${Targets}
    ${shell} = New-Object -ComObject 'Shell.Application'

    foreach (${Target} in ${Targets}) {
        ${shell}.
            NameSpace(0).
            ParseName(${Target}).
            InvokeVerb('Delete')

        if ($?) {
            "${Target} -> Recycle Bin"
        }
    }
}

# 'ln' for powershell
function ln {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true, Position = 0)]
        [string]${ItemType},
        [Parameter(Mandatory = $true, Position = 1)]
        [string]${Target},
        [Parameter(Mandatory = $true, Position = 2)]
        [string]${Link},
        [Parameter(Position = 3, ValueFromRemainingArguments)]
        [string[]]${Remaining}
    )

    # check the link is a directory or file
    if (Test-Path -Path ${Link} -PathType Container) {
        ${LinkPath} = Resolve-Path ${Link}
        ${LinkName} = Split-Path ${Target} -Leaf
    } else {
        ${LinkPath} = Resolve-Path $( Split-Path ${Link} -Parent )
        ${LinkName} = Split-Path ${Link} -Leaf
    }
    ${Target} = Resolve-Path ${Target}

    ${NewItemParameters} = @{
        ItemType = ${ItemType}
        Path = ${LinkPath}
        Name = ${LinkName}
        Value = ${Target}
    }

    #$NewItemParameters
    Invoke-Expression "New-Item @NewItemParameters ${Remaining}"
}

function Convert-Hex {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true, Position = 1)]
        [string]${Value},
        [Parameter(Mandatory = $true, Position = 2)]
        [int]${Base}
    )

    Return Invoke-Expression "[Convert]::ToInt32(0x${Value}, ${Base})"
}
