#
# ${HOME}\dotfiles\Colors.ps1
#

# token colors
${Colors} = @{
    "ContinuationPrompt" = [ConsoleColor]::DarkYellow
    "Default"            = [ConsoleColor]::Gray
    "Comment"            = [ConsoleColor]::DarkGray
    "Keyword"            = [ConsoleColor]::DarkYellow
    "String"             = [ConsoleColor]::Gray
    "Operator"           = [ConsoleColor]::DarkYellow
    "Variable"           = [ConsoleColor]::DarkRed
    "Command"            = [ConsoleColor]::DarkYellow
    "Parameter"          = [ConsoleColor]::Gray
    "Type"               = [ConsoleColor]::DarkGreen
    "Number"             = [ConsoleColor]::Gray
    "Member"             = [ConsoleColor]::Gray
    "Emphasis"           = [ConsoleColor]::DarkCyan
    "Error"              = [ConsoleColor]::DarkBlue
    "Selection"          = [ConsoleColor]::DarkYellow
}

Set-PSReadlineOption -Colors ${Colors}

# console colors
#$host.ui.rawui.ForegroundColor            = [ConsoleColor]::Gray
#$host.ui.rawui.BackgroundColor            = [ConsoleColor]::Black
#$Host.PrivateData.VerboseForegroundColor  = [ConsoleColor]::Gray
#$Host.PrivateData.VerboseBackgroundColor  = [ConsoleColor]::Black
$Host.PrivateData.ErrorForegroundColor    = [ConsoleColor]::DarkBlue
#$Host.PrivateData.ErrorBackgroundColor    = [ConsoleColor]::Black
$Host.PrivateData.WarningForegroundColor  = [ConsoleColor]::DarkCyan
#$Host.PrivateData.WarningBackgroundColor  = [ConsoleColor]::Black
$Host.PrivateData.DebugForegroundColor    = [ConsoleColor]::DarkRed
#$Host.PrivateData.DebugBackgroundColor    = [ConsoleColor]::Black
$Host.PrivateData.ProgressForegroundColor = [ConsoleColor]::DarkGray
$Host.PrivateData.ProgressBackgroundColor = [ConsoleColor]::White
