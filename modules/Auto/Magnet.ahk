Magnet:
    While(GetKeyState("XButton1","P")) {
        ControlSend, , {x down}, ahk_id %WndID%
    }
    if (!GetKeyState("XButton2","P")) {
        ControlSend, , {x up}, ahk_id %WndID%
    }
return

AutoMagnet:
    global AutoMagnet:=!AutoMagnet
    WinGet, WndID, ID, Genshin Impact
    global WndID
    if (AutoMagnet) {
        SetTimer, DoAutoMagnet, ON
    } else {
        SetTimer, DoAutoMagnet, OFF
        ControlSend, , {x up}, ahk_id %WndID%
    }
    SM:=% "AutoMagnet: " (AutoMagnet ? "ON":"OFF")
    CKTooltip(SM)
return

DoAutoMagnet:
    if (AutoMagnet) {
        ControlSend, , {x down}, ahk_id %WndID%
    } else {
        ControlSend, , {x up}, ahk_id %WndID%
    }
return