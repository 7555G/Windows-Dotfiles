;
; %USERPROfILE%\Documents\shortcuts.ahk
;

; behavior
#NoTrayIcon
#SingleInstance force
SetWinDelay 0
SetWorkingDir %USERPROFILE%


; terminal
*!^t::Run pwsh -NoLogo
*+!^t::
    Run pwsh -nol -nop -w H -c "Start-Process pwsh -v RunAs"
    Return

; file manager
*!^n::Run lf.exe

; editor
*!^e::Run gvim.exe

; music
*!^m::Run "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\iTunes"

; internet browser
*!^i::Run Chrome.exe
*+!^i::Run Chrome.exe -incognito
