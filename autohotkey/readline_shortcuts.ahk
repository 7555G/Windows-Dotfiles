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
#IfWinNotActive, ahk_class Vim
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
#IfWinActive

#IfWinActive, ahk_class Vim
SC068 & q::^q
SC068 & w::^w
SC068 & e::^e
SC068 & r::^r
SC068 & t::^t
SC068 & y::^y
SC068 & u::^u
SC068 & i::^i
SC068 & o::^o
SC068 & p::^p
SC068 & [::^[
SC068 & ]::^]
SC068 & \::^\
SC068 & a::^a
SC068 & s::^s
SC068 & d::^d
SC068 & f::^f
SC068 & g::^g
SC068 & h::^h
SC068 & j::^j
SC068 & k::^k
SC068 & l::^l
SC068 & `;::^;
SC068 & '::^'
SC068 & z::^z
SC068 & x::^x
SC068 & c::^c
SC068 & v::^v
SC068 & b::^b
SC068 & n::^n
SC068 & m::^m
SC068 & ,::^,
SC068 & .::^.
SC068 & /::^/
SC068 & `::^`
#IfWinActive
