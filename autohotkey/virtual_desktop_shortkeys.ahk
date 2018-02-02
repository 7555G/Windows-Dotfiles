; This is an AutoHotkey script.

#NoTrayIcon

; Invert scrolling

WheelUp::
Send {WheelDown}
Return

WheelDown::
Send {WheelUp}
Return

; Shift + Wheel for horizontal scrolling

+WheelDown::
Send {WheelLeft}
Return

+WheelUp::
Send {WheelRight}
Return

;; Task View Shortcuts
;; (Must first set Computer>HKEY_USERS>.DEFAULT>Control Panel>Keyboard>InitialKeyboardIndicators to 2)
;; or uncomment next line
;; SetNumLockState, AlwaysOn ;Forces the key to stay on permanently (has no effect on Windows 9x)
;
; Numpad5::
; Send {LWin Down}{Tab}{LWin Up}
; Return

#RButton::
Send #{TAB}
return

#WheelLeft::
Send #^{Left}
return

#WheelRight::
Send #^{Right}
return
