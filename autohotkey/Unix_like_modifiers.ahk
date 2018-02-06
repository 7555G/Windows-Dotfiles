; Don't show tray icon
#NoTrayIcon

; Make Win key behave like Control
LWin::Control
RWin::Control
^Tab::!Tab
!Tab::return

; Disables Control key combinations
Control Up::return

; Unix Ctrl combinations
#If GetKeyState("Control", "p")

    Shift Up::return

    h::Backspace
    d::Delete
    K::Send +{End}^x
    A::Send {Home}
    E::Send {End}
    F::Send {Right}
    B::Send {Left}
    P::Send {Up}
    N::Send {Down}
    O::Send {Enter}{Left}
    Y::Send ^v

    r::Send ^r

#If
