;
; %appdata%\Microsoft\Windows\Start Menu\Programs\Startup\general_modifiers.ahk
;

; Don't show tray icon
#NoTrayIcon

^Space::#Space
^Tab::!Tab
!Tab::return
CapsLock & Tab::
    if (GetKeyState("Shift", "P"))
        send +^{Tab}
    else
        send ^{Tab}
return

; Disable Caps Lock
*CapsLock::return

; Readline tshortcuts
CapsLock & e::Send {End}
CapsLock & y::Send ^v
CapsLock & o::Send {Enter}{Left}
CapsLock & p::Send {Up}
CapsLock & a::Send {Home}
CapsLock & d::Send {Delete}
CapsLock & f::Send {Right}
CapsLock & h::Send {Backspace}
CapsLock & k::Send +{End}^x
CapsLock & b::Send {Left}
CapsLock & n::Send {Down}
CapsLock & r::Send ^r
CapsLock & Esc::return
CapsLock & q::return
CapsLock & w::return
CapsLock & t::return
CapsLock & u::return
CapsLock & i::return
CapsLock & s::return
CapsLock & g::return
CapsLock & j::return
CapsLock & l::return
CapsLock & z::return
CapsLock & x::return
CapsLock & c::return
CapsLock & v::return
CapsLock & m::return
CapsLock & [::return
CapsLock & ]::return
CapsLock & `;::return
CapsLock & '::return
CapsLock & `::return
CapsLock & \::return
CapsLock & ,::return
CapsLock & .::return
CapsLock & /::return
