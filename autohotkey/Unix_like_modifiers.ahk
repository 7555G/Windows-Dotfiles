; Don't show tray icon
#NoTrayIcon

; Make Win key behave like Control
LWin::LControl
RWin::RControl
^Space::#Space
^Tab::!Tab
!Tab::return
Control & Tab::
    if (GetKeyState("Shift", "P"))
        send +^{Tab}
    else
        send ^{Tab}
return

; Unix style Ctrl shortcuts
#IfWinNotActive ahk_class Vim
Control & Esc::return
Control & q::return
Control & w::return
Control & e::Send {End}
;Control & r::return
Control & t::return
Control & y::Send ^v
Control & u::return
Control & i::return
Control & o::Send {Enter}{Left}
Control & p::Send {Up}
Control & a::Send {Home}
Control & s::return
Control & d::Send {Delete}
Control & f::Send {Right}
Control & g::return
Control & h::Send {Backspace}
Control & j::return
Control & k::Send +{End}^x
Control & l::return
Control & z::return
Control & x::return
Control & c::return
Control & v::return
Control & b::Send {Left}
Control & n::Send {Down}
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
#IfWinActive
