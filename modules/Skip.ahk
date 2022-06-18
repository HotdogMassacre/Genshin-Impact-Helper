SkipDomainWish:
    MouseGetPos,mx,my
    Click
    Sleep, 200
    Click 1750, 45
    Sleep, 70
    Click 1750, 45
    Sleep, 70
    Click 1750, 45
    Sleep, 500
    Click 1845, 50
    Sleep, 75
    MouseMove, %mx%, %my%
return

SkipDialog:
    Send {capslock Down}
    Keywait r, T0.4
    if (ErrorLevel) {
        While(GetKeyState("r","P"))
        {
            Click 1010, 750
            Send {capslock Down}
            Send {f}
            Click, 1500, 800 ; First Dialog Option
        }
    } else {
        Send {f}
        Sleep, 125
    }
    Sleep, 350
    ClickClose()
    Sleep, 350
    CloseMenu()
    Send {capslock Up}
    SetCapsLockState, Off
return

SkipDialogV2:
    GameSpeed(1)
    Send {f}
    Click 1297, 651
    Click 1302, 726
    Click 1299, 810
    GameSpeed(0)
return