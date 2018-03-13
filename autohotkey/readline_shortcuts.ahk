;
; %appdata%\Microsoft\Windows\Start Menu\Programs\Startup\hhkb_modifiers.ahk
;

; Don't show tray icon
#NoTrayIcon

; Use "CapsLock" as LControl
SC068::LControl

SC068 & LButton::RButton
SC068 & Tab::^Tab
^Tab::!Tab
!Tab::return
^Space::#Space

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
