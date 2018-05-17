;
; %appdata%\Microsoft\Windows\Start Menu\Programs\Startup\readline_shortcuts.ahk
;


; Don't show tray icon
#NoTrayIcon


; Use 0x70 (mapped on "CapsLock") as Left Control
~SC070::LCtrl


; swap "\" and "Backspace" keys
\::Backspace
Backspace::\


; macOS "Command key"-like functionality for Control (mapped on Alt)
SC070 & Tab::
    if (GetKeyState("Shift", "P") = 1) {
        send +^{Tab}
    } else {
        send ^{Tab}
    }
return

;!Tab::send #{Tab}
!Tab::return

;!^Right::send #^{Right}
;!^Left::send #^{Left}
;!^Up::send #^{Up}
;!^Down::send #^{Down}

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


; Audio/Media control
RAlt & a::send {Volume_Down}
RAlt & s::send {Volume_Up}
RAlt & d::send {Volume_Mute}
PrintScreen::send {Media_Prev}
ScrollLock::send {Media_Play_Pause}
Pause::send {Media_Next}

; Readline-style Shortcuts
#IfWinNotActive, ahk_class Vim
SC070 & h::send {Backspace}
SC070 & d::send {Delete}
SC070 & e::send {End}
SC070 & a::send {Home}
SC070 & f::send {Right}
SC070 & b::send {Left}
SC070 & n::send {Down}
SC070 & p::send {Up}
SC070 & Space::return
SC070 & Backspace::send {Backspace}
#IfWinActive
