EasyCook() {
    if (EasyCook) {
        MouseMove, 820, 1015, 0
        Sleep, 70
        Click
        Sleep, 70
        MouseMove, 954, 912, 0
        Loop,
        {
            Sleep, 5
        } Until GetKeyState("LButton","P")
        Sleep, 120
        GameSpeed(1)
        Loop,
        {
            pixelGetColor,CC,960,885,RGB,Fast
        } Until CC=="0xECE5D8"
        Sleep, 150
        Click
        Sleep, 150
        MouseMove, 820, 1015, 0
        Sleep, 150
        GameSpeed(0)
    }
}

EasyCook:
    global EasyCook:=!EasyCook
    if (EasyCook) {
        SetTimer, EasyCookTimer, ON
    } else {
        SetTimer, EasyCookTimer, OFF
    }
return

EasyCookTimer:
    if (EasyCook) {
        Loop,
        {
            pixelGetColor,ACC,632,1005,RGB,Fast
            ;pixelGetColor,ACC,680,1010,RGB,Fast
            Sleep, 150
            if (ACC!="0x99CB33") {
                EasyCook()
            }
            ;Tooltip,%ACC%,20,60,20
        } Until ACC=="0x99CB33" ;"0xECE5D8"
        EasyCook:=0
    }
return