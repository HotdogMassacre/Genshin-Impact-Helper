
; Party Loader
GILPHK:=[{"$6": "6"
    , "$7": "7"
    , "$8": "8"
    , "$9": "9"}]
GILPHotKeys:=GILPHK.1
for key, mapping in GILPHotKeys {
    fn := Func("GILoadParty").Bind(mapping)
    HotKey, % key, % fn
}
GILoadParty(keySent) {
    P1:=StrSplit("900,45",",")  ; Party 1
    P2:=StrSplit("940,45",",")  ; Party 2
    P3:=StrSplit("975,45",",")  ; Party 3
    P4:=StrSplit("1010,45",",") ; Party 4
    RSB:="1852,539"
    Deploy:="1550,1020" ; Deploy Button
    
    Send {l}
    Sleep, 3000

    PixelGetColor, P1C, 900, 45, 1, RGB Fast
    PixelGetColor, P2C, 940, 45, 1, RGB Fast
    PixelGetColor, P3C, 975, 45, 1, RGB Fast
    PixelGetColor, P4C, 1010, 45, 1, RGB Fast
    ;Tooltip, %P1C% %P2C% %P3C% %P4C%, 100, 100, 2

    if (P1C == "0xFFFFFF")
        WC:="1"
    if (P2C == "0xFFFFFF") 
        WC:="2"
    if (P3C == "0xFFFFFF") 
        WC:="3"
    if (P4C == "0xFFFFFF") 
        WC:="4"


    if (keySent == "6")
    {
        if (WC=="1")
            RPC:="0"
        if (WC=="2")
            RPC:="3"
        if (WC=="3")
            RPC:="2"
        if (WC=="4")
            RPC:="1"
    }
    If (keySent == "7")
    {
        if (WC=="1")
            RPC:="1"
        if (WC=="2")
            RPC:="0"
        if (WC=="3")
            RPC:="3"
        if (WC=="4")
            RPC:="2"
    }
    If (keySent == "8")
    {
        if (WC=="1")
            RPC:="2"
        if (WC=="2")
            RPC:="1"
        if (WC=="3")
            RPC:="0"
        if (WC=="4")
            RPC:="3"
    }
    If (keySent == "9")
    {
        if (WC=="1")
            RPC:="3"
        if (WC=="2")
            RPC:="2"
        if (WC=="3")
            RPC:="1"
        if (WC=="4")
            RPC:="0"
    }

    ;Tooltip, %WC% %RPC%, 150, 60, 5

    if (RPC == 1) {
        Click %RSB%
        Sleep, 70
    }
    if (RPC == 2) {
        Click %RSB%
        Sleep, 70
        Click %RSB%
        Sleep, 70
    }
    if (RPC == 3) {
        Click %RSB%
        Sleep, 70
        Click %RSB%
        Sleep, 70
        Click %RSB%
        Sleep, 70
    }
    Sleep, 150
    Click %Deploy%
    Sleep, 150
    Send {ESC}
}
