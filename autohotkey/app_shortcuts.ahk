;
; %USERPROfILE%\Documents\shortcuts.ahk
;

; behavior
#NoTrayIcon
#SingleInstance force
SetWinDelay, 0

; terminal
*!^t::Run pwsh -NoLogo -WorkingDirectory %HOME%
*+!^t::
    Run pwsh -wd %HOME% -nop -w Hidden -c "Start-Process pwsh -v RunAs"
    Return

; file manager
*!^n::Run lf %HOME%

; editor
*!^e::Run gvim

; music
*!^m::Run "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\iTunes"

; internet browser
*!^i::Run Chrome.exe
*+!^i::Run Chrome.exe -incognito
