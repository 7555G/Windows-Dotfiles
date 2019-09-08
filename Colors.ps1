#
# ${HOME}\dotfiles\Colors.ps1
#

# token colors
${Colors} = @{
    "ContinuationPrompt" = [ConsoleColor]::DarkCyan
    "Default"            = [ConsoleColor]::Gray
    "Comment"            = [ConsoleColor]::DarkGray
    "Keyword"            = [ConsoleColor]::DarkCyan
    "String"             = [ConsoleColor]::Gray
    "Operator"           = [ConsoleColor]::DarkCyan
    "Variable"           = [ConsoleColor]::DarkBlue
    "Command"            = [ConsoleColor]::DarkCyan
    "Parameter"          = [ConsoleColor]::Gray
    "Type"               = [ConsoleColor]::DarkGreen
    "Number"             = [ConsoleColor]::Gray
    "Member"             = [ConsoleColor]::Gray
    "Emphasis"           = [ConsoleColor]::DarkYellow
    "Error"              = [ConsoleColor]::DarkRed
    "Selection"          = [ConsoleColor]::DarkCyan
}

Set-PSReadlineOption -Colors ${Colors}

# console colors
#$host.ui.rawui.ForegroundColor            = [ConsoleColor]::Gray
#$host.ui.rawui.BackgroundColor            = [ConsoleColor]::Black
$Host.PrivateData.DebugForegroundColor    = [ConsoleColor]::DarkBlue
#$Host.PrivateData.DebugBackgroundColor    = [ConsoleColor]::Black
$Host.PrivateData.VerboseForegroundColor  = [ConsoleColor]::DarkYellow
#$Host.PrivateData.VerboseBackgroundColor  = [ConsoleColor]::Black
$Host.PrivateData.WarningForegroundColor  = [ConsoleColor]::DarkYellow
#$Host.PrivateData.WarningBackgroundColor  = [ConsoleColor]::Black
$Host.PrivateData.ErrorForegroundColor    = [ConsoleColor]::DarkRed
#$Host.PrivateData.ErrorBackgroundColor    = [ConsoleColor]::Black
$Host.PrivateData.ProgressForegroundColor = [ConsoleColor]::DarkGray
$Host.PrivateData.ProgressBackgroundColor = [ConsoleColor]::White
