;
; A script with the functionality similar to keynav by Jordan Sissel.
; This autohotkey adaptation was inspired by and is an enhanced version
; of the script from Jose A. Romero L.<escherdragon@gmail.com>.
;

#NoTrayIcon
#SingleInstance force
SetWinDelay 0


; start
$^;::start()
$+^;::start() cursorzoom(50, 50)

#IfWinExist, _keynav
    ; exit
    $Space::warp() end()

    ; left click, right click, click&drag, scroll
    $*Enter::warp() click_1()
    $i::warp() click_3() end()
    $*d::warp() drag()
    $PgUp::warp() click_5()
    $PgDn::warp() click_4()

    ; move cursor area
    $h::move_left()
    $j::move_down()
    $k::move_up()
    $l::move_right()

    ; cut cursor area
    $^h::cut_left()
    $^j::cut_down()
    $^k::cut_up()
    $^l::cut_right()

    ; grow cursor area
    $+^h::grow_left()
    $+^j::grow_down()
    $+^k::grow_up()
    $+^l::grow_right()

    ; utilities
    $w::windowzoom()
    $c::cursorzoom(50, 50)
#IfWinExist

GuiClose:
ExitApp

;; keynav functions
start() {
    Global newDimensions, dimensions, ClickIsUp
    dimensions := {posX: 0, posY: 0
        , scWidth: A_ScreenWidth, scHeight: A_ScreenHeight}
    newDimensions := CopyDimensions(dimensions)
    ClickIsUp := True

    #IfWinExist, _keynav
        Gui, destroy
    #IfWinExist

    Draw(newDimensions, dimensions)
}
 
move_left() {
    Global newDimensions, dimensions
    newDimensions.posX -= newDimensions.scWidth
    Draw(newDimensions, dimensions)
}

move_down() {
    Global newDimensions, dimensions
    newDimensions.posY += newDimensions.scHeight
    Draw(newDimensions, dimensions)
}

move_up() {
    Global newDimensions, dimensions
    newDimensions.posY -= newDimensions.scHeight
    Draw(newDimensions, dimensions)
}

move_right() {
    Global newDimensions, dimensions
    newDimensions.posX += newDimensions.scWidth
    Draw(newDimensions, dimensions)
}

cut_left() {
    Global newDimensions, dimensions
    newDimensions.scWidth /= 2
    Draw(newDimensions, dimensions)
}

cut_down() {
    Global newDimensions, dimensions
    newDimensions.scHeight /= 2
    newDimensions.posY += newDimensions.scHeight
    Draw(newDimensions, dimensions)
}

cut_up() {
    Global newDimensions, dimensions
    newDimensions.scHeight /= 2
    Draw(newDimensions, dimensions)
}

cut_right() {
    Global newDimensions, dimensions
    newDimensions.scWidth /= 2
    newDimensions.posX += newDimensions.scWidth
    Draw(newDimensions, dimensions)
}

grow_left() {
    Global newDimensions, dimensions
    newDimensions.posX -= newDimensions.scWidth
    newDimensions.scWidth *= 2
    Draw(newDimensions, dimensions)
}

grow_down() {
    Global newDimensions, dimensions
    newDimensions.scHeight *= 2
    Draw(newDimensions, dimensions)
}

grow_up() {
    Global newDimensions, dimensions
    newDimensions.posY -= newDimensions.scHeight
    newDimensions.scHeight *= 2
    Draw(newDimensions, dimensions)
}

grow_right() {
    Global newDimensions, dimensions
    newDimensions.scWidth *= 2
    Draw(newDimensions, dimensions)
}

windowzoom() {
    Global newDimensions, dimensions
    WinGetPos, newPosX, newPosY, newScWidth, newScHeight, A
    newDimensions := {posX: newPosX, posY: newPosY
        , scWidth: newScWidth, scHeight: newScHeight}
    Draw(newDimensions, dimensions)
}

cursorzoom(newScWidth, newScHeight) {
    Global newDimensions, dimensions
    CoordMode, Mouse, Screen
    MouseGetPos, mouseX, mouseY
    newDimensions.PosX := mouseX - newScWidth/2
    newDimensions.PosY := mouseY - newScHeight/2
    newDimensions.scWidth := newScWidth
    newDimensions.scHeight := newScHeight
    Draw(newDimensions, dimensions)
}

warp() {
    Global dimensions
    MoveCursor(dimensions)
}

end() {
    Gui, destroy
}

click_1() {
    MouseClick, Left
}

click_2() {
    MouseClick, Middle
}

click_3() {
    MouseClick, Right
}

click_4() {
    MouseClick, WheelDown
}

click_5() {
    MouseClick, WheelUp
}

drag() {
    Global dimensions, ClickIsUp
    If ClickIsUp {
        Click Down
        ClickIsUp := False
        dimensions.posY += 5
        MoveCursor(dimensions)
        dimensions.posY -= 5
        MoveCursor(dimensions)
    } Else {
        Click Up
        ClickIsUp := True
    }
}

;; internal functions
Draw(byref newDimensions, byref dimensions) {
    If !AreInsideScreen(newDimensions) {
        newDimensions := CopyDimensions(dimensions)
        Return
    }

    dimensions := CopyDimensions(newDimensions)

    Gui, destroy
    WinGet, window_id, ID, A ; get active window ahk_id

    Gui +AlwaysOnTop -Caption +ToolWindow
    Gui, Color, EEEEEE, _keynav
    Gui, Show, % "X" A_ScreenWidth "Y" A_ScreenHeight
        . "W" A_ScreenWidth "H" A_ScreenHeight
        . NoActivate, _keynav
    WinSet, Transparent, 0, _keynav
    WinSet, ExStyle, ^0x20, _keynav
    WinSet, TransColor, EEEEEE, _keynav
    Gui, Show, X0 Y0

    CoordMode, Mouse, Screen
    WinMove, _keynav, , dimensions.posX, dimensions.posY
        , dimensions.scWidth, dimensions.scHeight
    CrossHair(dimensions.scWidth, dimensions.scHeight)

    WinActivate, ahk_id %window_id% ; reactivate active window
}

CrossHair(scWidth, scHeight) {
    Gui, Add, Text, % "x0 y" scHeight/2 " w" scWidth " h1"
        . " 0x10 +BackgroundTrans"
    Gui, Add, Text, % "x" scWidth/2 " y0 w1 h" scHeight
        . " 0x11 +BackgroundTrans"

    Gui, Add, Text, % "x0 y0 w" scWidth " h1"
        . " 0x10 +BackgroundTrans"
    Gui, Add, Text, % "x0 y0 w1 h" scHeight
        . " 0x11 +BackgroundTrans"

    Gui, Add, Text, % "x0 y" scHeight - 1 " w" scWidth " h1"
        . " 0x10 +BackgroundTrans"
    Gui, Add, Text, % "x" scWidth - 1 " y0 w1 h" scHeight
        . " 0x11 +BackgroundTrans"
}

AreInsideScreen(dimensions) {
    tolerance := 10
    If (dimensions.posX < (0 - tolerance)
        or dimensions.posX > (A_ScreenWidth + tolerance)) {
        ;MsgBox, % "posX = " dimensions.posX
        Return False
    }
    If (dimensions.posY < (0 - tolerance)
        or dimensions.posY > (A_ScreenHeight + tolerance)) {
        ;MsgBox, % "posY = " dimensions.posY
        Return False
    }
    If ((dimensions.posX + dimensions.scWidth)
        < (0 - tolerance)
        or (dimensions.posX + dimensions.scWidth)
        > (A_screenWidth + tolerance)) {
        ;MsgBox, % "posX + scWidth = "
        ;        .(dimensions.posX + dimensions.scWidth)
        Return False
    }
    If ((dimensions.posY + dimensions.scHeight)
        < (0 - tolerance)
        or (dimensions.posY + dimensions.scHeight)
        > (A_screenHeight + tolerance)) {
        ;MsgBox, % "posY + scHeight = "
        ;        . (dimensions.posY + dimensions.scHeight)
        Return False
    }
    Return True
}

PrintDimensions(dimensions) {
    MsgBox, % "posX = " newDimensions.posX ",`n"
            . "posY = " newDimensions.posY ",`n"
            . "scWidth = " newDimensions.scWidth ",`n"
            . "scHeight = " newDimensions.scHeight
    Return
}

CopyDimensions(dimensions) {
    theDimensions := {posX: dimensions.posX, posY: dimensions.posY
        , scWidth: dimensions.scWidth, scHeight: dimensions.scHeight}
    Return theDimensions
}

MoveCursor(dimensions) {
    CoordMode, Mouse, Screen
    toX := dimensions.posX + dimensions.scWidth/2
    toY := dimensions.posY + dimensions.scHeight/2
    MouseMove, toX, toY, 0
}
