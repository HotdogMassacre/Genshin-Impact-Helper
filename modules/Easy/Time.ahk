OpenTimeMenu() {
    GameSpeed(1)
    MouseGetPos,mx,my
    Send {ESC}
    Sleep, 1000
    MouseClick Left, 45, 715
    Sleep, 30
    MouseClick Left, 45, 715
    MouseMove,%mx%,%my%,0
    GameSpeed(0)
}
CloseTimeMenu() {
    GameSpeed(1)
    Send {ESC}
    Sleep, 75
    Send {ESC}
    GameSpeed(0)
}

ConfirmTime() {
    GameSpeed(1)
    ClickConfirm("needles\confirm_short.png")
    Sleep, 500
    DoClickClose()
    Sleep, 150
    CloseMenu()
    GameSpeed(0)
}

GetTimeBlock() {
    ; Time 0600 to 1200 0xFFFFB2
    ; Time 1200 to 1800 0xFFFFF0
    ; Time 1800 to 2400 0xFFD3B0
    ; Time 2400 to 0600 0X9DFFFF

    pixelGetColor,TB1,1200,500,RGB,Fast
    pixelGetCOlor,TB2,1440,250,RGB,Fast
    pixelGetColor,TB3,1680,500,RGB,Fast
    pixelGetColor,TB4,1450,750,RGB,Fast

    C1:=SubStr(TB1,1,4)
    C2:=SubStr(TB2,1,4)
    C3:=SubStr(TB3,1,4)
    C4:=SubStr(TB4,1,4)

    ;Print("TB1: " . TB1 . "C1: " . C1)
    ;Print("TB2: " . TB2 . "C2: " . C2)
    ;Print("TB3: " . TB3 . "C3: " . C3)
    ;Print("TB4: " . TB4 . "C4: " . C4)

    if (C1=="0xFF") {
        return "Morning"
    } else if (C2=="0xFF") {
        return "Noon"
    } else if (C3=="0xFF") {
        return "Evening"
    } else if (C4=="0x9D") {
        return "Night"
    }
}

TimeDrag(startx,starty,endx,endy) {
    MouseClickDrag,Left,%startx%,%starty%,%endx%,%endy%
    MouseMove,%startx%,%starty%,50
    Click Down
    MouseMove,%endx%,%endy%,50
    Click Up
}

TimeMGMT:
    pixelGetColor,TM,1437,329,RGB,Fast
    TC:=% HasVal(MenuSelCol,TM)
    if (TC>0) {
        ConfirmTime()
    } else {
        OpenTimeMenu()
    }
return

DayTime:
    CTB:=% GetTimeBlock()
    Tooltip,%CTB%,300,25,17
    if (CTB=="Morning") {
        CloseTimeMenu()
    }
    if (CTB=="Noon") {
        CloseTimeMenu()
    }
    if (CTB=="Evening") {
        MouseMove,1460,500,90
        Click Down
        Sleep,30
        MouseMove,1460,510,90
        Click Up
        Sleep, 30
        MouseMove,1460,510,90
        Click Down
        Sleep,30
        MouseMove,1460,520,90
        Click Up
        Sleep, 30
        MouseMove,1460,520,90
        Click Down
        Sleep,30
        MouseMove,1460,530,90
        Click Up
        Sleep, 30
        MouseMove,1460,530,90
        Click Down
        Sleep,30
        MouseMove,1460,540,90
        Click Up
        Sleep, 30
        MouseMove,1460,540,90
        Click Down
        Sleep,30
        MouseMove,1460,550,90
        Click Up
        Sleep, 30
        MouseMove,1460,550,90
        Click Down
        Sleep,30
        MouseMove,1460,560,90
        Click Up
        Sleep, 30
        MouseMove,1460,560,90
        Click Down
        Sleep,30
        MouseMove,1460,570,90
        Click Up
        Sleep, 30
        MouseMove,1460,570,90
        Click Down
        Sleep,30
        MouseMove,1460,580,90
        Click Up
        Sleep, 30
        MouseMove,1460,580,90
        Click Down
        Sleep,30
        MouseMove,1460,590,90
        Click Up
        Sleep, 30
        MouseMove,1460,590,90
        Click Down
        Sleep,30
        MouseMove,1460,600,90
        Click Up
        Sleep, 30
        MouseMove,1460,600,90
        Click Down
        Sleep,30
        MouseMove,1439,610,90
        Click Up
        Sleep, 30
        
        MouseMove,1439,610,90
        Click Down
        Sleep,30
        MouseMove,1439,620,90
        Click Up
        Sleep, 30
        MouseMove,1439,620,90
        Click Down
        Sleep,30
        MouseMove,1439,630,90
        Click Up
        Sleep, 30
        MouseMove,1439,630,90
        Click Down
        Sleep,30
        MouseMove,1345,595,90
        Click Up
        Sleep, 30

        MouseMove,1345,595,90
        Click Down
        Sleep,30
        MouseMove,1335,575,90
        Click Up
        Sleep, 30

        MouseMove,1335,575,90
        Click Down
        Sleep,30
        MouseMove,1300,500,90
        Click Up
        Sleep, 30
    }
    if (CTB=="Night") {
    
    }
return

EveningTime:
return