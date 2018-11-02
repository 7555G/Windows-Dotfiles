;
; %appdata%\Microsoft\Windows\Start Menu\Programs\Startup\readline_shortcuts.ahk
;


; Don't show tray icon
#NoTrayIcon


; Store modifiers' state
*$~Ctrl::ctrl := "^"
*$Ctrl up::ctrl := ""
*$~Shift::shift := "+"
*$Shift up::shift := ""
*$~Alt::alt := "!"
*$Alt up::alt := ""


; Use 0x70 (mapped on "CapsLock") as Left Control
~SC070::LCtrl


; swap "\" and "Backspace" keys
;\::Backspace
;Backspace::\


; macOS "Command key"-like functionality for Control (mapped on Alt)
SC070 & Tab::send %shift%^{Tab}

;!Tab::send #{Tab}
!Tab::return

;!<^Left::
;    send {LWin down}{LCtrl down}{Left}
;    send {LWin up}{LCtrl up}
;return
;!>^Left::
;    send {RWin down}{RCtrl down}{Left}
;    send {RWin up}{RCtrl up}
;return
;!<^Right::
;    send {LWin down}{LCtrl down}{Right}
;    send {LWin up}{LCtrl up}
;return
;!>^Right::
;    send {RWin down}{RCtrl down}{Right}
;    send {RWin up}{RCtrl up}
;return

$^Tab::
    send {ALTDOWN}{TAB}
    KeyWait Ctrl
    send {ALTUP}
return

$^+Tab::
    send {ALTDOWN}{SHIFTDOWN}{TAB}
    KeyWait Ctrl
    send {ALTUP}{SHIFTUP}
return

^Space::
    send {LWINDOWN}{SPACE}
    KeyWait Ctrl
    send {LWINUP}
return


; macOS-like context click
;RButton::LButton
;SC070 & LButton::send {RButton}
;SC070 & RButton::send {RButton}
;SC070 & WheelUp::
;    sleep 1000
;return
;SC070 & WheelDown::
;    sleep 1000
;return


; Audio/Media control
PrintScreen::send {Volume_Mute}
ScrollLock::send {Volume_Down}{Volume_Down}{Volume_Down}
Pause::send {Volume_Up}{Volume_Up}{Volume_Up}


; Readline-style Shortcuts
#if !WinActive("ahk_class Vim") && !WinExist("Steam") && !WinActive("Guild Wars 2")
~SC070::return
SC070::LCtrl
SC070 & h::send %shift%%ctrl%{Backspace}
SC070 & d::send %shift%%ctrl%{Delete}
SC070 & e::send %shift%%ctrl%{End}
SC070 & a::send %shift%%ctrl%{Home}
SC070 & f::send %shift%%ctrl%{Right}
SC070 & b::send %shift%%ctrl%{Left}
SC070 & n::send %shift%%ctrl%{Down}
SC070 & p::send %shift%%ctrl%{Up}
SC070 & c::send %shift%^c
SC070 & Space::return
SC070 & Backspace::send %shift%%ctrl%{Backspace}
#if
