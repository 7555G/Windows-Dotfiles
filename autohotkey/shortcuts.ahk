;
; %USERPROfILE%\Documents\shortcuts.ahk
;


; behavior
SetWinDelay, 0

; terminal
*!^t::Run pwsh -WorkingDirectory ~

; file manager
*!^n::Run lf ~

; editor
*!^e::Run gvim

; internet browser
*!^i::Run Chrome.exe
*+!^i::Run Chrome.exe -incognito
