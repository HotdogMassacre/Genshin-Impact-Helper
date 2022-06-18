EasyRefine:
    GameSpeed(1)
    Click 1535, 860
    Sleep, 150
    Click 75, 175
    Sleep, 150
    Click 1880, 965
    Sleep, 70
    MouseMove, 1575, 1020
    Sleep, 300
    /*
    Sleep, 70
    Loop
    {
        if GetKeyState("LButton","P") {
            ClickAndConfirm()
            Sleep, 30
            MouseMove, 1535, 850
            Break
        }
        if GetKeyState("RButton","P") {
            return
        }
    }
    */
    Loop,
    {
        Sleep, 5
    } Until GetKeyState("LButton","P")
    ;Sleep, 3400 ;Non-UNI Speed
    Sleep,500
    MouseMove, 820, 829, 0
    Sleep, 150
    Click 820, 829
    Sleep, 300
    MouseMove 1535, 860
    GameSpeed(0)
return