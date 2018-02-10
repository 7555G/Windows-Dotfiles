;
; %appdata%\Microsoft\Windows\Start Menu\Programs\Startup\hhkb_modifiers.ahk
;

; Don't show tray icon
#NoTrayIcon

; Make Win key behave like Control
SC07B::LControl ; Muhenkan as LControl
SC079::RControl ; Henkan as RControl

^Space::#Space
^Tab::!Tab
!Tab::return
Control & Tab::
    if (GetKeyState("Shift", "P"))
        send +^{Tab}
    else
        send ^{Tab}
return

; Readline shortcuts
#IfWinNotActive ahk_class Vim
Control & e::Send {End}
Control & y::Send ^v
Control & o::Send {Enter}{Left}
Control & p::Send {Up}
Control & a::Send {Home}
Control & d::Send {Delete}
Control & f::Send {Right}
Control & h::Send {Backspace}
Control & k::Send +{End}^x
Control & b::Send {Left}
Control & n::Send {Down}
Control & Esc::return
Control & q::return
Control & w::return
Control & r::return
Control & t::return
Control & u::return
Control & i::return
Control & s::return
Control & g::return
Control & j::return
Control & l::return
Control & z::return
Control & x::return
Control & c::return
Control & v::return
Control & m::return
Control & [::return
Control & ]::return
Control & `;::return
Control & '::return
Control & `::return
Control & \::return
Control & ,::return
Control & .::return
Control & /::return
Control & Space::return
#IfWinActive
