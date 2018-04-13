;
; %appdata%\Microsoft\Windows\Start Menu\Programs\Startup\readline_shortcuts.ahk
;

; Don't show tray icon
#NoTrayIcon

; Use "CapsLock" as LControl
SC068::LControl

; macOS "Command key"-like functionality for Control
SC068 & Tab::^Tab
^Tab::!Tab
!Tab::send #{Tab}
;!Tab::return
!^Right::send #^{Right}
!^Left::send #^{Left}
!^Up::send #^{Up}
!^Down::send #^{Down}
^Space::#Space

; macOS-like context click
RButton::LButton
SC068 & LButton::RButton
SC068 & RButton::RButton

; Audio control
RAlt & a::send {Volume_Down}
RAlt & s::send {Volume_Up}
RAlt & d::send {Volume_Mute}

; Readline-style Shortcuts
SC068 & h::Backspace
SC068 & d::Delete
SC068 & e::End
SC068 & a::Home
SC068 & f::Right
SC068 & b::Left
SC068 & n::Down
SC068 & p::Up
SC068 & Space::return
SC068 & Backspace::Backspace

#IfWinActive, ahk_class Vim
SC068 & r::^r
#IfWinActive
