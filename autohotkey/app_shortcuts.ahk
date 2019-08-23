;
; %USERPROfILE%\Documents\shortcuts.ahk
;

; behavior
SetWinDelay, 0

; terminal
*!^t::Run pwsh -NoLogo -WorkingDirectory ~

; file manager
*!^n::Run lf ~

; editor
*!^e::Run gvim

; music
*!^m::Run "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\iTunes"

; internet browser
*!^i::Run Chrome.exe
*+!^i::Run Chrome.exe -incognito
