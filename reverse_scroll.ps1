# This is a powershell script, run with administrator privileges.

# Request Administrative Privileges ########################################
# according to: https://www.petri.com/run-powershell-scripts-with-administrative-privileges
param([switch]$Elevated)
function Check-Admin {
$currentUser = New-Object Security.Principal.WindowsPrincipal $([Security.Principal.WindowsIdentity]::GetCurrent())
$currentUser.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}
if ((Check-Admin) -eq $false)  {
if ($elevated)
{
# could not elevate, quit
}
 
else {
 
Start-Process powershell.exe -Verb RunAs -ArgumentList ('-noprofile -noexit -file "{0}" -elevated' -f ($myinvocation.MyCommand.Definition))
}
exit
}
############################################################################

# Reverse mouse wheel vertical scroll FlipFlopWheel = 1

Get-ItemProperty HKLM:\SYSTEM\CurrentControlSet\Enum\HID\*\*\Device` Parameters FlipFlopWheel -EA 0 | ForEach-Object { Set-ItemProperty $_.PSPath FlipFlopWheel 1 }

# Reverse mouse wheel horizontal scroll FlipFlopHScroll = 1

Get-ItemProperty HKLM:\SYSTEM\CurrentControlSet\Enum\HID\*\*\Device` Parameters FlipFlopHScroll -EA 0 | ForEach-Object { Set-ItemProperty $_.PSPath FlipFlopHScroll 1 }
