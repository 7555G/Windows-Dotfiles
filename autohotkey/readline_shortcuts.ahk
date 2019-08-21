;
; %USERPROfILE%\Documents\readline_shortcuts.ahk
;


; behavior
#NoTrayIcon
#SingleInstance force
SetWinDelay, 0


; Store modifiers' state
*$~Ctrl::ctrl := "^"
*$Ctrl up::ctrl := ""
*$~Shift::shift := "+"
*$Shift up::shift := ""
*$~Alt::alt := "!"
*$Alt up::alt := ""

; Use 0x70 as control ("CapsLock" is mapped to 0x70 in registry)
~SC070::LCtrl

; macOS "Command key"-like functionality for Control and Alt,
; and for hhkb make Alt behave like Win
SC070 & Tab::send ^%shift%{Tab}
*^Esc::send !%shift%{Esc}
*^`::send !%shift%{Esc}
*$!Esc::return
!Space::send ^{Esc}
!Tab::send #{Tab}

$^Tab::
$^+Tab::
    send {Alt down}%shift%{Tab}
    KeyWait Ctrl
    send {Alt up}
return

^Space::
    send {LWin down}{Space}
    KeyWait Ctrl
    send {LWin up}
return

!<^Left::
    send {LWin down}{LCtrl down}{Left}
    send {LWin up}{LCtrl up}
return

!>^Left::
    send {RWin down}{RCtrl down}{Left}
    send {RWin up}{RCtrl up}
return

!<^Right::
    send {LWin down}{LCtrl down}{Right}
    send {LWin up}{LCtrl up}
return

!>^Right::
    send {RWin down}{RCtrl down}{Right}
    send {RWin up}{RCtrl up}
return


; macOS-like context click
$RButton::LButton
$LButton::RButton
;Ctrl & LButton::send {RButton}
;Ctrl & RButton::send {RButton}
;Ctrl & WheelUp::
;    sleep 1000
;return
;Ctrl & WheelDown::
;    sleep 1000
;return


; Audio/Media control
*PrintScreen::send {Volume_Mute}
*ScrollLock::send {Volume_Down}{Volume_Down}
*Pause::send {Volume_Up}{Volume_Up}


; Readline-style Shortcuts
#if !WinActive("ahk_class Vim")
               && !WinExist("Steam")
               && !WinActive("Guild Wars 2")
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
    SC070 & c::send %shift%^{c}
    SC070 & l::send %shift%^{l}
    SC070 & Space::return
    SC070 & Backspace::send %shift%%ctrl%{Backspace}
#if


#include shortcuts.ahk
