ChooseExpeditionMember() {
    ExpeditionSlots:=[143, 255, 375, 500, 625, 750]
    for k,v in ExpeditionSlots {
        pixelGetColor, MUC, 880, 25, RGB, Fast
        if (MUC=="0x263240") {
            MouseMove, 885, v, 0
            Sleep, 15
            Click
        }
    }  
}

AutoExpedition:
    MouseGetPos, mx, my
    Send {Capslock Down}
    Click
    Sleep, 300
    Click, 1800, 675
    EO1:=ScanScreen("1587","1006","27","27","needles\expedition_claim.png","expedition_")
    EO2:=ScanScreen("1587","1006","27","27","needles\expedition_start.png","expedition_")
    if (EO1>0) {
        Click, 1600, 1020
        Sleep, 300
        Click
        Sleep, 800
        Click, mx, my
        Sleep, 300
        ChooseExpeditionMember()
    } else if (EO2>0) {
        Click, 1600, 1020
        Sleep, 500
        ChooseExpeditionMember()
    }
    Send {Capslock Up}
    SetCapsLockState, OFF
return

AutoExpeditionNew:
    ExpeditionSlots:=[143, 255, 375, 500, 625, 750]
    MouseGetPos, mx, my
    MouseClick, Left
    Sleep, 70
    Click 1800, 680 ;20h
    Sleep, 150
    Click 1600, 1020 ;Select Characters
    Sleep, 800
    Loop
    {
        pixelGetColor, MUC, 880, 25, RGB, Fast
    } Until MUC == "0x263240"
    Sleep, 20
    for k,v in ExpeditionSlots {
        pixelGetColor, MUC, 880, 25, RGB, Fast
        if (MUC=="0x263240") {
            MouseMove, 885, v, 0
            Sleep, 15
            Click
        } else {
            return
        }
    }
return

AutoExpeditionOLD:
    MouseGetPos, mx, my
    Click
    Sleep, 70
    Click 1796, 392
    Sleep, 70
    Click 1598, 1019
    Sleep, 500
    Click 885, 140
    Sleep, 150
    Click 885, 268
    Sleep, 150
    Click 885, 380
    Sleep, 150
    Click 885, 504
    Sleep, 150
    Click 885, 630
    Sleep, 150
    MouseMove, %mx%, %my%
return